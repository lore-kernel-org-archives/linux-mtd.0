Received: from gecko.sbs.de ([194.138.37.40])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwV-0000sm-Js
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:35 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp9x4004236
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:09 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 20/20] ubi-utils: mkfs.ubifs: Return error code if command
 line option is unknown
Date: Mon, 12 Jun 2017 12:51:01 +0200
Message-Id: <20170612105101.18223-21-daniel.wagner@siemens.com>
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

We need to return -1 instead of EXIT_FAILURE to be consistent with the
other exit code places.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index a60052d12c46..9e69a4fddf4d 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -548,15 +548,17 @@ static int get_options(int argc, char**argv)
 			yes = 1;
 			break;
 		case 'h':
+			printf("%s", helptext);
+			exit(EXIT_SUCCESS);
 		case '?':
 			printf("%s", helptext);
-			exit(0);
+			exit(-1);
 		case 'v':
 			verbose = 1;
 			break;
 		case 'V':
 			common_print_version();
-			exit(0);
+			exit(EXIT_SUCCESS);
 		case 'g':
 			debug_level = strtol(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg ||
-- 
2.9.4
