Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R1HED-0000Bn-GU
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 12:27:42 +0000
Date: Wed, 7 Sep 2011 08:56:21 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs: max 4K writepage size
Message-ID: <20110907065621.GL32018@logfs.org>
References: <CAMjNe_fdRw=5-MjOii8aGfEvejPo-dR6Rpf1=JQf_gMJ3U9jfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_fdRw=5-MjOii8aGfEvejPo-dR6Rpf1=JQf_gMJ3U9jfQ@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 4 September 2011 15:50:03 +0530, srimugunthan dhandapani wrote:
> 
> If you plan to do this, when can we expect your patches in the kernel?

Don't expect me to predict the future - my past predictions have not
proven to be very reliable.

> Can you suggest what changes have to be done to have >4K writepage size.

I think the only change strictly necessary is the patch below,
removing an assertion.  Plus the second patch below for mklogfs.

> From what i looked, it doesnt seem straight forward. I think the 4K
> writepage size restriction is because
> the flash device is memory mapped for caching purposes.
> Initially, I wouldnt want to have the caching feature.

Careful.  I know that for some devices the caching makes a performance
difference somewhere between 100x and 1000x.  Pretty much whenever you
encounter a crap FTL on your random USB stick, SDcard, etc. that is
the case.  So if you want to avoid caching for your purposes, you'd
have to do it in a way that doesn't cause a huge performance
regression to these devices.  In other words, caching needs to stay in
the code, but be made contingent on some condition that I couldn't
specify in half an hour.

As the result - having both caching and non-caching code, plus some
decision heuristic - will be a non-trivial maintenance burden, there
should also be a non-trivial performance benefit attached.  But then
again, I suppose the two patches below mean you won't even attempt
going non-caching anyway. :)

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle

[PATCH] logfs: remove useless BUG_ON

It prevents write sizes >4k.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 fs/logfs/journal.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/logfs/journal.c b/fs/logfs/journal.c
index 9da2970..1e1c369 100644
--- a/fs/logfs/journal.c
+++ b/fs/logfs/journal.c
@@ -612,7 +612,6 @@ static size_t __logfs_write_je(struct super_block *sb, void *buf, u16 type,
 	if (len == 0)
 		return logfs_write_header(super, header, 0, type);
 
-	BUG_ON(len > sb->s_blocksize);
 	compr_len = logfs_compress(buf, data, len, sb->s_blocksize);
 	if (compr_len < 0 || type == JE_ANCHOR) {
 		memcpy(data, buf, len);
-- 
1.7.2.3


[PATCH] Allow larger write shift

Current flashes with 8k write size already exist.  Why pick 16?  No
good reason, it's a bit bigger and will do for a while.  Maybe 32 or
64 would be sane choices - beyond 64 is definitely insane - but until
someone can properly argue where exactly the boundary should be, this
is good enough for a while.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 mkfs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs.c b/mkfs.c
index fd54b75..138067a 100644
--- a/mkfs.c
+++ b/mkfs.c
@@ -514,8 +514,8 @@ static void mkfs(struct super_block *sb)
 		fail("segment shift must be larger than block shift");
 	if (blockshift != 12)
 		fail("blockshift must be 12");
-	if (writeshift > 12)
-		fail("writeshift too large (max 12)");
+	if (writeshift > 16)
+		fail("writeshift too large (max 16)");
 	sb->segsize = 1 << segshift;
 	sb->blocksize = 1 << blockshift;
 	sb->blocksize_bits = blockshift;
-- 
1.7.2.3
