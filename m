Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: chucklever@gmail.com
In-Reply-To: <1217597759.3454.356.camel@pmac.infradead.org>
References: <1209670979.25560.587.camel@pmac.infradead.org>
	<20080501204820.GA5951@infradead.org>
	<1209681898.25560.613.camel@pmac.infradead.org>
	<18458.28833.539314.455215@notabene.brown>
	<1217541264.1126.15.camel@shinybook.infradead.org>
	<18578.21997.529551.676627@notabene.brown>
	<1217551230.3719.15.camel@shinybook.infradead.org>
	<76bd70e30807311753m2785c6d3kd82edd1fe8b5f8b7@mail.gmail.com>
	<1217552437.3719.30.camel@shinybook.infradead.org>
	<76bd70e30807311831p771d0f1eia3e303bd84919422@mail.gmail.com>
	<1217597759.3454.356.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 14:56:16 +0100
Message-Id: <1217598976.3454.359.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-nfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-01 at 14:36 +0100, David Woodhouse wrote:
> Those are needed by NFSv3 too -- and can be handled with a lookup_fh()
> method in the file system which is guaranteed to be called from within
> the filldir callback, and some support in the VFS for checking if it's a
> mountpoint.
> 
> NFSv4 introduces another problem though, which is that it seems to be
> able to return the _full_ getattr() results for each object, and there's
> no real way round the fact that we need to do the ->lookup() for that.
> 
> If sane clients aren't expected to _ask_ for that, though, then perhaps
> it would be OK to fall back to something like the existing
> readdir-to-buffer hack for that case, while most normal clients won't
> trigger it.

Or maybe we could just mask the offending attrs out of ->rd_bmval for
readdir calls, and say we don't support them? Would anyone scream if we
did that?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
