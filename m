Received: from lancelot.crf.canon.fr ([194.2.158.66])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KcZz-0000UZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 10:16:15 +0100
Received: (from smap@localhost)
	by lancelot.crf.canon.fr (8.9.2/8.9.2) id LAA12986
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 11:18:15 +0200 (MET DST)
Message-ID: <3B4D6B4E.2040303@crf.canon.fr>
Date: Thu, 12 Jul 2001 11:18:06 +0200
From: "VALETTE Eric" <valette@crf.canon.fr>
Reply-To: valette@crf.canon.fr
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Moving from 2.2.18 + M-system proprietray code to 2.4.6 => does not work
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

I have been using a motherboard with a DOC 2000. I can boot from the 
diskOnChip and see it as a disk device with a ext2 filesystem using 
2.2.18 + Msystem patch + own cooked lilo patch...

Now I upgraded the system to a stock 2.4.6 kernel *with devfs enabled*

When I boot, I see the follwing message :

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
2 flash chips found. Total DiskOnChip size: 32 MiB
Ignoring DiskOnChip 2000 at 0xDA000 - already configured
Ignoring DiskOnChip 2000 at 0xDC000 - already configured
Ignoring DiskOnChip 2000 at 0xDE000 - already configured
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftlcore.c,v 1.73 2001/06/09 01:09:43 dwmw2 Exp $
  nftla: p1
devfs: devfs_register(disc): NULL ops, got c02d8850 from major table
devfs: devfs_register(part1): NULL ops, got c02d8850 from major tableL


In /dev/nflt/disc0 I have two devices

/dev/nftl# ls
disc0
albator:/dev/nftl# cd disc0
albator:/dev/nftl/disc0# ls -l
total 0
brw-------    1 root     root      93,   0 Jan  1  1970 disc
brw-------    1 root     root      93,   1 Jan  1  1970 part1

No other things.

NB : /dev/discs/disc1# ls -l
total 0
brw-------    1 root     root      93,   0 Jan  1  1970 disc
brw-------    1 root     root      93,   1 Jan  1  1970 part1

But I can not mount the filesystem. The filesystem is valid as it works
with the 2.2.18 kernel...

Any idea?





-- 
    __
   /  `                          Eric Valette - Canon CRF
  /--   __  o _.                 Canon Development Europe Team Leader
(___, / (_(_(__                 Rue de la touche lambert
                                 35517 Cesson-Sevigne  Cedex
                                 FRANCE
Tel: +33 (0)2 99 87 68 91       Fax: +33 (0)2 99 84 11 30
E-mail: valette@crf.canon.fr    http://www.crf.canon.fr
