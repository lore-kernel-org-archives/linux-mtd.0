Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FcX3M-0005WR-4V
	for linux-mtd@lists.infradead.org; Sat, 06 May 2006 20:23:20 -0400
Message-ID: <445D3DCE.2000208@kaigai.gr.jp>
Date: Sun, 07 May 2006 09:22:38 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>	<1146917241.2766.61.camel@pmac.infradead.org>	<1146919108.2766.73.camel@pmac.infradead.org>	<445CD332.40309@ak.jp.nec.com>
	<1146937993.2503.93.camel@shinybook.infradead.org>
In-Reply-To: <1146937993.2503.93.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: joern@wohnheim.fh-wedel.de, linux-mtd@lists.infradead.org,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

David Woodhouse wrote:
> I don't like that very much either, to be honest. How about getting rid
> of jffs2_garbage_collect_xattr() altogether, and using this in gc.c
> instead...
> 
> #ifdef CONFIG_JFFS2_FS_XATTR
> 	/* When 'ic' refers xattr_datum/xattr_ref, this node is GCed as xattr.
> 	   We can decide whether this node is inode or xattr by ic->class. */
> 	if (ic->class == RAWNODE_CLASS_XATTR_DATUM ||
> 	    ic->class == RAWNODE_CLASS_XATTR_REF) {
> 		spin_unlock(&c->erase_completion_lock);
> 	/* XXXXXX? */
> 		down_write(&c->xattr_sem);
> 		if (ic->class == RAWNODE_CLASS_XATTR_DATUM)
> 			ret = jffs2_garbage_collect_xattr_datum(c, (void *)ic);
> 		else
> 			ret = jffs2_garbage_collect_xattr_ref(c, (void *)ic);
> 		up_write(&c->xattr_sem);
> 		goto release_sem;
> 	}
> #endif

OK, I'll fix according to your suggestion.
Only one point, I think xattr_sem should be modified in xattr.c for readability.

>>I haven't known much about detailed git operations yet. But I'm already
>>doing basical operations such as pull/push/... in my local environment.
>>Maybe, here is not significant problem. I'm willing to manage jffs2-xattr-2.6.git
>>tree. Is it necessary to send you my ssh public key, isn't it?
> 
> 
> Yes, please. I'll add an account for you.

I'll send it to you directly.

Thanks,
-- 
KaiGai Kohei <kaigai@ak.jp.nec.com>
