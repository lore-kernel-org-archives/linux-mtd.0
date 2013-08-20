Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBf1S-0002FH-5n
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 06:02:32 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH for mtd-utils 1/4] add the MTD_MLCNANDFLASH case
Date: Tue, 20 Aug 2013 13:58:34 +0800
Message-ID: <1376978317-28010-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1376978317-28010-1-git-send-email-b32955@freescale.com>
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MTD_MLCNANDFLASH case is missed in the current code.
This patch adds it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 lib/libmtd.c        |    2 ++
 lib/libmtd_legacy.c |    3 +++
 mtd_debug.c         |    3 +++
 3 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 654490e..3e8109a 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -403,6 +403,8 @@ static int type_str2int(const char *str)
 {
 	if (!strcmp(str, "nand"))
 		return MTD_NANDFLASH;
+	if (!strcmp(str, "mlc-nand"))
+		return MTD_MLCNANDFLASH;
 	if (!strcmp(str, "nor"))
 		return MTD_NORFLASH;
 	if (!strcmp(str, "rom"))
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 1ae9946..233a92e 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -322,6 +322,9 @@ int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
 	case MTD_NANDFLASH:
 		strcpy((char *)mtd->type_str, "nand");
 		break;
+	case MTD_MLCNANDFLASH:
+		strcpy((char *)mtd->type_str, "mlc-nand");
+		break;
 	case MTD_DATAFLASH:
 		strcpy((char *)mtd->type_str, "dataflash");
 		break;
diff --git a/mtd_debug.c b/mtd_debug.c
index 9110e9b..d6993ce 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -260,6 +260,9 @@ int showinfo(int fd)
 		case MTD_NANDFLASH:
 			printf("MTD_NANDFLASH");
 			break;
+		case MTD_MLCNANDFLASH:
+			printf("MTD_MLCNANDFLASH");
+			break;
 		case MTD_DATAFLASH:
 			printf("MTD_DATAFLASH");
 			break;
-- 
1.7.1
