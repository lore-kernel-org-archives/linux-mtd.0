Received: from goliath.siemens.de ([192.35.17.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwY-0003Jw-Q7
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:39 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v5CAp8lA022930
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 06/20] mtd-utils: lash_unlock: Use defines for exit code
 values
Date: Mon, 12 Jun 2017 12:50:47 +0200
Message-Id: <20170612105101.18223-7-daniel.wagner@siemens.com>
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
 misc-utils/flash_unlock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/misc-utils/flash_unlock.c b/misc-utils/flash_unlock.c
index 94f476114355..5a3aac532053 100644
--- a/misc-utils/flash_unlock.c
+++ b/misc-utils/flash_unlock.c
@@ -87,7 +87,7 @@ static void process_args(int argc, char *argv[])
 
 		switch (c) {
 		case 'h':
-			usage(0);
+			usage(EXIT_SUCCESS);
 			break;
 		case 'i':
 			req = REQUEST_ISLOCKED;
@@ -105,14 +105,14 @@ static void process_args(int argc, char *argv[])
 			common_print_version();
 			exit(0);
 		default:
-			usage(1);
+			usage(EXIT_FAILURE);
 			break;
 		}
 	}
 
 	if (req_set > 1) {
 		errmsg("cannot specify more than one lock/unlock/islocked option");
-		usage(1);
+		usage(EXIT_FAILURE);
 	}
 
 	arg_idx = optind;
@@ -120,10 +120,10 @@ static void process_args(int argc, char *argv[])
 	/* Sanity checks */
 	if (argc - arg_idx < 1) {
 		errmsg("too few arguments");
-		usage(1);
+		usage(EXIT_FAILURE);
 	} else if (argc - arg_idx > 3) {
 		errmsg("too many arguments");
-		usage(1);
+		usage(EXIT_FAILURE);
 	}
 
 	/* First non-option argument */
-- 
2.9.4
