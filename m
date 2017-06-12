Received: from lizzard.sbs.de ([194.138.37.39])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwX-0003K6-QQ
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:37 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp8cr020012
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 11/20] nor-utils: rfddump: Return error code if command
 line option is unknown
Date: Mon, 12 Jun 2017 12:50:52 +0200
Message-Id: <20170612105101.18223-12-daniel.wagner@siemens.com>
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
 nor-utils/rfddump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index 048f58ca4ec9..5141ea37b926 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -55,7 +55,7 @@ struct rfd {
 	int verbose;
 };
 
-void display_help(void)
+void display_help(int status)
 {
 	printf("Usage: %s [OPTIONS] MTD-device filename\n"
 			"Dumps the contents of a resident flash disk\n"
@@ -65,7 +65,7 @@ void display_help(void)
 			"-v         --verbose		Be verbose\n"
 			"-b size    --blocksize          Block size (defaults to erase unit)\n",
 			PROGRAM_NAME);
-	exit(0);
+	exit(status);
 }
 
 void display_version(void)
@@ -101,7 +101,7 @@ void process_options(int argc, char *argv[], struct rfd *rfd)
 
 		switch (c) {
 			case 'h':
-				display_help();
+				display_help(EXIT_SUCCESS);
 				break;
 			case 'V':
 				display_version();
@@ -119,7 +119,7 @@ void process_options(int argc, char *argv[], struct rfd *rfd)
 	}
 
 	if ((argc - optind) != 2 || error)
-		display_help();
+		display_help(EXIT_FAILURE);
 
 	rfd->mtd_filename = argv[optind];
 	rfd->out_filename = argv[optind + 1];
-- 
2.9.4
