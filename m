Received: from goliath.siemens.de ([192.35.17.28])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwZ-0000F9-8d
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:38 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v5CAp9GL022993
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:09 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 13/20] integrity: Return error code if command line option
 is unknown
Date: Mon, 12 Jun 2017 12:50:54 +0200
Message-Id: <20170612105101.18223-14-daniel.wagner@siemens.com>
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
 tests/fs-tests/integrity/integck.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 7cb530515d42..827adc5205bf 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -3080,10 +3080,13 @@ static int parse_opts(int argc, char * const argv[])
 			exit(EXIT_SUCCESS);
 
 		case 'h':
-		case '?':
 			fprintf(stderr, "%s\n\n", doc);
 			fprintf(stderr, "%s\n", optionsstr);
 			exit(EXIT_SUCCESS);
+		case '?':
+			fprintf(stderr, "%s\n\n", doc);
+			fprintf(stderr, "%s\n", optionsstr);
+			exit(-1);
 		case ':':
 			return errmsg("parameter is missing");
 
-- 
2.9.4
