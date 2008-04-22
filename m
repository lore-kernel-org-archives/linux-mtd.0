Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2008 17:47:13 +0100
Message-Id: <1208882833.9212.629.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-01-18 at 19:28 +0300, Alexander Belyakov wrote:
> On 1/15/08, Jörn Engel <joern@logfs.org> wrote:
> >
> > Right now the important thing is to dig deeper and understand the nature
> > of this bug.  You can reproduce it, that is good.  We also know that it
> > makes a difference whether the block is on one list or the other.  But
> > we don't know yet, what difference exactly it makes.
> 
> Question. What is success criteria for jffs2_garbage_collect_pass() execution?
> 
> Why asking? In the case described above jffs2_find_gc_block() fails to
> find erase block for garbage collection but falling into
> jffs2_flush_wbuf_pad(c) which produces amount of erasing blocks. So
> jffs2_garbage_collect_pass() sees no single block for garbage
> collection, but filesystem still recieves fresh erasing blocks upon
> execution.
> 
> Is it success or failure? Theoretically.

It depends. There are two callers of jffs2_garbage_collect_pass().

For jffs2_flush_wbuf_gc() it's not progress, so it should be handled
like failure.

For jffs2_reserve_space(), we can treat it as success... or we can have
a special case which calls jffs2_erase_pending_blocks() right away to
wait for the block to erase.

How about this... does it solve the problem for you?

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 26c7992..f2c6e88 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -221,6 +221,12 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		jeb = jffs2_find_gc_block(c);
 
 	if (!jeb) {
+		/* Couldn't find a free block. But maybe we can just erase one and make 'progress'? */
+		if (!list_empty(&c->erase_pending_list)) {
+			spin_unlock(&c->erase_completion_lock);
+			mutex_unlock(&c->alloc_sem);
+			return -EAGAIN;
+		}
 		D1 (printk(KERN_NOTICE "jffs2: Couldn't find erase block to garbage collect!\n"));
 		spin_unlock(&c->erase_completion_lock);
 		mutex_unlock(&c->alloc_sem);
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 747a73f..952a828 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -116,7 +116,12 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			spin_unlock(&c->erase_completion_lock);
 
 			ret = jffs2_garbage_collect_pass(c);
-			if (ret)
+			if (ret == -EAGAIN) {
+				jffs2_erase_pending_blocks(c, 1);
+				goto again;
+			}
+
+			if (ret) 
 				return ret;
 
 			cond_resched();
@@ -124,6 +129,7 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			if (signal_pending(current))
 				return -EINTR;
 
+		again:
 			mutex_lock(&c->alloc_sem);
 			spin_lock(&c->erase_completion_lock);
 		}


-- 
dwmw2
