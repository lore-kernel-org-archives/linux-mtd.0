Received: from thoth.sbs.de ([192.35.17.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwY-0003K7-RH
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:40 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp8OA004128
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:09 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 12/20] nor-utils: rfdformat: Return error code if command
 line option is unknown
Date: Mon, 12 Jun 2017 12:50:53 +0200
Message-Id: <20170612105101.18223-13-daniel.wagner@siemens.com>
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
 nor-utils/rfdformat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
index d393975e2354..1f01a8531012 100644
--- a/nor-utils/rfdformat.c
+++ b/nor-utils/rfdformat.c
@@ -30,7 +30,7 @@
 
 #include "common.h"
 
-void display_help(void)
+void display_help(int status)
 {
 	printf("Usage: %s [OPTIONS] MTD-device\n"
 			"Formats NOR flash for resident flash disk\n"
@@ -38,7 +38,7 @@ void display_help(void)
 			"-h         --help               display this help and exit\n"
 			"-V         --version            output version information and exit\n",
 			PROGRAM_NAME);
-	exit(0);
+	exit(status);
 }
 
 void display_version(void)
@@ -69,7 +69,7 @@ void process_options(int argc, char *argv[], const char **mtd_filename)
 
 		switch (c) {
 			case 'h':
-				display_help();
+				display_help(EXIT_SUCCESS);
 				break;
 			case 'V':
 				display_version();
@@ -81,7 +81,7 @@ void process_options(int argc, char *argv[], const char **mtd_filename)
 	}
 
 	if ((argc - optind) != 1 || error)
-		display_help();
+		display_help(EXIT_FAILURE);
 
 	*mtd_filename = argv[optind];
 }
-- 
2.9.4
