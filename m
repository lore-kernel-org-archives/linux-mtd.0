Received: from mail-ew0-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LdsNl-0000La-I6
	for linux-mtd@lists.infradead.org; Sun, 01 Mar 2009 20:35:44 +0000
Received: by ewy20 with SMTP id 20so2117938ewy.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Mar 2009 12:35:27 -0800 (PST)
Message-ID: <49AAF190.6050404@gmail.com>
Date: Sun, 01 Mar 2009 21:35:28 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH] jffs2_acl_count() tests < 0 on unsigned
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch wasn't tested in any way.
------------------------------>8-------------8<---------------------------------
size_t s is unsigned and cannot be less than 0.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index d987137..6e63e8b 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -38,12 +38,12 @@ static int jffs2_acl_count(size_t size)
 	size_t s;
 
 	size -= sizeof(struct jffs2_acl_header);
-	s = size - 4 * sizeof(struct jffs2_acl_entry_short);
-	if (s < 0) {
+	if (size < 4 * sizeof(struct jffs2_acl_entry_short)) {
 		if (size % sizeof(struct jffs2_acl_entry_short))
 			return -1;
 		return size / sizeof(struct jffs2_acl_entry_short);
 	} else {
+		s = size - 4 * sizeof(struct jffs2_acl_entry_short);
 		if (s % sizeof(struct jffs2_acl_entry))
 			return -1;
 		return s / sizeof(struct jffs2_acl_entry) + 4;
