Received: from fwvip.nel.co.jp ([143.125.54.3] helo=lsig.nel.co.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B9Ep1-0002m2-UR
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2004 03:54:20 +0100
Message-Id: <200404020303.AA00315@arimoto-pc.lsig.nel.co.jp>
From: Takanori Arimoto <ari@lsig.nel.co.jp>
Date: Fri, 02 Apr 2004 12:03:50 +0900
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Problems with DOC Millenium Plus 64
Reply-To: ari@lsig.nel.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I try to use a DOC Millenium PLUS(64MB) in a PC-AT board, 
working with kernel version 2.4.20, but I have some problems.

Kernel does not recognize Millenium PLUS 64 correctly.

When it checks by DataSheet, Chip-ID of Millennium PLUS 64 is
the 40H same as Millennium PLUS 32. 

I tried it with another DOC and got the same message.

----kernel message---
DiskOnChip Millennium Plus found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba 
TC58256FT/DC)
1 flash chips found. Total DiskOnChip size: 32 MiB
mtd: Giving out device 0 to DiskOnChip Millennium Plus
blkmtd: error, missing `device' name
$Id: ftl.c,v 1.43 2002/02/13 15:31:37 dwmw2 Exp $
_DoC_WaitReady called for out-of-line wait
...
_DoC_WaitReady called for out-of-line wait
ftl_cs: FTL header not found.
NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 
$
NFTL_notify_add for DiskOnChip Millennium Plus
mtd->read = c01bf860, size = 33554432, erasesize = 32768
NFTL_setup
_DoC_WaitReady called for out-of-line wait
...
_DoC_WaitReady called for out-of-line wait
Could not find valid boot record
Could not mount NFTL device
---

I used this patch.
http://www.uclinux.org/pub/uClinux/misc/mplus-20030414.patch.gz

I formatted the DOC with doc514.exb at address d8000 by the
 M-sys program.

dformat /win:d800 /s:DOC514.EXB

I set the following option to YES for by built-in MTD,
and compiled my kernel.

---kernel option---
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_FTL=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y

#
# Self-contained MTD device drivers
#
CONFIG_MTD_BLKMTD=y
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOC2001=y
CONFIG_MTD_DOC2001PLUS=y
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADVANCED=y
CONFIG_MTD_DOCPROBE_ADDRESS=0xd8000
CONFIG_MTD_DOCPROBE_55AA=y
---

Can anyone help me please with this situation.
What have I done wrong?
What shell I do now?


--------------------------------------
T.Arimoto  ari@lsig.nel.co.jp
