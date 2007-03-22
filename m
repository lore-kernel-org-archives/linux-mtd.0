Received: from mail1004.centrum.cz ([213.29.7.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HUIdN-00063m-Tu
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 04:26:59 -0400
Received: by mail1004.centrum.cz id S4801248AbXCVI02 (ORCPT
	<rfc822;linux-mtd@lists.infradead.org>);
	Thu, 22 Mar 2007 09:26:28 +0100
Date: Thu, 22 Mar 2007 09:26:28 +0100
From: "Jakub  =?iso-8859-2?Q?=20Bedn=E1=F8?=" <bednar.jakub@centrum.cz>
To: <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Message-ID: <200703220926.22574@centrum.cz>
Subject: NAND flash file system and JFFS2 problem
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
      I've spent long time reading all about mtd devices and I'd like 
to check if I understood correctly.

1.) The NFTL is usable ONLY for DOC, not for normal NAND flashes.
      Thats why nftl_format prints unrecognized erase size 0x20000

2.) FTL is usable ONLY with NOR flashes, that's why the ftl_format
       ends with an error on trying to erase bad block on NAND in dmesg.

3.) So there should be used JFFS2 on NAND, there is no good and reliable
       way to run ext2 on NAND.

I've also encountered a problem.
        I'm using kernel 2.6.16.20 from buildroot on DBAu1550 like board.
        When running destroy test on Samsung NAND where I had ext2, 
        I was using programs from busybox placed on NOR flash (jffs2) /dev/mtdblock0. 
        Links like dd, cp, md5sum.

        NAND was mounted on /mnt/. After creating a 45MB file /mnt/file0 with dd
        from /dev/zero  and running md5sum, something got wrong and all the links
        from NOR jffs2 stopped working with lot's of errors in CRC codes. I wasnt writting
        to the NOR jffs2 but I have it mounted rw.  After rebooting the NOR jffs2 is ok again!

        So maybe it mess up in RAM???  What can couse this trouble?

Thanks a lot for Your answer

Jakub
