From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <445EA6D4.5000909@ak.jp.nec.com>
References: <445C476A.2090506@ak.jp.nec.com>
	<20060507171601.GA7990@wohnheim.fh-wedel.de>
	<445EA6D4.5000909@ak.jp.nec.com>
Content-Type: text/plain
Date: Mon, 08 May 2006 13:49:27 +0100
Message-Id: <1147092567.2766.146.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jmorris@redhat.com, sds@tycho.nsa.gov, russell@coker.com.au,
	lorenzo@gnu.org, linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-08 at 11:03 +0900, KaiGai Kohei wrote:
> [Current TODO list]
> * Fix the declaration of jffs2_acl_header and so on by using 'struct'
>    instead of 'typedef' in kernel space.
> - Fix the declaration of jffs2_acl_header and so on by using 'struct'
>    instead of 'typedef' in user space header.
> * Add documentation about xattr_sem into README.Locking.
> * Call jffs2_garbage_collect_xattr_datum/ref() from gc.c directly
>    instead of jffs2_garbage_collect_xattr()
> - Use unidirection list beween inode_chache and xattr_ref, instead of
>    list_head.
> - Add '#include <linux/list.h>' into xattr.h.
> - Unify each file header part with any jffs2 files.
> - Remove a senseless comment. ("/* forward refence */")
> - Remove unneccesary pointer casts.
> - Remove unneccesary '#ifdef __KERNEL__' on acl.h
> 
> *: It has already prepared, but I've not publicated yet.
> -: It has not prepated yet. I should work from now. 

That's an excellent summary; thanks. It does serve to show that we've
mostly picked on cosmetic details so far though :)

If you have patches committed into a git tree, you should be able to
just 'git-push ssh://git.infradead.org/home/git/jffs2-xattr-2.6.git' to
make it available.

-- 
dwmw2
