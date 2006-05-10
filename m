Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdonz-0008T1-OZ
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 09:32:59 -0400
Date: Wed, 10 May 2006 15:28:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060510132854.GC31935@wohnheim.fh-wedel.de>
References: <445C476A.2090506@ak.jp.nec.com>
	<20060507171601.GA7990@wohnheim.fh-wedel.de>
	<445EA6D4.5000909@ak.jp.nec.com>
	<1147092567.2766.146.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1147092567.2766.146.camel@pmac.infradead.org>
Cc: jmorris@redhat.com, KaiGai Kohei <kaigai@ak.jp.nec.com>,
	russell@coker.com.au, lorenzo@gnu.org,
	linux-mtd@lists.infradead.org, sds@tycho.nsa.gov
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 May 2006 13:49:27 +0100, David Woodhouse wrote:
> On Mon, 2006-05-08 at 11:03 +0900, KaiGai Kohei wrote:
> > [Current TODO list]
> > * Fix the declaration of jffs2_acl_header and so on by using 'struct'
> >    instead of 'typedef' in kernel space.
> > - Fix the declaration of jffs2_acl_header and so on by using 'struct'
> >    instead of 'typedef' in user space header.
> > * Add documentation about xattr_sem into README.Locking.
> > * Call jffs2_garbage_collect_xattr_datum/ref() from gc.c directly
> >    instead of jffs2_garbage_collect_xattr()
> > - Use unidirection list beween inode_chache and xattr_ref, instead of
> >    list_head.
> > - Add '#include <linux/list.h>' into xattr.h.
> > - Unify each file header part with any jffs2 files.
> > - Remove a senseless comment. ("/* forward refence */")
> > - Remove unneccesary pointer casts.
> > - Remove unneccesary '#ifdef __KERNEL__' on acl.h
> > 
> > *: It has already prepared, but I've not publicated yet.
> > -: It has not prepated yet. I should work from now. 
> 
> That's an excellent summary; thanks. It does serve to show that we've
> mostly picked on cosmetic details so far though :)

Correct.  The basic design makes sense, the code is good.  I don't
feel opposed to merging it once above list is handled.  The number of
new #ifdefs still concerns me a bit, but we can still deal with that
after the merge.  There has been worse.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
