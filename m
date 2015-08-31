Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfN-00042a-FT
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:05 +0000
Received: by pacdd16 with SMTP id dd16so152797022pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 03/11] flash_{un,}lock: support --version flag
Date: Mon, 31 Aug 2015 15:34:24 -0700
Message-Id: <1441060472-82169-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
References: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just use the common helper macro.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 flash_unlock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/flash_unlock.c b/flash_unlock.c
index 777e4375a44d..9a24b5f796e0 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -39,6 +39,7 @@ static void usage(int status)
 static const char short_opts[] = "h";
 static const struct option long_opts[] = {
 	{ "help",	no_argument,	0, 'h' },
+	{ "version",	no_argument,	0, 'v' },
 	{ NULL,		0,		0, 0 },
 };
 
@@ -61,6 +62,9 @@ int main(int argc, char *argv[])
 		case 'h':
 			usage(0);
 			break;
+		case 'v':
+			common_print_version();
+			exit(0);
 		default:
 			usage(1);
 			break;
-- 
2.5.0.457.gab17608
