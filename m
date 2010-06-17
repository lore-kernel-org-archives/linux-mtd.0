Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OQxjq-000626-Ft
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 07:17:43 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5M7HVjm031513
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2010 02:17:41 -0500
Received: from fs-test.localnet (esdhcp035224.research.nokia.com
	[172.21.35.224])
	by mgw-sa02.ext.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5M7Gq93012207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2010 10:16:53 +0300
Resent-Message-ID: <201006221017.43942.ext-andriy.shevchenko@nokia.com>
From: "Shevchenko Andriy (EXT-Teleca/Helsinki)"
	<ext-andriy.shevchenko@nokia.com>
To: "Bityutskiy Artem (Nokia-D/Helsinki)" <Artem.Bityutskiy@nokia.com>
Date: Thu, 17 Jun 2010 10:42:39 +0200
Subject: [PATCH 3/3] flash_eraseall: make -? option the same as --help
Message-ID: <1276764159-28726-3-git-send-email-ext-andriy.shevchenko@nokia.com>
References: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
	<1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
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
 flash_eraseall.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index f6319d1..ebd329b 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -192,8 +192,6 @@ int main (int argc, char *argv[])
=20
 void process_options (int argc, char *argv[])
 {
-	int error =3D 0;
-
 	static const char *short_options =3D "jq";
 	static const struct option long_options[] =3D {
 		{"help", no_argument, 0, 0},
@@ -233,15 +231,13 @@ void process_options (int argc, char *argv[])
 				jffs2 =3D 1;
 				break;
 			case '?':
-				error =3D 1;
+				display_help();
 				break;
 		}
 	}
+
 	if (optind =3D=3D argc) {
 		fprintf(stderr, "%s: no MTD device specified\n", exe_name);
-		error =3D 1;
-	}
-	if (error) {
 		fprintf(stderr, "Try `%s --help' for more information.\n",
 				exe_name);
 		exit(1);
--=20
1.6.3.3
