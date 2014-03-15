/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140114-64 [Jan 22 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of dsdt.dat, Sat Mar 15 17:46:08 2014
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00007A6D (31341)
 *     Revision         0x02
 *     Checksum         0x33
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 2, "ALASKA", "A M I", 0x00000000)
{
    /*
     * iASL Warning: There were 1 external control methods found during
     * disassembly, but additional ACPI tables to resolve these externals
     * were not specified. This resulting disassembler output file may not
     * compile because the disassembler did not know how many arguments
     * to assign to these methods. To specify the tables needed to resolve
     * external control method references, use the one of the following
     * example iASL invocations:
     *     iasl -e <ssdt1.aml,ssdt2.aml...> -d <dsdt.aml>
     *     iasl -e <dsdt.aml,ssdt2.aml...> -d <ssdt1.aml>
     */
    External (ALIB, MethodObj)    // Warning: Unresolved Method, guessing 2 arguments (may be incorrect, see warning above)


    Name (SP1O, 0x2E)
    Name (IO1B, 0x0A00)
    Name (IO1L, 0x20)
    Name (IO2B, 0x0225)
    Name (IO2L, 0x10)
    Name (IO3B, Zero)
    Name (IO3L, Zero)
    Name (IOES, Zero)
    Name (SMBB, 0x0B20)
    Name (SMBL, 0x20)
    Name (SMB0, 0x0B00)
    Name (SMBM, 0x10)
    Name (PMBS, 0x0800)
    Name (PMLN, 0xA0)
    Name (SMIO, 0xB2)
    Name (GPBS, Zero)
    Name (GPLN, Zero)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (SPIB, 0xFEC10000)
    Name (SPIL, 0x1000)
    Name (HPTB, 0xFED00000)
    Name (HPTL, 0x1000)
    Name (GIOB, 0xFED80100)
    Name (IOMB, 0xFED80D00)
    Name (SMIB, 0xFED80200)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, One)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (PEBS, 0xE0000000)
    Name (PEBL, 0x10000000)
    Name (DSSP, Zero)
    Name (FHPP, Zero)
    Name (SMIT, 0xB2)
    Name (OFST, 0x35)
    Name (TPMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (TGPE, 0x1F)
    Name (TPCH, Zero)
    Name (CTRR, 0x7A)
    Name (ATIS, 0x55)
    Name (MBEC, Zero)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
            \_SB.IRQC ()
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8)
        }

        Store (One, OSVR)
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Linux"))
            {
                Store (0x03, OSVR)
            }

            If (_OSI ("Windows 2001"))
            {
                Store (0x04, OSVR)
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x05, OSVR)
            }

            If (_OSI ("FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (_OSI ("HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (_OSI ("OpenVMS"))
            {
                Store (0x08, OSVR)
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x09, OSVR)
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x0A, OSVR)
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                Store (0x0B, OSVR)
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x0C, OSVR)
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                Store (0x0D, OSVR)
            }

            If (_OSI ("Windows 2009"))
            {
                Store (0x0E, OSVR)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (Zero, OSVR)
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                Store (One, OSVR)
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x02, OSVR)
            }

            If (MCTH (_OS, "Linux"))
            {
                Store (0x03, OSVR)
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                Store (0x06, OSVR)
            }

            If (MCTH (_OS, "HP-UX"))
            {
                Store (0x07, OSVR)
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                Store (0x08, OSVR)
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, Zero)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0x440F)
    Name (TOPM, 0x00000000)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    Name (OSTY, Ones)
    OperationRegion (ACMS, SystemIO, 0x72, 0x10)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ICMS,   8, 
        DCMS,   8, 
        Offset (0x0E), 
        P80,    8
    }

    IndexField (ICMS, DCMS, ByteAcc, NoLock, Preserve)
    {
        Offset (0x08), 
        BS_A,   32
    }

    OperationRegion (CFGS, SystemMemory, BS_A, 0x0100)
    Field (CFGS, AnyAcc, NoLock, Preserve)
    {
        Offset (0x0C), 
        PCIE,   32, 
        Offset (0x7F), 
            ,   5, 
        GGN2,   1, 
        Offset (0x87), 
        GECE,   1, 
        IR_E,   1, 
        Offset (0x93), 
            ,   5, 
        OSCF,   1, 
        Offset (0x9E), 
        PRS0,   1, 
        DET0,   1, 
        Offset (0xA2), 
        PRS1,   1, 
        DET1,   1, 
        Offset (0xA6), 
        PRS2,   1, 
        DET2,   1, 
        Offset (0xAA), 
        PRS3,   1, 
        DET3,   1, 
        Offset (0xB2), 
            ,   6, 
        ABPS,   1, 
            ,   3, 
        GPPS,   1
    }

    OperationRegion (CMPT, SystemIO, 0x0C50, 0x03)
    Field (CMPT, ByteAcc, NoLock, Preserve)
    {
        CMID,   8, 
            ,   6, 
        GPCT,   2, 
        GP0I,   1, 
        GP1I,   1, 
        GP2I,   1, 
        GP3I,   1, 
        GP4I,   1, 
        GP5I,   1, 
        GP6I,   1, 
        GP7I,   1
    }

    OperationRegion (PCFG, SystemMemory, PCIE, 0x02000000)
    Field (PCFG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x20078), 
        Offset (0x2007A), 
        PMSA,   1, 
        Offset (0x28078), 
        Offset (0x2807A), 
        PMSB,   1, 
        Offset (0x48078), 
        Offset (0x4807A), 
        PMSC,   1, 
        Offset (0x8800A), 
        STCL,   16, 
        Offset (0xA0004), 
        SMIE,   1, 
        SMME,   1, 
        Offset (0xA0008), 
        RVID,   8, 
        Offset (0xA0014), 
        SMB1,   32, 
        Offset (0xA0082), 
            ,   2, 
        G31O,   1, 
        Offset (0xA00E1), 
            ,   6, 
        ACIR,   1, 
        Offset (0xA4004), 
        PCMD,   2, 
        Offset (0xA807A), 
        PMS0,   1, 
        Offset (0xA8088), 
        TLS0,   4, 
        Offset (0xA907A), 
        PMS1,   1, 
        Offset (0xA9088), 
        TLS1,   4, 
        Offset (0xAA07A), 
        PMS2,   1, 
        Offset (0xAA088), 
        TLS2,   4, 
        Offset (0xAB07A), 
        PMS3,   1, 
        Offset (0xAB088), 
        TLS3,   4
    }

    OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        INPM,   8, 
        DAPM,   8
    }

    IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
    {
        Offset (0x24), 
        MMSO,   32, 
        Offset (0x60), 
        P1EB,   16
    }

    OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
    Field (ERMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x132), 
            ,   7, 
        GP51,   1, 
        Offset (0x136), 
            ,   7, 
        GP55,   1, 
        Offset (0x13A), 
            ,   7, 
        GP59,   1, 
        Offset (0x13D), 
        GP62,   8, 
        Offset (0x13F), 
            ,   7, 
        GP64,   1, 
        Offset (0x16A), 
            ,   7, 
        GE11,   1, 
            ,   7, 
        GE12,   1, 
        Offset (0x16E), 
            ,   7, 
        BATS,   1, 
        Offset (0x287), 
            ,   1, 
        CLPS,   1, 
        Offset (0x298), 
            ,   7, 
        G15A,   1, 
        Offset (0x2AF), 
            ,   2, 
        SLPS,   2, 
        Offset (0x376), 
        EPNM,   1, 
        DPPF,   1, 
        Offset (0x3BA), 
            ,   6, 
        PWDE,   1, 
        Offset (0x3BD), 
            ,   5, 
        ALLS,   1, 
        Offset (0x3EF), 
        PHYD,   1, 
            ,   1, 
            ,   1, 
        US5R,   1, 
        Offset (0x3F5), 
        GECD,   1
    }

    OperationRegion (ABIO, SystemIO, 0x0CD8, 0x08)
    Field (ABIO, DWordAcc, NoLock, Preserve)
    {
        INAB,   32, 
        DAAB,   32
    }

    Method (RDAB, 1, NotSerialized)
    {
        Store (Arg0, INAB)
        Return (DAAB)
    }

    Method (WTAB, 2, NotSerialized)
    {
        Store (Arg0, INAB)
        Store (Arg1, DAAB)
    }

    Method (RWAB, 3, NotSerialized)
    {
        And (RDAB (Arg0), Arg1, Local0)
        Or (Local0, Arg2, Local1)
        WTAB (Arg0, Local1)
    }

    Method (CABR, 3, NotSerialized)
    {
        ShiftLeft (Arg0, 0x05, Local0)
        Add (Local0, Arg1, Local1)
        ShiftLeft (Local1, 0x18, Local2)
        Add (Local2, Arg2, Local3)
        Return (Local3)
    }

    Method (GHPS, 2, NotSerialized)
    {
        If (LEqual (Arg0, Zero))
        {
            If (LEqual (Arg1, Zero))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFEFFF, Zero)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFEFE, Zero)
                Store (One, DET0)
            }

            If (LEqual (Arg1, 0x02))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, Zero)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, Zero)
                Store (One, DET2)
            }

            Stall (0xC8)
        }

        If (LEqual (Arg0, One))
        {
            If (LEqual (Arg1, Zero))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFEFFF, 0x1000)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFEFE, 0x0101)
                Store (Zero, DET0)
            }

            If (LEqual (Arg1, 0x02))
            {
                RWAB (CABR (0x06, Zero, 0xC0), 0xFFFFBFFF, 0x4000)
                RWAB (CABR (One, Zero, 0x65), 0xFFFFFBFB, 0x0404)
                Store (Zero, DET2)
            }

            Stall (0xC8)
        }

        If (GGN2)
        {
            If (LEqual (Arg0, Zero))
            {
                GEN2 ()
                Store (RDAB (CABR (0x03, 0x02, 0xA5)), Local0)
                And (Local0, 0xFF, Local0)
                Store (0x01F4, Local1)
                While (LAnd (LGreater (Local1, Zero), LNotEqual (Local0, 0x10)))
                {
                    Store (RDAB (CABR (0x03, 0x02, 0xA5)), Local0)
                    And (Local0, 0xFF, Local0)
                    Decrement (Local1)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                If (LNotEqual (Local0, 0x10))
                {
                    GEN1 ()
                }
            }
        }
    }

    Method (GEN2, 0, NotSerialized)
    {
        Store (0x02, TLS2)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, One)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        RWAB (CABR (0x03, 0x02, 0xC0), 0xFFFF7FFF, 0x8000)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xDFFFFFFF, 0x20000000)
        Stall (0xC8)
        Stall (0xC8)
    }

    Method (GEN1, 0, NotSerialized)
    {
        Store (One, TLS2)
        RWAB (CABR (0x03, 0x02, 0xA4), 0xFFFFFFFE, Zero)
        RWAB (CABR (0x03, 0x02, 0xA2), 0xFFFFDFFF, 0x2000)
        Stall (0xC8)
        Stall (0xC8)
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    Method (SPTS, 1, NotSerialized)
    {
        Store (One, PCMD)
        Store (Arg0, P80)
        CPMS ()
        CPMS ()
        Store (One, PEWS)
    }

    Method (SWAK, 1, NotSerialized)
    {
        CPMS ()
        CPMS ()
        Store (One, PEWS)
    }

    Method (TRMD, 1, NotSerialized)
    {
    }

    Method (CPMS, 0, NotSerialized)
    {
        If (LEqual (EPNM, Zero))
        {
            Store (One, PMSA)
            Store (One, PMSB)
            Store (One, PMSC)
            Store (One, PMS0)
            Store (One, PMS1)
            Store (One, PMS2)
            Store (One, PMS3)
        }
    }

    Scope (_GPE)
    {
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x17)
        {
            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }
        })
        Name (AR00, Package (0x17)
        {
            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x11
            }
        })
        Name (PR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR21, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR21, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR14, Package (0x02)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }
        })
        Name (AR14, Package (0x02)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }
        })
        Name (PR15, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }
        })
        Name (AR15, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }
        })
        Name (PR16, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }
        })
        Name (AR16, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }
        })
        Name (PR17, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }
        })
        Name (AR17, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }
        })
        Name (PR18, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }
        })
        Name (AR18, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x14
            }
        })
        Name (PR0C, Package (0x08)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKE, 
                Zero
            }
        })
        Name (AR0C, Package (0x08)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                Zero, 
                0x14
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {4,7,10,11,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, 0x00180000)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Name (CPRB, One)
            Name (LVGA, 0x55)
            Name (BRB, 0x0000)
            Name (BRL, 0x0100)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0xC0000000)
            Name (MBL, 0x40000000)
            Name (MABL, 0x00000000)
            Name (MABH, 0x00000000)
            Name (MALL, 0x00000000)
            Name (MALH, 0x00000000)
            Name (MAML, 0x00000000)
            Name (MAMH, 0x00000000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y00)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDFC0000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y08, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                BreakPoint
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    Store (BRB, MIN0)
                    Store (BRL, LEN0)
                    Store (LEN0, Local0)
                    Add (MIN0, Decrement (Local0), MAX0)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If (LEqual (IOB, 0x1000))
                    {
                        Store (IOL, Local0)
                        Add (IOB, Decrement (Local0), MAX1)
                        Subtract (MAX1, MIN1, Local0)
                        Add (Local0, One, LEN1)
                    }
                    Else
                    {
                        Store (IOB, MIN1)
                        Store (IOL, LEN1)
                        Store (LEN1, Local0)
                        Add (MIN1, Decrement (Local0), MAX1)
                    }

                    If (LOr (LEqual (LVGA, One), LEqual (LVGA, 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            Store (0x03B0, IMN1)
                            Store (0x03DF, IMX1)
                            Store (0x30, ILN1)
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            Store (0x000A0000, VMN1)
                            Store (0x000BFFFF, VMX1)
                            Store (0x00020000, VLN1)
                            Store (Zero, VGAF)
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    Store (MBB, MIN3)
                    Store (MBL, LEN3)
                    Store (LEN3, Local0)
                    Add (MIN3, Decrement (Local0), MAX3)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Add (0xB4, 0x04, Local0)
                        CreateDWordField (CRS1, Local0, MN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Add (0xBC, 0x04, Local1)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Add (0xCC, 0x04, Local2)
                        CreateDWordField (CRS1, Local2, LN8H)
                        Store (MABL, MN8L)
                        Store (MABH, MN8H)
                        Store (MALL, LN8L)
                        Store (MALH, LN8H)
                        Store (MAML, MX8L)
                        Store (MAMH, MX8H)
                    }

                    Return (CRS1)
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    Store (BRB, MIN2)
                    Store (BRL, LEN2)
                    Store (LEN2, Local1)
                    Add (MIN2, Decrement (Local1), MAX2)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    Store (IOB, MIN4)
                    Store (IOL, LEN4)
                    Store (LEN4, Local1)
                    Add (MIN4, Decrement (Local1), MAX4)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        Store (0x03B0, IMN2)
                        Store (0x03DF, IMX2)
                        Store (0x30, ILN2)
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        Store (0x000A0000, VMN2)
                        Store (0x000BFFFF, VMX2)
                        Store (0x00020000, VLN2)
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    Store (MBB, MIN5)
                    Store (MBL, LEN5)
                    Store (LEN5, Local1)
                    Add (MIN5, Decrement (Local1), MAX5)
                    If (LOr (MALH, MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Add (0x72, 0x04, Local0)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Add (0x7A, 0x04, Local1)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Add (0x8A, 0x04, Local2)
                        CreateDWordField (CRS2, Local2, LN9H)
                        Store (MABL, MN9L)
                        Store (MABH, MN9H)
                        Store (MALL, LN9L)
                        Store (MALH, LN9H)
                        Store (MAML, MX9L)
                        Store (MAMH, MX9H)
                    }

                    Return (CRS2)
                }
            }

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Method (XCMP, 2, NotSerialized)
                    {
                        If (LNotEqual (0x10, SizeOf (Arg0)))
                        {
                            Return (Zero)
                        }

                        If (LNotEqual (0x10, SizeOf (Arg1)))
                        {
                            Return (Zero)
                        }

                        Store (Zero, Local0)
                        While (LLess (Local0, 0x10))
                        {
                            If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                                Arg1, Local0))))
                            {
                                Return (Zero)
                            }

                            Increment (Local0)
                        }

                        Return (One)
                    }

                    Device (AMDN)
                    {
                        Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                        Name (_UID, 0xC8)  // _UID: Unique ID
                        Name (_STA, 0x0F)  // _STA: Status
                        Name (NPTR, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y0C)
                        })
                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            CreateDWordField (NPTR, \_SB.PCI0.AMDN._Y0C._LEN, PL)  // _LEN: Length
                            CreateDWordField (NPTR, \_SB.PCI0.AMDN._Y0C._BAS, PB)  // _BAS: Base Address
                            Store (PEBS, PB)
                            Store (PEBL, PL)
                            Return (NPTR)
                        }
                    }
                }
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (SMBS, PCI_Config, Zero, 0x0100)
                Field (SMBS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x08), 
                    REV,    8, 
                    Offset (0x62), 
                    I1F,    1, 
                    I12F,   1, 
                        ,   2, 
                    MT3A,   1, 
                    Offset (0xF8), 
                    EIDX,   8, 
                    Offset (0xFC), 
                    EDAT,   32
                }

                IndexField (EIDX, EDAT, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    Offset (0x05), 
                        ,   3, 
                    G39E,   1, 
                    G41E,   1, 
                    Offset (0x06), 
                    Offset (0x07), 
                        ,   3, 
                    G39O,   1, 
                    G41O,   1
                }

                OperationRegion (WIDE, PCI_Config, 0xAD, One)
                Field (WIDE, AnyAcc, NoLock, Preserve)
                {
                    DUM1,   4, 
                    SOPT,   1
                }
            }

            Device (IDEC)
            {
                Name (_ADR, 0x00140001)  // _ADR: Address
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x0F, 
                    Zero
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    Zero
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    Zero
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, AnyAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                    Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                    Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, One), Add (Local1, 
                        One))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, PIT1)
                    CreateByteField (Arg0, One, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0008 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0010 */   0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, Zero, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, One))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, One))
                    {
                        Or (FLAG, One, FLAG)
                        Store (DerefOf (Index (UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, Zero, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                         0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, Zero, PIT1)
                    CreateByteField (BUF, One, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (PIOT, MLE, PIO0, MTR, Zero, Zero), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (PIOT, MLE, PIO1, MTR, Zero, Zero), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (PITR, Local0)), PIT0)
                    Store (DerefOf (Index (PITR, Local1)), PIT1)
                    If (And (FLAG, One))
                    {
                        Store (Match (UDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, One, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (Match (MDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (UDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (Match (MDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, Zero, MDT1)
                    CreateByteField (Arg1, One, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, One, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x15)
                    {
                        /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03,
                        /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x00, 0x00,
                        /* 0010 */   0x00, 0x00, 0x00, 0x00, 0xF5
                    })
                    CreateByteField (BUF, One, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    CreateByteField (BUF, 0x13, CMDC)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Store (Arg0, CMDC)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (MDMT, MLE, GETT (Local1), MTR, Zero, Zero), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        If (LOr (LGreaterEqual (^^^SMBS.REV, 0x3A), ^^^SMBS.SOPT))
                        {
                            Store (PPIT, VPIT)
                            Store (PMDT, VMDT)
                            Store (PPIC, VPIC)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                        }
                        Else
                        {
                            Store (SPIT, VPIT)
                            Store (SMDT, VMDT)
                            Store (SPIC, VPIC)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                        }

                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        If (LOr (LGreaterEqual (^^^SMBS.REV, 0x3A), ^^^SMBS.SOPT))
                        {
                            Store (VPIT, PPIT)
                            Store (VMDT, PMDT)
                            Store (VPIM, PPIM)
                            Store (VUDC, PUDC)
                            Store (VUDM, PUDM)
                        }
                        Else
                        {
                            Store (VPIT, SPIT)
                            Store (VMDT, SMDT)
                            Store (VPIM, SPIM)
                            Store (VUDC, SUDC)
                            Store (VUDM, SUDM)
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            If (LOr (LGreaterEqual (^^^^SMBS.REV, 0x3A), ^^^^SMBS.SOPT))
                            {
                                Store (PMDT, VMDT)
                                Store (PPIM, VPIM)
                                Store (PUDC, VUDC)
                                Store (PUDM, VUDM)
                            }
                            Else
                            {
                                Store (SMDT, VMDT)
                                Store (SPIM, VPIM)
                                Store (SUDC, VUDC)
                                Store (SUDM, VUDM)
                            }

                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            If (LOr (LGreaterEqual (^^^^SMBS.REV, 0x3A), ^^^^SMBS.SOPT))
                            {
                                Store (PMDT, VMDT)
                                Store (PPIM, VPIM)
                                Store (PUDC, VUDC)
                                Store (PUDM, VUDM)
                            }
                            Else
                            {
                                Store (SMDT, VMDT)
                                Store (SPIM, VPIM)
                                Store (SUDC, VUDC)
                                Store (SUDM, VUDM)
                            }

                            Return (GTF (0xB0, BUF))
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        If (LOr (LGreaterEqual (^^^SMBS.REV, 0x3A), ^^^SMBS.SOPT))
                        {
                            Store (SPIT, VPIT)
                            Store (SMDT, VMDT)
                            Store (SPIC, VPIC)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                        }
                        Else
                        {
                            Store (PPIT, VPIT)
                            Store (PMDT, VMDT)
                            Store (PPIC, VPIC)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                        }

                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        If (LOr (LGreaterEqual (^^^SMBS.REV, 0x3A), ^^^SMBS.SOPT))
                        {
                            Store (VPIT, SPIT)
                            Store (VMDT, SMDT)
                            Store (VPIM, SPIM)
                            Store (VUDC, SUDC)
                            Store (VUDM, SUDM)
                        }
                        Else
                        {
                            Store (VPIT, PPIT)
                            Store (VMDT, PMDT)
                            Store (VPIM, PPIM)
                            Store (VUDC, PUDC)
                            Store (VUDM, PUDM)
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            If (LOr (LGreaterEqual (^^^^SMBS.REV, 0x3A), ^^^^SMBS.SOPT))
                            {
                                Store (SMDT, VMDT)
                                Store (SPIM, VPIM)
                                Store (SUDC, VUDC)
                                Store (SUDM, VUDM)
                            }
                            Else
                            {
                                Store (PMDT, VMDT)
                                Store (PPIM, VPIM)
                                Store (PUDC, VUDC)
                                Store (PUDM, VUDM)
                            }

                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            If (LOr (LGreaterEqual (^^^^SMBS.REV, 0x3A), ^^^^SMBS.SOPT))
                            {
                                Store (SMDT, VMDT)
                                Store (SPIM, VPIM)
                                Store (SUDC, VUDC)
                                Store (SUDM, VUDM)
                            }
                            Else
                            {
                                Store (PMDT, VMDT)
                                Store (PPIM, VPIM)
                                Store (PUDC, VUDC)
                                Store (PUDM, VUDM)
                            }

                            Return (GTF (0xB0, BUF))
                        }
                    }
                }
            }

            Device (SBAZ)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, Zero, 0x0100)
                Field (PCI, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DNSP,   1, 
                    DNSO,   1, 
                    ENSR,   1
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1B, 0x04))
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                OperationRegion (RMBS, PCI_Config, Zero, 0x0100)
                Field (RMBS, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x6C), 
                    LR2S,   16, 
                    LR2E,   16
                }

                Method (SPTS, 1, NotSerialized)
                {
                }

                Method (SWAK, 1, NotSerialized)
                {
                }

                Device (S800)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x0700)  // _UID: Unique ID
                    Name (_STA, 0x0F)  // _STA: Status
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C52,             // Range Minimum
                            0x0C52,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD2,             // Range Minimum
                            0x0CD2,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0D)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y10)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0F)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0E)
                        IO (Decode16,
                            0x0900,             // Range Minimum
                            0x0900,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0910,             // Range Minimum
                            0x0910,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x00,               // Alignment
                            0xFF,               // Length
                            )
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y11)
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED80000,         // Address Base
                            0x00010000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED61000,         // Address Base
                            0x00010000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y12)
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y13)
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y14)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0D._MIN, PBB)  // _MIN: Minimum Base Address
                        CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0D._MAX, PBH)  // _MAX: Maximum Base Address
                        CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y0D._LEN, PML)  // _LEN: Length
                        Store (PMBS, PBB)
                        Store (PMBS, PBH)
                        Store (PMLN, PML)
                        If (SMBB)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0E._MIN, SMB1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0E._MAX, SMH1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y0E._LEN, SML1)  // _LEN: Length
                            Store (SMBB, SMB1)
                            Store (SMBB, SMH1)
                            Store (SMBL, SML1)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0F._MIN, SMB0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y0F._MAX, SMH0)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y0F._LEN, SML0)  // _LEN: Length
                            Store (SMB0, SMB0)
                            Store (SMB0, SMH0)
                            Store (SMBM, SML0)
                        }

                        If (GPBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y10._MIN, IGB)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.S800._Y10._MAX, IGH)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.S800._Y10._LEN, IGL)  // _LEN: Length
                            Store (GPBS, IGB)
                            Store (GPBS, IGH)
                            Store (GPLN, IGL)
                        }

                        If (APCB)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y11._BAS, APB)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y11._LEN, APL)  // _LEN: Length
                            Store (APCB, APB)
                            Store (APCL, APL)
                        }

                        If (SPIB)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y12._BAS, SPIB)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y12._LEN, SPIL)  // _LEN: Length
                            Store (\SPIB, SPIB)
                            Store (\SPIL, SPIL)
                        }

                        If (HPTB)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y13._BAS, HXTB)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y13._LEN, HXTL)  // _LEN: Length
                            Store (HPTB, HXTB)
                            Store (HPTL, HXTL)
                        }

                        CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y14._BAS, ROMB)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.SBRG.S800._Y14._LEN, ROML)  // _LEN: Length
                        If (LR2S)
                        {
                            Store (ShiftLeft (LR2S, 0x10), ROMB)
                            Store (ShiftLeft (Add (Subtract (LR2E, LR2S), One), 0x10
                                ), ROML)
                        }
                        Else
                        {
                            Store (ROMS, ROMB)
                            Subtract (Zero, ROMS, ROML)
                        }

                        Return (CRS)
                    }
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x0111)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y15)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y16)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y17)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (LAnd (LLess (SP1O, 0x03F0), LGreater (SP1O, 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._MIN, GPI0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._MAX, GPI1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y15._LEN, GPIL)  // _LEN: Length
                            Store (SP1O, GPI0)
                            Store (SP1O, GPI1)
                            Store (0x02, GPIL)
                        }

                        If (IO1B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y16._LEN, GPL1)  // _LEN: Length
                            Store (IO1B, GP10)
                            Store (IO1B, GP11)
                            Store (IO1L, GPL1)
                        }

                        If (IO2B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MIN, GP20)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MAX, GP21)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._LEN, GPL2)  // _LEN: Length
                            Store (IO2B, GP20)
                            Store (IO2B, GP21)
                            Store (IO2L, GPL2)
                        }

                        If (IO3B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MIN, GP30)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MAX, GP31)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._LEN, GPL3)  // _LEN: Length
                            Store (IO3B, GP30)
                            Store (IO2B, GP31)
                            Store (IO3L, GPL3)
                        }

                        Return (CRS)
                    }

                    Name (DCAT, Package (0x15)
                    {
                        One, 
                        0x02, 
                        0x03, 
                        Zero, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF
                    })
                    Mutex (MUT0, 0x00)
                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (MUT0, 0x0FFF)
                        Store (0x87, INDX)
                        Store (0x87, INDX)
                        Store (Arg0, LDN)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                        Release (MUT0)
                    }

                    Method (LPTM, 0, NotSerialized)
                    {
                        ENFG (CGLD (0x02))
                        And (OPT0, 0x02, Local0)
                        EXFG ()
                        Return (Local0)
                    }

                    Method (UHID, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT1, 0x80, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                        Else
                        {
                            Return (0x0105D041)
                        }
                    }

                    OperationRegion (IOID, SystemIO, SP1O, 0x02)
                    Field (IOID, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x21), 
                        SCF1,   8, 
                        SCF2,   8, 
                        SCF3,   8, 
                        SCF4,   8, 
                        SCF5,   8, 
                        SCF6,   8, 
                        Offset (0x29), 
                        CKCF,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IOH2,   8, 
                        IOL2,   8, 
                        Offset (0x70), 
                        INTR,   8, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xE0), 
                        RGE0,   8, 
                        RGE1,   8, 
                        RGE2,   8, 
                        RGE3,   8, 
                        RGE4,   8, 
                        RGE5,   8, 
                        RGE6,   8, 
                        RGE7,   8, 
                        RGE8,   8, 
                        RGE9,   8, 
                        Offset (0xF0), 
                        OPT0,   8, 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8, 
                        OPT5,   8, 
                        OPT6,   8, 
                        OPT7,   8, 
                        OPT8,   8, 
                        OPT9,   8
                    }

                    OperationRegion (RNTR, SystemIO, IO2B, IO2L)
                    Field (RNTR, ByteAcc, NoLock, Preserve)
                    {
                        PMES,   8, 
                        Offset (0x04), 
                        PMEE,   1, 
                        Offset (0x05), 
                        Offset (0x08), 
                        PMS3,   8, 
                        PMS2,   8, 
                        PMS1,   8, 
                        Offset (0x0C), 
                        PME3,   8, 
                        PME2,   8, 
                        PME1,   8
                    }

                    Method (CGLD, 1, NotSerialized)
                    {
                        Return (DerefOf (Index (DCAT, Arg0)))
                    }

                    Method (DSTA, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Store (ACTR, Local0)
                        EXFG ()
                        If (LEqual (Local0, 0xFF))
                        {
                            Return (Zero)
                        }

                        And (Local0, One, Local0)
                        If (LGreaterEqual (Arg0, 0x10))
                        {
                            Or (IOES, ShiftLeft (Local0, And (Arg0, 0x0F)), IOES)
                        }
                        Else
                        {
                            Or (IOST, ShiftLeft (Local0, Arg0), IOST)
                        }

                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LGreaterEqual (Arg0, 0x10))
                            {
                                Store (IOES, Local0)
                            }
                            Else
                            {
                                Store (IOST, Local0)
                            }

                            And (Arg0, 0x0F, Local1)
                            If (And (ShiftLeft (One, Local1), Local0))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Method (DCNT, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        If (LAnd (LLess (DMCH, 0x04), LNotEqual (And (DMCH, 0x03, 
                            Local1), Zero)))
                        {
                            RDMA (Arg0, Arg1, Increment (Local1))
                        }

                        Store (Arg1, ACTR)
                        ShiftLeft (IOAH, 0x08, Local1)
                        Or (IOAL, Local1, Local1)
                        RRIO (Arg0, Arg1, Local1, 0x08)
                        EXFG ()
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1A)
                        IRQNoFlags (_Y18)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y19)
                            {}
                    })
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y18._INT, IRQM)  // _INT: Interrupts
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y19._DMA, DMAM)  // _DMA: Direct Memory Access
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MIN, IO11)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._MAX, IO12)  // _MAX: Maximum Base Address
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1A._LEN, LEN1)  // _LEN: Length
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1D)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1E)
                        IRQNoFlags (_Y1B)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1C)
                            {2}
                    })
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1B._INT, IRQE)  // _INT: Interrupts
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1C._DMA, DMAE)  // _DMA: Direct Memory Access
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MIN, IO21)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._MAX, IO22)  // _MAX: Maximum Base Address
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1D._LEN, LEN2)  // _LEN: Length
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MIN, IO31)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._MAX, IO32)  // _MAX: Maximum Base Address
                    CreateByteField (CRS2, \_SB.PCI0.SBRG.SIO1._Y1E._LEN, LEN3)  // _LEN: Length
                    Name (CRS4, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y20)
                        IRQ (Edge, ActiveLow, Shared, _Y1F)
                            {}
                    })
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y1F._INT, IRQL)  // _INT: Interrupts
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MIN, IOHL)  // _MIN: Minimum Base Address
                    CreateWordField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._MAX, IORL)  // _MAX: Maximum Base Address
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._ALN, ALMN)  // _ALN: Alignment
                    CreateByteField (CRS4, \_SB.PCI0.SBRG.SIO1._Y20._LEN, LENG)  // _LEN: Length
                    Method (DCRS, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IO11)
                        Or (IOAL, IO11, IO11)
                        Store (IO11, IO12)
                        Store (0x08, LEN1)
                        If (INTR)
                        {
                            ShiftLeft (One, INTR, IRQM)
                        }
                        Else
                        {
                            Store (Zero, IRQM)
                        }

                        If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                        {
                            Store (Zero, DMAM)
                        }
                        Else
                        {
                            And (DMCH, 0x03, Local1)
                            ShiftLeft (One, Local1, DMAM)
                        }

                        EXFG ()
                        Return (CRS1)
                    }

                    Method (DCR2, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IO21)
                        Or (IOAL, IO21, IO21)
                        Store (IO21, IO22)
                        Store (0x08, LEN2)
                        ShiftLeft (IOH2, 0x08, IO31)
                        Or (IOL2, IO31, IO31)
                        Store (IO21, IO32)
                        Store (0x08, LEN3)
                        If (INTR)
                        {
                            ShiftLeft (One, INTR, IRQE)
                        }
                        Else
                        {
                            Store (Zero, IRQE)
                        }

                        If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                        {
                            Store (Zero, DMAE)
                        }
                        Else
                        {
                            And (DMCH, 0x03, Local1)
                            ShiftLeft (One, Local1, DMAE)
                        }

                        EXFG ()
                        Return (CRS2)
                    }

                    Method (DCR4, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        ShiftLeft (IOAH, 0x08, IOHL)
                        Or (IOAL, IOHL, IOHL)
                        Store (IOHL, IORL)
                        Store (0x08, LENG)
                        If (INTR)
                        {
                            And (INTR, 0x0F, INTR)
                            ShiftLeft (One, INTR, IRQL)
                        }
                        Else
                        {
                            Store (Zero, IRQL)
                        }

                        EXFG ()
                        Return (CRS4)
                    }

                    Method (DSRS, 2, NotSerialized)
                    {
                        If (LEqual (Arg1, 0x02))
                        {
                            If (LPTM ())
                            {
                                DSR2 (Arg0, Arg1)
                            }
                        }
                        Else
                        {
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateByteField (Arg0, 0x0C, DMAM)
                            CreateWordField (Arg0, 0x02, IO11)
                            ENFG (CGLD (Arg1))
                            And (IO11, 0xFF, IOAL)
                            ShiftRight (IO11, 0x08, IOAH)
                            If (IRQM)
                            {
                                FindSetRightBit (IRQM, Local0)
                                Subtract (Local0, One, INTR)
                            }
                            Else
                            {
                                Store (Zero, INTR)
                            }

                            If (DMAM)
                            {
                                FindSetRightBit (DMAM, Local0)
                                Subtract (Local0, One, DMCH)
                            }
                            Else
                            {
                                Store (0x04, DMCH)
                            }

                            EXFG ()
                            DCNT (Arg1, One)
                            Store (Arg1, Local2)
                            If (LGreater (Local2, Zero))
                            {
                                Subtract (Local2, One, Local2)
                            }
                        }
                    }

                    Method (DSR2, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x11, IRQT)
                        CreateByteField (Arg0, 0x14, DMAT)
                        CreateWordField (Arg0, 0x02, IOT1)
                        CreateWordField (Arg0, 0x0A, IOT2)
                        ENFG (CGLD (Arg1))
                        And (IOT1, 0xFF, IOAL)
                        ShiftRight (IOT1, 0x08, IOAH)
                        And (IOT2, 0xFF, IOL2)
                        ShiftRight (IOT2, 0x08, IOH2)
                        If (IRQT)
                        {
                            FindSetRightBit (IRQT, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        If (DMAT)
                        {
                            FindSetRightBit (DMAT, Local0)
                            Subtract (Local0, One, DMCH)
                        }
                        Else
                        {
                            Store (0x04, DMCH)
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Store (Arg1, Local2)
                        If (LGreater (Local2, Zero))
                        {
                            Subtract (Local2, One, Local2)
                        }
                    }

                    Method (DSR4, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, IOHL)
                        CreateWordField (Arg0, 0x09, IRQL)
                        ENFG (CGLD (Arg1))
                        And (IOHL, 0xFF, IOAL)
                        ShiftRight (IOHL, 0x08, IOAH)
                        If (IRQL)
                        {
                            FindSetRightBit (IRQL, Local0)
                            Subtract (Local0, One, INTR)
                        }
                        Else
                        {
                            Store (Zero, INTR)
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Store (Arg1, Local2)
                        If (LGreater (Local2, Zero))
                        {
                            Subtract (Local2, One, Local2)
                        }
                    }
                }

                Name (PMFG, Zero)
                Method (SIOS, 1, NotSerialized)
                {
                    Store ("SIOS", Debug)
                    ^SIO1.ENFG (0x06)
                    Or (^SIO1.RGE1, 0x20, ^SIO1.RGE1)
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Store ("SIOW", Debug)
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP030B"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, KBFG)
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Method (PS2K._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x03))
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (And (IOST, 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, MSFG)
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Method (PS2M._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x03))
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (^^SIO1.DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (^^SIO1.DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        ^^SIO1.DSRS (Arg0, Zero)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Device (CIR)
                {
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (_HID, EisaId ("FIT0002"))  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (IRST (0x08))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (0x08, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (IRCR (0x08))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        IRSR (Arg0, 0x08)
                    }

                    Method (IRST, 1, NotSerialized)
                    {
                        ^^SIO1.ENFG (^^SIO1.CGLD (Arg0))
                        If (^^SIO1.ACTR)
                        {
                            Store (0x0F, Local0)
                        }
                        Else
                        {
                            If (^^SIO1.IOAH)
                            {
                                Store (0x0D, Local0)
                            }
                            Else
                            {
                                Store (Zero, Local0)
                            }
                        }

                        ^^SIO1.EXFG ()
                        Return (Local0)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x4700,             // Range Minimum
                                0x4700,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x4700,             // Range Minimum
                                0x4700,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E0,             // Range Minimum
                                0x02E0,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0298,             // Range Minimum
                                0x0298,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,9,10,11,12}
                        }
                        EndDependentFn ()
                    })
                    Name (PBUF, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y21)
                        IRQNoFlags ()
                            {0}
                    })
                    Method (IRCR, 1, NotSerialized)
                    {
                        CreateByteField (PBUF, \_SB.PCI0.SBRG.CIR._Y21._MIN, IOLO)  // _MIN: Minimum Base Address
                        CreateByteField (PBUF, 0x03, IOHI)
                        CreateWordField (PBUF, \_SB.PCI0.SBRG.CIR._Y21._MIN, IOHL)  // _MIN: Minimum Base Address
                        CreateWordField (PBUF, \_SB.PCI0.SBRG.CIR._Y21._MAX, IORL)  // _MAX: Maximum Base Address
                        CreateByteField (PBUF, \_SB.PCI0.SBRG.CIR._Y21._ALN, ALMN)  // _ALN: Alignment
                        CreateByteField (PBUF, \_SB.PCI0.SBRG.CIR._Y21._LEN, LENG)  // _LEN: Length
                        CreateWordField (PBUF, 0x05, IRQL)
                        ^^SIO1.ENFG (^^SIO1.CGLD (Arg0))
                        Store (^^SIO1.IOAH, IOHI)
                        Store (^^SIO1.IOAL, IOLO)
                        Store (IOHL, IORL)
                        Store (One, ALMN)
                        Store (0x08, LENG)
                        Store (One, Local0)
                        ShiftLeft (Local0, ^^SIO1.INTR, IRQL)
                        ^^SIO1.EXFG ()
                        Return (PBUF)
                    }

                    Method (IRSR, 2, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, POLB)
                        CreateByteField (Arg0, 0x03, POHB)
                        CreateWordField (Arg0, 0x05, PIRQ)
                        ^^SIO1.ENFG (^^SIO1.CGLD (Arg1))
                        Store (POLB, ^^SIO1.IOAL)
                        Store (POHB, ^^SIO1.IOAH)
                        FindSetRightBit (PIRQ, Local0)
                        Subtract (Local0, One, ^^SIO1.INTR)
                        Store (One, ^^SIO1.ACTR)
                        ^^SIO1.EXFG ()
                    }
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (And (MBEC, 0xFFFF))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Scope (\_GPE)
                {
                    OperationRegion (IP, SystemIO, 0x0225, 0x02)
                    Field (IP, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DAT0,   8
                    }

                    Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        Store (GBYT (0x66), Local0)
                        If (LNotEqual (And (Local0, 0x02), Zero))
                        {
                            Notify (\_TZ.THRM, 0x80)
                        }
                    }

                    Method (GBYT, 1, NotSerialized)
                    {
                        Store (Arg0, INDX)
                        Store (DAT0, Local0)
                        Return (Local0)
                    }
                }

                Scope (\_TZ)
                {
                    OperationRegion (IP, SystemIO, 0x0225, 0x02)
                    Field (IP, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DAT0,   8
                    }

                    ThermalZone (THRM)
                    {
                        Method (KELV, 1, NotSerialized)
                        {
                            Store (Arg0, Local1)
                            Multiply (0x0A, Local1, Local1)
                            Add (Local1, 0x0AAC, Local1)
                            Return (Local1)
                        }

                        Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
                        {
                            If (LEqual (TPCH, One))
                            {
                                While (LGreater (GBYT (0x7A), 0x7E))
                                {
                                    Store (GBYT (0x7A), DBG8)
                                    Sleep (0xFA)
                                    Store (One, Local1)
                                    Multiply (0x0A, Local1, Local1)
                                    Add (Local1, 0x0AAC, Local1)
                                    Return (Local1)
                                }
                            }

                            Return (KELV (CTMP ()))
                        }

                        Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
                        {
                            Return (KELV (STMP ()))
                        }

                        Method (STMP, 0, NotSerialized)
                        {
                            Store (GBYT (0x82), Local0)
                            Return (Local0)
                        }

                        Method (CTMP, 0, NotSerialized)
                        {
                            Store (GBYT (0x7A), Local0)
                            Store (Local0, DBG8)
                            If (LGreaterEqual (Local0, 0x65))
                            {
                                Store (0x30, Local0)
                            }

                            Return (Local0)
                        }

                        Method (GBYT, 1, NotSerialized)
                        {
                            Store (Arg0, INDX)
                            Store (DAT0, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (NBRM)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x99)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (CRS)
                    }
                }
            }

            Device (P0PC)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x04, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0C)
                    }

                    Return (PR0C)
                }
            }

            Device (GEC)
            {
                Name (_ADR, 0x00140006)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x13, 0x04))
                }
            }

            Device (UHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC2)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB5)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC6)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (UHC7)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                If (LEqual (STCL, 0x0101))
                {
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                    }

                    OperationRegion (SACS, PCI_Config, Zero, 0x40)
                    Field (SACS, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x24), 
                        STB5,   32
                    }

                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Device (PRID)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                        {
                            Return (SPTM)
                        }

                        Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                        {
                        }

                        Name (PRIS, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x120), 
                                    ,   7, 
                                PMBY,   1, 
                                Offset (0x128), 
                                PMS0,   4, 
                                Offset (0x129), 
                                PMS1,   4, 
                                Offset (0x220), 
                                    ,   7, 
                                PSBY,   1, 
                                Offset (0x228), 
                                PSS0,   4, 
                                Offset (0x229), 
                                PSS1,   4, 
                                Offset (0x2A0), 
                                    ,   7
                            }

                            If (LOr (LEqual (OSTY, 0x06), LEqual (OSTY, 0x04)))
                            {
                                If (PMS1)
                                {
                                    Store (0x32, Local0)
                                    While (LAnd (LEqual (PMBY, One), Local0))
                                    {
                                        Sleep (0xFA)
                                        Decrement (Local0)
                                    }
                                }

                                If (PSS1)
                                {
                                    Store (0x32, Local0)
                                    While (LAnd (LEqual (PSBY, One), Local0))
                                    {
                                        Sleep (0xFA)
                                        Decrement (Local0)
                                    }
                                }
                            }

                            Store (Zero, PRIS)
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            Store (0x03, PRIS)
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (PRIS)
                        }

                        Device (P_D0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x128), 
                                    PMS0,   4, 
                                    Offset (0x129), 
                                    PMS1,   4
                                }

                                If (Not (LEqual (PMS1, Zero)))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Name (S12P, Zero)
                            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x120), 
                                        ,   7, 
                                    PMBY,   1
                                }

                                Store (0x32, Local0)
                                While (LAnd (LEqual (PMBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }

                                Store (Zero, S12P)
                            }

                            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                            {
                                Store (0x03, S12P)
                            }

                            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                            {
                                Return (S12P)
                            }
                        }

                        Device (P_D1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x228), 
                                    PSS0,   4, 
                                    Offset (0x229), 
                                    PSS1,   4
                                }

                                If (Not (LEqual (PSS1, Zero)))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Name (S12P, Zero)
                            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x220), 
                                        ,   7, 
                                    PSBY,   1
                                }

                                Store (0x32, Local0)
                                While (LAnd (LEqual (PSBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }

                                Store (Zero, S12P)
                            }

                            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                            {
                                Store (0x03, S12P)
                            }

                            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                            {
                                Return (S12P)
                            }
                        }
                    }

                    Device (SECD)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                        {
                            Return (SPTM)
                        }

                        Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                        {
                        }

                        Name (SECS, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                            Field (BAR, AnyAcc, NoLock, Preserve)
                            {
                                Offset (0x1A0), 
                                    ,   7, 
                                SMBY,   1, 
                                Offset (0x1A8), 
                                SMS0,   4, 
                                Offset (0x1A9), 
                                SMS1,   4, 
                                Offset (0x2A0), 
                                    ,   7, 
                                SSBY,   1, 
                                Offset (0x2A8), 
                                SSS0,   4, 
                                Offset (0x2A9), 
                                SSS1,   4, 
                                Offset (0x2AC)
                            }

                            If (LOr (LEqual (OSTY, 0x06), LEqual (OSTY, 0x04)))
                            {
                                If (SMS1)
                                {
                                    Store (0x32, Local0)
                                    While (LAnd (LEqual (SMBY, One), Local0))
                                    {
                                        Sleep (0xFA)
                                        Decrement (Local0)
                                    }
                                }

                                If (SSS1)
                                {
                                    Store (0x32, Local0)
                                    While (LAnd (LEqual (SSBY, One), Local0))
                                    {
                                        Sleep (0xFA)
                                        Decrement (Local0)
                                    }
                                }
                            }

                            Store (Zero, SECS)
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                            Store (0x03, SECS)
                        }

                        Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                        {
                            Return (SECS)
                        }

                        Device (S_D0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x1A8), 
                                    SMS0,   4, 
                                    Offset (0x1A9), 
                                    SMS1,   4
                                }

                                If (Not (LEqual (SMS1, Zero)))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Name (S12P, Zero)
                            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x1000)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x1A0), 
                                        ,   7, 
                                    SMBY,   1
                                }

                                Store (0x32, Local0)
                                While (LAnd (LEqual (SMBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }

                                Store (Zero, S12P)
                            }

                            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                            {
                                Store (0x03, S12P)
                            }

                            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                            {
                                Return (S12P)
                            }
                        }

                        Device (S_D1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x2A8), 
                                    SSS0,   4, 
                                    Offset (0x2A9), 
                                    SSS1,   4
                                }

                                If (Not (LEqual (SSS1, Zero)))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Name (S12P, Zero)
                            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                            {
                                OperationRegion (BAR, SystemMemory, STB5, 0x0400)
                                Field (BAR, AnyAcc, NoLock, Preserve)
                                {
                                    Offset (0x2A0), 
                                        ,   7, 
                                    SSBY,   1
                                }

                                Store (0x32, Local0)
                                While (LAnd (LEqual (SSBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }

                                Store (Zero, S12P)
                            }

                            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                            {
                                Store (0x03, S12P)
                            }

                            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                            {
                                Return (S12P)
                            }
                        }
                    }
                }
            }

            Device (PE20)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0F, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR20)
                    }

                    Return (PR20)
                }
            }

            Device (PE21)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x10, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR21)
                    }

                    Return (PR21)
                }
            }

            Device (PE22)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x11, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR22)
                    }

                    Return (PR22)
                }
            }

            Device (PE23)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x12, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR23)
                    }

                    Return (PR23)
                }
            }

            Device (GNBD)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Scope (\)
                {
                    OperationRegion (ATFB, SystemMemory, 0xA7A6FD98, 0x0105)
                    Field (ATFB, AnyAcc, NoLock, Preserve)
                    {
                        BCMD,   8, 
                        DID,    32, 
                        INFO,   2048
                    }

                    Field (ATFB, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x05), 
                        INF0,   8, 
                        INF1,   8, 
                        INF2,   8, 
                        INF3,   8, 
                        INF4,   8, 
                        INF5,   8, 
                        INF6,   8, 
                        INF7,   8
                    }

                    Field (ATFB, AnyAcc, NoLock, Preserve)
                    {
                        AccessAs (ByteAcc, 0x00), 
                        Offset (0x05), 
                        INF,    8
                    }
                }

                OperationRegion (NBRV, PCI_Config, 0x08, One)
                Field (NBRV, ByteAcc, NoLock, Preserve)
                {
                    PREV,   8
                }

                OperationRegion (NBBR, PCI_Config, 0x1C, 0x08)
                Field (NBBR, DWordAcc, NoLock, Preserve)
                {
                    BR3L,   32, 
                    BR3H,   32
                }

                OperationRegion (NBBI, PCI_Config, 0x84, 0x04)
                Field (NBBI, DWordAcc, NoLock, Preserve)
                {
                    PARB,   32
                }

                OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
                Field (NBMS, DWordAcc, NoLock, Preserve)
                {
                    MIDX,   32, 
                    MIDR,   32
                }

                Mutex (NBMM, 0x00)
                Method (NBMR, 1, NotSerialized)
                {
                    Acquire (NBMM, 0xFFFF)
                    And (Arg0, 0x7F, Local0)
                    Store (Local0, MIDX)
                    Store (MIDR, Local0)
                    Store (0x7F, MIDX)
                    Release (NBMM)
                    Return (Local0)
                }

                Method (NBMW, 2, NotSerialized)
                {
                    Acquire (NBMM, 0xFFFF)
                    And (Arg0, 0x7F, Local0)
                    Or (Local0, 0x80, Local0)
                    Store (Local0, MIDX)
                    Store (Arg1, MIDR)
                    Store (And (Local0, 0x7F, Local0), MIDX)
                    Release (NBMM)
                }

                OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
                Field (NBXP, DWordAcc, NoLock, Preserve)
                {
                    NBXI,   32, 
                    NBXD,   32
                }

                Mutex (NBXM, 0x00)
                Method (NBXR, 1, NotSerialized)
                {
                    Acquire (NBXM, 0xFFFF)
                    Store (Arg0, NBXI)
                    Store (NBXD, Local0)
                    Store (Zero, NBXI)
                    Release (NBXM)
                    Return (Local0)
                }

                Method (NBXW, 2, NotSerialized)
                {
                    Acquire (NBXM, 0xFFFF)
                    Store (Arg0, NBXI)
                    Store (Arg1, NBXD)
                    Store (Zero, NBXI)
                    Release (NBXM)
                }

                Method (GFXM, 0, NotSerialized)
                {
                    Store (NBMR (0x08), Local0)
                    And (Local0, 0x0F, Local0)
                    Return (Local0)
                }

                Method (GPPM, 0, NotSerialized)
                {
                    Store (NBMR (0x67), Local0)
                    And (Local0, 0xF0, Local0)
                    Return (Local0)
                }

                Method (GPPX, 0, NotSerialized)
                {
                    Store (NBMR (0x2D), Local0)
                    ShiftRight (Local0, 0x07, Local0)
                    And (Local0, 0x0F, Local0)
                    Return (Local0)
                }

                Method (XPTR, 2, NotSerialized)
                {
                    If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Store (GPPM (), Local0)
                        Store (GPPX (), Local1)
                        Store (One, Local0)
                        If (LLess (Arg0, 0x04))
                        {
                            Add (Arg0, 0x02, Local1)
                        }
                        Else
                        {
                            Add (Arg0, 0x11, Local1)
                        }

                        ShiftLeft (Local0, Local1, Local0)
                        Store (NBMR (0x08), Local2)
                        If (Arg1)
                        {
                            And (Local2, Not (Local0), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local0, Local2)
                        }

                        NBMW (0x08, Local2)
                        Return (Ones)
                    }
                }

                Name (PX3L, 0x80000000)
                Name (PX3H, 0x80000000)
                Name (PX3S, 0x10000000)
                Name (PX3K, 0xF0000000)
                Mutex (BR3X, 0x00)
                Method (BR3M, 0, NotSerialized)
                {
                    Store (PARB, Local0)
                    ShiftRight (Local0, 0x10, Local0)
                    And (Local0, 0x07, Local0)
                    If (Local0)
                    {
                        ShiftLeft (One, Local0, Local1)
                        Subtract (0x1000, Local1, Local1)
                        ShiftLeft (Local1, 0x14, Local1)
                        Store (Local1, PX3K)
                        ShiftRight (0x00100000, Local0, Local0)
                        Store (Local0, PX3S)
                    }

                    Acquire (BR3X, 0xFFFF)
                    Store (NBMR (Zero), Local0)
                    And (Local0, 0xFFFFFFF7, Local0)
                    NBMW (Zero, Local0)
                    Store (BR3L, Local0)
                    And (Local0, PX3K, Local0)
                    Store (Local0, PX3L)
                    Store (BR3H, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, PX3H)
                    Store (NBMR (Zero), Local0)
                    Or (Local0, 0x08, Local0)
                    NBMW (Zero, Local0)
                    Release (BR3X)
                    Return (PX3L)
                }

                OperationRegion (NB2, PCI_Config, Zero, 0x0100)
                Field (NB2, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    MI,     32, 
                    MD,     32, 
                    Offset (0x90), 
                    TOM,    32, 
                    OI,     32, 
                    OD,     32, 
                    Offset (0xE0), 
                    LI,     32, 
                    LD,     32
                }

                Device (BROD)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x14)  // _UID: Unique ID
                    Name (UMAS, 0x18000000)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y22)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.GNBD.BROD._Y22._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.GNBD.BROD._Y22._LEN, LEN1)  // _LEN: Length
                        Store (UMAS, LEN1)
                        Subtract (TOM, LEN1, BAS1)
                        Return (CRS)
                    }
                }
            }

            Device (BR15)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR15)
                    }

                    Return (PR15)
                }
            }

            Device (PCE6)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR16)
                    }

                    Return (PR16)
                }
            }

            Device (PCE7)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17)
                    }

                    Return (PR17)
                }
            }

            Device (PCE8)
            {
                Name (_ADR, 0x00080000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR18)
                    }

                    Return (PR18)
                }
            }

            Device (PCE4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                OperationRegion (XPEX, SystemMemory, 0xE0020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (Zero, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (Zero, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (^^GNBD.GPPX (), Local2)
                    Store (^^GNBD.GFXM (), Local3)
                    Store (Zero, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (Zero, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (Zero, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (Zero, Local1))
                    {
                        Store (^^GNBD.NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        ^^GNBD.NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (^^GNBD.GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (Zero, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (One, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (One, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (^^GNBD.NBMR (0x07), Local0)
                    Store (^^GNBD.NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (Zero, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (Zero, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (^^GNBD.NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        ^^GNBD.NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (One)
                        XPLP (One)
                        Sleep (0xC8)
                        ^^GNBD.XPTR (ShiftLeft (XPPB (), 0x03), One)
                        Sleep (0x14)
                    }
                    Else
                    {
                        ^^GNBD.XPTR (ShiftLeft (XPPB (), 0x03), Zero)
                        XPLP (Zero)
                        XPLL (Zero)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (DOSP, Zero)
                    Name (BLVL, Buffer (0x10)
                    {
                        /* 0000 */   0x00, 0x20, 0x30, 0x40, 0x50, 0x58, 0x60, 0x70,
                        /* 0008 */   0x80, 0x90, 0xA0, 0xB0, 0xC0, 0xD0, 0xE0, 0xFF
                    })
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        Store (Arg0, DOSP)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x05)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200, 
                            0x00010210, 
                            0x00010220
                        })
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0110)
                        }

                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            If (LEqual (^^^^VGA.AF7E, 0x80000001))
                            {
                                Return (Package (0x11)
                                {
                                    0x52, 
                                    0x22, 
                                    0x02, 
                                    0x08, 
                                    0x0E, 
                                    0x16, 
                                    0x1C, 
                                    0x22, 
                                    0x2A, 
                                    0x30, 
                                    0x36, 
                                    0x3E, 
                                    0x44, 
                                    0x4B, 
                                    0x52, 
                                    0x58, 
                                    0x64
                                })
                            }
                            Else
                            {
                                Return (Package (0x35)
                                {
                                    0x5A, 
                                    0x3C, 
                                    Zero, 
                                    0x02, 
                                    0x04, 
                                    0x06, 
                                    0x08, 
                                    0x0A, 
                                    0x0C, 
                                    0x0E, 
                                    0x10, 
                                    0x12, 
                                    0x14, 
                                    0x16, 
                                    0x18, 
                                    0x1A, 
                                    0x1C, 
                                    0x1E, 
                                    0x20, 
                                    0x22, 
                                    0x24, 
                                    0x26, 
                                    0x28, 
                                    0x2A, 
                                    0x2C, 
                                    0x2E, 
                                    0x30, 
                                    0x32, 
                                    0x34, 
                                    0x36, 
                                    0x38, 
                                    0x3A, 
                                    0x3C, 
                                    0x3E, 
                                    0x40, 
                                    0x42, 
                                    0x44, 
                                    0x46, 
                                    0x48, 
                                    0x4A, 
                                    0x4C, 
                                    0x4E, 
                                    0x50, 
                                    0x52, 
                                    0x54, 
                                    0x56, 
                                    0x58, 
                                    0x5A, 
                                    0x5C, 
                                    0x5E, 
                                    0x60, 
                                    0x62, 
                                    0x64
                                })
                            }
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            If (LEqual (^^^^VGA.AF7E, 0x80000001))
                            {
                                Divide (Add (Multiply (Arg0, 0x03), 0x13), 0x14, Local1, 
                                    Local0)
                                Store (DerefOf (Index (BLVL, Local0)), Local3)
                                ^^^^VGA.AFN7 (Local3)
                            }
                            Else
                            {
                                Acquire (^^^^SMBS.PSMX, 0xFFFF)
                                Store (One, INF0)
                                Store (Arg0, INF1)
                                Store (0x8A, BCMD)
                                Store (ATIS, ^^^^SBRG.SMIC)
                                Release (^^^^SMBS.PSMX)
                            }
                        }
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PDC2)
                            Store (One, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (Zero, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), INFO)
                                    Store (0x87, BCMD)
                                    Store (Zero, ^^SBRG.SMIC)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (One, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (Zero, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (Zero)
                            XPPR (Zero)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PDC2)
                        Store (^VGA.DVID, Local7)
                        Sleep (0x0A)
                        Store (One, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (Zero, Local4)
                            }
                            Else
                            {
                                Store (^VGA.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR14)
                    }

                    Return (PR14)
                }
            }

            Device (VGA)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x2C), 
                    SVID,   32, 
                    Offset (0x4C), 
                    SMID,   32
                }

                Name (DOSP, Zero)
                Name (BLVL, Buffer (0x10)
                {
                    /* 0000 */   0x00, 0x20, 0x30, 0x40, 0x50, 0x58, 0x60, 0x70,
                    /* 0008 */   0x80, 0x90, 0xA0, 0xB0, 0xC0, 0xD0, 0xE0, 0xFF
                })
                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (Arg0, DOSP)
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    Return (Package (0x05)
                    {
                        0x00010100, 
                        0x00010110, 
                        0x0200, 
                        0x00010210, 
                        0x00010220
                    })
                }

                Device (LCD)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0110)
                    }

                    Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                    {
                        If (LEqual (AF7E, 0x80000001))
                        {
                            Return (Package (0x11)
                            {
                                0x52, 
                                0x22, 
                                0x02, 
                                0x08, 
                                0x0E, 
                                0x16, 
                                0x1C, 
                                0x22, 
                                0x2A, 
                                0x30, 
                                0x36, 
                                0x3E, 
                                0x44, 
                                0x4B, 
                                0x52, 
                                0x58, 
                                0x64
                            })
                        }
                        Else
                        {
                            Return (Package (0x35)
                            {
                                0x5A, 
                                0x3C, 
                                Zero, 
                                0x02, 
                                0x04, 
                                0x06, 
                                0x08, 
                                0x0A, 
                                0x0C, 
                                0x0E, 
                                0x10, 
                                0x12, 
                                0x14, 
                                0x16, 
                                0x18, 
                                0x1A, 
                                0x1C, 
                                0x1E, 
                                0x20, 
                                0x22, 
                                0x24, 
                                0x26, 
                                0x28, 
                                0x2A, 
                                0x2C, 
                                0x2E, 
                                0x30, 
                                0x32, 
                                0x34, 
                                0x36, 
                                0x38, 
                                0x3A, 
                                0x3C, 
                                0x3E, 
                                0x40, 
                                0x42, 
                                0x44, 
                                0x46, 
                                0x48, 
                                0x4A, 
                                0x4C, 
                                0x4E, 
                                0x50, 
                                0x52, 
                                0x54, 
                                0x56, 
                                0x58, 
                                0x5A, 
                                0x5C, 
                                0x5E, 
                                0x60, 
                                0x62, 
                                0x64
                            })
                        }
                    }

                    Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                    {
                        If (LEqual (AF7E, 0x80000001))
                        {
                            Divide (Add (Multiply (Arg0, 0x03), 0x13), 0x14, Local1, 
                                Local0)
                            Store (DerefOf (Index (BLVL, Local0)), Local3)
                            AFN7 (Local3)
                        }
                        Else
                        {
                            Acquire (^^^SMBS.PSMX, 0xFFFF)
                            Store (One, INF0)
                            Store (Arg0, INF1)
                            Store (0x8A, BCMD)
                            Store (ATIS, ^^^SBRG.SMIC)
                            Release (^^^SMBS.PSMX)
                        }
                    }
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.SBAZ, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.SBRG.SIOH ()
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0PC, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L13, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.GEC, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.UHC1, 0x02)
                Notify (\_SB.PCI0.UHC2, 0x02)
                Notify (\_SB.PCI0.USB3, 0x02)
                Notify (\_SB.PCI0.UHC4, 0x02)
                Notify (\_SB.PCI0.USB5, 0x02)
                Notify (\_SB.PCI0.UHC6, 0x02)
                Notify (\_SB.PCI0.UHC7, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0F, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE20, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE21, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE22, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L12, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PE23, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.BR15, 0x02)
                Notify (\_SB.PCI0.PCE6, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x1D, 0x03))
            }
        }
    }

    Scope (_SB)
    {
        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x10), 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x15), 
            GEC,    8, 
            Offset (0x30), 
            USB1,   8, 
            USB2,   8, 
            USB3,   8, 
            USB4,   8, 
            USB5,   8, 
            USB6,   8, 
            USB7,   8, 
            Offset (0x40), 
            IDE,    8, 
            SATA,   8, 
            Offset (0x50), 
            GPP0,   8, 
            GPP1,   8, 
            GPP2,   8, 
            GPP3,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (IRQC, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Store (PD64, Local1)
            Store (0x1F, PIRE)
            Store (0x1F, PIRF)
            Store (0x1F, PIRG)
            Store (0x1F, PIRH)
        }

        Method (INTA, 1, NotSerialized)
        {
            Store (Arg0, PIRA)
            Store (Arg0, HDAD)
            Store (Arg0, GEC)
            Store (Arg0, GPP0)
            Store (Arg0, GPP0)
        }

        Method (INTB, 1, NotSerialized)
        {
            Store (Arg0, PIRB)
            Store (Arg0, USB2)
            Store (Arg0, USB4)
            Store (Arg0, USB6)
            Store (Arg0, GPP1)
            Store (Arg0, IDE)
        }

        Method (INTC, 1, NotSerialized)
        {
            Store (Arg0, PIRC)
            Store (Arg0, USB1)
            Store (Arg0, USB3)
            Store (Arg0, USB5)
            Store (Arg0, USB7)
            Store (Arg0, GPP2)
        }

        Method (INTD, 1, NotSerialized)
        {
            Store (Arg0, PIRD)
            Store (Arg0, SATA)
            Store (Arg0, GPP3)
        }

        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Name (IPRA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRB, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRA)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRA, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTA (Local0)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRB)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRB, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTB (Local0)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRC)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRC, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTC (Local0)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRD)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRD, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                INTD (Local0)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRE)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRE)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRE, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (PIRE, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRF)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRF)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRF, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRG)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRG)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRG, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRH)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRH)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRH, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }
    }

    Scope (_SB.PCI0.SBRG)
    {
        Method (RGPM, 0, NotSerialized)
        {
            Store (^^SMBS.GPXC, Local0)
            And (Local0, 0xFFFFFFFFFFFFFF3F, Local0)
            Store (Local0, ^^SMBS.GPXC)
            Store (^^SMBS.CLGP, Local1)
            Return (Local1)
        }
    }

    Scope (_GPE)
    {
        Name (WLAN, One)
        Name (WLST, One)
    }

    Scope (_SB.PCI0.SMBS)
    {
        OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
        Field (LCLM, ByteAcc, NoLock, Preserve)
        {
            CLMI,   8, 
            CLMD,   8, 
            CLGP,   8
        }

        IndexField (CLMI, CLMD, ByteAcc, NoLock, Preserve)
        {
            IDRG,   8, 
            Offset (0x02), 
            TSTS,   8, 
            TINT,   8, 
            Offset (0x12), 
            I2CC,   8, 
            GPXC,   8
        }

        OperationRegion (GPIO, SystemMemory, GIOB, 0x0100)
        Field (GPIO, AnyAcc, NoLock, Preserve)
        {
            Offset (0x06), 
                ,   5, 
            G06E,   1, 
            G06O,   1, 
            G06I,   1, 
            G07B,   8, 
            Offset (0x0B), 
            G0BB,   8, 
            Offset (0x0E), 
            G0EB,   8, 
            Offset (0x14), 
                ,   5, 
            G14E,   1, 
            G14O,   1, 
            G14I,   1, 
                ,   5, 
            G15E,   1, 
            G15O,   1, 
            G15I,   1, 
            Offset (0x1C), 
                ,   7, 
            G1CI,   1, 
            Offset (0x2D), 
                ,   5, 
            G2DE,   1, 
            G2DO,   1, 
            G2DI,   1, 
            Offset (0x37), 
                ,   5, 
            G37E,   1, 
            G37O,   1, 
            G37I,   1, 
            Offset (0x65), 
                ,   7, 
            GE05,   1, 
            Offset (0x70), 
                ,   7, 
            GE16,   1, 
            Offset (0x76), 
                ,   7, 
            GE22,   1, 
            Offset (0xAF), 
            GAFB,   8, 
            GB0B,   8
        }

        OperationRegion (GPMX, SystemMemory, IOMB, 0x0100)
        Field (GPMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x06), 
            G06M,   8, 
            G07M,   8, 
            Offset (0x0B), 
            G0BM,   8, 
            Offset (0x0E), 
            G0EM,   8, 
            Offset (0x14), 
            G14M,   8, 
            G15M,   8, 
            Offset (0x1C), 
            G1CM,   8, 
            Offset (0x2D), 
            G2DM,   8, 
            Offset (0x37), 
            G37M,   8, 
            Offset (0x70), 
            G70M,   8, 
            Offset (0x76), 
            G76M,   8, 
            Offset (0xAF), 
            GAFM,   8, 
            GB0M,   8
        }

        OperationRegion (GEVT, SystemMemory, SMIB, 0x0100)
        Field (GEVT, AnyAcc, NoLock, Preserve)
        {
                ,   9, 
            GESA,   1, 
            Offset (0x08), 
                ,   5, 
            E05C,   1, 
            Offset (0x09), 
            E08C,   1, 
            E09C,   1, 
            Offset (0x0A), 
                ,   6, 
            E22C,   1
        }
    }

    Scope (_SB.PCI0.GNBD)
    {
    }

    OperationRegion (DEB2, SystemIO, 0x80, 0x02)
    Field (DEB2, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    Scope (_SB.PCI0.SBRG)
    {
        OperationRegion (SMIP, SystemIO, SMIO, One)
        Field (SMIP, ByteAcc, NoLock, Preserve)
        {
            SMIC,   8
        }
    }

    Scope (_GPE)
    {
        Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Name (HPOK, Zero)
            Store (0x66, P80H)
            If (\_SB.PCI0.SMBS.E05C)
            {
                Store (0x11CC, P80H)
                Sleep (0x14)
                Store (\_SB.PCI0.SMBS.GE05, Local0)
                If (Local0)
                {
                    Store (0x12CC, P80H)
                    Store (Zero, \_SB.PCI0.SMBS.E05C)
                    Store ("HotPlug:04: Removal Event", Debug)
                    Store (0x0F05, P80H)
                }
            }
            Else
            {
                Sleep (0x14)
                Store (0x21CC, P80H)
                Store (\_SB.PCI0.SMBS.GE05, Local0)
                If (LNot (And (Local0, One)))
                {
                    Store (One, \_SB.PCI0.SMBS.E05C)
                    Store ("HotPlug:04: Insertion Event", Debug)
                    Sleep (0x64)
                    Sleep (0x64)
                    Sleep (0x14)
                    Store (0x0205, P80H)
                }
            }

            Notify (\_SB.PCI0.PE20, Zero)
        }
    }

    Scope (_SB.PCI0.SBRG)
    {
        Method (SIOH, 0, NotSerialized)
        {
            If (And (PMFG, 0x08))
            {
                Notify (PS2K, 0x02)
            }

            If (And (PMFG, 0x10))
            {
                Notify (PS2M, 0x02)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (LLessEqual (RVID, 0x13)) {}
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Scope (SBRG)
            {
                Method (RRIO, 4, NotSerialized)
                {
                    Store ("RRIO", Debug)
                }

                Method (RDMA, 3, NotSerialized)
                {
                    Store ("rDMA", Debug)
                }
            }
        }
    }

    Device (HPET)
    {
        Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
        Name (CRS, ResourceTemplate ()
        {
            Memory32Fixed (ReadOnly,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                _Y23)
        })
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            CreateDWordField (CRS, \HPET._Y23._BAS, HPT)  // _BAS: Base Address
            Store (0xFED00000, HPT)
            Return (CRS)
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Store (Arg0, DBG8)
        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (Zero, AAXB)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    Scope (_PR)
    {
        OperationRegion (SSDT, SystemMemory, 0xFFFF0000, 0xFFFF)
        Name (DCOR, 0x02)
        Name (TBLD, 0x04)
        Name (NPSS, 0x05)
        Name (HNDL, 0x80000000)
        Name (APSS, Package (0x0A)
        {
            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }, 

            Package (0x06)
            {
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF, 
                0xFFFF
            }
        })
        Processor (P000, 0x01, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                If (LAnd (LEqual (TBLD, Zero), LNotEqual (NPSS, Zero)))
                {
                    If (LOr (LEqual (And (TYPE, 0x1B), 0x1B), LEqual (DCOR, 
                        Zero)))
                    {
                        Store (One, TBLD)
                        Load (SSDT, HNDL)
                    }
                }
            }
        }

        Processor (P001, 0x02, 0x00000810, 0x06)
        {
            Name (TYPE, 0x80000000)
            Method (_PDC, 1, NotSerialized)  // _PDC: Processor Driver Capabilities
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                If (LAnd (LEqual (TBLD, Zero), LNotEqual (NPSS, Zero)))
                {
                    If (LOr (LEqual (And (TYPE, 0x1B), 0x1B), LEqual (DCOR, 
                        Zero)))
                    {
                        Store (One, TBLD)
                        Load (SSDT, HNDL)
                    }
                }
            }
        }
    }

    If (OSCF)
    {
        Scope (_SB.PCI0)
        {
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                            /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E)
                    }

                    And (CTRL, 0x1D, CTRL)
                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One)) {}
                        If (And (CTRL, 0x04))
                        {
                            Store (One, EPNM)
                        }
                        Else
                        {
                            Store (Zero, EPNM)
                        }

                        If (And (CTRL, 0x10)) {}
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }
        }
    }

    Scope (_SB.PCI0.VGA)
    {
        Name (PXEN, 0x80000000)
        Name (PXID, 0x00040000)
        Name (PXMX, 0x80000001)
        Name (LCDT, 0x80000000)
        Name (DSCT, 0x80000000)
        Name (AF7E, 0x80000000)
        Name (PXDY, 0x80000000)
        Name (PXFX, 0x80000000)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Scope (\_SB.PCI0.VGA)
        {
            Name (ATIB, Buffer (0x0100) {})
            Method (ATIF, 2, Serialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (AF00 ())
                }

                If (LEqual (Arg0, One))
                {
                    Return (AF01 ())
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (AF02 ())
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                        0x04))))
                }
                Else
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    Store (Zero, SSZE)
                    Store (Zero, VERN)
                    Store (Zero, NMSK)
                    Store (Zero, SFUN)
                    Return (ATIB)
                }
            }

            Method (AF00, 0, NotSerialized)
            {
                Store (0xF0, P80H)
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, VERN)
                CreateDWordField (ATIB, 0x04, NMSK)
                CreateDWordField (ATIB, 0x08, SFUN)
                Store (0x0C, SSZE)
                Store (One, VERN)
                If (LEqual (PXEN, 0x80000000))
                {
                    Store (0x11, NMSK)
                }
                Else
                {
                    Store (0x51, NMSK)
                }

                If (LEqual (AF7E, 0x80000001))
                {
                    Or (NMSK, 0x80, NMSK)
                }

                Store (NMSK, MSKN)
                Store (0x07, SFUN)
                Return (ATIB)
            }

            Name (NCOD, 0x81)
            Method (AF01, 0, NotSerialized)
            {
                Store (0xF1, P80H)
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, VMSK)
                CreateDWordField (ATIB, 0x06, FLGS)
                Store (0x0B, VMSK)
                Store (0x0A, SSZE)
                Store (0x03, VMSK)
                Store (One, FLGS)
                Store (0x81, NCOD)
                Return (ATIB)
            }

            Name (PSBR, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            Name (MSKN, Zero)
            Name (SEXM, Zero)
            Name (STHG, Zero)
            Name (STHI, Zero)
            Name (SFPG, Zero)
            Name (SFPI, Zero)
            Name (SSPS, Zero)
            Name (SSDM, 0x0A)
            Name (SCDY, Zero)
            Name (SACT, Buffer (0x07)
            {
                 0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
            })
            Method (AF02, 0, NotSerialized)
            {
                Store (0xF2, P80H)
                CreateBitField (PSBR, Zero, PDSW)
                CreateBitField (PSBR, One, PEXM)
                CreateBitField (PSBR, 0x02, PTHR)
                CreateBitField (PSBR, 0x03, PFPS)
                CreateBitField (PSBR, 0x04, PSPS)
                CreateBitField (PSBR, 0x05, PDCC)
                CreateBitField (PSBR, 0x06, PXPS)
                CreateBitField (PSBR, 0x07, PBRT)
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, PSBI)
                CreateByteField (ATIB, 0x06, EXPM)
                CreateByteField (ATIB, 0x07, THRM)
                CreateByteField (ATIB, 0x08, THID)
                CreateByteField (ATIB, 0x09, FPWR)
                CreateByteField (ATIB, 0x0A, FPID)
                CreateByteField (ATIB, 0x0B, SPWR)
                CreateByteField (ATIB, 0x0C, BRTL)
                Store (0x0D, SSZE)
                Store (PSBR, PSBI)
                If (PDSW)
                {
                    Store (0x82, P80H)
                    Store (Zero, PDSW)
                }

                If (PEXM)
                {
                    Store (SEXM, EXPM)
                    Store (Zero, SEXM)
                    Store (Zero, PEXM)
                }

                If (PTHR)
                {
                    Store (STHG, THRM)
                    Store (STHI, THID)
                    Store (Zero, STHG)
                    Store (Zero, STHI)
                    Store (Zero, PTHR)
                }

                If (PFPS)
                {
                    Store (SFPG, FPWR)
                    Store (SFPI, FPWR)
                    Store (Zero, SFPG)
                    Store (Zero, SFPI)
                    Store (Zero, PFPS)
                }

                If (PSPS)
                {
                    Store (SSPS, SPWR)
                    Store (Zero, PSPS)
                }

                If (PXPS)
                {
                    Store (0xA2, P80H)
                    Store (Zero, PXPS)
                }

                If (PBRT)
                {
                    Store (0xF7, P80H)
                    Store (Zero, PBRT)
                }

                Return (ATIB)
            }

            Method (AF03, 2, NotSerialized)
            {
                Store (0xF3, P80H)
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, SSDP)
                CreateWordField (ATIB, 0x04, SCDP)
                Store (Arg0, SSDP)
                Store (Arg1, SCDP)
                Name (NXTD, 0x06)
                Name (CIDX, 0x06)
                Store (SSDP, Local1)
                And (Local1, 0x8B, Local1)
                Store (SCDP, Local2)
                If (CondRefOf (\_SB.LID._LID, Local4))
                {
                    And (Local2, 0xFFFFFFFFFFFFFFFE, Local2)
                    Or (Local2, Local4, Local2)
                }
                Else
                {
                    Or (Local2, One, Local2)
                }

                Store (Local2, P80H)
                Store (Zero, Local0)
                While (LLess (Local0, SizeOf (SACT)))
                {
                    Store (DerefOf (Index (SACT, Local0)), Local3)
                    If (LEqual (Local3, Local1))
                    {
                        Store (Local0, CIDX)
                        Store (SizeOf (SACT), Local0)
                    }
                    Else
                    {
                        Increment (Local0)
                    }
                }

                Store (CIDX, Local0)
                While (LLess (Local0, SizeOf (SACT)))
                {
                    Increment (Local0)
                    If (LEqual (Local0, SizeOf (SACT)))
                    {
                        Store (Zero, Local0)
                    }

                    Store (DerefOf (Index (SACT, Local0)), Local3)
                    If (LEqual (And (Local3, Local2), Local3))
                    {
                        Store (Local0, NXTD)
                        Store (SizeOf (SACT), Local0)
                    }
                }

                If (LEqual (NXTD, SizeOf (SACT)))
                {
                    Store (Zero, SSDP)
                }
                Else
                {
                    Store (NXTD, Local0)
                    Store (DerefOf (Index (SACT, Local0)), Local3)
                    And (SSDP, 0xFFFFFFFFFFFFFF74, SSDP)
                    Or (SSDP, Local3, SSDP)
                }

                Store (0x04, SSZE)
                Store (SSDP, P80H)
                Return (ATIB)
            }

            Method (AFN0, 0, Serialized)
            {
                If (And (MSKN, One))
                {
                    CreateBitField (PSBR, Zero, PDSW)
                    Store (One, PDSW)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN3, 2, Serialized)
            {
                If (And (MSKN, 0x08))
                {
                    Store (Arg0, Local0)
                    Store (Local0, SFPI)
                    Store (Arg1, Local0)
                    Store (And (Local0, 0x03, Local0), SFPG)
                    CreateBitField (PSBR, 0x03, PFPS)
                    Store (One, PFPS)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN4, 1, Serialized)
            {
                If (And (MSKN, 0x10))
                {
                    Store (Arg0, Local0)
                    Store (SSPS, Local1)
                    Store (Local0, SSPS)
                    If (LEqual (Local0, Local1)) {}
                    Else
                    {
                        CreateBitField (PSBR, 0x04, PSPS)
                        Store (One, PSPS)
                        Notify (VGA, NCOD)
                    }
                }
            }

            Method (AFN5, 0, Serialized)
            {
                If (And (MSKN, 0x20))
                {
                    CreateBitField (PSBR, 0x05, PDCC)
                    Store (One, PDCC)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN6, 0, Serialized)
            {
                If (And (MSKN, 0x40))
                {
                    CreateBitField (PSBR, 0x06, PXPS)
                    Store (One, PXPS)
                    Notify (VGA, NCOD)
                }
            }

            Method (AFN7, 1, Serialized)
            {
                If (And (MSKN, 0x80))
                {
                    CreateBitField (PSBR, 0x07, PBRT)
                    Store (One, PBRT)
                    CreateByteField (ATIB, 0x0C, BRTL)
                    Store (Arg0, BRTL)
                    Notify (VGA, NCOD)
                }
            }

            Name (AT00, Buffer (0xFF) {})
            Name (AT01, Buffer (0x03) {})
            Method (ATCS, 2, Serialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    ATC0 ()
                }

                If (LEqual (Arg0, One))
                {
                    ATC1 ()
                }

                If (LEqual (Arg0, 0x02))
                {
                    ATC2 (Arg1)
                }

                If (LEqual (Arg0, 0x03))
                {
                    ATC3 ()
                }

                If (LEqual (Arg0, 0x04))
                {
                    ATC4 (Arg1)
                }

                Return (AT00)
            }

            Method (ATC0, 0, NotSerialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateWordField (AT00, 0x02, INTF)
                CreateDWordField (AT00, 0x04, SUPP)
                Store (0x08, SZZE)
                Store (One, INTF)
                Store (0x0F, SUPP)
            }

            Method (ATC1, 0, Serialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateDWordField (AT00, 0x02, VFMK)
                CreateDWordField (AT00, 0x06, FLAG)
                CreateField (AT00, 0x30, One, DOCK)
                Store (0x0A, SZZE)
                Store (One, VFMK)
                Store (Zero, FLAG)
                Store (One, DOCK)
            }

            Method (ATC2, 1, Serialized)
            {
                CreateField (Arg0, 0x10, 0x03, FUCC)
                CreateField (Arg0, 0x13, 0x06, DEVV)
                CreateByteField (Arg0, 0x03, BUSS)
                CreateDWordField (Arg0, 0x04, VFMK)
                CreateDWordField (Arg0, 0x06, FLAG)
                CreateField (Arg0, 0x30, One, ADVC)
                CreateField (Arg0, 0x31, One, WFCM)
                CreateByteField (Arg0, 0x08, RQST)
                CreateByteField (Arg0, 0x09, PFRQ)
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, RETV)
                Store (0x03, SZZE)
                Store (One, RETV)
                Store (ALIB (0x02, Arg0), AT00)
            }

            Method (ATC3, 0, Serialized)
            {
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, RETV)
                CreateWordField (AT01, Zero, SZZB)
                CreateByteField (AT01, 0x02, PSPP)
                Store (0x03, SZZE)
                Store (One, RETV)
                Store (0x03, SZZB)
                Store (One, PSPP)
                Store (ALIB (0x03, AT01), AT00)
            }

            Method (ATC4, 1, Serialized)
            {
                CreateField (Arg0, 0x10, 0x03, FUCC)
                CreateField (Arg0, 0x13, 0x06, DEVV)
                CreateByteField (Arg0, 0x03, BUSS)
                CreateByteField (Arg0, 0x04, NULN)
                CreateWordField (AT00, Zero, SZZE)
                CreateByteField (AT00, 0x02, NULM)
                Store (0x03, SZZE)
                Store (One, NULM)
                Store (ALIB (0x04, Arg0), AT00)
            }
        }

        Name (ATPB, Buffer (0x0100) {})
        Name (DSID, 0xFFFFFFFF)
        Name (HSID, 0xFFFFFFFF)
        Name (CNT0, Buffer (0x05)
        {
             0x05, 0x00, 0x00, 0x10, 0x01
        })
        Name (CNT1, Buffer (0x05)
        {
             0x05, 0x01, 0x00, 0x00, 0x01
        })
        Name (CNT2, Buffer (0x05)
        {
             0x07, 0x03, 0x00, 0x10, 0x02
        })
        Name (CNT3, Buffer (0x05)
        {
             0x07, 0x07, 0x00, 0x20, 0x02
        })
        Name (CNT4, Buffer (0x05)
        {
             0x00, 0x09, 0x00, 0x30, 0x02
        })
        Name (CNT5, Buffer (0x05)
        {
             0x05, 0x00, 0x01, 0x10, 0x01
        })
        Name (CNT6, Buffer (0x05)
        {
             0x05, 0x01, 0x01, 0x00, 0x01
        })
        Name (CNT7, Buffer (0x05)
        {
             0x07, 0x03, 0x01, 0x10, 0x02
        })
        Name (CNT8, Buffer (0x05)
        {
             0x07, 0x07, 0x01, 0x20, 0x02
        })
        Name (CNT9, Buffer (0x05)
        {
             0x00, 0x09, 0x01, 0x30, 0x02
        })
        OperationRegion (REVD, SystemMemory, 0xA7A6FE9D, 0x00000008)
        Field (REVD, AnyAcc, NoLock, Preserve)
        {
            SROM,   32, 
            VROM,   32
        }

        Name (TVGA, Buffer (0x0004)
        {
             0x00
        })
        Method (ATRM, 2, Serialized)
        {
            Add (Arg0, Arg1, Local0)
            If (LLessEqual (Local0, SROM))
            {
                Multiply (Arg1, 0x08, Local1)
                Multiply (Arg0, 0x08, Local2)
                Store (VROM, TVGA)
                CreateField (TVGA, Local2, Local1, TEMP)
                Name (RETB, Buffer (Arg1) {})
                Store (TEMP, RETB)
                Return (RETB)
            }
            Else
            {
                If (LLess (Arg0, SROM))
                {
                    Subtract (SROM, Arg0, Local3)
                    Multiply (Local3, 0x08, Local1)
                    Multiply (Arg0, 0x08, Local2)
                    Store (VROM, TVGA)
                    CreateField (TVGA, Local2, Local1, TEM)
                    Name (RETC, Buffer (Local3) {})
                    Store (TEM, RETC)
                    Return (RETC)
                }
                Else
                {
                    Name (RETD, Buffer (One) {})
                    Return (RETD)
                }
            }
        }

        Method (ATPX, 2, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (PX00 ())
            }

            If (LEqual (Arg0, One))
            {
                Return (PX01 ())
            }

            If (LEqual (Arg0, 0x02))
            {
                PX02 (DerefOf (Index (Arg1, 0x02)))
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x03))
            {
                PX03 (DerefOf (Index (Arg1, 0x02)))
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x04))
            {
                PX04 (DerefOf (Index (Arg1, 0x02)))
                Return (ATPB)
            }

            If (LEqual (Arg0, 0x08))
            {
                Return (PX08 ())
            }

            If (LEqual (Arg0, 0x09))
            {
                Return (PX09 ())
            }

            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, VERN)
            CreateDWordField (ATPB, 0x04, SFUN)
            Store (Zero, SSZE)
            Store (Zero, VERN)
            Store (Zero, SFUN)
            Return (ATPB)
        }

        Method (PX00, 0, NotSerialized)
        {
            Store (0xE0, P80H)
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, VERN)
            CreateDWordField (ATPB, 0x04, SFUN)
            Store (0x08, SSZE)
            Store (One, VERN)
            If (LEqual (PXEN, 0x80000000))
            {
                Store (Zero, SFUN)
                Return (ATPB)
            }

            If (LEqual (PXMX, 0x80000000))
            {
                Store (0x018F, SFUN)
            }
            Else
            {
                Store (0x0183, SFUN)
            }

            If (LEqual (PXDY, 0x80000001))
            {
                And (SFUN, 0xFFFFFFFD, SFUN)
            }

            If (LAnd (LEqual (PXDY, 0x80000001), LEqual (PXFX, 0x80000001)))
            {
                Or (SFUN, 0x02, SFUN)
            }

            Store (^^PCE4.VGA.SVID, Local0)
            Store (^^PCE4.HDAU.SVID, Local1)
            If (LNotEqual (Local0, 0xFFFFFFFF))
            {
                Store (Local0, DSID)
            }

            If (LNotEqual (Local1, 0xFFFFFFFF))
            {
                Store (Local1, HSID)
            }

            Return (ATPB)
        }

        Method (PX01, 0, NotSerialized)
        {
            Store (0xE1, P80H)
            CreateWordField (ATPB, Zero, SSZE)
            CreateDWordField (ATPB, 0x02, VMSK)
            CreateDWordField (ATPB, 0x06, FLGS)
            Store (0x0A, SSZE)
            Store (0xFF, VMSK)
            If (LEqual (PXMX, 0x80000000))
            {
                Store (0x4B, FLGS)
            }
            Else
            {
                Store (Zero, FLGS)
                If (LEqual (PXDY, 0x80000001))
                {
                    Or (FLGS, 0x80, FLGS)
                }
            }

            Return (ATPB)
        }

        Method (PX02, 1, NotSerialized)
        {
            CreateWordField (ATPB, Zero, SSZE)
            CreateByteField (ATPB, 0x02, PWST)
            Store (0x03, SSZE)
            Store (Buffer (0x05) {}, Local7)
            CreateWordField (Local7, Zero, SZZE)
            CreateField (Local7, 0x10, 0x03, FUCC)
            CreateField (Local7, 0x13, 0x05, DEVV)
            CreateByteField (Local7, 0x03, BUSS)
            CreateByteField (Local7, 0x04, HPST)
            Store (0x05, SZZE)
            Store (Zero, BUSS)
            Store (Zero, FUCC)
            Store (Buffer (0x04) {}, Local6)
            CreateByteField (Local6, 0x02, HPOX)
            And (Arg0, One, PWST)
            Name (HPOK, Zero)
            If (PWST)
            {
                Store (0x11E2, P80H)
                Store (Zero, ^^SMBS.G15O)
                Store (Zero, ^^SMBS.G15E)
                Store (Zero, ^^SMBS.G2DO)
                Store (Zero, ^^SMBS.G2DE)
                Sleep (0x0A)
                Store (One, ^^SMBS.G2DO)
                Store (Zero, ^^SMBS.G2DE)
                Sleep (0x0A)
                Store (One, ^^SMBS.G37O)
                Store (Zero, ^^SMBS.G37E)
                Sleep (0x0A)
                Store (One, ^^SMBS.G1CM)
                While (LEqual (^^SMBS.G1CI, Zero)) {}
                Store (One, ^^SMBS.G15O)
                Store (Zero, ^^SMBS.G15E)
                Store (0x12E2, P80H)
                Store (Zero, HPOK)
                Sleep (0x64)
                Sleep (0x64)
                Store (0x04, DEVV)
                Store (One, HPST)
                Store (ALIB (0x06, Local7), Local6)
                Sleep (0x14)
                Store (Zero, Local2)
                While (LLess (Local2, 0x0F))
                {
                    Store (One, ^^PCE4.PDC2)
                    Store (One, Local4)
                    Store (0xC8, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (^^PCE4.XPRD (0xA5), Local0)
                        And (Local0, 0x7F, Local0)
                        If (LAnd (LGreaterEqual (Local0, 0x10), LNotEqual (Local0, 0x7F)))
                        {
                            Store ("PXPGfx:04: TrainingState=0x10", Debug)
                            Store (Zero, Local4)
                        }
                        Else
                        {
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    If (LNot (Local4))
                    {
                        Store ("PXPGfx:04: Check VC Negotiation Pending", Debug)
                        Store (^^PCE4.XPDL (), Local5)
                        If (Local5)
                        {
                            Store ("PXPGfx:04: Retraining Link", Debug)
                            ^^PCE4.XPRT ()
                            Sleep (0x05)
                            Increment (Local2)
                        }
                        Else
                        {
                            Store ("PXPGfx:04: Device OK", Debug)
                            Store (0x20, INFO)
                            Store (0x87, BCMD)
                            Store (ATIS, ^^SBRG.SMIC)
                            Store (Zero, Local0)
                            If (LEqual (^^PCE4.XPR2 (), Ones))
                            {
                                Store (One, Local0)
                            }

                            If (Local0)
                            {
                                Store (One, HPOK)
                                Store (0x10, Local2)
                            }
                            Else
                            {
                                Store ("PXPGFx:04: Common Clock Retraining Failed", Debug)
                                Store (Zero, HPOK)
                                Store (0x10, Local2)
                            }
                        }
                    }
                    Else
                    {
                        Store ("PXPGfx:04: TrainingState Timeout", Debug)
                        Store (0x10, Local2)
                    }
                }

                If (LNot (HPOK))
                {
                    Store (0x13E2, P80H)
                    Store ("PXPGfx:04: Insertion Failed: Disable Training & PowerDown", Debug)
                    Store (^^PCE4.VGA.DVID, Local1)
                    Sleep (0x0A)
                    Store (One, Local4)
                    Store (0x05, Local5)
                    While (LAnd (Local4, Local5))
                    {
                        Store (^^PCE4.XPRD (0xA5), Local0)
                        And (Local0, 0x7F, Local0)
                        If (LLessEqual (Local0, 0x04))
                        {
                            Store (Zero, Local4)
                        }
                        Else
                        {
                            Store (^^PCE4.VGA.DVID, Local1)
                            Sleep (0x05)
                            Decrement (Local5)
                        }
                    }

                    Store (0x04, DEVV)
                    Store (Zero, HPST)
                    ALIB (0x06, Local7)
                }

                Store (0x14E2, P80H)
            }
            Else
            {
                Store (0x02E2, P80H)
                Store (0x20, INFO)
                Store (0x84, BCMD)
                Store (ATIS, ^^SBRG.SMIC)
                Store (Zero, ^^SMBS.G37O)
                Store (Zero, ^^SMBS.G37E)
                Sleep (0x0A)
                Store (Zero, ^^SMBS.G2DO)
                Store (Zero, ^^SMBS.G2DE)
                Store (0x03E2, P80H)
                Store (One, ^^PCE4.PDC2)
                Store (^^PCE4.VGA.DVID, Local1)
                Sleep (0x0A)
                Store (One, Local4)
                Store (0x05, Local5)
                While (LAnd (Local4, Local5))
                {
                    Store (^^PCE4.XPRD (0xA5), Local0)
                    And (Local0, 0x7F, Local0)
                    If (LLessEqual (Local0, 0x04))
                    {
                        Store (Zero, Local4)
                    }
                    Else
                    {
                        Store (^^PCE4.VGA.DVID, Local1)
                        Sleep (0x05)
                        Decrement (Local5)
                    }
                }

                Store (0x04, DEVV)
                Store (Zero, HPST)
                ALIB (0x06, Local7)
                Store (0x02, HPOK)
                Store (0x04E2, P80H)
            }

            If (HPOK)
            {
                If (LAnd (LEqual (HPOK, One), LNotEqual (DSID, 0xFFFFFFFF)))
                {
                    Store (DSID, Local1)
                    Store (Local1, ^^PCE4.VGA.SMID)
                    Sleep (0x0A)
                    Store (HSID, Local1)
                    If (LNotEqual (Local1, 0xFFFFFFFF))
                    {
                        Store (Local1, ^^PCE4.HDAU.SMID)
                    }

                    Sleep (0x0A)
                }

                Notify (PCE4, Zero)
            }
        }

        Method (PX03, 1, NotSerialized)
        {
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, DPSW)
            Store (0x04, SSZE)
            And (Arg0, One, DPSW)
            If (DPSW)
            {
                Store (0x02E3, P80H)
                Store (One, ^^SMBS.G06O)
                Store (Zero, ^^SMBS.G06E)
            }
            Else
            {
                Store (0x01E3, P80H)
                Store (Zero, ^^SMBS.G06O)
                Store (Zero, ^^SMBS.G06E)
            }
        }

        Method (PX04, 1, NotSerialized)
        {
            Store (0xE4, P80H)
            CreateWordField (ATPB, Zero, SSZE)
            CreateWordField (ATPB, 0x02, ICSW)
            Store (0x04, SSZE)
            And (Arg0, One, ICSW)
            If (ICSW)
            {
                Store (0x02E4, P80H)
                Store (One, ^^SMBS.G14O)
                Store (Zero, ^^SMBS.G14E)
            }
            Else
            {
                Store (0x01E4, P80H)
                Store (Zero, ^^SMBS.G14O)
                Store (Zero, ^^SMBS.G14E)
            }
        }

        Method (PX08, 0, NotSerialized)
        {
            Store (0xE8, P80H)
            CreateWordField (ATPB, Zero, CNUM)
            CreateWordField (ATPB, 0x02, CSSZ)
            Store (0x0A, CNUM)
            Store (0x05, CSSZ)
            CreateField (ATPB, 0x20, 0x28, CTI0)
            Store (CNT0, CTI0)
            CreateField (ATPB, 0x48, 0x28, CTI1)
            Store (CNT1, CTI1)
            CreateField (ATPB, 0x70, 0x28, CTI2)
            CreateByteField (CNT2, Zero, FLG2)
            If (LEqual (LCDT, 0x80000001))
            {
                If (LEqual (DSCT, 0x80000001))
                {
                    Store (Zero, FLG2)
                }

                If (LEqual (DSCT, 0x80000002))
                {
                    Store (0x07, FLG2)
                }
            }

            Store (CNT2, CTI2)
            CreateField (ATPB, 0x98, 0x28, CTI3)
            CreateByteField (CNT3, Zero, FLG3)
            If (LEqual (LCDT, 0x80000000))
            {
                Store (0x07, FLG3)
            }

            If (LEqual (LCDT, 0x80000001))
            {
                Store (Zero, FLG3)
                If (LEqual (DSCT, 0x80000002))
                {
                    Store (Zero, FLG3)
                }
            }

            If (LEqual (LCDT, 0x80000002))
            {
                Store (Zero, FLG3)
                If (LEqual (DSCT, 0x80000002))
                {
                    Store (0x07, FLG3)
                }
            }

            Store (CNT3, CTI3)
            CreateField (ATPB, 0xC0, 0x28, CTI4)
            Store (CNT4, CTI4)
            CreateField (ATPB, 0xE8, 0x28, CTI5)
            Store (CNT5, CTI5)
            CreateField (ATPB, 0x0110, 0x28, CTI6)
            Store (CNT6, CTI6)
            CreateField (ATPB, 0x0138, 0x28, CTI7)
            CreateByteField (CNT7, Zero, FLG7)
            If (LEqual (LCDT, 0x80000001))
            {
                If (LEqual (DSCT, 0x80000001))
                {
                    Store (Zero, FLG7)
                }

                If (LEqual (DSCT, 0x80000002))
                {
                    Store (0x07, FLG7)
                }
            }

            Store (CNT7, CTI7)
            CreateField (ATPB, 0x0160, 0x28, CTI8)
            CreateByteField (CNT8, Zero, FLG8)
            If (LEqual (LCDT, 0x80000000))
            {
                Store (0x07, FLG8)
            }

            If (LEqual (LCDT, 0x80000001))
            {
                Store (Zero, FLG8)
            }

            If (LEqual (LCDT, 0x80000002))
            {
                Store (Zero, FLG8)
            }

            If (LEqual (DSCT, 0x80000002))
            {
                Store (0x07, FLG8)
            }

            Store (CNT8, CTI8)
            CreateField (ATPB, 0x0188, 0x28, CTI9)
            CreateByteField (CNT9, Zero, FLG9)
            If (LEqual (DSCT, 0x80000002))
            {
                Store (0x07, FLG9)
            }

            Store (CNT9, CTI9)
            Return (ATPB)
        }

        Method (PX09, 0, NotSerialized)
        {
            Store (0xE9, P80H)
            CreateWordField (ATPB, Zero, CNUM)
            CreateWordField (ATPB, 0x02, CSSZ)
            Store (Zero, CNUM)
            Store (Zero, CSSZ)
            CreateByteField (ATPB, 0x04, ATI0)
            CreateByteField (ATPB, 0x05, HPD0)
            CreateByteField (ATPB, 0x06, DDC0)
            Store (Zero, ATI0)
            Store (Zero, HPD0)
            Store (Zero, DDC0)
            CreateByteField (ATPB, 0x07, ATI1)
            CreateByteField (ATPB, 0x08, HPD1)
            CreateByteField (ATPB, 0x09, DDC1)
            Store (Zero, ATI1)
            Store (Zero, HPD1)
            Store (Zero, DDC1)
            Return (ATPB)
        }
    }

    Device (_SB.PCI0.SBRG.TPM)
    {
        Name (_HID, EisaId ("PNP0C31"))  // _HID: Hardware ID
        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            ACCS,   8, 
            Offset (0x18), 
            TSTA,   8, 
            TBCA,   8, 
            Offset (0xF00), 
            TVID,   16, 
            TDID,   16
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LEqual (VIDT, 0x8086))
            {
                Return (Zero)
            }
            Else
            {
                If (TPMF)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.SBRG.TPM)
    {
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */   0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E,
                        /* 0008 */   0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    }))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store (ToInteger (Arg2), _T_0)
                If (LEqual (_T_0, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x7F
                    })
                }
                Else
                {
                    If (LEqual (_T_0, One))
                    {
                        Return ("1.0")
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                            Store (TMF2, DAT)
                            Store (OFST, INQ)
                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (One, TMF1)
                                Add (TMF1, OFST, TMF2)
                                Store (0xFA, DAT)
                                Store (TMF2, INQ)
                                Store (DAT, Index (PPI1, One))
                                Return (PPI1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (One, TMF1)
                                        Add (TMF1, OFST, TMF2)
                                        Store (0xFB, DAT)
                                        Store (TMF2, INQ)
                                        Store (DAT, Index (PPI2, One))
                                        Store (One, TMF1)
                                        Add (TMF1, OFST, TMF2)
                                        Store (0xFC, DAT)
                                        Store (TMF2, INQ)
                                        If (LEqual (DAT, 0xFFF0))
                                        {
                                            Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xFFF1))
                                            {
                                                Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Return (Zero)
                                        }
                                        Else
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46,
                            /* 0008 */   0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                        }))
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    Store (ToInteger (Arg2), _T_1)
                    If (LEqual (_T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }
                    Else
                    {
                        If (LEqual (_T_1, One))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1)
                            Store (TMF1, DAT)
                            Store (0x02, TMF1)
                            Add (TMF1, OFST, TMF2)
                            Store (TMF2, INQ)
                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                 0x00
            })
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (ITPD, PCI_Config, 0xE8, 0x04)
        Field (ITPD, DWordAcc, NoLock, Preserve)
        {
                ,   15, 
            TPDI,   1
        }

        OperationRegion (TVID, SystemMemory, 0xFED40F00, 0x02)
        Field (TVID, WordAcc, NoLock, Preserve)
        {
            VIDT,   16
        }
    }

    Device (_SB.PCI0.ITPM)
    {
        Name (_HID, "INTC0102")  // _HID: Hardware ID
        Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
        Name (_STR, Unicode ("TPM 1.2 Device"))  // _STR: Description String
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            Memory32Fixed (ReadOnly,
                0xFED40000,         // Address Base
                0x00005000,         // Address Length
                )
        })
        OperationRegion (TSMI, SystemIO, SMIT, 0x02)
        Field (TSMI, ByteAcc, NoLock, Preserve)
        {
            INQ,    8, 
            DAT,    8
        }

        OperationRegion (TPMR, SystemMemory, 0xFED40000, 0x5000)
        Field (TPMR, AnyAcc, NoLock, Preserve)
        {
            ACC0,   8
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LNotEqual (ACC0, 0xFF))
            {
                If (LEqual (VIDT, 0x8086))
                {
                    If (TPMF)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */   0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E,
                        /* 0008 */   0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    }))
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store (ToInteger (Arg2), _T_0)
                If (LEqual (_T_0, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x7F
                    })
                }
                Else
                {
                    If (LEqual (_T_0, One))
                    {
                        Return ("1.0")
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF2)
                            Store (TMF2, DAT)
                            Store (OFST, INQ)
                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Name (PPI1, Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                                Store (One, TMF1)
                                Add (TMF1, OFST, TMF2)
                                Store (0xFA, DAT)
                                Store (TMF2, INQ)
                                Store (DAT, Index (PPI1, One))
                                Return (PPI1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Name (PPI2, Package (0x03)
                                        {
                                            Zero, 
                                            Zero, 
                                            Zero
                                        })
                                        Store (One, TMF1)
                                        Add (TMF1, OFST, TMF2)
                                        Store (0xFB, DAT)
                                        Store (TMF2, INQ)
                                        Store (DAT, Index (PPI2, One))
                                        Store (One, TMF1)
                                        Add (TMF1, OFST, TMF2)
                                        Store (0xFC, DAT)
                                        Store (TMF2, INQ)
                                        If (LEqual (DAT, 0xFFF0))
                                        {
                                            Store (0xFFFFFFF0, Index (PPI2, 0x02))
                                        }
                                        Else
                                        {
                                            If (LEqual (DAT, 0xFFF1))
                                            {
                                                Store (0xFFFFFFF1, Index (PPI2, 0x02))
                                            }
                                            Else
                                            {
                                                Store (DAT, Index (PPI2, 0x02))
                                            }
                                        }

                                        Return (PPI2)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Return (Zero)
                                        }
                                        Else
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Else
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46,
                            /* 0008 */   0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                        }))
                {
                    Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                    Store (ToInteger (Arg2), _T_1)
                    If (LEqual (_T_1, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }
                    Else
                    {
                        If (LEqual (_T_1, One))
                        {
                            ToInteger (DerefOf (Index (Arg3, Zero)), TMF1)
                            Store (TMF1, DAT)
                            Store (0x02, TMF1)
                            Add (TMF1, OFST, TMF2)
                            Store (TMF2, INQ)
                            Return (Zero)
                        }
                        Else
                        {
                        }
                    }
                }
            }

            Return (Buffer (One)
            {
                 0x00
            })
        }
    }

    Scope (_SB.PCI0.SMBS)
    {
        Mutex (PSMX, 0x00)
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x04, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            SPTS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
            \_SB.PCI0.SBRG.SIOS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        SWAK (Arg0)
        \_SB.PCI0.NWAK (Arg0)
        \_SB.PCI0.SBRG.SIOW (Arg0)
    }
}

