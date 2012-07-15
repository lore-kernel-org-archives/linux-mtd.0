Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqK7P-0002VL-Lc
 for linux-mtd@lists.infradead.org; Sun, 15 Jul 2012 08:24:03 +0000
Received: by lbbgg6 with SMTP id gg6so6571786lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jul 2012 01:22:47 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: James Nute <newten82@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: [PATCH] UBIFS: fix a bug in empty space fix-up
Date: Sun, 15 Jul 2012 11:17:17 +0300
Message-Id: <1342340237-29656-1-git-send-email-dedekind1@gmail.com>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

UBIFS has a feature called "empty space fix-up" which is a quirk to work-around
limitations of dumb flasher programs. Namely, of those flashers that are unable
to skip NAND pages full of 0xFFs while flashing, resulting in empty space at
the end of half-filled eraseblocks to be unusable for UBIFS. This feature is
relatively new (introduced in v3.0).

The fix-up routine (fixup_free_space()) is executed only once at the very first
mount if the superblock has the 'space_fixup' flag set (can be done with -F
option of mkfs.ubifs). It basically reads all the UBIFS data and metadata and
writes it back to the same LEB. The routine assumes the image is pristine and
does not have anything in the journal.

There was a bug in 'fixup_free_space()' where it fixed up the log incorrectly.
All but one LEB of the log of a pristine file-system are empty. And one
contains just a commit start node. And 'fixup_free_space()' just unmapped this
LEB, which resulted in wiping the commit start node. As a result, some users
were unable to mount the file-system next time with the following symptom:

UBIFS error (pid 1): replay_log_leb: first log node at LEB 3:0 is not CS node
UBIFS error (pid 1): replay_log_leb: log error detected while replaying the log at LEB 3:0

The root-cause of this bug was that 'fixup_free_space()' wrongly assumed
that the beginning of empty space in the log head (c->lhead_offs) was known
on mount. However, it is not the case - it was always 0. UBIFS does not store
in it the master node and finds out by scanning the log on every mount.

The fix is simple - just pass commit start node size instead of 0 to
'fixup_leb()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org [v3.0+]
Reported-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Reported-by: James Nute <newten82@gmail.com>
---
 fs/ubifs/sb.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index ef3d1ba..49382e7 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -718,8 +718,9 @@ static int fixup_free_space(struct ubifs_info *c)
 		lnum = ubifs_next_log_lnum(c, lnum);
 	}
 
-	/* Fixup the current log head */
-	err = fixup_leb(c, c->lhead_lnum, c->lhead_offs);
+	/* Fixup the log head contains the only a CS node at the beginning */
+	err = fixup_leb(c, c->lhead_lnum,
+			ALIGN(UBIFS_CS_NODE_SZ, c->min_io_size));
 	if (err)
 		goto out;
 
-- 
1.7.7.6
