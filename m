Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: Neil Brown <neilb@suse.de>
In-Reply-To: <18578.21997.529551.676627@notabene.brown>
References: <1209670979.25560.587.camel@pmac.infradead.org>
	<20080501204820.GA5951@infradead.org>
	<1209681898.25560.613.camel@pmac.infradead.org>
	<18458.28833.539314.455215@notabene.brown>
	<1217541264.1126.15.camel@shinybook.infradead.org>
	<18578.21997.529551.676627@notabene.brown>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 01:40:30 +0100
Message-Id: <1217551230.3719.15.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-01 at 10:16 +1000, Neil Brown wrote:
> On Thursday July 31, dwmw2@infradead.org wrote:
> > On Fri, 2008-05-02 at 11:38 +1000, Neil Brown wrote:
> > > Why is there a deadlock here?
> 
> I was really hoping you would answer this question.

It's because the nfsd readdirplus code recurses into the file system.
>From the file system's ->readdir() function we call back into nfsd's
encode_entry(), which then calls back into the file system's ->lookup()
function so that it can generate a filehandle.

For any file system which has its own internal locking -- which includes
jffs2, btrfs, xfs, jfs, gfs*, ocfs* and probably others -- that
recursive call back into the file system will deadlock.

In the specific case of JFFS2, we need that internal locking because of
lock ordering constraints with the garbage collection -- we need to take
the allocator lock _before_ the per-inode lock, which means we can't use
the generic inode->i_mutex for that purpose. That's documented in
fs/jffs2/README.Locking. I know fewer details about the other affected
file systems.

> I can see the sense in your approach, but it does still seem a bit
> hackish.  I would like to understand the details of the problem enough
> to be confident that there is no less-hackish solution.

I was thinking that we could perhaps get away with an extension to
readdir() that passes the filehandle to its filldir callback too. I'm
not sure if that's sufficient for NFS4 though.

Perhaps we could add a ->lookup_fh() method which is guaranteed to be
called _only_ from within ->readdir(), so it can have (or _lack_) the
appropriate locking.

For now though, this approach moves the problem into the nfsd code where
it belongs -- the VFS never calls into the file system recursively like
this, in the general case.

-- 
dwmw2
