Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3zh5-0004jy-Gd
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 07:52:29 +0000
Received: by mail-wm0-x241.google.com with SMTP id t67so3281869wmt.0
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2018 00:52:16 -0700 (PDT)
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
To: linux-mtd@lists.infradead.org
Cc: Koen Vandeputte <koen.vandeputte@ncentric.com>
Subject: [PATCH] mtd-utils: ubifs: fix typo in without_lzo definition
Date: Thu,  5 Apr 2018 09:51:43 +0200
Message-Id: <1522914703-12842-1-git-send-email-koen.vandeputte@ncentric.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes: 1d04b4d5361a ("fix build when WITHOUT_LZO is set")

Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 2e18fdc54366..6323dd45c4ad 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -612,7 +612,7 @@ static int get_options(int argc, char**argv)
 				return err_msg("bad compressor name");
 			break;
 		case 'X':
-#ifdef WITHOT_LZO
+#ifdef WITHOUT_LZO
 			return err_msg("built without LZO support");
 #else
 			c->favor_percent = strtol(optarg, &endp, 0);
-- 
2.7.4
