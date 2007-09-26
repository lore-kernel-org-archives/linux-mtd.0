Received: from smtp43.singnet.com.sg ([165.21.103.151])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Iad6X-0007mh-Cc
	for linux-mtd@lists.infradead.org; Wed, 26 Sep 2007 16:03:33 -0400
Received: from cksim (bb116-15-8-76.singnet.com.sg [116.15.8.76])
	by smtp43.singnet.com.sg (8.14.1/8.14.1) with ESMTP id l8QJv3Zx023719
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 03:57:03 +0800
From: "CK Sim" <cksim@singnet.com.sg>
To: <linux-mtd@lists.infradead.org>
Subject: Problem with ST Micro NAND Flash (256MB x 8) on AT91SAM9261
Date: Thu, 27 Sep 2007 03:56:24 +0800
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA33LEMKcTz06k3l6K9b/SmcKAAAAQAAAA/5444bty+0yCDopkfvzkYQEAAAAA@singnet.com.sg>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: cksim@singnet.com.sg
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have encountered a problem with writing a jffs2 root filesystem image into
the NAND part (2Gbits) from ST Micro.

The NAND flash uses large page size (2048).


I have done the following tests:
1) "flash_eraseall  /dev/mtd1" --- erase NAND Flash (with and without -j
option) => erase is OK
2) "nandwrite" jffs2 image ---- writing did not produce any errors
3) Mounting with "mount -t jffs2 /dev/mtdblock1 /mnt" give long list of ECC
& MAGIC BITMASK error messages
4) "mtd_debug info" indicates that "mtd.ecctype=unknown"
5) Did a "nanddump"  with "-p" option to a text file. Analyse the generated
file and noted that the first 3 bytes were "85 85 19" instead of starting as
"85 19"
6) Confirmed on the jffs2 image file that the starting bytes are "85 19"

Is there a known issue in supporting this ST Micro's NAND Flash in the
mtd-utils ?

Has anyone encountered similar problems and got it resolved ?

Any help would be appreciated.

Thanks in advance.
