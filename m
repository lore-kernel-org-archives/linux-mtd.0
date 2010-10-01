Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YLI-0004yy-MM
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:39:37 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 498DD1B41D5
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:39:35 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] libmtd: fix "fount" typo
Date: Fri,  1 Oct 2010 01:40:33 -0400
Message-Id: <1285911633-9386-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 lib/libmtd_legacy.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 27fb3f8..3d129c1 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -125,18 +125,18 @@ static int proc_parse_next(struct proc_parse_info *pi)
 
 	p = memchr(pi->next, '\"', pi->data_size - pos);
 	if (!p)
-		return errmsg("opening \" not fount");
+		return errmsg("opening \" not found");
 	p += 1;
 	pos = p - pi->buf;
 	if (pos >= pi->data_size)
-		return errmsg("opening \" not fount");
+		return errmsg("opening \" not found");
 
 	p1 = memchr(p, '\"', pi->data_size - pos);
 	if (!p1)
-		return errmsg("closing \" not fount");
+		return errmsg("closing \" not found");
 	pos = p1 - pi->buf;
 	if (pos >= pi->data_size)
-		return errmsg("closing \" not fount");
+		return errmsg("closing \" not found");
 
 	len = p1 - p;
 	if (len > MTD_NAME_MAX)
@@ -146,7 +146,7 @@ static int proc_parse_next(struct proc_parse_info *pi)
 	pi->name[len] = '\0';
 
 	if (p1[1] != '\n')
-		return errmsg("opening \"\n\" not fount");
+		return errmsg("opening \"\n\" not found");
 	pi->next = p1 + 2;
 	return 1;
 }
-- 
1.7.3.1
