(set-logic AUFLIA)

; Definitionen für set, item, member
(declare-fun set (Int) Bool)
(declare-fun item (Int) Bool)
(declare-fun member (Int Int) Bool)

; Axiom 1: ∃x(set(x)) ∧ ¬∃x(set(x) ∧ item(x))
(assert (and (exists ((x Int)) (set x))
(not (exists ((x Int)) (and (set x) (item x))))))

; Axiom 2: set(x) ∧ set(y) → (x = y ↔ ∀u(member(u, x) ↔ member(u, y)))
(assert (forall ((x Int) (y Int))
(or (not (and (set x) (set y)))
(and (= x y) (forall ((u Int)) (= (member u x) (member u y)))))))

; Axiom 3: ∀x y(item(x) ∧ item(y) → ∃z(set(z) ∧ ∀u(member(u, z) ↔ (u = x ∨ u = y))))
(assert (forall ((x Int) (y Int))
(or (not (and (item x) (item y)))
(exists ((z Int)) (and (set z) (forall ((u Int)) (= (member u z) (or (= u x) (= u y)))))))))

; Axiom 4: ∃x(set(x) ∧ ∀u(member(u, x) ↔ item(u)))
(assert (exists ((x Int))
(and (set x)
(forall ((u Int)) (= (member u x) (item u))))))

(check-sat)