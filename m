Received: from smtp.comcast.net ([24.153.64.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16xBww-0006rd-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 20:15:38 +0100
Received: from [192.168.0.101]
 (pcp657911pcs.micske01.fl.comcast.net [68.35.215.220])
 by mtaout04.icomcast.net (iPlanet Messaging Server 5.1 (built Feb  6 2002))
 with ESMTP id <0GUM0078WIT6KJ@mtaout04.icomcast.net> for
 linux-mtd@lists.infradead.org; Mon, 15 Apr 2002 15:15:07 -0400 (EDT)
Date: Mon, 15 Apr 2002 15:16:20 -0400
From: Edgar Hilton <efhilton@comcast.net>
Subject: DOC-2000 problems
To: linux-mtd@lists.infradead.org
Message-id: <1018898181.3931.18.camel@tuxie>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
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

Hi!

I have a DOC-2000.  Following the mtd-jffs-HOWTO, I get to the point
where I can type:

bash-2.04# modprobe -a doc2000 nftl mtdchar mtdblock
bash-2.04# modprobe -a docprobe
bash-2.04# cat /proc/mtd
dev:    size   erasesize name 
mtd0: 06000000 00004000 "DiskOnChip 2000"

Howewer, dmesg gives:

------------------ cut here -------------------------
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.23 $
DiskOnChip 2000 found at address 0xCE000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba
TC58256FT/DC)
3 flash chips found. Total DiskOnChip size: 96 MiB
mtd: Giving out device 0 to DiskOnChip 2000
NFTL_notify_add for DiskOnChip 2000
mtd->read = c483d9a8, size = 100663296, erasesize = 16384
NFTL_setup
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device
------------------ cut here -----------------------

Also, as per the howto, I run:  

bash-2.04# ./nftl_format /dev/mtd0

But I get:
$Id: nftl_format.c,v 1.17 2001/08/29 14:28:48 dwmw2 Exp $
Erase size not 8Kb - I'm confused


Any ideas?

-Edgar
