Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EgvHR-0004sY-HL
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 21:31:49 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1EgvGc-0001y0-9h
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 03:30:50 +0100
Received: from desk.marajade.sandelman.ca ([205.150.200.247])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 03:30:50 +0100
Received: from mcr by desk.marajade.sandelman.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 03:30:50 +0100
To: linux-mtd@lists.infradead.org
From: Michael Richardson <mcr@sandelman.ottawa.on.ca>
Date: Mon, 28 Nov 2005 21:27:26 -0500
Message-ID: <v0ek50fasx.fsf@marajade.sandelman.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Sender: news <news@sea.gmane.org>
Subject: [PATCH 2/2] --cvs-exclude for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=


Signed-off-by: Michael Richardson <mcr@sandelman.ca>

---

 util/mkfs.jffs2.1 |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

applies-to: e5a6153acb76c3bf3984261748386669e80942f2
08193343c2d58ac0da9d62d2ec6173e83feee6ff
diff --git a/util/mkfs.jffs2.1 b/util/mkfs.jffs2.1
index 7e32c92..2340b10 100644
--- a/util/mkfs.jffs2.1
+++ b/util/mkfs.jffs2.1
@@ -34,6 +34,9 @@ mkfs.jffs2 \- Create a JFFS2 file system
 .B -b,--big-endian
 ]
 [
+.B --cvs-exclude
+]
+[
 .B -D,--devtable=FILE
 ]
 [
@@ -142,6 +145,11 @@ Write \'CLEANMARKER\' nodes with the siz
 normally appropriate to specify a size other than the default 12
 bytes.
 .TP
+.B --cvs-exclude
+When making lists of files ignore CVS control directories. In addition,
+ignore files called ".KEEP_ME" which may have been created solely to prevent
+CVS from pruning directories. 
+.TP
 .B -n, --no-cleanmarkers
 Do not write \'CLEANMARKER\' nodes to the beginning of each erase
 block. This option can be useful for creating JFFS2 images for
---
0.99.9.GIT


-- 
]       ON HUMILITY: to err is human. To moo, bovine.           |  firewalls  [
]   Michael Richardson,    Xelerance Corporation, Ottawa, ON    |net architect[
] mcr@xelerance.com      http://www.sandelman.ottawa.on.ca/mcr/ |device driver[
] panic("Just another Debian GNU/Linux using, kernel hacking, security guy"); [

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ4u8kICLcPvd0N1lAQLx/Qf/adDZxy/XlrpRX/lduiROuqSAdh869Q25
g2ZIL6eeBJxdJHzaeDB5ZF3NTgAp3/UcY/xXD78EFDWIRUf4786HxqUSOY5QO6JK
f34xbzTakMI8CXJR4XnnS717IX4XNe/LKviK3ZpPfl3xBm8WWQUtTPjmFFE186lM
+/YWFbPerAKaidpV0FjV1eKxcJKgVtBxm/vKxu0GNv1kgPUhnzPt6L5oQTztR2gN
uNP7/oAd3ADG0rpoMNYYqfbGUpGoeYGTnWTbfQ9YqpCBapguis04ZBN9sRWc33rQ
XGz39u2p46J2UagKva5jOfTDxn36T4ZpLrxRDRaYu2mRjWJEIldQ0g==
=A+Y7
-----END PGP SIGNATURE-----
--=-=-=--
