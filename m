Received: from moutng.kundenserver.de ([212.227.126.177] helo=moutng3.kundenserver.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17VGeQ-00018E-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2002 20:09:22 +0100
Received: from [212.227.126.160] (helo=mrelayng0.kundenserver.de)
	by moutng3.kundenserver.de with esmtp (Exim 3.35 #2)
	id 17Uraw-0001Cs-00
	for linux-mtd@lists.infradead.org; Wed, 17 Jul 2002 18:24:06 +0200
Received: from [80.134.28.137] (helo=[192.168.1.27])
	by mrelayng0.kundenserver.de with asmtp (Exim 3.35 #1)
	id 17Uraw-0006or-00
	for linux-mtd@lists.infradead.org; Wed, 17 Jul 2002 18:24:06 +0200
Subject: Can't format my DOC
From: Jens Nixdorf <jens.nixdorf@embesso.com>
To: MTD Mailingliste <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 17 Jul 2002 18:26:47 +0200
Message-Id: <1026923208.17761.22.camel@pc11>
Mime-Version: 1.0
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

Hi,

i'm a newbie in DiskOnChip (and generally in embedded linux also) and
i've had many problems to get linux to see my DOC. Now i've managed
this, but i get the following messages at boot-time: 

DiskOnChip 2000 found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba
TC58256FT/DC)
9 flash chips found. Total DiskOnChip size: 288 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Ignoring DiskOnChip 2000 at 0xDA000 - already configured
Ignoring DiskOnChip 2000 at 0xDC000 - already configured
Ignoring DiskOnChip 2000 at 0xDE000 - already configured
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip 2000
NFTL_setup
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device

So, i've read in the mtd-jffs-Howto, that i could (or should) format the
chip. But if i try this with:

./nflt_format /dev/mtd0

i get always the message:

ioctl(MEMGETINFO): Inappropriate ioctl for device

Is this something with the 288 MB DOC? With dmesg i get this message:

MTD_ioctl
Invalid ioctl 80404d01 (MEMGETINFO = 80204d01)
MTD_close

What can i do?


best regards, and thanks in advance, Jens
