Received: from lizzard.sbs.de ([194.138.37.39])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwV-0000sk-Jw
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:36 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp9KR020045
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:09 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 17/20] ubi-utils: ubirmvol: Return error code if command
 line option is unknown
Date: Mon, 12 Jun 2017 12:50:58 +0200
Message-Id: <20170612105101.18223-18-daniel.wagner@siemens.com>
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
 ubi-utils/ubirmvol.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/ubi-utils/ubirmvol.c b/ubi-utils/ubirmvol.c
index 3370aff3d336..049e70de3774 100644
--- a/ubi-utils/ubirmvol.c
+++ b/ubi-utils/ubirmvol.c
@@ -109,12 +109,17 @@ static int parse_opt(int argc, char * const argv[])
 			break;
 
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
+
 		case 'V':
 			common_print_version();
 			exit(EXIT_SUCCESS);
-- 
2.9.4
