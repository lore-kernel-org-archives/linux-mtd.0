Received: from thoth.sbs.de ([192.35.17.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwZ-0003Jz-P1
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:44 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp7wT004070
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 01/20] jffs2dump: Return error code if command line option
 is unknown
Date: Mon, 12 Jun 2017 12:50:42 +0200
Message-Id: <20170612105101.18223-2-daniel.wagner@siemens.com>
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
 jffsX-utils/jffs2dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index a8d082bf1e39..df5b1e120b69 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -50,7 +50,7 @@
 long	imglen;		// length of image
 char	*data;		// image data
 
-void display_help (void)
+void display_help (int error)
 {
 	printf("Usage: %s [OPTION]... INPUTFILE\n"
 	       "Dump the contents of a binary JFFS2 image.\n\n"
@@ -65,7 +65,7 @@ void display_help (void)
 	       " -o, --oobsize=LEN            size of oob data chunk in binary image (NAND only)\n"
 	       " -v, --verbose                verbose output\n",
 	       PROGRAM_NAME);
-	exit(0);
+	exit(error ? EXIT_FAILURE : EXIT_SUCCESS);
 }
 
 void display_version (void)
@@ -124,7 +124,7 @@ void process_options (int argc, char *argv[])
 
 		switch (c) {
 			case 'h':
-				display_help();
+				display_help(EXIT_SUCCESS);
 				break;
 			case 'V':
 				display_version();
@@ -161,7 +161,7 @@ void process_options (int argc, char *argv[])
 	}
 
 	if ((argc - optind) != 1 || error)
-		display_help ();
+		display_help (error);
 
 	img = argv[optind];
 }
-- 
2.9.4
