Received: from gecko.sbs.de ([194.138.37.40])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwV-0000si-G3
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:33 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp9vI004215
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:09 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 15/20] ubi-utils: ubiformat: Return error code if command
 line option is unknown
Date: Mon, 12 Jun 2017 12:50:56 +0200
Message-Id: <20170612105101.18223-16-daniel.wagner@siemens.com>
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
 ubi-utils/ubiformat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 896fe20cc6a4..ef0378a63403 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -209,11 +209,15 @@ static int parse_opt(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'h':
-		case '?':
 			printf("%s\n\n", doc);
 			printf("%s\n\n", usage);
 			printf("%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			return -1;
 
 		case ':':
 			return errmsg("parameter is missing");
-- 
2.9.4
