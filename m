Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hk-Qo
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:02 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuql013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/10] UBIFS: assert no fixup when writing a node
Date: Fri,  3 Jun 2011 16:49:59 +0300
Message-Id: <1307109001-19761-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ben Gardiner <bengardiner@nanometrics.ca>

The current free space fixup can result in some writing to the UBI volume
when the space_fixup flag is set.

To catch instances where UBIFS is writing to the NAND while the space_fixup
flag is set, add an assert to ubifs_write_node().

Artem: tweaked the patch, added similar assertion to the write buffer
       write path.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Reviewed-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 166951e..3be645e 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -581,6 +581,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(wbuf->size % c->min_io_size == 0);
 	ubifs_assert(mutex_is_locked(&wbuf->io_mutex));
 	ubifs_assert(!c->ro_media && !c->ro_mount);
+	ubifs_assert(!c->space_fixup);
 	if (c->leb_size - wbuf->offs >= c->max_write_size)
 		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size));
 
@@ -759,6 +760,7 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 	ubifs_assert(lnum >= 0 && lnum < c->leb_cnt && offs >= 0);
 	ubifs_assert(offs % c->min_io_size == 0 && offs < c->leb_size);
 	ubifs_assert(!c->ro_media && !c->ro_mount);
+	ubifs_assert(!c->space_fixup);
 
 	if (c->ro_error)
 		return -EROFS;
-- 
1.7.2.3
