function minimise_hard_coding
%Written by Xing 29/05/14
%Use variables and minimise hard coding.

%Set animals and areas 'automatically':
animals=[{'blanco'} {'jack'}];
areas=[{'v4_1'} {'v4_2'} {'v1_1'} {'v1_2'}];
for animalInd=1:length(animals)
    animal=animals{animalInd};
    for areaInd=1:length(areas)
        area=areas{areaInd};
        doSomethingHere=1;
    end
end





%Versus setting them manually & constantly commenting or uncommenting lines:
animal='blanco';
% animal='jack';

% area='v4_1';
area='v4_2';
% area='v1_1';
% area='v1_2';

doSomethingHere=1;