Received: from zeus.bridgeport.edu ([216.87.96.66])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAqaO-0006TY-9x
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 11:02:52 -0400
From: itche <itche@bridgeport.edu>
To: uClinux development list <uclinux-dev@uclinux.org>
Date: Thu, 1 Sep 2005 11:02:14 -0400
References: <200508260940.38685.itche@bridgeport.edu>
	<200508261515.23949.itche@bridgeport.edu>
	<4312DC61.2040701@eptar.com>
In-Reply-To: <4312DC61.2040701@eptar.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200509011102.14677.itche@bridgeport.edu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [uClinux-dev] MTD/uclinux help
Reply-To: itche@bridgeport.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,
first of, i would like to thank Greg and Claudio,  without your help guys i 
wouldn't be able to get to this stage, thanks a bunch.
at this point my system is recognizing the Nand device properly, and assigning 
3 MTD devices for the 3 partitions I've created.
however when i try to do eraseall /dev/MTD# the system hangs.
even when i try to do nandtest /dev/MTD# the system hangs just after asking me 
if i want to continue (because it erases the first block).

i am using 4.2.19 kernel (heavily modified for my hardware)
any help will be appreciated.
thanks in advance 
Isack

On Monday 29 August 2005 05:58, Claudio Lanconelli wrote:
> Hi Isack,
>
> I'm using uClinux-2_4_31_uc0. I build my custom hardware interface based
> on edb7312.c
> It seems to work with generic NAND 32MB 3,3V parameters in nand_ids.c so
> I don't add any IDs.
>
> This is what my bootlog:
>
> MBOPB scan for NAND...
> NAND device: Manufacture ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MB 3,3V)
> Using static partition definition
> Creating 3 MTD partitions on "NAND 32MB 3,3V":
> 0x00000000-0x00400000 : "MBOPB NandFlash partition 1"
> 0x00400000-0x00800000 : "MBOPB NandFlash partition 2"
> 0x00800000-0x02000000 : "MBOPB NandFlash partition 3"
>
> This is the content of nand_ids.h
> static struct nand_flash_dev nand_flash_ids[] = {
>     {"Toshiba TC5816BDC",     NAND_MFR_TOSHIBA, 0x64, 21, 1, 2, 0x1000},
>     {"Toshiba TC5832DC",      NAND_MFR_TOSHIBA, 0x6b, 22, 0, 2, 0x2000},
>     {"Toshiba TH58V128DC",    NAND_MFR_TOSHIBA, 0x73, 24, 0, 2, 0x4000},
>     {"Toshiba TC58256FT/DC",  NAND_MFR_TOSHIBA, 0x75, 25, 0, 2, 0x4000},
>     {"Toshiba TH58512FT",     NAND_MFR_TOSHIBA, 0x76, 26, 0, 3, 0x4000},
>     {"Toshiba TC58V32DC",     NAND_MFR_TOSHIBA, 0xe5, 22, 0, 2, 0x2000},
>     {"Toshiba TC58V64AFT/DC", NAND_MFR_TOSHIBA, 0xe6, 23, 0, 2, 0x2000},
>     {"Toshiba TC58V16BDC",    NAND_MFR_TOSHIBA, 0xea, 21, 1, 2, 0x1000},
>     {"Samsung KM29N16000",    NAND_MFR_SAMSUNG, 0x64, 21, 1, 2, 0x1000},
>     {"Samsung unknown 4Mb",   NAND_MFR_SAMSUNG, 0x6b, 22, 0, 2, 0x2000},
>     {"Samsung KM29U128T",     NAND_MFR_SAMSUNG, 0x73, 24, 0, 2, 0x4000},
>     {"Samsung KM29U256T",     NAND_MFR_SAMSUNG, 0x75, 25, 0, 2, 0x4000},
>     {"Samsung KM29V512000",   NAND_MFR_SAMSUNG, 0x76, 26, 0, 3, 0x4000},
>     {"Samsung KM29V1024000",  NAND_MFR_SAMSUNG, 0x79, 27, 0, 3, 0x4000},
>     {"Samsung KM29W32000",    NAND_MFR_SAMSUNG, 0xe3, 22, 0, 2, 0x2000},
>     {"Samsung KM29N32000",    NAND_MFR_SAMSUNG, 0xe5, 22, 0, 2, 0x2000},
>     {"Samsung KM29U64000",    NAND_MFR_SAMSUNG, 0xe6, 23, 0, 2, 0x2000},
>     {"Samsung KM29W16000",    NAND_MFR_SAMSUNG, 0xea, 21, 1, 2, 0x1000},
>     {NULL,}
> };
>
> and nand_ids.c
> struct nand_flash_dev nand_flash_ids[] = {
>     {"NAND 1MB 5V", 0x6e, 20, 0x1000, 1},    // 1Mb 5V
>     {"NAND 2MB 5V", 0x64, 21, 0x1000, 1},    // 2Mb 5V
>     {"NAND 4MB 5V", 0x6b, 22, 0x2000, 0},    // 4Mb 5V
>     {"NAND 1MB 3,3V", 0xe8, 20, 0x1000, 1},    // 1Mb 3.3V
>     {"NAND 1MB 3,3V", 0xec, 20, 0x1000, 1},    // 1Mb 3.3V
>     {"NAND 2MB 3,3V", 0xea, 21, 0x1000, 1},    // 2Mb 3.3V
>     {"NAND 4MB 3,3V", 0xd5, 22, 0x2000, 0},    // 4Mb 3.3V
>     {"NAND 4MB 3,3V", 0xe3, 22, 0x2000, 0},    // 4Mb 3.3V
>     {"NAND 4MB 3,3V", 0xe5, 22, 0x2000, 0},    // 4Mb 3.3V
>     {"NAND 8MB 3,3V", 0xd6, 23, 0x2000, 0},    // 8Mb 3.3V
>     {"NAND 8MB 3,3V", 0xe6, 23, 0x2000, 0},    // 8Mb 3.3V
>     {"NAND 16MB 3,3V", 0x73, 24, 0x4000, 0},// 16Mb 3,3V
>     {"NAND 32MB 3,3V", 0x75, 25, 0x4000, 0}, // 32Mb 3,3V
>     {"NAND 64MB 3,3V", 0x76, 26, 0x4000, 0}, // 64Mb 3,3V
>     {"NAND 128MB 3,3V", 0x79, 27, 0x4000, 0}, // 128Mb 3,3V
>     {NULL,}
> };
>
> struct nand_manufacturers nand_manuf_ids[] = {
>     {NAND_MFR_TOSHIBA, "Toshiba"},
>     {NAND_MFR_SAMSUNG, "Samsung"},
>     {NAND_MFR_FUJITSU, "Fujitsu"},
>     {NAND_MFR_NATIONAL, "National"},
>     {0x0, "Unknown"}
> };
>
> Cheers,
> Claudio Lanconelli
>
> itche wrote:
> >On Friday 26 August 2005 11:09, Claudio Lanconelli wrote:
> >Hi Claudio,
> >Thanks for answering.
> >I'm using 2.4.
> >what parameters are there for this chip in your distribution?
> >Thanks
> >Isack
> >
> >>Hi Isack,
> >>I use the same NAND chip on my board and it works without modifying
> >>nand_ids.h
> >>What is the kernel version you are using?
> >>
> >>Cheers,
> >>Claudio Lanconelli
> >>
> >>itche wrote:
> >>>Hello all
> >>>I am using the following NAND flash device : Samsung K9F5608UOC
> >>>i have tried to add it to the nand_ids.h file with these parameters.
> >>>{"Samsung K9F5608UOC",    NAND_MFR_SAMSUNG, 0x75, 25, 0, 2, 0x4000}
> >>>However when i boot i get a kernel panic
> >>>Any ideas?
> >>>thanks in advance
> >>>Isack
> >>>_______________________________________________
> >>>uClinux-dev mailing list
> >>>uClinux-dev@uclinux.org
> >>>http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
> >>>This message was resent by uclinux-dev@uclinux.org
>
> _______________________________________________
> uClinux-dev mailing list
> uClinux-dev@uclinux.org
> http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
> This message was resent by uclinux-dev@uclinux.org
