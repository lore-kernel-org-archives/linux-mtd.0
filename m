Received: from gecko.sbs.de ([194.138.37.40])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwZ-0003K4-Ov
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:42 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp87e004192
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 09/20] mtd-utils: nandtest: Use defines for exit code values
Date: Mon, 12 Jun 2017 12:50:50 +0200
Message-Id: <20170612105101.18223-10-daniel.wagner@siemens.com>
In-Reply-To: <20170612105101.18223-1-daniel.wagner@siemens.com>
References: <20170612105101.18223-1-daniel.wagner@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The tool will quit with an exit code 0 if the command line option was
not recognized. By returning an error code a calling script has the
possibility to distinguish between a real success and an invalid
invocation.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 nand-utils/nandtest.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/nand-utils/nandtest.c b/nand-utils/nandtest.c
index 56767337846b..9e39446de257 100644
--- a/nand-utils/nandtest.c
+++ b/nand-utils/nandtest.c
@@ -181,14 +181,14 @@ int main(int argc, char **argv)
 
 		switch (c) {
 		case 'h':
-			usage(0);
+			usage(EXIT_SUCCESS);
 			break;
 		case 'V':
 			common_print_version();
 			exit(EXIT_SUCCESS);
 			break;
 		case '?':
-			usage(1);
+			usage(EXIT_FAILURE);
 			break;
 
 		case 'm':
@@ -222,7 +222,7 @@ int main(int argc, char **argv)
 		}
 	}
 	if (argc - optind != 1)
-		usage(1);
+		usage(EXIT_FAILURE);
 	if (error)
 		errmsg_die("Try --help for more information");
 
-- 
2.9.4
