Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QzEtI-0004Es-1e
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2011 21:33:41 +0000
Date: Thu, 1 Sep 2011 23:34:20 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110901213420.GA30947@logfs.org>
References: <20110816171707.GU26160@logfs.org>
	<CAMjNe_f9RT0qmO5EeUxhA80ruB+uz7Ng7jCVZriaUcgmk_H1HQ@mail.gmail.com>
	<20110826194910.GE22411@logfs.org>
	<CAMjNe_euj5t9+Jph0Uy-j7+SRMe1oSzihGCaiuQ1Dcd7dz6cuw@mail.gmail.com>
	<20110831055854.GA12713@logfs.org>
	<CAMjNe_d2pOC9+2nSy2PA=2aigF95vZv3_A-jPyWyTXteW3mqFw@mail.gmail.com>
	<20110831074902.GA26382@logfs.org>
	<CAMjNe_csYHWCRFXt6sW1FpMaS_RFGLM6z1ML6_-3xb-5x7DZtg@mail.gmail.com>
	<20110831141731.GA29862@logfs.org>
	<CAMjNe_d0-vz==Hjqzyu6taJHyHiPff8EH+=qadrOv_87LO8F2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_d0-vz==Hjqzyu6taJHyHiPff8EH+=qadrOv_87LO8F2g@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 September 2011 11:38:39 +0530, srimugunthan dhandapani wrote:
> 
> Its frustrating when you ask me to take a new set of logs without
> reading my previous mails.
> To repeat, iam not able to reproduce the third bug. I think the first
> two bugs should be reproducible at your end.

Well, so far I have basically ignored your second and third bug.  As
long as the first is unresolved, I don't want to add yet more
confusion to what we already have.

> I thought that you were asking me to take the logs because you are not
> able to reproduce them too.

I wanted to ask you to take the test patch, run it, see the debug
output in the kernel log and send it to me.  "Take the logs" may have
been what I said, but if I did that would have been too ambiguous.  A
single line of output from the debug printk would have been enough, or
maybe a pagefull.  Certainly not megabytes worth.

> Out of curiosity, are you able to run bonnie successfully with logfs+nandsim?

Yes and no.  I think I have to apologize for using block2mtd so far.
There shouldn't be a big difference between one mtd driver and another
wrt. logfs behaviour.  Famous last words.

The problem with nandsim + logfs is the default segment size.  16k is
not enough to fit an entire journal commit into.  You can try this
yourself by using "mklogfs -s14 /dev/mtd0" or "mklogfs -s15 /dev/mtd0"
in your test scripts.  The first should run into the infinite loop you
experienced, while the second should work.

I'm not entirely sure what to do about this.  The easiest and probably
most robust solution is to check for segment size at mount time and
fail for anything <32k.

Oh, and you might want to add the patch below.

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918

[PATCH] logfs: add mtd_write_sb

Fairly obvious, given the benefit of hindsight. :(

Signed-off-by: Joern Engel <joern@logfs.org>
---
 fs/logfs/dev_mtd.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 5ca422c..50a3c8c 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -228,6 +228,15 @@ static void mtd_writeseg(struct super_block *sb, u64 ofs, size_t len)
 	__mtd_writeseg(sb, ofs, ofs >> PAGE_SHIFT, len >> PAGE_SHIFT);
 }
 
+static int mtd_write_sb(struct super_block *sb, struct page *page)
+{
+	struct mtd_info *mtd = logfs_super(sb)->s_mtd;
+
+	if (mtd->sync)
+		mtd->sync(mtd);
+	return 0;
+}
+
 static void mtd_put_device(struct logfs_super *s)
 {
 	put_mtd_device(s->s_mtd);
@@ -255,6 +264,7 @@ out:
 static const struct logfs_device_ops mtd_devops = {
 	.find_first_sb	= mtd_find_first_sb,
 	.find_last_sb	= mtd_find_last_sb,
+	.write_sb	= mtd_write_sb,
 	.readpage	= mtd_readpage,
 	.writeseg	= mtd_writeseg,
 	.erase		= mtd_erase,
-- 
1.7.2.3
