Received: from web11507.mail.yahoo.com ([216.136.172.39])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kkHi-0006ai-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 11:17:38 +0000
Message-ID: <20020312112903.89113.qmail@web11507.mail.yahoo.com>
Date: Tue, 12 Mar 2002 11:29:03 +0000 (GMT)
From: =?iso-8859-1?q?Ajit=20Anand?= <ajit_anand@yahoo.com>
Subject: kernel oops loading Doc2000
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hi all,

i have a Doc2000 64 MB chip and am trying to get the
same working under linux. i've tried using kernel
versions 2.4.10 and 2.4.18 patched with the latest
sources from 

cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs
login

te following kernel options are selected (only
relevant portions attached) 

# Loadable module support
CONFIG_MODULES=y
CONFIG_MODVERSIONS=y
CONFIG_KMOD=y

CONFIG_M486=y

# Memory Technology Devices (MTD)
CONFIG_MTD=m
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=1
CONFIG_MTD_CHAR=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y

# Self-contained MTD device drivers
CONFIG_MTD_DOC2000=m
CONFIG_MTD_DOC2001=m
CONFIG_MTD_DOCPROBE=m
# CONFIG_MTD_DOCPROBE_ADVANCED is not set
CONFIG_MTD_DOCPROBE_ADDRESS=0
# CONFIG_MTD_DOCPROBE_HIGH is not set
# CONFIG_MTD_DOCPROBE_55AA is not set

but after instaling the new kernel and trying to run
modprobe -a doc2000 nftl mtdchar
this runs fine but when i try
modprobe -a docprobe
i get a kernel oops and when i run
cat /proc/modules i get
docprobe initializing

the kernel oops is given below :-

Mar 12 23:08:51 test kernel: NFTL driver: nftlcore.c
$Revision: 1.86 $, nftlmount.c $Revision: 1.26 $
Mar 12 23:09:02 test kernel: Possible DiskOnChip with
unknown ChipID FF found at 0xc8000
Mar 12 23:09:02 test kernel: Possible DiskOnChip with
unknown ChipID FF found at 0xca000
Mar 12 23:09:02 test kernel: DiskOnChip 2000 found at
address 0xCC000
Mar 12 23:09:02 test kernel: Flash chip found:
Manufacturer ID: 98, Chip ID: 75 (Toshiba
TC58256FT/DC)
Mar 12 23:09:02 test kernel: 2 flash chips found.
Total DiskOnChip size: 64 MiB
Mar 12 23:09:02 test kernel: mtd: Giving out device 0
to DiskOnChip 2000
Mar 12 23:09:02 test kernel: NFTL_notify_add for
DiskOnChip 2000
Mar 12 23:09:02 test kernel: NFTL_setup
Mar 12 23:09:02 test kernel: Unable to handle kernel
paging request at virtual address 454a4550
Mar 12 23:09:02 test kernel:  printing eip:
Mar 12 23:09:02 test kernel: c2835a37
Mar 12 23:09:02 test kernel: *pde = 00000000
Mar 12 23:09:02 test kernel: Oops: 0002
Mar 12 23:09:02 test kernel: CPU:    0
Mar 12 23:09:02 test kernel: EIP:    0010:[<c2835a37>]
Mar 12 23:09:02 test kernel: EFLAGS: 00010246
Mar 12 23:09:02 test kernel: eax: 454a4548   ebx:
c1d4aa60   ecx: c1d4ad24   edx: 00000004
Mar 12 23:09:02 test kernel: esi: c032bc36   edi:
c1d4ac60   ebp: c1d4aa80   esp: c032bc14
Mar 12 23:09:02 test kernel: ds: 0018   es: 0018   ss:
0018
Mar 12 23:09:02 test kernel: Process modprobe (pid:
627, stackpage=c032b000)
Mar 12 23:09:02 test kernel: Stack: c032bc2c c032bc30
00000000 00000004 00000004 3c693c69 00000008 4e414e41
Mar 12 23:09:02 test kernel:        0ffc0044 00000004
000003ea 00000000 00000000 00000000 00000000 00000000
Mar 12 23:09:02 test kernel:        00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000
Mar 12 23:09:02 test kernel: Call Trace: [<c2836371>]
[call_console_drivers+218/224] [<c2834119>]
[<c28368aa>] [<c282b724>]
Mar 12 23:09:02 test kernel: Call Trace: [<c2836371>]
[<c011212a>] [<c2834119>] [<c28368aa>] [<c282b724>]
Mar 12 23:09:02 test kernel:    [<c282d800>]
[<c2834306>] [<c2837ae4>] [<c282b0b3>] [<c283b4e2>]
[<c283b242>]
Mar 12 23:09:02 test kernel:    [<c282d800>]
[<c283b4e2>] [<c283b4d7>] [<c283b4d2>] [<c283b508>]
[<c283b2cb>]
Mar 12 23:09:02 test kernel:   
[sys_init_module+1461/1648] [<c283b060>]
[system_call+51/64]
Mar 12 23:09:02 test kernel:    [<c0112ff5>]
[<c283b060>] [<c0106da3>]
Mar 12 23:09:02 test kernel:
Mar 12 23:09:02 test kernel: Code: 66 c7 04 50 fc ff
8b 4c 24 08 85 c9 74 6b 89 ee 8b 7c 24 04


could you please send me some pointers as to where i'm
going wrong.

TIA

ajit

__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
