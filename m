Received: from wip-ectls-mx1.wipro.com ([203.91.193.21])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHb1f-0003wZ-5e
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 01:51:37 -0400
Received: from wip-ectls-mx1.wipro.com (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id 872682202CA
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 11:20:04 +0530 (IST)
Received: from blr-ec-bh02.wipro.com (blr-ec-bh02.wipro.com [10.201.50.92])
	by wip-ectls-mx1.wipro.com (Postfix) with ESMTP id 7C224220319
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 11:20:04 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Sep 2005 11:19:33 +0530
Message-ID: <30A4A576EB47C64AB2694E1F17DBE117026DA4D0@blr-itp-msg.wipro.com>
From: <srinath.satyanarayana@wipro.com>
To: <linux-mtd@lists.infradead.org>
Subject: mounting NAND+JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I am using linux-2.6.12 and Redboot on my board.  I have Samsung 32Mb,
16Kb erase block flash on my board
I am not able to mount the empty  jffs2 partition of NAND.=0D
The procedure followed=0D

flasheraseall -j /dev/mtd/7
mount -t jffs2 /dev/mtdblock/7 /mnt


ffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block at
000000
00
OOB at 00000000 was ff ff ff ff ff ff ff ff ff ff 03 ff ff ff ff ff
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 1
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
at 000040
00

Any ideas about what might be wrong.

Thanks
Srinath



Confidentiality Notice=0D

The information contained in this electronic message and any attachments to=
 this message are intended
for the exclusive use of the addressee(s) and may contain confidential or=
 privileged information. If
you are not the intended recipient, please notify the sender at Wipro or=
 Mailadmin@wipro.com immediately
and destroy all copies of this message and any attachments.
