Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2Kx6-0005ip-DW
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 10:06:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2NA65B8003725
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2011 12:06:06 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: fix assertion warning and refine comments
Date: Wed, 23 Mar 2011 12:08:36 +0200
Message-Id: <1300874916-1721-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes the following UBIFS assertion warning:

UBIFS assert failed in do_readpage at 115 (pid 199)
[<b00321b8>] (unwind_backtrace+0x0/0xdc) from [<af025118>]
(do_readpage+0x108/0x594 [ubifs])
[<af025118>] (do_readpage+0x108/0x594 [ubifs]) from [<af025764>]
(ubifs_write_end+0x1c0/0x2e8 [ubifs])
[<af025764>] (ubifs_write_end+0x1c0/0x2e8 [ubifs]) from
[<b00a0164>] (generic_file_buffered_write+0x18c/0x270)
[<b00a0164>] (generic_file_buffered_write+0x18c/0x270) from
[<b00a08d4>] (__generic_file_aio_write+0x478/0x4c0)
[<b00a08d4>] (__generic_file_aio_write+0x478/0x4c0) from
[<b00a0984>] (generic_file_aio_write+0x68/0xc8)
[<b00a0984>] (generic_file_aio_write+0x68/0xc8) from
[<af024a78>] (ubifs_aio_write+0x178/0x1d8 [ubifs])
[<af024a78>] (ubifs_aio_write+0x178/0x1d8 [ubifs]) from
[<b00d104c>] (do_sync_write+0xb0/0x100)
[<b00d104c>] (do_sync_write+0xb0/0x100) from [<b00d1abc>]
(vfs_write+0xac/0x154)
[<b00d1abc>] (vfs_write+0xac/0x154) from [<b00d1c10>]
(sys_write+0x3c/0x68)
[<b00d1c10>] (sys_write+0x3c/0x68) from [<b002d9a0>]
(ret_fast_syscall+0x0/0x2c)

The 'PG_checked' flag is used to indicate that the page does not
supposedly exist on the media (e.g., a hole or a page beyond the
inode size), so it requires slightly bigger budget, because we have
to account the indexing size increase. And this flag basically
tells that the budget for this page has to be "new page budget".
The "new page budget" is slightly bigger than the "existing page
budget".

The 'do_readpage()' function has the following assertion which
sometimes is hit: 'ubifs_assert(!PageChecked(page))'. Obviously,
the meaning of this assertion is: "I should not be asked to read
a page which does not exist on the media".

However, in 'ubifs_write_begin()' we have a small "trick". Notice,
that VFS may write pages which were not read yet, so the page data
were not loaded from the media to the page cache yet. If VFS tells
that it is going to change only some part of the page, we obviously
have to load it from the media. However, if VFS tells that it is
going to change whole page, we do not read it from the media for
optimization purposes.

However, since we do not read it, we do not know if it exists on
the media or not (a hole, etc). So we set the 'PG_checked' flag
to this page to force bigger budget, just in case.

So 'ubifs_write_begin()' sets 'PG_checked'. Then we are in
'ubifs_write_end()'. And VFS tells us: "hey, for some reasons I
changed my mind and did not change whole page". Frankly, I do not
know why this happens, but I hit this somehow on an ARM platform.
And this is extremely rare.

So in this case UBIFS does the following:

1. Cancels allocated budget.
2. Loads the page from the media by calling 'do_readpage()'.
3. Asks VFS to repeat the whole write operation from the very
   beginning (call '->write_begin() again, etc).

And the assertion warning is hit at the step 2 - remember we have
the 'PG_checked' set for this page, and 'do_readpage()' does not
like this. So this patch fixes the problem by adding step 1.5 and
cleaning the 'PG_checked' before calling 'do_readpage()'.

All in all, this patch does not fix any functionality issue, but it
silences UBIFS false positive warning which may happen in very very
rare cases.

And while on it, this patch also improves a commentary which explains
the reasons of setting the 'PG_checked' flag for the page. The old
commentary was a bit difficult to understand.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/file.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index d77db7e..28be1e6 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -448,10 +448,12 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 		if (!(pos & ~PAGE_CACHE_MASK) && len == PAGE_CACHE_SIZE) {
 			/*
 			 * We change whole page so no need to load it. But we
-			 * have to set the @PG_checked flag to make the further
-			 * code know that the page is new. This might be not
-			 * true, but it is better to budget more than to read
-			 * the page from the media.
+			 * do not know whether this page exists on the media or
+			 * not, so we assume the latter because it requires
+			 * larger budget. The assumption is that it is better
+			 * to budget a bit more than to read the page from the
+			 * media. Thus, we are setting the @PG_checked flag
+			 * here.
 			 */
 			SetPageChecked(page);
 			skipped_read = 1;
@@ -559,6 +561,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 		dbg_gen("copied %d instead of %d, read page and repeat",
 			copied, len);
 		cancel_budget(c, page, ui, appending);
+		ClearPageChecked(page);
 
 		/*
 		 * Return 0 to force VFS to repeat the whole operation, or the
-- 
1.7.2.3
