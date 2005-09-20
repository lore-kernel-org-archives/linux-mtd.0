Received: from wip-ectls-mx1.wipro.com ([203.91.193.21])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHazH-0003n7-TP
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 01:48:33 -0400
Received: from wip-ectls-mx1.wipro.com (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id 419C522031E
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 11:17:40 +0530 (IST)
Received: from blr-ec-bh01.wipro.com (blr-ec-bh01.wipro.com [10.201.50.91])
	by wip-ectls-mx1.wipro.com (Postfix) with ESMTP id 3388E22031C
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2005 11:17:40 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Sep 2005 11:17:39 +0530
Message-ID: <30A4A576EB47C64AB2694E1F17DBE117026DA4CE@blr-itp-msg.wipro.com>
From: <srinath.satyanarayana@wipro.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 on Samsung NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi ,

I am using linux-2.6.12 and Redboot on my board.  I have Samsung 32Mb,
16Kb erase block flash on my board
I am not able to mount the  jffs2 partition of NAND.=0D
The procedure followed=0D

mkfs.jffs2 -d jffs2  -n -o fs.jffs2 -e 0x4000 --pad=3D0x400000
flasheraseall -j /dev/mtd/7
nandwrite  /dev/mtd/7 fs.jffs2=0D
mount -t jffs2 /dev/mtdblock/7 /mnt


Node at 0x00003eec with length 0x00000615 would run over the end of the
erase block Perhaps the file system was  reated with the wrong erase
size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003ef0:
0x0615 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003ef4:
0xef68 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003ef8:
0x001e in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003efc:
0x0004 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f00:
0x81ed in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f04:
0x01f5 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f08:
0x4de2 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f18:
0x3000 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f1c:
0x05d1 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003f20:
0x1000 in
stead
Further such events for this erase block will not be printed

Is steps followed  are corrent? Any suggestion is appreciated.

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
