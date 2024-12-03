%
% Sources
% [1] - General Formal Ontology (GFO)  Part I: Basic Principles (2006), https://www.academia.edu/download/48825658/herre-h-2006-a.pdf
%

% ∃x(Set(x)) ∧ ¬∃x(Set(x) ∧ Item(x))
% Source: [1], page 12
fof(a1, axiom, ( ? [X] : set(X) & ~ ? [X] : ( set(X) & item(X) ) )).

% Set(x) ∧ Set(y) → (x = y ↔ ∀u(u ∈ x ↔ u ∈ y))
% Source: [1], page 12
fof(a2, axiom, ( set(X) & set(Y) => ( X = Y <=> ![U]:( member(U,X) <=> member(U,Y) )))).

% ∀xy(Item(x) ∧ Item(y) → ∃z(Set(z) ∧ z = {x, y}))
% Source: [1], page 12
fof(a3, axiom, ![X,Y]:( item(X) & item(Y) => ?[Z]: ( set(Z) & ![U]:( member(U, Z) <=> (U = X | U = Y ))))).

% ∃x(Set(x) ∧ ∀u(u ∈ x ↔ Item(u)))
% Source: [1], page 12
fof(a4, axiom, ?[X]:( set(X) & ![U]: (member(U,X) <=> item(U)) )).