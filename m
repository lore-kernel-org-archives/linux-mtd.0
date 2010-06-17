Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OQxjT-0005st-OL
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 07:17:24 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5M7GXOW030878
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2010 10:17:15 +0300
Received: from fs-test.localnet (esdhcp035224.research.nokia.com
	[172.21.35.224])
	by mgw-sa01.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5M7GnxZ003213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2010 10:16:50 +0300
Resent-Message-ID: <201006221017.40861.ext-andriy.shevchenko@nokia.com>
From: "Shevchenko Andriy (EXT-Teleca/Helsinki)"
	<ext-andriy.shevchenko@nokia.com>
To: "Bityutskiy Artem (Nokia-D/Helsinki)" <Artem.Bityutskiy@nokia.com>
Date: Thu, 17 Jun 2010 10:42:38 +0200
Subject: [PATCH 2/3] flash_eraseall: move constants out of for loop
Message-ID: <1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
References: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
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
 flash_eraseall.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..f6319d1 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -194,21 +194,21 @@ void process_options (int argc, char *argv[])
 {
 	int error =3D 0;
=20
+	static const char *short_options =3D "jq";
+	static const struct option long_options[] =3D {
+		{"help", no_argument, 0, 0},
+		{"version", no_argument, 0, 0},
+		{"jffs2", no_argument, 0, 'j'},
+		{"quiet", no_argument, 0, 'q'},
+		{"silent", no_argument, 0, 'q'},
+
+		{0, 0, 0, 0},
+	};
+
 	exe_name =3D argv[0];
=20
 	for (;;) {
 		int option_index =3D 0;
-		static const char *short_options =3D "jq";
-		static const struct option long_options[] =3D {
-			{"help", no_argument, 0, 0},
-			{"version", no_argument, 0, 0},
-			{"jffs2", no_argument, 0, 'j'},
-			{"quiet", no_argument, 0, 'q'},
-			{"silent", no_argument, 0, 'q'},
-
-			{0, 0, 0, 0},
-		};
-
 		int c =3D getopt_long(argc, argv, short_options,
 				long_options, &option_index);
 		if (c =3D=3D EOF) {
--=20
1.6.3.3
