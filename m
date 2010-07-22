Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ObvyA-00030c-Qk
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2010 13:37:51 +0000
Received: by gxk27 with SMTP id 27so5751501gxk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Jul 2010 06:37:49 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 22 Jul 2010 21:37:48 +0800
Message-ID: <AANLkTim8PxP47Kor9Ryg8vup_h-s1g2x9fkFI4WlBBhP@mail.gmail.com>
Subject: Bad blocks in a FAT32 partition of MLC nand flash
From: rednoah <rednoax@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
   I'm using samsung s3c2416 board with a 8G MLC nand flash.A partition
larger than 7G was reserved for cutomer.They use PC to store files in this
partition.Since Windows XP was their mainly used OS,there is no other
file-system choice except FAT32.But FAT32 can't cope with bad blocks in
nand flash,which may be an easy job for yaffs.So these errors such as
"path too deep","crc error" are common when copying files to the MLC
nand flash partition.I refered to the mtd homepage.It seems that there is 2
solutions:

1.use a flash translation layer to deal with wear leveling and bad block.But
it seems that there is no reliable open source FTL for nand flash.There is no
FTL for MLC nand flash in main-line kernel.

2.use ubi layer,but there is no block device driver on ubi for building FAT32
or ext2.There is a ubi block device driver.But it doesn't belong main-line mtd
driver.

Could anyone give some suggestions on the problem?
B/r
