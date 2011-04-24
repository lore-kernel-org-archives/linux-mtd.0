Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDzGe-00026X-K1
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 13:22:29 +0000
Received: from eru.research.nokia.com ([172.21.24.121])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3ODMO06031759
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 16:22:25 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] UBIFS: remove strange commentary
Date: Sun, 24 Apr 2011 16:26:05 +0300
Message-Id: <1303651565-18302-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Remove the following commentary from 'ubifs_file_mmap()':

/* 'generic_file_mmap()' takes care of NOMMU case */

I do not understand what it means, and I could not find anything relater to
NOMMU in 'generic_file_mmap()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/file.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index adce3b7..5e7fccf 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1541,7 +1541,6 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	int err;
 
-	/* 'generic_file_mmap()' takes care of NOMMU case */
 	err = generic_file_mmap(file, vma);
 	if (err)
 		return err;
-- 
1.7.2.3
