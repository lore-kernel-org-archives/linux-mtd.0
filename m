Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OQxjS-0005sa-GR
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 07:17:22 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5M7GBdn030819
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2010 10:17:12 +0300
Received: from fs-test.localnet (esdhcp035224.research.nokia.com
	[172.21.35.224])
	by mgw-sa02.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5M7GiQL012067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2010 10:16:44 +0300
Resent-Message-ID: <201006221017.35571.ext-andriy.shevchenko@nokia.com>
From: "Shevchenko Andriy (EXT-Teleca/Helsinki)"
	<ext-andriy.shevchenko@nokia.com>
To: "Bityutskiy Artem (Nokia-D/Helsinki)" <Artem.Bityutskiy@nokia.com>
Date: Thu, 17 Jun 2010 10:42:37 +0200
Subject: [PATCH 1/3] mkfs.ubifs: check output first
Message-ID: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
Content-Language: en-US
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Shevchenko Andriy \(EXT-Teleca/Helsinki\)"
	<ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 mkfs.ubifs/mkfs.ubifs.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index e4b4e3c..9061453 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -647,8 +647,11 @@ static int get_options(int argc, char**argv)
=20
 	if (optind !=3D argc && !output)
 		output =3D strdup(argv[optind]);
-	if (output)
-		out_ubi =3D !open_ubi(output);
+
+	if (!output)
+		return err_msg("not output device or file specified");
+
+	out_ubi =3D !open_ubi(output);
=20
 	if (out_ubi) {
 		c->min_io_size =3D c->di.min_io_size;
@@ -656,9 +659,6 @@ static int get_options(int argc, char**argv)
 		c->max_leb_cnt =3D c->vi.rsvd_lebs;
 	}
=20
-	if (!output)
-		return err_msg("not output device or file specified");
-
 	if (c->min_io_size =3D=3D -1)
 		return err_msg("min. I/O unit was not specified "
 			       "(use -h for help)");
--=20
1.6.3.3
