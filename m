Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002SP-Hm
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:08 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE6028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:02 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/30] UBIFS: minor cleanup: use S_ISREG helper
Date: Thu,  9 Jun 2011 12:04:46 +0300
Message-Id: <1307610310-28691-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of using long "(inode->i_mode & S_IFMT) != S_IFREG" expression, use
shorted "!S_ISREG(inode->i_mode)".

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 55161c6..70e8c92 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -85,7 +85,7 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 	if (ui->data_len < 0 || ui->data_len > UBIFS_MAX_INO_DATA)
 		return 4;
 
-	if (ui->xattr && (inode->i_mode & S_IFMT) != S_IFREG)
+	if (ui->xattr && !S_ISREG(inode->i_mode))
 		return 5;
 
 	if (!ubifs_compr_present(ui->compr_type)) {
-- 
1.7.2.3
