Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA38AC79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 05:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qfgqpf8eUMGtmsfW6SZiUS70VNQ82x2RgK5kgxqv1EY=; b=lQu9gALIAUiwMxCpoMqZk9+U96
	B9gKAw/LarUH6D1V8p/uT49yDeNrJuSGXpxG2NzACbwcMxrT8mhQsrArzuoasmZqrU8QEr//1muAi
	AZqN4n+QbuRZtetw5hCTLg6BJ2gebYSOka8LI6ykTJlERa2CA1En7WZ8IpyidVdUZqkDBjQvJw3pa
	vjEev110QnPvukvRyaS99QQRP7rSqDqpmjIZHWHGx3ulcsxlYRE5wj9L3M81r1PItbjMkbn+in45a
	wkIycX6IGLOPWSvID0PeC8mahKLfFGDTxBoTIuWqtQGd7yzM3UqPMIfjgYttly2mJ4L+6OhUmCYU4
	Gn24rpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BJ2-0000000ApJO-0kwm;
	Wed, 09 Sep 2026 05:57:12 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BIz-0000000ApIy-0Dp5
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 05:57:10 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788933426; bh=zooWrDic3EPT3oe8Inni1HE
	n8KnOqLyrt6oR8Ewuy1k=; b=lNv2D6Y48BIlqBOWJJFrJKDK/Dm1DSi78dfiVS4csylvMbyNYl
	Y24/ltardYaoeBJBi0iAJG3uwl+8Xc+5tEBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788933426; bh=zooWrDic3EPT3oe8Inni1HE
	n8KnOqLyrt6oR8Ewuy1k=; b=Op7jwH+GMdefyjSBvPqcvl+jjtcQ4hg8gOd1cu6C3fOTj+YeAX
	ixSg39MgmQzZ0ondU2VNUco506B5X07AlDEhEbiMuskroG9D/J6sIL9iuOP2CltFk0aVO0VE2/u
	MuqTVxUJsKOSAJSvcUwIAD+mfKSG8aDX3+zIsCQwag0gJPUw/2lg6uJdwZzj3tYJa+zRv7EC3WG
	drxlN+n8LE0AE/rqpcsoQbFv5JPpsh/s0oV5FTj/iSASnn4mQwJPIZzcgqA1DjwmeXN/dFpE7Ap
	U/QJ7+Ec0P96j0yvB8JSWbwRtNS9hkdvxMVi7Tp5mYY34B/kHTz5zCJCMSbYhfR1JeA==;
From: "Richard Weinberger" <richard@nod.at>
To: <sashiko-reviews@lists.linux.dev>, 
	"Lucas Jeffrey" <luquijeffrey@gmail.com>, <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
Subject: =?us-ascii?Q?AW:_[PATCH]_jffs:_initialize_inocache_to_NULL_when?=
	=?us-ascii?Q?_initializing_a_jffs2=5Finode=5Finfo?=
Message-ID: <mttoruf5.55d3678c-d0ad-4a15-98a0-5ea7ec0d7e8d@nod.at>
In-Reply-To: <20260909025407.7494D1F00A3A@smtp.kernel.org>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
	<20260909025407.7494D1F00A3A@smtp.kernel.org>
Date: Wed, 9 Sep 2026 05:57:06 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_225709_248859_E71C0DBF 
X-CRM114-Status: GOOD (  22.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Lucas,

Am Wed, Sep 9, 2026, 04:54 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Double free of `f->target` on early VFS failure paths due to uninitialized slab memory.
> --
> 
> commit 9fd2012cfec1b8d15df193fea97deabda99aa5e5
> Author: Lucas Jeffrey <luquijeffrey@gmail.com>
> 
> jffs: initialize inocache to NULL when initializing a jffs2_inode_info
> 
> When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
> can retain stale values from its previous use.
> 
> If the new jffs2_inode_info object allocated retains an old reference to a
> freed inocache, the function jffs2_new_inode may crash if either
> jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
> when calling iput() with the inode it will eventually attempt to free again
> the inocache.
> 
> Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
> 
> > diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> > index 86ab014a349c5..40f17218a276b 100644
> > --- a/fs/jffs2/os-linux.h
> > +++ b/fs/jffs2/os-linux.h
> > @@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
> >  {
> >  	f->highest_version = 0;
> >  	f->fragtree = RB_ROOT;
> > +	f->inocache = NULL;
> >  	f->metadata = NULL;
> >  	f->dents = NULL;
> >  	f->target = NULL;
> 
> [Severity: Critical]
> This isn't a bug introduced by this patch, but doesn't f->target suffer from
> a similar issue due to uninitialized slab memory on early VFS failure paths?
> 
> When the VFS allocates a new inode via jffs2_alloc_inode() in
> fs/jffs2/super.c, the object is returned from the SLAB cache without
> __GFP_ZERO. It retains stale values from its previous lifecycle, including
> a dangling pointer in f->target, because jffs2_free_inode() frees f->target
> but does not nullify it.
> 
> JFFS2 defers initializing f->target = NULL to jffs2_init_inode_info(), which
> is called after VFS initialization completes. If the VFS fails early (e.g.,
> inode_init_always() fails due to an LSM memory allocation, or iget_locked()
> in fs/inode.c encounters a hash collision race and drops the newly allocated
> inode), the VFS destroys the inode via jffs2_free_inode() before JFFS2 ever
> initializes it.
> 
> This causes a double free when kfree(f->target) executes again on the
> dangling pointer:
> 
> fs/jffs2/super.c:jffs2_free_inode() {
> 	...
> 	kfree(f->target);
> 	kmem_cache_free(jffs2_inode_cachep, f);
> }
> 
> Userspace can reliably trigger the iget_locked() hash collision race by
> performing concurrent lookups (e.g., stat() or open()) on the same
> non-resident inode:
> 
> fs/inode.c:iget_locked() {
> 	...
> 	if (unlikely(test_bit(__I_NEW, &inode->i_state))) {
> 		/* Uhhuh, somebody else created the same inode under us... */
> 		spin_unlock(&inode_hash_lock);
> 		destroy_inode(inode);
> 	...
> }
> 
> Would it be safer to zero these fields in jffs2_alloc_inode() or ensure
> jffs2_free_inode() nullifies them before returning the object to the slab
> cache?

I think this is a legit bug pointed out by Sashiko.
Do you want to double check and (if needed) fix it?

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
