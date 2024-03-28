classdef TestBabrts < matlab.unittest.TestCase
    methods (Test)
        function testSquareRoot(testCase)
            % perfect square
            c = 25;
            tol = 1e-6;
            expectedRoot = sqrt(c);
            actualRoot = babrts(c, tol);
            testCase.verifyEqual(actualRoot, expectedRoot, 'RelTol', tol);
            
            % non-perfect square
            c = 17;
            expectedRoot = sqrt(c);
            actualRoot = babrts(c, tol);
            testCase.verifyEqual(actualRoot, expectedRoot, 'RelTol', tol);
            
        end
    end
end