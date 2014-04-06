/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140325-64 [Apr  5 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of ssdt1.dd, Sun Apr  6 12:56:38 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000168E (5774)
 *     Revision         0x02
 *     Checksum         0x83
 *     OEM ID           "AMD"
 *     OEM Table ID     "ALIB"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x04000000 (67108864)
 */
DefinitionBlock ("ssdt1.aml", "SSDT", 2, "AMD", "ALIB", 0x00000001)
{
    /*
     * iASL Warning: There were 1 external control methods found during
     * disassembly, but additional ACPI tables to resolve these externals
     * were not specified. This resulting disassembler output file may not
     * compile because the disassembler did not know how many arguments
     * to assign to these methods. To specify the tables needed to resolve
     * external control method references, the -e option can be used to
     * specify the filenames. Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_SB_.ALIC, MethodObj)    // Warning: Unresolved method, guessing 6 arguments


    Scope (\_SB)
    {
        Name (A001, 0x06)
        Name (AD01, 0xF8000000)
        Alias (AD01, A086)
        Name (AD07, Package (0x08)
        {
            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x04, 0x04, 0x04, 0x04, 0x01, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x05, 0x05, 0x05, 0x05, 0x02, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x06, 0x06, 0x06, 0x06, 0x03, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x07, 0x07, 0x07, 0x07, 0x04, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x03, 0x00, 0x03, 0x00, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }
        })
        Alias (AD07, A087)
        Name (A088, Buffer (0x0100) {})
        Method (ALIB, 2, NotSerialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Return (A026 (Arg1))
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (A030 (Arg1))
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (A041 (Arg1))
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (A066 (Arg1))
            }

            If (LEqual (Arg0, 0x05))
            {
                Return (A089 ())
            }

            If (LEqual (Arg0, 0x06))
            {
                Return (A069 (Arg1))
            }

            Return (0x00)
        }

        Method (A089, 0, Serialized)
        {
            Return (0x00)
        }

        Method (A007, 2, Serialized)
        {
            Add (A086, ShiftLeft (Arg0, 0x0C), Local0)
            Add (Arg1, Local0, Local0)
            OperationRegion (A090, SystemMemory, Local0, 0x04)
            Field (A090, DWordAcc, NoLock, Preserve)
            {
                A091,   32
            }

            Return (A091) /* \_SB_.A007.A091 */
        }

        Method (A008, 3, Serialized)
        {
            Add (A086, ShiftLeft (Arg0, 0x0C), Local0)
            Add (Arg1, Local0, Local0)
            OperationRegion (A090, SystemMemory, Local0, 0x04)
            Field (A090, DWordAcc, NoLock, Preserve)
            {
                A091,   32
            }

            Store (Arg2, A091) /* \_SB_.A008.A091 */
        }

        Method (A052, 4, Serialized)
        {
            Store (A007 (Arg0, Arg1), Local0)
            Or (And (Local0, Arg2), Arg3, Local0)
            A008 (Arg0, Arg1, Local0)
        }

        Mutex (A092, 0x00)
        Method (A053, 2, NotSerialized)
        {
            Acquire (A092, 0xFFFF)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            A008 (Local0, 0xE0, Arg1)
            Store (A007 (Local0, 0xE4), Local0)
            Release (A092)
            Return (Local0)
        }

        Method (A093, 3, NotSerialized)
        {
            Acquire (A092, 0xFFFF)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            A008 (Local0, 0xE0, Arg1)
            A008 (Local0, 0xE4, Arg2)
            Release (A092)
        }

        Method (A050, 4, NotSerialized)
        {
            Store (A053 (Arg0, Arg1), Local0)
            Or (And (Local0, Arg2), Arg3, Local0)
            A093 (Arg0, Arg1, Local0)
        }

        Mutex (A094, 0x00)
        Method (A042, 3, NotSerialized)
        {
            Acquire (A094, 0xFFFF)
            A008 (Arg0, Arg1, Arg2)
            Store (A007 (Arg0, Add (Arg1, 0x04)), Local0)
            Release (A094)
            Return (Local0)
        }

        Method (A043, 4, NotSerialized)
        {
            Acquire (A094, 0xFFFF)
            A008 (Arg0, Arg1, Arg2)
            A008 (Arg0, Add (Arg1, 0x04), Arg3)
            Release (A094)
        }

        Method (A028, 5, NotSerialized)
        {
            Store (A042 (Arg0, Arg1, Arg2), Local0)
            Or (And (Local0, Arg3), Arg4, Local0)
            A043 (Arg0, Arg1, Arg2, Local0)
        }

        Method (A073, 1, NotSerialized)
        {
            Return (DerefOf (Index (A087, Arg0)))
        }

        Method (A059, 2, NotSerialized)
        {
            Store (0x34, Local1)
            If (LEqual (A007 (Arg0, 0x00), 0xFFFFFFFF))
            {
                Return (0x00)
            }

            Store (0x01, Local0)
            While (LEqual (Local0, 0x01))
            {
                Store (And (A007 (Arg0, Local1), 0xFF), Local1)
                If (LEqual (Local1, 0x00))
                {
                    Break
                }

                If (LEqual (And (A007 (Arg0, Local1), 0xFF), Arg1))
                {
                    Store (0x00, Local0)
                }
                Else
                {
                    Increment (Local1)
                }
            }

            Return (Local1)
        }

        Method (A058, 2, Serialized)
        {
            OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
            Field (PMIO, ByteAcc, NoLock, Preserve)
            {
                PMRI,   8, 
                PMRD,   8
            }

            IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
            {
                Offset (0xE0), 
                ABAR,   32
            }

            OperationRegion (ACFG, SystemIO, ABAR, 0x08)
            Field (ACFG, DWordAcc, NoLock, Preserve)
            {
                ABIX,   32, 
                ABDA,   32
            }

            Store (0x00, Local0)
            If (LEqual (Arg1, 0x00))
            {
                Store (0x80000068, ABIX) /* \_SB_.A058.ABIX */
                Store (ABDA, Local0)
                Return (Local0)
            }
            Else
            {
                Store (0x80000068, ABIX) /* \_SB_.A058.ABIX */
                Store (ABDA, Local0)
                Or (And (Local0, 0xFFFFFFFC), Arg0, Local0)
                Store (Local0, ABDA) /* \_SB_.A058.ABDA */
            }
        }

        Method (A081, 1, NotSerialized)
        {
            Store (A042 (0x00, 0x60, 0xCD), Local0)
            Increment (Arg0)
            Or (And (Local0, 0xFEFFFFFF), And (Not (And (Local0, 0x01000000
                )), 0x01000000), Local0)
            Or (And (Local0, 0xFD00FFFF), ShiftLeft (Arg0, 0x10), Local0)
            A043 (0x00, 0x60, 0xCD, Local0)
            Store (A042 (0x00, 0x60, 0xCE), Local0)
            Return (Local0)
        }

        Method (A082, 3, NotSerialized)
        {
            Store (A042 (0x00, 0x60, 0xCD), Local0)
            Store (And (Arg1, 0xFFFF), Local1)
            Or (And (Local0, 0xFEFFFFFF), And (Not (And (Local0, 0x01000000
                )), 0x01000000), Local0)
            Or (And (Local0, 0xFD000000), ShiftLeft (Arg0, 0x10), Local0)
            Or (Local0, 0x02000000, Local0)
            Or (Local0, Local1, Local0)
            A043 (0x00, 0x60, 0xCD, Local0)
            If (LEqual (Arg2, 0x01))
            {
                Store (ShiftRight (Arg1, 0x10), Local1)
                Or (And (Local0, 0xFEFFFFFF), And (Not (And (Local0, 0x01000000
                    )), 0x01000000), Local0)
                Or (And (Local0, 0xFF000000), ShiftLeft (Add (Arg0, 0x01), 
                    0x10), Local0)
                Or (Local0, Local1, Local0)
                A043 (0x00, 0x60, 0xCD, Local0)
            }
        }

        Method (A083, 2, NotSerialized)
        {
            Or (ShiftLeft (Arg0, 0x03), 0x01, Local0)
            A082 (0x03, Local0, 0x01)
            If (LAnd (Arg1, 0x01))
            {
                While (LNotEqual (And (A081 (0x03), 0x02), 0x02)) {}
            }

            If (LAnd (Arg1, 0x02))
            {
                While (LNotEqual (And (A081 (0x03), 0x04), 0x04)) {}
            }

            A082 (0x03, 0x00, 0x01)
        }

        Method (A004, 2, NotSerialized)
        {
            A082 (0x0B, Arg0, 0x00)
            A082 (0x05, Arg1, 0x01)
        }

        Method (A003, 1, NotSerialized)
        {
            A082 (0x0B, Arg0, 0x00)
            Store (A081 (0x05), Local0)
            Return (Local0)
        }

        Method (A084, 1, NotSerialized)
        {
            Store (Or (And (Arg0, 0xFF), 0x01865000), Local0)
            Store (Or (And (Arg0, 0xFFFFFF00), 0x04), Local1)
            Store (Or (ShiftLeft (0x03, 0x1E), ShiftLeft (0x01, 0x12)
                ), Local2)
            A004 (0x8600, Local0)
            A004 (0x8604, Local1)
            A004 (0x8608, Local2)
            If (LEqual (ShiftRight (Arg0, 0x10), 0xFE00))
            {
                A083 (0x0D, 0x03)
            }

            If (LEqual (ShiftRight (Arg0, 0x10), 0xFE30))
            {
                A083 (0x0B, 0x03)
            }

            Return (A003 (0x8650))
        }

        Method (A085, 2, NotSerialized)
        {
            Store (Or (And (Arg0, 0xFF), 0x01865000), Local0)
            Store (Or (And (Arg0, 0xFFFFFF00), 0x04), Local1)
            Store (Or (ShiftLeft (0x03, 0x1E), ShiftLeft (0x01, 0x12)
                ), Local2)
            Or (Local2, ShiftLeft (0x01, 0x10), Local2)
            A004 (0x8600, Local0)
            A004 (0x8604, Local1)
            A004 (0x8608, Local2)
            A004 (0x8650, Arg1)
            A083 (0x0B, 0x03)
        }

        Name (AD02, 0x00)
        Alias (AD02, A009)
        Name (AD03, 0x03)
        Alias (AD03, A010)
        Name (AD04, 0x00)
        Alias (AD04, A011)
        Name (AD05, 0x03)
        Alias (AD05, A012)
        Name (AD06, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x02, 
            0x00, 
            0x02, 
            0x00
        })
        Alias (AD06, A013)
        Name (AD08, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x02, 
            0x00, 
            0x02, 
            0x00
        })
        Alias (AD08, A014)
        Name (A015, 0x00)
        Name (A016, 0x00)
        Name (A017, 0x01)
        Name (A018, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A019, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A020, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (AD09, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Alias (AD09, A021)
        Name (A022, Package (0x08)
        {
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01
        })
        Name (A023, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A025, 0x00)
        Method (A026, 1, Serialized)
        {
            Store (DerefOf (Index (Arg0, 0x02)), Local1)
            Store (A027 (), Local0)
            Store (Local1, A016) /* \_SB_.A016 */
            Or (ShiftLeft (0x01, 0x05), ShiftLeft (0x01, 0x06), Local2)
            Or (ShiftLeft (A016, 0x05), ShiftLeft (A017, 0x06), Local3)
            A028 (0x00, 0x60, 0xF4, Not (Local2), And (Local2, Local3
                ))
            If (LEqual (Local1, Local0))
            {
                Return (0x00)
            }

            A006 (A016)
            If (LEqual (A009, 0x04))
            {
                A002 (0x01, A027 ())
            }

            If (LOr (LLessEqual (A009, 0x01), LGreaterEqual (A009, 0x04)))
            {
                Return (0x00)
            }

            If (LEqual (A015, 0x00))
            {
                Return (0x00)
            }

            A029 ()
            Return (0x00)
        }

        Method (A030, 1, NotSerialized)
        {
            Store (A031 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x02)), Local0)
            If (LNotEqual (Local0, 0x02))
            {
                Return (Local7)
            }

            A029 ()
            Return (Local7)
        }

        Method (A031, 1, NotSerialized)
        {
            Name (A032, 0x00)
            Store (0x00, A025) /* \_SB_.A025 */
            Store (Buffer (0x0A) {}, Local7)
            CreateWordField (Local7, 0x00, A033)
            Store (0x03, A033) /* \_SB_.A031.A033 */
            CreateByteField (Local7, 0x02, A034)
            Store (0x01, A034) /* \_SB_.A031.A034 */
            If (LOr (LLessEqual (A009, 0x01), LGreaterEqual (A009, 0x04)))
            {
                Return (Local7)
            }

            If (LEqual (A015, 0x00))
            {
                Return (Local7)
            }

            CreateWordField (Arg0, 0x02, A035)
            CreateWordField (Arg0, 0x04, A036)
            CreateWordField (Arg0, 0x06, A037)
            CreateByteField (Arg0, 0x08, A038)
            CreateByteField (Arg0, 0x09, A039)
            And (ShiftRight (A035, 0x08), 0xFF, A032) /* \_SB_.A031.A032 */
            While (LLessEqual (A025, A001))
            {
                If (LEqual (A040 (A025), 0x01))
                {
                    Store (A007 (ShiftLeft (Add (A025, 0x02), 0x03), 0x18), 
                        Local1)
                    And (ShiftRight (Local1, 0x10), 0xFF, Local2)
                    And (ShiftRight (Local1, 0x08), 0xFF, Local1)
                    If (LAnd (LGreaterEqual (A032, Local1), LLessEqual (A032, Local2)))
                    {
                        Break
                    }
                }

                Increment (A025)
            }

            If (LGreater (A025, A001))
            {
                Return (Local7)
            }

            If (LEqual (DerefOf (Index (A018, A025)), 0x00))
            {
                Store (A035, Index (A018, A025))
            }
            Else
            {
                If (LNotEqual (DerefOf (Index (A018, A025)), A035))
                {
                    Return (Local7)
                }
            }

            Store (0x00, Index (A023, A025))
            If (LEqual (A039, 0x00))
            {
                Store (0x00, Index (A018, A025))
            }

            If (LEqual (A039, 0x01))
            {
                Store (0x01, Index (A023, A025))
            }

            If (LEqual (A039, 0x02))
            {
                Store (0x01, Index (A020, A025))
            }

            If (LEqual (A039, 0x03))
            {
                Store (0x02, Index (A020, A025))
            }

            If (LEqual (And (A036, A037), 0x01))
            {
                Store (DerefOf (Index (A013, A025)), Index (A020, A025))
            }

            Store (0x02, A034) /* \_SB_.A031.A034 */
            Return (Local7)
        }

        Method (A040, 1, Serialized)
        {
            If (LEqual (DerefOf (Index (A013, Arg0)), 0x00))
            {
                Return (0x00)
            }

            Return (0x01)
        }

        Method (A041, 1, Serialized)
        {
            Store (Buffer (0x0100) {}, Local7)
            Store (0x03, Index (Local7, 0x00))
            Store (0x00, Index (Local7, 0x01))
            Store (0x00, Index (Local7, 0x02))
            Store (DerefOf (Index (Arg0, 0x02)), A015) /* \_SB_.A015 */
            Store (A042 (0x00, 0x60, 0xF4), Local0)
            If (LEqual (A015, 0x01))
            {
                If (LEqual (And (Local0, 0x01), 0x01))
                {
                    Return (Local7)
                }

                Or (Local0, 0x01, Local0)
            }

            If (LEqual (A015, 0x00))
            {
                If (LEqual (And (Local0, 0x01), 0x00))
                {
                    Return (Local7)
                }

                And (Local0, Not (0x01), Local0)
            }

            Or (Local0, ShiftLeft (A009, 0x01), Local0)
            A043 (0x00, 0x60, 0xF4, Local0)
            A044 (RefOf (A019), RefOf (A018))
            A006 (A016)
            If (LEqual (A009, 0x04))
            {
                A002 (0x01, A027 ())
            }

            If (LAnd (LGreater (A009, 0x01), LLess (A009, 0x04)))
            {
                If (LEqual (A009, 0x02))
                {
                    A044 (RefOf (A013), RefOf (A021))
                    Store (0x00, A025) /* \_SB_.A025 */
                    While (LLessEqual (A025, A001))
                    {
                        If (LNotEqual (DerefOf (Index (A014, A025)), 0x00))
                        {
                            Store (DerefOf (Index (A014, A025)), Index (A021, A025))
                        }

                        Increment (A025)
                    }
                }
                Else
                {
                    A044 (RefOf (A022), RefOf (A021))
                }

                A029 ()
            }

            Return (Local7)
        }

        Name (A045, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Method (A029, 0, Serialized)
        {
            Store (0x00, A025) /* \_SB_.A025 */
            A044 (RefOf (A022), RefOf (A045))
            While (LLessEqual (A025, A001))
            {
                If (LEqual (A040 (A025), 0x01))
                {
                    Store (A046 (A025), Index (A045, A025))
                }

                Increment (A025)
            }

            If (LNotEqual (Match (A023, MEQ, 0x01, MTR, 0x00, 0x00), 
                Ones))
            {
                A044 (RefOf (A022), RefOf (A045))
            }

            If (LNotEqual (Match (A045, MEQ, 0x02, MTR, 0x00, 0x00), 
                Ones))
            {
                A047 (A010, 0x01)
                A005 (0x02)
                A002 (0x02, A027 ())
            }

            Store (0x00, A025) /* \_SB_.A025 */
            While (LLessEqual (A025, A001))
            {
                If (LEqual (A040 (A025), 0x00))
                {
                    Increment (A025)
                    Continue
                }

                Store (DerefOf (Index (A021, A025)), Local0)
                Store (DerefOf (Index (A045, A025)), Local2)
                If (LEqual (Local0, Local2))
                {
                    Increment (A025)
                    Continue
                }

                Store (Local2, Index (A021, A025))
                A048 (A025, Local2)
                Increment (A025)
            }

            If (LEqual (Match (A045, MEQ, 0x02, MTR, 0x00, 0x00), Ones))
            {
                A002 (0x01, A027 ())
                A005 (0x01)
                A047 (A011, 0x00)
            }
        }

        Method (A046, 1, NotSerialized)
        {
            Store (0x02, Local0)
            If (LEqual (DerefOf (Index (A018, Arg0)), 0x00))
            {
                If (LOr (LEqual (A027 (), 0x01), LEqual (A009, 0x03)))
                {
                    Store (0x01, Local0)
                }

                If (LNotEqual (DerefOf (Index (A014, Arg0)), 0x00))
                {
                    Store (DerefOf (Index (A014, Arg0)), Local0)
                }
            }
            Else
            {
                Store (DerefOf (Index (A020, Arg0)), Local0)
            }

            Return (Local0)
        }

        Method (A048, 2, NotSerialized)
        {
            If (LEqual (Arg0, 0x06))
            {
                A028 (0x00, 0x60, 0x80, Not (0x40), 0x40)
            }

            A049 (Arg0, Arg1)
            If (LNotEqual (DerefOf (Index (A018, Arg0)), 0x00))
            {
                A050 (Arg0, 0xA1, Not (0x1000), 0x00)
            }
            Else
            {
                A050 (Arg0, 0xA1, Not (0x1000), 0x1000)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            And (A007 (Local1, 0x70), 0x00400000, Local3)
            If (LNotEqual (Local3, 0x00))
            {
                A051 (Arg0)
                Store (0x01, Local2)
                While (Local2)
                {
                    A052 (Local1, 0x68, Not (0x00), 0x20)
                    Sleep (0x1E)
                    While (And (A007 (Local1, 0x68), 0x08000000))
                    {
                        Sleep (0x0A)
                    }

                    Store (0x00, Local2)
                    If (LEqual (Arg1, 0x01))
                    {
                        Store (A053 (Arg0, 0xA4), Local4)
                        If (LNotEqual (And (Local4, 0x0800), 0x00))
                        {
                            Store (0x01, Local2)
                        }
                    }
                }

                A054 (Arg0)
            }
            Else
            {
            }

            If (LEqual (Arg0, 0x06))
            {
                A028 (0x00, 0x60, 0x80, Not (0x40), 0x00)
            }
        }

        Name (A055, Package (0x09)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A056, 0x00)
        Name (A057, 0x00)
        Method (A051, 1, Serialized)
        {
            Store (0x00, A056) /* \_SB_.A056 */
            Store (0x00, A057) /* \_SB_.A057 */
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            If (LEqual (Arg0, 0x06))
            {
                Store (A058 (0x00, 0x00), Index (A055, 0x00))
                A058 (0x00, 0x01)
                Return (0x00)
            }

            Store (A007 (Local1, 0x18), Local3)
            Store (And (ShiftRight (Local3, 0x08), 0xFF), Local3)
            Store (ShiftLeft (Local3, 0x08), Local2)
            Store (A007 (Local2, 0x0C), Local3)
            Store (And (ShiftRight (Local3, 0x10), 0xFF), Local3)
            If (LNotEqual (And (Local3, 0x80), 0x00))
            {
                Store (0x07, Local0)
            }
            Else
            {
                Store (0x00, Local0)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local0))
            {
                Store (A059 (Add (Local2, Local4), 0x10), A056) /* \_SB_.A056 */
                If (LEqual (A056, 0x00))
                {
                    Increment (Local4)
                    Continue
                }

                Add (A056, 0x10, A056) /* \_SB_.A056 */
                Store (A007 (Add (Local2, Local4), A056), A057) /* \_SB_.A057 */
                Store (And (A057, 0x03), Index (A055, Local4))
                A052 (Add (Local2, Local4), A056, Not (0x03), 0x00)
                Increment (Local4)
            }
        }

        Method (A054, 1, Serialized)
        {
            Store (0x00, A056) /* \_SB_.A056 */
            Store (0x00, A057) /* \_SB_.A057 */
            If (LEqual (Arg0, 0x06))
            {
                A058 (DerefOf (Index (A055, 0x00)), 0x01)
                Return (0x00)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            Store (A007 (Local1, 0x18), Local3)
            Store (And (ShiftRight (Local3, 0x08), 0xFF), Local3)
            Store (ShiftLeft (Local3, 0x08), Local2)
            Store (A007 (Local2, 0x0C), Local3)
            Store (And (ShiftRight (Local3, 0x10), 0xFF), Local3)
            If (LNotEqual (And (Local3, 0x80), 0x00))
            {
                Store (0x07, Local0)
            }
            Else
            {
                Store (0x00, Local0)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local0))
            {
                Store (A059 (Add (Local2, Local4), 0x10), A056) /* \_SB_.A056 */
                If (LEqual (A056, 0x00))
                {
                    Increment (Local4)
                    Continue
                }

                Add (A056, 0x10, A056) /* \_SB_.A056 */
                A008 (Add (Local2, Local4), A056, DerefOf (Index (A055, Local4
                    )))
                Increment (Local4)
            }
        }

        Method (A049, 2, NotSerialized)
        {
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            If (LEqual (Arg1, 0x01))
            {
                A052 (Local0, 0x88, Not (0x2F), 0x21)
                A050 (Arg0, 0xA4, Not (0x20000001), 0x00)
            }
            Else
            {
                A050 (Arg0, 0xA4, Not (0x20000001), 0x20000001)
                A052 (Local0, 0x88, Not (0x2F), 0x02)
            }
        }

        Method (A047, 2, Serialized)
        {
            Store (A042 (0x00, 0x60, 0xEA), Local1)
            Or (Local1, 0x02, Local1)
            A043 (0x00, 0x60, 0xEA, Local1)
            And (Local1, Not (ShiftLeft (0x03, 0x03)), Local1)
            Or (Local1, ShiftLeft (Arg0, 0x03), Local1)
            And (Not (Local1), 0x04, Local2)
            Or (And (Local1, Not (0x04)), Local2, Local1)
            A043 (0x00, 0x60, 0xEA, Local1)
            If (LNotEqual (Arg1, 0x00))
            {
                While (LNotEqual (ShiftLeft (Local1, 0x02), Local2))
                {
                    And (A042 (0x00, 0x60, 0xEB), 0x01, Local1)
                }
            }
        }

        Method (A044, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local1)
            Store (0x00, Local0)
            While (LLess (Local0, Local1))
            {
                Store (DerefOf (Index (DerefOf (Arg0), Local0)), Index (DerefOf (Arg1), 
                    Local0))
                Increment (Local0)
            }
        }

        Method (A027, 0, NotSerialized)
        {
            Return (And (A016, A017))
        }

        Name (A060, 0x00)
        Name (A061, 0x00)
        Name (A062, 0x00)
        Name (A063, 0x00)
        Name (A064, 0x00)
        Name (A065, 0x00)
        Method (A066, 1, NotSerialized)
        {
            Store (Buffer (0x0100) {}, Local7)
            CreateWordField (Local7, 0x00, A033)
            CreateWordField (Local7, 0x02, A067)
            CreateByteField (Arg0, 0x02, A068)
            Store (0x03, A033) /* \_SB_.A066.A033 */
            Store (A068, A067) /* \_SB_.A066.A067 */
            Return (Local7)
        }

        Method (A069, 1, Serialized)
        {
            Store (DerefOf (Index (Arg0, 0x04)), Local0)
            Store (DerefOf (Index (Arg0, 0x02)), Local1)
            Subtract (ShiftRight (Local1, 0x03), 0x02, Local1)
            If (LEqual (Local0, 0x01))
            {
                Store (0x06, Local2)
            }
            Else
            {
                Store (0x04, Local2)
            }

            Store (A070 (Local1, Local2), Local0)
            Store (Buffer (0x0A) {}, Local7)
            CreateWordField (Local7, 0x00, A033)
            CreateByteField (Local7, 0x02, A034)
            CreateByteField (Local7, 0x03, A071)
            Store (0x04, A033) /* \_SB_.A069.A033 */
            Store (0x00, A034) /* \_SB_.A069.A034 */
            Store (Local0, A071) /* \_SB_.A069.A071 */
            Return (Local7)
        }

        Name (A072, Buffer (0x0A)
        {
            /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0008 */   0x00, 0x00
        })
        Method (A070, 2, Serialized)
        {
            Store (0x00, Local4)
            Store (A073 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x07)), Local1)
            If (LNotEqual (Local1, 0x01))
            {
                Return (Local4)
            }

            Store (Arg1, Local2)
            While (LNotEqual (Local2, 0x08))
            {
                If (LEqual (Local2, 0x06))
                {
                    Store (0x00, Index (A014, Arg0))
                    A050 (Arg0, 0xA2, Not (0x2000), 0x00)
                    Store (0x00, A017) /* \_SB_.A017 */
                    A029 ()
                    A074 (Arg0, 0x01)
                    A075 (Arg0, 0x00)
                    Store (0x01, Local2)
                    Store (0x00, Local3)
                }

                If (LEqual (Local2, 0x01))
                {
                    And (A053 (Arg0, 0xA5), 0x3F, Local1)
                    If (LGreater (Local1, 0x04))
                    {
                        Store (0x02, Local2)
                        Store (0x00, Local3)
                        Continue
                    }

                    If (LLess (Local3, 0x50))
                    {
                        Sleep (0x01)
                        Increment (Local3)
                    }
                    Else
                    {
                        Store (0x04, Local2)
                    }
                }

                If (LEqual (Local2, 0x02))
                {
                    Store (A053 (Arg0, 0xA5), Local1)
                    And (Local1, 0x3F, Local1)
                    If (LEqual (Local1, 0x10))
                    {
                        Store (0x05, Local2)
                        Continue
                    }

                    If (LLess (Local3, 0x50))
                    {
                        Sleep (0x01)
                        Increment (Local3)
                        Continue
                    }

                    Store (0x04, Local2)
                    If (LEqual (DerefOf (Index (A014, Arg0)), 0x01))
                    {
                        Continue
                    }

                    If (LEqual (A076 (Arg0), 0x01))
                    {
                        A050 (Arg0, 0xA2, Not (0x2000), 0x2000)
                        Store (0x01, Index (A014, Arg0))
                        A049 (Arg0, 0x01)
                        Store (0x07, Local2)
                    }
                }

                If (LEqual (Local2, 0x04))
                {
                    A075 (Arg0, 0x01)
                    A074 (Arg0, 0x00)
                    Store (0x01, Index (A014, Arg0))
                    Store (0x00, Local2)
                }

                If (LEqual (Local2, 0x07))
                {
                    If (CondRefOf (\_SB.ALIC, Local6))
                    {
                        Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
                        \_SB.ALIC (Local1, 0x00, Sleep (0x02), \_SB.ALIC (Local1, 0x01, Store (0x00, 
                            Local3), Store (0x01, Local2), Continue, Store (0x04, Local2)), If (LEqual (Local2, 
                            0x05))
                            {
                                Store (0x01, Local4)
                                Store (0x00, Local2)
                                A074 (Arg0, 0x02)
                            }, If (LEqual (Local2, 0x00))
                            {
                                Store (0x01, A017) /* \_SB_.A017 */
                                A029 ()
                                Store (0x08, Local2)
                            })
                    }
                }
            }

            Return (Local4)
        }

        Method (A074, 2, Serialized)
        {
            Store (A073 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x02)), A062) /* \_SB_.A062 */
            Store (DerefOf (Index (Local7, 0x03)), A063) /* \_SB_.A063 */
            If (LEqual (Arg1, 0x00))
            {
                A077 (Arg0, A062, A063, 0x01)
            }

            If (LEqual (Arg1, 0x01))
            {
                A077 (Arg0, A062, A063, 0x00)
            }

            If (LNotEqual (Arg1, 0x02))
            {
                Return (0x00)
            }

            Store (A078 (Arg0, 0x00), Local2)
            If (LLessEqual (A078 (Arg0, 0x01), Local2))
            {
                Return (0x00)
            }

            Store (A079 (Arg0), Local1)
            If (LEqual (Local1, 0x00))
            {
                Add (A062, Local2, Local3)
                Store (A063, Local4)
            }
            Else
            {
                Subtract (A063, Local2, Local4)
                Store (A062, Local3)
            }

            A077 (Arg0, Local3, Local4, 0x01)
            Return (0x00)
        }

        Method (A076, 1, NotSerialized)
        {
            Store (Buffer (0x10) {}, Local1)
            Store (0x00, Local0)
            While (LLessEqual (Local0, 0x03))
            {
                Store (A053 (Arg0, Add (Local0, 0xA5)), Local2)
                Store (Local2, Index (Local1, Multiply (Local0, 0x04)))
                Store (ShiftRight (Local2, 0x08), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x01)))
                Store (ShiftRight (Local2, 0x10), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x02)))
                Store (ShiftRight (Local2, 0x18), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x03)))
                Increment (Local0)
            }

            Store (0x00, Local0)
            While (LLess (Local0, 0x0F))
            {
                If (LAnd (LEqual (DerefOf (Index (Local1, Local0)), 0x2A), LEqual (
                    DerefOf (Index (Local1, Add (Local0, 0x01))), 0x09)))
                {
                    Return (0x01)
                }

                Increment (Local0)
            }

            Return (0x00)
        }

        Method (A079, 1, Serialized)
        {
            Store (A073 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x00)), A060) /* \_SB_.A060 */
            Store (DerefOf (Index (Local7, 0x01)), A061) /* \_SB_.A061 */
            Store (0x00, Local0)
            If (LGreater (A060, A061))
            {
                Store (0x01, Local0)
            }

            And (A053 (Arg0, 0x50), 0x01, Local1)
            Return (And (XOr (Local0, Local1), 0x01))
        }

        Method (A075, 2, NotSerialized)
        {
            Store (A073 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x04)), A065) /* \_SB_.A065 */
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A064) /* \_SB_.A064 */
            A028 (0x00, 0xE0, Or (ShiftLeft (A064, 0x10), Add (0x0800, 
                Multiply (0x0100, A065))), Not (0x01), Arg1)
        }

        Name (A080, Buffer (0x07)
        {
             0x00, 0x01, 0x02, 0x04, 0x08, 0x0C, 0x10
        })
        Method (A078, 2, NotSerialized)
        {
            If (LEqual (Arg1, 0x00))
            {
                And (ShiftRight (A053 (Arg0, 0xA2), 0x04), 0x07, Local0)
                Store (DerefOf (Index (A080, Local0)), Local1)
            }
            Else
            {
                Store (A073 (Arg0), Local7)
                Store (DerefOf (Index (Local7, 0x00)), A060) /* \_SB_.A060 */
                Store (DerefOf (Index (Local7, 0x01)), A061) /* \_SB_.A061 */
                If (LGreater (A060, A061))
                {
                    Subtract (A060, A061, Local1)
                }
                Else
                {
                    Subtract (A061, A060, Local1)
                }

                Increment (Local1)
            }

            Return (Local1)
        }

        Method (A077, 4, Serialized)
        {
            Store (A073 (Arg0), Local7)
            Store (Arg1, A062) /* \_SB_.A062 */
            Store (Arg2, A063) /* \_SB_.A063 */
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A064) /* \_SB_.A064 */
            If (LGreater (A062, A063))
            {
                Subtract (A062, A063, Local1)
                Store (A063, Local2)
            }
            Else
            {
                Subtract (A063, A062, Local1)
                Store (A062, Local2)
            }

            ShiftLeft (Subtract (ShiftLeft (0x01, Add (Local1, 0x01)), 0x01
                ), Local2, Local3)
            Store (Not (Local3), Local4)
            If (LEqual (Arg3, 0x01))
            {
                Store (0x00, Local3)
            }

            A028 (0x00, 0xE0, Or (ShiftLeft (A064, 0x10), 0x8023), 
                Local4, Local3)
            Stall (0x0A)
        }

        Method (A002, 2, NotSerialized)
        {
            Store (A003 (0x8490), Local0)
            If (LNotEqual (And (Local0, 0xF0), 0x00))
            {
                If (LEqual (Arg0, 0x02))
                {
                    And (Local0, 0xFFFFFFA0, Local0)
                    Or (Local0, 0xA0, Local0)
                }
                Else
                {
                    If (LEqual (Arg1, 0x00))
                    {
                        And (Local0, 0xFFFFFF60, Local0)
                        Or (Local0, 0x60, Local0)
                    }
                    Else
                    {
                        And (Local0, 0xFFFFFF20, Local0)
                        Or (Local0, 0x20, Local0)
                    }
                }

                A004 (0x8490, Local0)
            }
        }

        Method (A005, 1, NotSerialized)
        {
        }

        Name (AD0B, 0x01)
        Method (A006, 1, NotSerialized)
        {
            If (LEqual (AD0B, 0x01))
            {
                Store (Or (ShiftLeft (0x18, 0x03), 0x04), Local1)
                Store (A007 (Local1, 0x015C), Local2)
                If (LEqual (Arg0, 0x00))
                {
                    Or (Local2, 0x01, Local2)
                }
                Else
                {
                    And (Local2, 0xFFFFFFFC, Local2)
                }

                A008 (Local1, 0x015C, Local2)
            }
        }
    }
}

