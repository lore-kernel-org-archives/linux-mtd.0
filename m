Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8IUJ-0003zy-1e
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 10:13:59 -0400
Date: Thu, 25 Aug 2005 16:12:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kaigai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050825141255.GA5625@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <430D9D5A.4000504@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430D9D5A.4000504@ak.jp.nec.com>
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 August 2005 19:28:42 +0900, Kaigai Kohei wrote:
> 
> Today, I think about appropriate locking in JFFS2's XATTR.
> I hope to get some comments about dividing locking.
> 
> >* Dividing the global xattr_sem semaphore into more small lock.
> 
> xattr_sem is a global read/write semaphore stored in jffs2_sb_info
> to protect any XATTR structure.
> In common case, dividing lock/semaphore has good effects for scalability
> toward the number of CPUs. But JFFS2 is frequently used for small
> and embedded region in my understanding.
> 
> If global semaphore is divided into many per-entry locks, we may be able
> to execute setxattr() concurrently. But each locking/un-locking cost
> may also exceed the scalability effect.
> Since I don't have much experience in this region, I hope any professional's
> worthwhile comments.
> 
> Now, I think one global read/write semaphore is enough for 1-2 CPUs,
> if assumption of the XATTR processing with wrinting does not happen
> so much is permitted.  In almost case, we can execute get/listxattr
> cuncurrently with one lock/un-locking, I think.

Your idea to go to fine-grained locking surprised me a bit when I
first saw it.  JFFS2 is hardly the fs that cares much about SMP
scalability.  Unless you can prove real contentions around the
xattr_lock in realistic benchmarks, I would ignore this issue.

Correctness is another issue.  I guess you have read
fs/jffs2/README.Locking and started a graph on paper to visualize
locking order.  This is more important, as a deadlock is about the
worst performance you can get. ;)

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin
