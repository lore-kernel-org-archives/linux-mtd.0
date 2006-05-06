Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FcPx2-0000qG-Oc
	for linux-mtd@lists.infradead.org; Sat, 06 May 2006 12:48:27 -0400
Message-ID: <445CD332.40309@ak.jp.nec.com>
Date: Sun, 07 May 2006 01:47:46 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>	
	<1146917241.2766.61.camel@pmac.infradead.org>
	<1146919108.2766.73.camel@pmac.infradead.org>
In-Reply-To: <1146919108.2766.73.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
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

Thanks for your comments.

> 1. Please don't use typedefs. Just 'struct jffs2_acl_header' instead of
> this:
> 	typedef struct {
> 	       jint32_t        a_version;
> 	} jffs2_acl_header;

OK, I'll fix it.

> 2. You're adding locks without documenting them in README.Locking.
> Please make sure any new locks (c->xattr_sem) are fully documented.

OK, I'll prepare it.
Please notice me, if storange English expressions are included.

> 3. You have very strange locking behaviour in
> jffs2_garbage_collect_xattr() -- sometimes you return with the lock
> still held, sometimes without. I think it would be best to check
> ic->class within the jffs2_garbage_collect_passs() function instead.

Do you prefer the following style implementation?
I also agree your opinion, if so. I'll fix it.

@ gc.c
    if (jffs2_garbage_collect_passs(c, ic)) {  /* returns 1, if ic is xdatum or xref */
        spin_unlock(&c->erase_completion_lock);
        jffs2_garbage_collect_xattr(c, ic);    /* ic is xdatum or xref */
        goto release_sem;
    }
        :

> 4. You add a list_head to struct jffs2_inode_cache. That's two pointers
> -- could we get away with only a single pointer instead?

It's probably possible. Please wait for a while, since there is a bit much
points to be fixed.

> How much has your code been tested on SMP machines?

It's not evaluated on SMP machine yet.
(And, I've not prepated SMP evaluation environment yet.)
I hope to make collaboration with MTD people.

> Please let me know if you'd like an account with direct access to the
> jffs2-xattr-2.6.git tree. I can continue to apply patches if you prefer,
> but git is quite easy to use.

I haven't known much about detailed git operations yet. But I'm already
doing basical operations such as pull/push/... in my local environment.
Maybe, here is not significant problem. I'm willing to manage jffs2-xattr-2.6.git
tree. Is it necessary to send you my ssh public key, isn't it?

Thanks,
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
