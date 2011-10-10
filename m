Received: from mga14.intel.com ([143.182.124.37])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RDBQC-0002Ni-OD
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 08:41:17 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH resend] mkfs_jffs2: fix typo for word unknown
Date: Mon, 10 Oct 2011 11:40:42 +0300
Message-Id: <a2202ab2af2fb20aead5d5956bd46dc030082eef.1318235873.git.andriy.shevchenko@linux.intel.com>
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexey Dokuchaev <danfe@nsu.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 compr.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/compr.c b/compr.c
index 2d3a56b..cb4432e 100644
--- a/compr.c
+++ b/compr.c
@@ -320,7 +320,7 @@ uint16_t jffs2_compress( unsigned char *data_in, unsigned char **cpage_out,
 			}
 			break;
 		default:
-			fprintf(stderr,"mkfs.jffs2: unknow compression mode.\n");
+			fprintf(stderr,"mkfs.jffs2: unknown compression mode.\n");
 	}
 out:
 	if (ret == JFFS2_COMPR_NONE) {
@@ -416,7 +416,7 @@ char *jffs2_stats(void)
 			act_buf += sprintf(act_buf, "favourlzo");
 			break;
 		default:
-			act_buf += sprintf(act_buf,"unkown");
+			act_buf += sprintf(act_buf, "unknown");
 			break;
 	}
 	act_buf += sprintf(act_buf,"\nCompressors:\n");
-- 
1.7.6.3
