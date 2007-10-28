Received: from mail.shareable.org ([81.29.64.88])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImFfY-0007ji-7A
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 17:27:46 -0400
Date: Sun, 28 Oct 2007 18:28:36 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: getdents64 problem in 2.6.23
Message-ID: <20071028182836.GE14076@mail.shareable.org>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
	<20071027231812.GA21216@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071027231812.GA21216@lazybastard.org>
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> > We probably need to implement a release() operation in the
> > jffs2_dir_operations (top of dir.c), which will remove the fake
> > 'deletion' dirents if !atomic_read(&inode->i_count). Or something like
> > that.
> 
> I hate to spoil the fun, but this can cause problems with nfs.
> 
> It is legal for nfs to call telldir, close the directory, wait for half
> a year, then open the directory, call seekdir and expect sane results.
> Not pretty at all for filesystem implementors.
> 
> So either these deletion dirents need to stay around or you have to
> convert the i_pos "cookie" to a hash of the filename or so or at least
> explicitly document that you have broken nfs under some circumstances.
> 
> Of course any other program could do the telldir/seekdir stunt as well.
> Nfs just appears to be the only one doing this madness in practice.

Indeed.

However, I think it's fine to _overwrite_ the deletion dirents with
new ones.  getdentds() allows new names created during a directory
read to appear or not in the lsit.

Also, I think it's fine to _coalesce_ deletion dirents into one, as
long as the number of entries they represent is retained as a count.

If to, the number of deletion dirent structures could be bounded to be
no more than the number of active dirents.

In which case, perhaps the storage on flash needed for them could
simply be (at most) one integer per active dirent?  If that's
possible, it would provide the correct semantics for telldir/readdir
even across unmounts/reboots, without using much storage even in
pathological cases.

-- Jamie
