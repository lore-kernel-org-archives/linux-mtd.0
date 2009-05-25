Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Zjx-0005lK-3X
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 12:57:24 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <1243256082.21646.114.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1243240685.21646.100.camel@localhost.localdomain>
	<1243256082.21646.114.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 15:57:06 +0300
Message-Id: <1243256226.21646.116.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, linux-mtd@lists.infradead.org,
	Stefan Roese <sr@denx.de>, Jamie Lokier <jamie@shareable.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 15:54 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-05-25 at 11:38 +0300, Artem Bityutskiy wrote:
> > Presumably what happens it: UBIFS scans LEB 120. It checks the first
> > node, and finds CRC mismatch. Then UBIFS logic is as follows. If this
> > corrupted node is the last one, then there was a write interrupt,
> > which is harmless. But if after this node some other data follows,
> > this is some serious corruption. So the 'is_last_write()' function
> > is called, it is supposed to check that.
> > 
> > In 'is_last_write()' I see it has different logic depending on whether
> > c->min_io_size == 1 or not. The former case is NOR case, the latter
> > is NAND. Well, since I know we never tested UBIFS well for NOR,
> > I conclude the NOR case may have a bug.
> 
> Oh, this 'c->min_io_size == 1' case is just dead code, we never have
> c->min_io_size < 8 in UBIFS. So I just remove that (patch at the end
> of the e-mail).
> 
> Eric, please, reproduce this problem again. Then please, do not
> "fix" it from u-boot. But instead, please do:
> 
> 1. Enable UBIFS debugging
> 2. Enable recovery and mount messages, by booting with
>    "ubifs.debug_msgs=6144" kernel parameter
> 3. also add the "ignore_loglevel" boot parameter
> 4. capture _all_ messages in minicom
> 5. If possible, make a full dump of your flash to play with it
>    later.
> 
> Share the messages with us. I hope we can fix these problems.
> Just provide us the info.

Err, and the patch.

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: remove dead code

UBIFS assumes that @c->min_io_size is 8 in case of NOR flash. This
is because UBIFS alignes all nodes to 8-byte boundary, and maintaining
@c->min_io_size introduced unnecessary complications.

This patch removes senseless constructs like:

if (c->min_io_size == 1)
	NOR-specific code

Also, few commentaries amendments.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/budget.c   |    1 -
 fs/ubifs/recovery.c |   31 ++++---------------------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index d0231ba..eaf6d89 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -91,7 +91,6 @@ static int shrink_liability(struct ubifs_info *c, int nr_to_write)
 	return nr_written;
 }
 
-
 /**
  * run_gc - run garbage collector.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 1066297..8056052 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -343,33 +343,15 @@ int ubifs_write_rcvrd_mst_node(struct ubifs_info *c)
  *
  * This function returns %1 if @offs was in the last write to the LEB whose data
  * is in @buf, otherwise %0 is returned.  The determination is made by checking
- * for subsequent empty space starting from the next min_io_size boundary (or a
- * bit less than the common header size if min_io_size is one).
+ * for subsequent empty space starting from the next @c->min_io_size boundary.
  */
 static int is_last_write(const struct ubifs_info *c, void *buf, int offs)
 {
-	int empty_offs;
-	int check_len;
+	int empty_offs, check_len;
 	uint8_t *p;
 
-	if (c->min_io_size == 1) {
-		check_len = c->leb_size - offs;
-		p = buf + check_len;
-		for (; check_len > 0; check_len--)
-			if (*--p != 0xff)
-				break;
-		/*
-		 * 'check_len' is the size of the corruption which cannot be
-		 * more than the size of 1 node if it was caused by an unclean
-		 * unmount.
-		 */
-		if (check_len > UBIFS_MAX_NODE_SZ)
-			return 0;
-		return 1;
-	}
-
 	/*
-	 * Round up to the next c->min_io_size boundary i.e. 'offs' is in the
+	 * Round up to the next @c->min_io_size boundary i.e. @offs is in the
 	 * last wbuf written. After that should be empty space.
 	 */
 	empty_offs = ALIGN(offs + 1, c->min_io_size);
@@ -392,7 +374,7 @@ static int is_last_write(const struct ubifs_info *c, void *buf, int offs)
  *
  * This function pads up to the next min_io_size boundary (if there is one) and
  * sets empty space to all 0xff. @buf, @offs and @len are updated to the next
- * min_io_size boundary (if there is one).
+ * @c->min_io_size boundary.
  */
 static void clean_buf(const struct ubifs_info *c, void **buf, int lnum,
 		      int *offs, int *len)
@@ -402,11 +384,6 @@ static void clean_buf(const struct ubifs_info *c, void **buf, int lnum,
 	lnum = lnum;
 	dbg_rcvry("cleaning corruption at %d:%d", lnum, *offs);
 
-	if (c->min_io_size == 1) {
-		memset(*buf, 0xff, c->leb_size - *offs);
-		return;
-	}
-
 	ubifs_assert(!(*offs & 7));
 	empty_offs = ALIGN(*offs, c->min_io_size);
 	pad_len = empty_offs - *offs;
-- 
1.6.0.6



-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
