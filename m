Received: from sw74-75-210.adsl.seed.net.tw ([211.74.75.210]
	helo=myhome.jhandyh.adsldns.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197J9S-0007Lh-St
	for <linux-mtd@lists.infradead.org>; Sun, 20 Apr 2003 19:02:55 +0100
Received: from yh (yh.jhandyh.adsldns.org [192.168.1.2])
	h3KI1wai009619
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 02:01:58 +0800
From: "jeffery" <jeffery@jhandyh.adsldns.org>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 02:02:51 +0800
Message-ID: <002901c30767$129a8bd0$0201a8c0@jhandyh.adsldns.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: 
 Which version of mkfs.jffs2 could work with kernel-2.4.18+patch-2.4.18-rmk6
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all=20
=A0=A0=A0 I=92m using the S3c2410x developer board and applied the =
Kernel-2.4.18
with patch-2.4.18-rmk6 for ARM,
I want to use JFFS2 and used the mkfs.jffs2 that revision is v1.7
=A0=A0=A0 It seems that my mkfs.jffs2=92s version is too old so I got =
many error
message when I mount the mtdblock , the error message is
# mount -t jffs2 /dev/mtdblock1 /mnt
Old JFFS2 bitmask found at 0x00000000
=A0
You cannot use older JFFS2 filesystems with newer kernels
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x0040 instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0x0001 instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0x0001 instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0x41ed instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0xd06c instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0xb499 instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0xb499 instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000003c:
0x3b87 instead
=A0
Old JFFS2 bitmask found at 0x00000040
=A0
You cannot use older JFFS2 filesystems with newer kernels
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000044:
0x002a instead
=A0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000048:
0x0001 instead
=A0
Further such events for this erase block will not be printed
=A0
Old JFFS2 bitmask found at 0x0000006c
=A0
You cannot use older JFFS2 filesystems with newer kernels
=A0
So Could someone kindly telling me which mkfs.jffs2 version is suitable =
for
making the jffs2 image ?
=A0
Regards
=A0
Jeffery
