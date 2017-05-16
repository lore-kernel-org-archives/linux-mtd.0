Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQS-0002gl-Iv
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:06 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 21/53] fs: add a blank lines on some kernel-doc comments
Date: Tue, 16 May 2017 09:16:13 -0300
Message-Id: <0117d4272b1acd151812abf4a6702fc7873e16ea.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sphinx gets confused when it finds identation without a
good reason for it and without a preceding blank line:

	./fs/mpage.c:347: ERROR: Unexpected indentation.
	./fs/namei.c:4303: ERROR: Unexpected indentation.
	./fs/fs-writeback.c:2060: ERROR: Unexpected indentation.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 fs/fs-writeback.c | 12 +++++++-----
 fs/mpage.c        |  1 +
 fs/namei.c        |  1 +
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 63ee2940775c..8b426f83909f 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2052,11 +2052,13 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
 }
 
 /**
- *	__mark_inode_dirty -	internal function
- *	@inode: inode to mark
- *	@flags: what kind of dirty (i.e. I_DIRTY_SYNC)
- *	Mark an inode as dirty. Callers should use mark_inode_dirty or
- *  	mark_inode_dirty_sync.
+ * __mark_inode_dirty -	internal function
+ *
+ * @inode: inode to mark
+ * @flags: what kind of dirty (i.e. I_DIRTY_SYNC)
+ *
+ * Mark an inode as dirty. Callers should use mark_inode_dirty or
+ * mark_inode_dirty_sync.
  *
  * Put the inode on the super block's dirty list.
  *
diff --git a/fs/mpage.c b/fs/mpage.c
index baff8f820c29..4760a0c09a4e 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -344,6 +344,7 @@ do_mpage_readpage(struct bio *bio, struct page *page, unsigned nr_pages,
  *
  * So an mpage read of the first 16 blocks of an ext2 file will cause I/O to be
  * submitted in the following order:
+ *
  * 	12 0 1 2 3 4 5 6 7 8 9 10 11 13 14 15 16
  *
  * because the indirect block has to be read to get the mappings of blocks
diff --git a/fs/namei.c b/fs/namei.c
index 7286f87ce863..b5af8228e2d9 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4300,6 +4300,7 @@ SYSCALL_DEFINE2(link, const char __user *, oldname, const char __user *, newname
  * The worst of all namespace operations - renaming directory. "Perverted"
  * doesn't even start to describe it. Somebody in UCB had a heck of a trip...
  * Problems:
+ *
  *	a) we can get into loop creation.
  *	b) race potential - two innocent renames can create a loop together.
  *	   That's where 4.4 screws up. Current fix: serialization on
-- 
2.9.3
