From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <445CD332.40309@ak.jp.nec.com>
References: <445C476A.2090506@ak.jp.nec.com>
	<1146917241.2766.61.camel@pmac.infradead.org>
	<1146919108.2766.73.camel@pmac.infradead.org>
	<445CD332.40309@ak.jp.nec.com>
Content-Type: text/plain
Date: Sat, 06 May 2006 18:53:11 +0100
Message-Id: <1146937993.2503.93.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joern@wohnheim.fh-wedel.de
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-05-07 at 01:47 +0900, KaiGai Kohei wrote:

> OK, I'll fix it.

 <...> 
> OK, I'll prepare it.
> Please notice me, if storange English expressions are included.

OK, thanks. I'm happy to proof-read for you.

> > 3. You have very strange locking behaviour in
> > jffs2_garbage_collect_xattr() -- sometimes you return with the lock
> > still held, sometimes without. I think it would be best to check
> > ic->class within the jffs2_garbage_collect_passs() function instead.
> 
> Do you prefer the following style implementation?
> I also agree your opinion, if so. I'll fix it.
> 
> @ gc.c
>     if (jffs2_garbage_collect_passs(c, ic)) {  /* returns 1, if ic is xdatum or xref */
>         spin_unlock(&c->erase_completion_lock);
>         jffs2_garbage_collect_xattr(c, ic);    /* ic is xdatum or xref */
>         goto release_sem;
>     }

I don't like that very much either, to be honest. How about getting rid
of jffs2_garbage_collect_xattr() altogether, and using this in gc.c
instead...

#ifdef CONFIG_JFFS2_FS_XATTR
	/* When 'ic' refers xattr_datum/xattr_ref, this node is GCed as xattr.
	   We can decide whether this node is inode or xattr by ic->class. */
	if (ic->class == RAWNODE_CLASS_XATTR_DATUM ||
	    ic->class == RAWNODE_CLASS_XATTR_REF) {
		spin_unlock(&c->erase_completion_lock);
	/* XXXXXX? */
		down_write(&c->xattr_sem);
		if (ic->class == RAWNODE_CLASS_XATTR_DATUM)
			ret = jffs2_garbage_collect_xattr_datum(c, (void *)ic);
		else
			ret = jffs2_garbage_collect_xattr_ref(c, (void *)ic);
		up_write(&c->xattr_sem);
		goto release_sem;
	}
#endif

> 
> > 4. You add a list_head to struct jffs2_inode_cache. That's two pointers
> > -- could we get away with only a single pointer instead?
> 
> It's probably possible. Please wait for a while, since there is a bit much
> points to be fixed.

OK, thanks. I think it's worth doing, because there will be many
instances of struct jffs2_inode_cache, and it's best to keep them as
small as possible.

> > How much has your code been tested on SMP machines?
> 
> It's not evaluated on SMP machine yet.
> (And, I've not prepated SMP evaluation environment yet.)
> I hope to make collaboration with MTD people.

Any SMP machine will work, using the 'mtdram' driver instead of real
flash.

> I haven't known much about detailed git operations yet. But I'm already
> doing basical operations such as pull/push/... in my local environment.
> Maybe, here is not significant problem. I'm willing to manage jffs2-xattr-2.6.git
> tree. Is it necessary to send you my ssh public key, isn't it?

Yes, please. I'll add an account for you.

-- 
dwmw2
