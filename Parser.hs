{-# OPTIONS_GHC -w #-}
module Parser where
import System.IO
import Token
import qualified Lex as L
import AS_Abs
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33
	| HappyAbsSyn34 t34

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,371) ([0,0,60,4096,0,0,1920,0,0,0,61440,0,64,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,5,61,0,0,128,0,0,0,5888,62464,0,0,0,0,0,0,0,64,9168,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,4096,2,0,0,0,2,0,0,0,64,0,0,0,2048,0,0,0,0,1,0,0,10,30752,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,14,1024,0,0,0,0,16,0,0,3,0,0,0,384,0,0,0,0,0,0,0,0,0,4,0,0,40,49280,1,0,1296,4096,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,320,1024,14,0,10240,32772,448,0,0,133,14352,0,0,160,1536,7,0,5120,16384,224,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1146,0,0,0,0,5,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,18432,0,0,0,0,0,0,0,0,0,0,0,3072,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,126,0,0,16384,1,3588,0,32768,1064,49280,1,0,24576,8192,0,0,0,0,4,0,0,0,128,0,0,0,4096,0,0,0,0,2,0,0,0,0,0,0,320,3072,14,0,2048,32768,448,0,0,1,14352,0,0,32,512,7,0,1024,16384,224,0,0,0,0,0,0,16,0,0,0,0,16384,2,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,8,0,49152,1,0,0,0,0,0,0,0,32768,1,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,288,0,0,0,0,0,0,1024,16384,224,0,0,0,0,0,0,0,16384,0,0,0,0,8,0,16384,33,3588,0,0,1064,49280,1,0,0,16384,0,0,0,12,4,0,0,64512,128,0,0,0,0,0,0,20480,0,897,0,0,10,28704,0,0,320,1024,14,0,10240,32768,448,0,0,5,14352,0,0,160,512,7,0,0,0,1,0,0,0,0,0,0,80,33024,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,8192,59392,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,573,0,0,0,8192,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Programa","ListaFuncoes","Funcao","TipoRetorno","Tipo","DeclParametros","Parametro","BlocoPrincipal","Declaracoes","Declaracao","ListaId","Bloco","ListaCmd","Comando","Retorno","CmdSe","CmdEnquanto","CmdAtrib","CmdEscrita","CmdLeitura","ChamadaProc","ChamaFuncao","ListaParametros","BooleanExpr","Negacao","NFator","Booleanterm","ArithmeticExpr","ArithExpr","Term","Factor","'int'","'float'","'string'","'void'","Id","'+'","'-'","'*'","'/'","'||'","'&&'","'!'","'=='","'/='","'>'","'<'","'>='","'<='","'if'","'else'","'while'","'print'","'read'","'return'","'('","')'","'{'","'}'","','","'='","';'","CINT","CFLOAT","CSTRING","%eof"]
        bit_start = st * 69
        bit_end = (st + 1) * 69
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..68]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (35) = happyShift action_6
action_0 (36) = happyShift action_7
action_0 (37) = happyShift action_8
action_0 (38) = happyShift action_9
action_0 (61) = happyShift action_12
action_0 (4) = happyGoto action_10
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (11) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (35) = happyShift action_6
action_1 (36) = happyShift action_7
action_1 (37) = happyShift action_8
action_1 (38) = happyShift action_9
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (35) = happyShift action_6
action_2 (36) = happyShift action_7
action_2 (37) = happyShift action_8
action_2 (38) = happyShift action_9
action_2 (61) = happyShift action_12
action_2 (6) = happyGoto action_33
action_2 (7) = happyGoto action_4
action_2 (8) = happyGoto action_5
action_2 (11) = happyGoto action_34
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_4

action_4 (39) = happyShift action_32
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_7

action_6 _ = happyReduce_9

action_7 _ = happyReduce_11

action_8 _ = happyReduce_10

action_9 _ = happyReduce_8

action_10 (69) = happyAccept
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_2

action_12 (35) = happyShift action_6
action_12 (36) = happyShift action_7
action_12 (37) = happyShift action_8
action_12 (39) = happyShift action_26
action_12 (53) = happyShift action_27
action_12 (55) = happyShift action_28
action_12 (56) = happyShift action_29
action_12 (57) = happyShift action_30
action_12 (58) = happyShift action_31
action_12 (8) = happyGoto action_13
action_12 (12) = happyGoto action_14
action_12 (13) = happyGoto action_15
action_12 (16) = happyGoto action_16
action_12 (17) = happyGoto action_17
action_12 (18) = happyGoto action_18
action_12 (19) = happyGoto action_19
action_12 (20) = happyGoto action_20
action_12 (21) = happyGoto action_21
action_12 (22) = happyGoto action_22
action_12 (23) = happyGoto action_23
action_12 (24) = happyGoto action_24
action_12 (25) = happyGoto action_25
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (39) = happyShift action_59
action_13 (14) = happyGoto action_58
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (35) = happyShift action_6
action_14 (36) = happyShift action_7
action_14 (37) = happyShift action_8
action_14 (39) = happyShift action_26
action_14 (53) = happyShift action_27
action_14 (55) = happyShift action_28
action_14 (56) = happyShift action_29
action_14 (57) = happyShift action_30
action_14 (58) = happyShift action_31
action_14 (8) = happyGoto action_13
action_14 (13) = happyGoto action_56
action_14 (16) = happyGoto action_57
action_14 (17) = happyGoto action_17
action_14 (18) = happyGoto action_18
action_14 (19) = happyGoto action_19
action_14 (20) = happyGoto action_20
action_14 (21) = happyGoto action_21
action_14 (22) = happyGoto action_22
action_14 (23) = happyGoto action_23
action_14 (24) = happyGoto action_24
action_14 (25) = happyGoto action_25
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_18

action_16 (39) = happyShift action_26
action_16 (53) = happyShift action_27
action_16 (55) = happyShift action_28
action_16 (56) = happyShift action_29
action_16 (57) = happyShift action_30
action_16 (58) = happyShift action_31
action_16 (62) = happyShift action_55
action_16 (17) = happyGoto action_54
action_16 (18) = happyGoto action_18
action_16 (19) = happyGoto action_19
action_16 (20) = happyGoto action_20
action_16 (21) = happyGoto action_21
action_16 (22) = happyGoto action_22
action_16 (23) = happyGoto action_23
action_16 (24) = happyGoto action_24
action_16 (25) = happyGoto action_25
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_24

action_18 _ = happyReduce_31

action_19 _ = happyReduce_25

action_20 _ = happyReduce_26

action_21 _ = happyReduce_27

action_22 _ = happyReduce_28

action_23 _ = happyReduce_29

action_24 _ = happyReduce_30

action_25 (65) = happyShift action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (59) = happyShift action_51
action_26 (64) = happyShift action_52
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (59) = happyShift action_50
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (59) = happyShift action_49
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (59) = happyShift action_48
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (59) = happyShift action_47
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (39) = happyShift action_40
action_31 (41) = happyShift action_41
action_31 (59) = happyShift action_42
action_31 (65) = happyShift action_43
action_31 (66) = happyShift action_44
action_31 (67) = happyShift action_45
action_31 (68) = happyShift action_46
action_31 (31) = happyGoto action_36
action_31 (32) = happyGoto action_37
action_31 (33) = happyGoto action_38
action_31 (34) = happyGoto action_39
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (59) = happyShift action_35
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_3

action_34 _ = happyReduce_1

action_35 (35) = happyShift action_6
action_35 (36) = happyShift action_7
action_35 (37) = happyShift action_8
action_35 (60) = happyShift action_89
action_35 (8) = happyGoto action_86
action_35 (9) = happyGoto action_87
action_35 (10) = happyGoto action_88
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (65) = happyShift action_85
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (40) = happyShift action_83
action_37 (41) = happyShift action_84
action_37 _ = happyReduce_59

action_38 (42) = happyShift action_81
action_38 (43) = happyShift action_82
action_38 _ = happyReduce_62

action_39 _ = happyReduce_65

action_40 (59) = happyShift action_80
action_40 _ = happyReduce_69

action_41 (39) = happyShift action_40
action_41 (41) = happyShift action_41
action_41 (59) = happyShift action_42
action_41 (66) = happyShift action_44
action_41 (67) = happyShift action_45
action_41 (68) = happyShift action_46
action_41 (31) = happyGoto action_79
action_41 (32) = happyGoto action_37
action_41 (33) = happyGoto action_38
action_41 (34) = happyGoto action_39
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (35) = happyShift action_78
action_42 (39) = happyShift action_40
action_42 (41) = happyShift action_41
action_42 (59) = happyShift action_42
action_42 (66) = happyShift action_44
action_42 (67) = happyShift action_45
action_42 (68) = happyShift action_46
action_42 (31) = happyGoto action_77
action_42 (32) = happyGoto action_37
action_42 (33) = happyGoto action_38
action_42 (34) = happyGoto action_39
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_33

action_44 _ = happyReduce_66

action_45 _ = happyReduce_67

action_46 _ = happyReduce_68

action_47 (39) = happyShift action_76
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (39) = happyShift action_40
action_48 (41) = happyShift action_41
action_48 (59) = happyShift action_42
action_48 (66) = happyShift action_44
action_48 (67) = happyShift action_45
action_48 (68) = happyShift action_46
action_48 (31) = happyGoto action_75
action_48 (32) = happyGoto action_37
action_48 (33) = happyGoto action_38
action_48 (34) = happyGoto action_39
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (39) = happyShift action_40
action_49 (41) = happyShift action_41
action_49 (46) = happyShift action_72
action_49 (59) = happyShift action_73
action_49 (66) = happyShift action_44
action_49 (67) = happyShift action_45
action_49 (68) = happyShift action_46
action_49 (27) = happyGoto action_74
action_49 (28) = happyGoto action_68
action_49 (29) = happyGoto action_69
action_49 (30) = happyGoto action_70
action_49 (31) = happyGoto action_71
action_49 (32) = happyGoto action_37
action_49 (33) = happyGoto action_38
action_49 (34) = happyGoto action_39
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (39) = happyShift action_40
action_50 (41) = happyShift action_41
action_50 (46) = happyShift action_72
action_50 (59) = happyShift action_73
action_50 (66) = happyShift action_44
action_50 (67) = happyShift action_45
action_50 (68) = happyShift action_46
action_50 (27) = happyGoto action_67
action_50 (28) = happyGoto action_68
action_50 (29) = happyGoto action_69
action_50 (30) = happyGoto action_70
action_50 (31) = happyGoto action_71
action_50 (32) = happyGoto action_37
action_50 (33) = happyGoto action_38
action_50 (34) = happyGoto action_39
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (39) = happyShift action_40
action_51 (41) = happyShift action_41
action_51 (59) = happyShift action_42
action_51 (60) = happyShift action_66
action_51 (66) = happyShift action_44
action_51 (67) = happyShift action_45
action_51 (68) = happyShift action_46
action_51 (26) = happyGoto action_64
action_51 (31) = happyGoto action_65
action_51 (32) = happyGoto action_37
action_51 (33) = happyGoto action_38
action_51 (34) = happyGoto action_39
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (39) = happyShift action_40
action_52 (41) = happyShift action_41
action_52 (59) = happyShift action_42
action_52 (66) = happyShift action_44
action_52 (67) = happyShift action_45
action_52 (68) = happyShift action_46
action_52 (31) = happyGoto action_63
action_52 (32) = happyGoto action_37
action_52 (33) = happyGoto action_38
action_52 (34) = happyGoto action_39
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_40

action_54 _ = happyReduce_23

action_55 _ = happyReduce_16

action_56 _ = happyReduce_17

action_57 (39) = happyShift action_26
action_57 (53) = happyShift action_27
action_57 (55) = happyShift action_28
action_57 (56) = happyShift action_29
action_57 (57) = happyShift action_30
action_57 (58) = happyShift action_31
action_57 (62) = happyShift action_62
action_57 (17) = happyGoto action_54
action_57 (18) = happyGoto action_18
action_57 (19) = happyGoto action_19
action_57 (20) = happyGoto action_20
action_57 (21) = happyGoto action_21
action_57 (22) = happyGoto action_22
action_57 (23) = happyGoto action_23
action_57 (24) = happyGoto action_24
action_57 (25) = happyGoto action_25
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (63) = happyShift action_60
action_58 (65) = happyShift action_61
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_21

action_60 (39) = happyShift action_120
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_19

action_62 _ = happyReduce_15

action_63 (65) = happyShift action_119
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (60) = happyShift action_117
action_64 (63) = happyShift action_118
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_44

action_66 _ = happyReduce_42

action_67 (44) = happyShift action_104
action_67 (45) = happyShift action_105
action_67 (60) = happyShift action_116
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_47

action_69 _ = happyReduce_49

action_70 _ = happyReduce_51

action_71 (47) = happyShift action_110
action_71 (48) = happyShift action_111
action_71 (49) = happyShift action_112
action_71 (50) = happyShift action_113
action_71 (51) = happyShift action_114
action_71 (52) = happyShift action_115
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (39) = happyShift action_40
action_72 (41) = happyShift action_41
action_72 (59) = happyShift action_73
action_72 (66) = happyShift action_44
action_72 (67) = happyShift action_45
action_72 (68) = happyShift action_46
action_72 (29) = happyGoto action_109
action_72 (30) = happyGoto action_70
action_72 (31) = happyGoto action_71
action_72 (32) = happyGoto action_37
action_72 (33) = happyGoto action_38
action_72 (34) = happyGoto action_39
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (35) = happyShift action_78
action_73 (39) = happyShift action_40
action_73 (41) = happyShift action_41
action_73 (46) = happyShift action_72
action_73 (59) = happyShift action_73
action_73 (66) = happyShift action_44
action_73 (67) = happyShift action_45
action_73 (68) = happyShift action_46
action_73 (27) = happyGoto action_107
action_73 (28) = happyGoto action_68
action_73 (29) = happyGoto action_69
action_73 (30) = happyGoto action_70
action_73 (31) = happyGoto action_108
action_73 (32) = happyGoto action_37
action_73 (33) = happyGoto action_38
action_73 (34) = happyGoto action_39
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (44) = happyShift action_104
action_74 (45) = happyShift action_105
action_74 (60) = happyShift action_106
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (60) = happyShift action_103
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (60) = happyShift action_102
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (60) = happyShift action_101
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (60) = happyShift action_100
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_58

action_80 (39) = happyShift action_40
action_80 (41) = happyShift action_41
action_80 (59) = happyShift action_42
action_80 (60) = happyShift action_99
action_80 (66) = happyShift action_44
action_80 (67) = happyShift action_45
action_80 (68) = happyShift action_46
action_80 (26) = happyGoto action_98
action_80 (31) = happyGoto action_65
action_80 (32) = happyGoto action_37
action_80 (33) = happyGoto action_38
action_80 (34) = happyGoto action_39
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (39) = happyShift action_40
action_81 (59) = happyShift action_42
action_81 (66) = happyShift action_44
action_81 (67) = happyShift action_45
action_81 (68) = happyShift action_46
action_81 (34) = happyGoto action_97
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (39) = happyShift action_40
action_82 (59) = happyShift action_42
action_82 (66) = happyShift action_44
action_82 (67) = happyShift action_45
action_82 (68) = happyShift action_46
action_82 (34) = happyGoto action_96
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (39) = happyShift action_40
action_83 (59) = happyShift action_42
action_83 (66) = happyShift action_44
action_83 (67) = happyShift action_45
action_83 (68) = happyShift action_46
action_83 (33) = happyGoto action_95
action_83 (34) = happyGoto action_39
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (39) = happyShift action_40
action_84 (59) = happyShift action_42
action_84 (66) = happyShift action_44
action_84 (67) = happyShift action_45
action_84 (68) = happyShift action_46
action_84 (33) = happyGoto action_94
action_84 (34) = happyGoto action_39
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_32

action_86 (39) = happyShift action_93
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (60) = happyShift action_91
action_87 (63) = happyShift action_92
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_13

action_89 (61) = happyShift action_12
action_89 (11) = happyGoto action_90
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_6

action_91 (61) = happyShift action_12
action_91 (11) = happyGoto action_139
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (35) = happyShift action_6
action_92 (36) = happyShift action_7
action_92 (37) = happyShift action_8
action_92 (8) = happyGoto action_86
action_92 (10) = happyGoto action_138
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_14

action_94 (42) = happyShift action_81
action_94 (43) = happyShift action_82
action_94 _ = happyReduce_61

action_95 (42) = happyShift action_81
action_95 (43) = happyShift action_82
action_95 _ = happyReduce_60

action_96 _ = happyReduce_64

action_97 _ = happyReduce_63

action_98 (60) = happyShift action_137
action_98 (63) = happyShift action_118
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_72

action_100 (39) = happyShift action_40
action_100 (59) = happyShift action_42
action_100 (66) = happyShift action_44
action_100 (67) = happyShift action_45
action_100 (68) = happyShift action_46
action_100 (34) = happyGoto action_136
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_70

action_102 (65) = happyShift action_135
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (65) = happyShift action_134
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (39) = happyShift action_40
action_104 (41) = happyShift action_41
action_104 (46) = happyShift action_72
action_104 (59) = happyShift action_73
action_104 (66) = happyShift action_44
action_104 (67) = happyShift action_45
action_104 (68) = happyShift action_46
action_104 (28) = happyGoto action_133
action_104 (29) = happyGoto action_69
action_104 (30) = happyGoto action_70
action_104 (31) = happyGoto action_71
action_104 (32) = happyGoto action_37
action_104 (33) = happyGoto action_38
action_104 (34) = happyGoto action_39
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (39) = happyShift action_40
action_105 (41) = happyShift action_41
action_105 (46) = happyShift action_72
action_105 (59) = happyShift action_73
action_105 (66) = happyShift action_44
action_105 (67) = happyShift action_45
action_105 (68) = happyShift action_46
action_105 (28) = happyGoto action_132
action_105 (29) = happyGoto action_69
action_105 (30) = happyGoto action_70
action_105 (31) = happyGoto action_71
action_105 (32) = happyGoto action_37
action_105 (33) = happyGoto action_38
action_105 (34) = happyGoto action_39
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (61) = happyShift action_123
action_106 (15) = happyGoto action_131
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (44) = happyShift action_104
action_107 (45) = happyShift action_105
action_107 (60) = happyShift action_130
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (47) = happyShift action_110
action_108 (48) = happyShift action_111
action_108 (49) = happyShift action_112
action_108 (50) = happyShift action_113
action_108 (51) = happyShift action_114
action_108 (52) = happyShift action_115
action_108 (60) = happyShift action_101
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_48

action_110 (39) = happyShift action_40
action_110 (41) = happyShift action_41
action_110 (59) = happyShift action_42
action_110 (66) = happyShift action_44
action_110 (67) = happyShift action_45
action_110 (68) = happyShift action_46
action_110 (31) = happyGoto action_129
action_110 (32) = happyGoto action_37
action_110 (33) = happyGoto action_38
action_110 (34) = happyGoto action_39
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (39) = happyShift action_40
action_111 (41) = happyShift action_41
action_111 (59) = happyShift action_42
action_111 (66) = happyShift action_44
action_111 (67) = happyShift action_45
action_111 (68) = happyShift action_46
action_111 (31) = happyGoto action_128
action_111 (32) = happyGoto action_37
action_111 (33) = happyGoto action_38
action_111 (34) = happyGoto action_39
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (39) = happyShift action_40
action_112 (41) = happyShift action_41
action_112 (59) = happyShift action_42
action_112 (66) = happyShift action_44
action_112 (67) = happyShift action_45
action_112 (68) = happyShift action_46
action_112 (31) = happyGoto action_127
action_112 (32) = happyGoto action_37
action_112 (33) = happyGoto action_38
action_112 (34) = happyGoto action_39
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (39) = happyShift action_40
action_113 (41) = happyShift action_41
action_113 (59) = happyShift action_42
action_113 (66) = happyShift action_44
action_113 (67) = happyShift action_45
action_113 (68) = happyShift action_46
action_113 (31) = happyGoto action_126
action_113 (32) = happyGoto action_37
action_113 (33) = happyGoto action_38
action_113 (34) = happyGoto action_39
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (39) = happyShift action_40
action_114 (41) = happyShift action_41
action_114 (59) = happyShift action_42
action_114 (66) = happyShift action_44
action_114 (67) = happyShift action_45
action_114 (68) = happyShift action_46
action_114 (31) = happyGoto action_125
action_114 (32) = happyGoto action_37
action_114 (33) = happyGoto action_38
action_114 (34) = happyGoto action_39
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (39) = happyShift action_40
action_115 (41) = happyShift action_41
action_115 (59) = happyShift action_42
action_115 (66) = happyShift action_44
action_115 (67) = happyShift action_45
action_115 (68) = happyShift action_46
action_115 (31) = happyGoto action_124
action_115 (32) = happyGoto action_37
action_115 (33) = happyGoto action_38
action_115 (34) = happyGoto action_39
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (61) = happyShift action_123
action_116 (15) = happyGoto action_122
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_41

action_118 (39) = happyShift action_40
action_118 (41) = happyShift action_41
action_118 (59) = happyShift action_42
action_118 (66) = happyShift action_44
action_118 (67) = happyShift action_45
action_118 (68) = happyShift action_46
action_118 (31) = happyGoto action_121
action_118 (32) = happyGoto action_37
action_118 (33) = happyGoto action_38
action_118 (34) = happyGoto action_39
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_37

action_120 _ = happyReduce_20

action_121 _ = happyReduce_43

action_122 (54) = happyShift action_141
action_122 _ = happyReduce_34

action_123 (39) = happyShift action_26
action_123 (53) = happyShift action_27
action_123 (55) = happyShift action_28
action_123 (56) = happyShift action_29
action_123 (57) = happyShift action_30
action_123 (58) = happyShift action_31
action_123 (16) = happyGoto action_140
action_123 (17) = happyGoto action_17
action_123 (18) = happyGoto action_18
action_123 (19) = happyGoto action_19
action_123 (20) = happyGoto action_20
action_123 (21) = happyGoto action_21
action_123 (22) = happyGoto action_22
action_123 (23) = happyGoto action_23
action_123 (24) = happyGoto action_24
action_123 (25) = happyGoto action_25
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_55

action_125 _ = happyReduce_53

action_126 _ = happyReduce_54

action_127 _ = happyReduce_52

action_128 _ = happyReduce_57

action_129 _ = happyReduce_56

action_130 _ = happyReduce_50

action_131 _ = happyReduce_36

action_132 _ = happyReduce_45

action_133 _ = happyReduce_46

action_134 _ = happyReduce_38

action_135 _ = happyReduce_39

action_136 _ = happyReduce_73

action_137 _ = happyReduce_71

action_138 _ = happyReduce_12

action_139 _ = happyReduce_5

action_140 (39) = happyShift action_26
action_140 (53) = happyShift action_27
action_140 (55) = happyShift action_28
action_140 (56) = happyShift action_29
action_140 (57) = happyShift action_30
action_140 (58) = happyShift action_31
action_140 (62) = happyShift action_143
action_140 (17) = happyGoto action_54
action_140 (18) = happyGoto action_18
action_140 (19) = happyGoto action_19
action_140 (20) = happyGoto action_20
action_140 (21) = happyGoto action_21
action_140 (22) = happyGoto action_22
action_140 (23) = happyGoto action_23
action_140 (24) = happyGoto action_24
action_140 (25) = happyGoto action_25
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (61) = happyShift action_123
action_141 (15) = happyGoto action_142
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_35

action_143 _ = happyReduce_22

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog (map fst happy_var_1) (map transformaFuncao happy_var_1) (fst happy_var_2) (snd happy_var_2)
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog [] [] (fst happy_var_1) (snd happy_var_1)
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happyReduce 6 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_2:->:(happy_var_4,happy_var_1), happy_var_6)
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_2 :->:([],happy_var_1), happy_var_5)
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn7
		 (TVOID
	)

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn8
		 (TINT
	)

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn8
		 (TSTRING
	)

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn8
		 (TDOUBLE
	)

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 (HappyTerminal (ID happy_var_2))
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_2:#:(happy_var_1, 0)
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 ((happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (([],happy_var_2)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  12 happyReduction_17
happyReduction_17 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 ++ happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  12 happyReduction_18
happyReduction_18 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  13 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 (map (\x -> x:#: (happy_var_1,0)) happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  14 happyReduction_20
happyReduction_20 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  14 happyReduction_21
happyReduction_21 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  15 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  16 happyReduction_23
happyReduction_23 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  16 happyReduction_24
happyReduction_24 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  17 happyReduction_25
happyReduction_25 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  17 happyReduction_26
happyReduction_26 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  17 happyReduction_27
happyReduction_27 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  17 happyReduction_28
happyReduction_28 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  17 happyReduction_29
happyReduction_29 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  17 happyReduction_30
happyReduction_30 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  17 happyReduction_31
happyReduction_31 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  18 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn31  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (Ret (Just happy_var_2)
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  18 happyReduction_33
happyReduction_33 _
	_
	 =  HappyAbsSyn18
		 (Ret Nothing
	)

happyReduce_34 = happyReduce 5 19 happyReduction_34
happyReduction_34 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (If happy_var_3 happy_var_5 []
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 7 19 happyReduction_35
happyReduction_35 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (If happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 5 20 happyReduction_36
happyReduction_36 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 4 21 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn31  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (Atrib happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 5 22 happyReduction_38
happyReduction_38 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Imp happy_var_3
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 5 23 happyReduction_39
happyReduction_39 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (Leitura happy_var_3
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_2  24 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (Proc (fst happy_var_1) (snd happy_var_1)
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happyReduce 4 25 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 ((happy_var_1,happy_var_3)
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_3  25 happyReduction_42
happyReduction_42 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn25
		 ((happy_var_1,[])
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  26 happyReduction_43
happyReduction_43 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  26 happyReduction_44
happyReduction_44 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn26
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  27 happyReduction_45
happyReduction_45 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (And happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  27 happyReduction_46
happyReduction_46 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (Or happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  27 happyReduction_47
happyReduction_47 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  28 happyReduction_48
happyReduction_48 (HappyAbsSyn29  happy_var_2)
	_
	 =  HappyAbsSyn28
		 (Not happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  28 happyReduction_49
happyReduction_49 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  29 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn29
		 (happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  29 happyReduction_51
happyReduction_51 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 (Rel happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  30 happyReduction_52
happyReduction_52 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  30 happyReduction_53
happyReduction_53 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  30 happyReduction_54
happyReduction_54 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  30 happyReduction_55
happyReduction_55 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  30 happyReduction_56
happyReduction_56 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Req happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  30 happyReduction_57
happyReduction_57 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Rdif happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  31 happyReduction_58
happyReduction_58 (HappyAbsSyn31  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (Neg happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  31 happyReduction_59
happyReduction_59 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn31
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  32 happyReduction_60
happyReduction_60 (HappyAbsSyn33  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (Add happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  32 happyReduction_61
happyReduction_61 (HappyAbsSyn33  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  32 happyReduction_62
happyReduction_62 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  33 happyReduction_63
happyReduction_63 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn33
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  33 happyReduction_64
happyReduction_64 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn33
		 (Div happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  33 happyReduction_65
happyReduction_65 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn33
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  34 happyReduction_66
happyReduction_66 (HappyTerminal (INT happy_var_1))
	 =  HappyAbsSyn34
		 (Const (CInt happy_var_1)
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  34 happyReduction_67
happyReduction_67 (HappyTerminal (FLOAT happy_var_1))
	 =  HappyAbsSyn34
		 (Const (CFloat happy_var_1)
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  34 happyReduction_68
happyReduction_68 (HappyTerminal (LITERAL happy_var_1))
	 =  HappyAbsSyn34
		 (Const (CString happy_var_1)
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  34 happyReduction_69
happyReduction_69 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn34
		 (IdVar happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  34 happyReduction_70
happyReduction_70 _
	(HappyAbsSyn31  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (happy_var_2
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happyReduce 4 34 happyReduction_71
happyReduction_71 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (Chama happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_72 = happySpecReduce_3  34 happyReduction_72
happyReduction_72 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn34
		 (Chama happy_var_1 []
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happyReduce 4 34 happyReduction_73
happyReduction_73 ((HappyAbsSyn34  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (DoubleInt happy_var_4
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 69 69 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TInt -> cont 35;
	TDouble -> cont 36;
	TString -> cont 37;
	TVoid -> cont 38;
	ID happy_dollar_dollar -> cont 39;
	ADD -> cont 40;
	SUB -> cont 41;
	MUL -> cont 42;
	DIV -> cont 43;
	OR -> cont 44;
	AND -> cont 45;
	NOT -> cont 46;
	REQ -> cont 47;
	RDIF -> cont 48;
	RGT -> cont 49;
	RLT -> cont 50;
	RGE -> cont 51;
	RLE -> cont 52;
	IF -> cont 53;
	ELSE -> cont 54;
	WHILE -> cont 55;
	Print -> cont 56;
	Read -> cont 57;
	Return -> cont 58;
	LPAR -> cont 59;
	RPAR -> cont 60;
	LCOL -> cont 61;
	RCOL -> cont 62;
	VIRG -> cont 63;
	IGUAL -> cont 64;
	PONTVIRG -> cont 65;
	INT happy_dollar_dollar -> cont 66;
	FLOAT happy_dollar_dollar -> cont 67;
	LITERAL happy_dollar_dollar -> cont 68;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 69 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
calc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
