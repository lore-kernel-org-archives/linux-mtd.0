Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FdlYG-0003eE-6U
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 06:04:39 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <445C476A.2090506@ak.jp.nec.com>
References: <445C476A.2090506@ak.jp.nec.com>
Content-Type: text/plain
Date: Wed, 10 May 2006 14:03:41 +0400
Message-Id: <1147255421.16853.28.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern@wohnheim.fh-wedel.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-05-06 at 15:51 +0900, KaiGai Kohei wrote:
> This attached patches provide xattr support including POSIX-ACL and
> SELinux support on JFFS2 (version.5).
> We can apply those patches to the latest git-tree.
> - xattr_on_jffs2.kernel.version-5.patch can be applied to mtd-2.6.git.
> - xattr_on_jffs2.utils.version-5.patch can be applied to mtd-utils.git.

The patch in general looks nice. I have got no real
suggestions/objections for now, slowly trying to read it and delve into
(the patch is quite large, my time is very limited).

Few suggestions for now (again cosmetic):

1. GC-related functions and summary-related functions should be moved to
gc.c and summary.c
2. JFFS2 uses namings we all are used to. E.g., c - JFFS2 superblock
structure, ref - struct jffs2_node_ref. I've noticed you use 'ref' as
jffs2_xattr_ref pointers which is just a bit confusing. I would suggest
you calling them 'xref' - this would improve readability a bit.

Example of confusing code:

> +	down_write(&c->xattr_sem);
> +	list_for_each_entry_safe(ref, _ref, &ic->ilist, ilist)
> +		delete_xattr_ref(c, ref);
> +	up_write(&c->xattr_sem);

This would be more readable for those aware with "older" JFFS2
internals:

> +	down_write(&c->xattr_sem);
> +	list_for_each_entry_safe(xref, _xref, &ic->ilist, ilist)
> +		delete_xattr_ref(c, xref);
> +	up_write(&c->xattr_sem);

It's minor, but still.

Will you object if I just do some changes I consider useful in xattr
GIT? Or should I first mail you?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
