Received: from h-67-102-66-132.snfccasy.covad.net ([67.102.66.132]
	helo=hheld.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G81Kw-0005f9-Of
	for linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 16:59:40 -0400
Received: from [206.15.76.194] (HELO RudiDell)
	by hheld.com (CommuniGate Pro SMTP 4.3.7)
	with ESMTPS id 868029 for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2006 13:59:33 -0700
From: "David Byron" <dbyron@hheld.com>
To: <linux-mtd@lists.infradead.org>
Subject: nandwrite in FAQ
Date: Tue, 1 Aug 2006 13:59:57 -0700
Message-ID: <001001c6b5ad$727d9400$c834800a@RudiDell>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0011_01C6B572.C61EBC00"
Reply-To: dbyron@hheld.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0011_01C6B572.C61EBC00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Related to
http://lists.infradead.org/pipermail/linux-mtd/2006-July/016184.html, what
do you think of removing the -j argument to nandwrite in the NAND FAQ?
Definitely would have saved me a bunch of time.

-DB

------=_NextPart_000_0011_01C6B572.C61EBC00
Content-Type: application/octet-stream;
	name="nand.xml.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="nand.xml.patch"

diff --git a/faq/nand.xml b/faq/nand.xml=0A=
index f208d44..1a39c46 100644=0A=
--- a/faq/nand.xml=0A=
+++ b/faq/nand.xml=0A=
@@ -43,7 +43,7 @@ is also neccecary before you copy a fs-i=0A=
 <p>Yes, as long as your chip does not contain bad blocks. Make sure, =
that the erasesize you set to mkfs.jffs2 =0A=
 is the same as the erasesize of your chip. Data will only be written =
with ECC, if your default settings for=0A=
 oob-layout selection are set for JFFS2. For bad block aware copying, =
use nandwrite from mtd-utils.<br />=0A=
-nandwrite -j /dev/mtdX image=0A=
+nandwrite /dev/mtdX image=0A=
 </p>=0A=
 =0A=
 <h3>Can I use seek/read/write on /dev/mtdX ?</h3>=0A=

------=_NextPart_000_0011_01C6B572.C61EBC00--
