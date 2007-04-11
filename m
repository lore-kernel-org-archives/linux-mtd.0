Received: from mail119.messagelabs.com ([216.82.241.179])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HbfpL-0007Y2-8h
	for linux-mtd@lists.infradead.org; Wed, 11 Apr 2007 12:37:50 -0400
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l3BGbjOW016772
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Apr 2007 09:37:45 -0700 (MST)
Received: from il06vts01.mot.com (il06vts01.mot.com [129.188.137.141])
	by il06exr04.mot.com (8.13.1/Vontu) with SMTP id l3BGbiGW013514
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Apr 2007 11:37:44 -0500 (CDT)
Received: from zuk35exm60.ds.mot.com (zuk35exm60.ea.mot.com [10.178.1.39])
	by il06exr04.mot.com (8.13.1/8.13.0) with ESMTP id l3BGbhbi013495
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Apr 2007 11:37:44 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: Problem booting from MTD partition of  NAND device
Date: Wed, 11 Apr 2007 17:37:42 +0100
Message-ID: <67194FEE6056B947B4EF756C9E497A2E01774A0D@zuk35exm60.ds.mot.com>
From: "Demke Torsten-atd012" <torsten.demke@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a PPC system that consists of several MTD partitions on a mix of
NOR and NAND flashes.
MTD partition layout in my system:
dev:    size   erasesize  name
mtd0: 00020000 00020000 "enviroment-flash1"
mtd1: 00500000 00020000 "kernel-flash1"
mtd2: 01a60000 00020000 "empty-flash1"
mtd3: 00080000 00020000 "uboot-flash1"
mtd4: 02000000 00020000 "boot-flash1"
mtd5: 00020000 00020000 "enviroment-flash2"
mtd6: 00500000 00020000 "kernel-flash2"
mtd7: 01a60000 00020000 "empty-flash2"
mtd8: 00080000 00020000 "uboot-flash2"
mtd9: 02000000 00020000 "boot-flash2"
mtd10: 80000000 00020000 "NAND Flash"

Partition 4 is the merge of partitions 0..3
Partition 9 is the merge of partition 5..8
0..4 and 5..9 are independent NOR flash devices (Intel Strataflash)
Partition 10 is located on a NAND flash device and is formated with
jffs2.

Whenever I try to boot from the NAND flash (root=3D/dev/mtdblock10)  I =
get
following error:
  VFS: Mount ROOT_DEV 0 - mtdblock10		<< some additional debug
output
  Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

When I disable all NOR flashes in the kernel (2.6.14) I can boot
(root=3D/dev/mtdblock0)=20
my board without a problem.
Any hints or comments?

Thanks for your help.
Regards,
Torsten
