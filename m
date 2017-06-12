Received: from thoth.sbs.de ([192.35.17.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwX-0003Jx-Pv
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:37 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp8ka004088
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 05/20] jffsX-utils: Return error code if command line
 option is unknown
Date: Mon, 12 Jun 2017 12:50:46 +0200
Message-Id: <20170612105101.18223-6-daniel.wagner@siemens.com>
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
 jffsX-utils/sumtool.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/jffsX-utils/sumtool.c b/jffsX-utils/sumtool.c
index 09586155f74c..a995bdf21d8e 100644
--- a/jffsX-utils/sumtool.c
+++ b/jffsX-utils/sumtool.c
@@ -156,9 +156,11 @@ void process_options (int argc, char **argv)
 				target_endian = __LITTLE_ENDIAN;
 				break;
 			case 'h':
-			case '?':
 				puts(helptext);
 				exit(EXIT_SUCCESS);
+			case '?':
+				puts(helptext);
+				exit(EXIT_FAILURE);
 			case 'v':
 				verbose = 1;
 				break;
-- 
2.9.4
