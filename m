Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6jHB-0003Nx-8F
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 11:48:29 +0000
Date: Tue, 27 Apr 2010 13:48:17 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Paolo Minazzi <paolo.minazzi@gmail.com>
Subject: [PATCH] [LogFS] Return -EINVAL if filesystem image doesn't match
Message-ID: <20100427114816.GE13859@logfs.org>
References: <20100426094810.GE27497@kernel.dk>
	<20100426143253.GB4364@logfs.org>
	<20100426143803.GM27497@kernel.dk>
	<20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org> <20100426163126.GD4364@logfs.org>
	<x2v4aa525de1004270201t9f57f49fv1e9cfbb2d886e4ad@mail.gmail.com>
	<20100427111759.GA13859@logfs.org>
	<h2h4aa525de1004270431hd98c271ag61462bdb778f7769@mail.gmail.com>
	<20100427114004.GD13859@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100427114004.GD13859@logfs.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Jens Axboe <jens.axboe@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 April 2010 13:40:04 +0200, Jörn Engel wrote:
> On Tue, 27 April 2010 13:31:11 +0200, Paolo Minazzi wrote:
> > 
> > > If you add "rootfstype=romfs" to the command line, does the problem
> > > still exist?
> > 
> > Jorn , you are right.
> > It seems work....
> > please wait....
> 
> Ok, I'm pretty sure that logfs returns -EIO where it should return
> -EINVAL.  If filesystems are tried in alphabetical order, logfs comes
> first and -EIO tells the kernel to stop trying and panic, essentially.
> 
> Will cook up a patch...

Does the patch below solve the problem for you (without the explicit
"rootfstype=romfs")?

Jörn

-- 
One of my most productive days was throwing away 1000 lines of code.
-- Ken Thompson.


Signed-off-by: Joern Engel <joern@logfs.org>
---
 fs/logfs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/logfs/super.c b/fs/logfs/super.c
index 5866ee6..f649038 100644
--- a/fs/logfs/super.c
+++ b/fs/logfs/super.c
@@ -413,7 +413,7 @@ static int __logfs_read_sb(struct super_block *sb)
 
 	page = find_super_block(sb);
 	if (!page)
-		return -EIO;
+		return -EINVAL;
 
 	ds = page_address(page);
 	super->s_size = be64_to_cpu(ds->ds_filesystem_size);
-- 
1.6.2.1
