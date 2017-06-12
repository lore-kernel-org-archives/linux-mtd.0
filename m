Received: from david.siemens.de ([192.35.17.14])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwX-0003K5-O2
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:35 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v5CAp8DD023584
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 10/20] mtd-utils: nftl_format: Use defines for exit code
 values
Date: Mon, 12 Jun 2017 12:50:51 +0200
Message-Id: <20170612105101.18223-11-daniel.wagner@siemens.com>
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
 nand-utils/nftl_format.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/nand-utils/nftl_format.c b/nand-utils/nftl_format.c
index a329c59fc504..ea8199d5509d 100644
--- a/nand-utils/nftl_format.c
+++ b/nand-utils/nftl_format.c
@@ -234,7 +234,7 @@ int main(int argc, char **argv)
 	int idx = 0;
 
 	if (argc < 2)
-		usage(1);
+		usage(EXIT_FAILURE);
 
 	nftl = "NFTL";
 
@@ -249,13 +249,13 @@ int main(int argc, char **argv)
 				break;
 			case 'h':
 			case '?':
-				usage(0);
+				usage(EXIT_SUCCESS);
 				break;
 			case 'V':
 				display_version();
 				break;
 			default:
-				usage(1);
+				usage(EXIT_FAILURE);
 				break;
 		}
 	}
-- 
2.9.4
