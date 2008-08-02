Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
In-Reply-To: <20080802182644.GE30454@fieldses.org>
References: <18578.21997.529551.676627@notabene.brown>
	<1217551230.3719.15.camel@shinybook.infradead.org>
	<76bd70e30807311753m2785c6d3kd82edd1fe8b5f8b7@mail.gmail.com>
	<1217552437.3719.30.camel@shinybook.infradead.org>
	<76bd70e30807311831p771d0f1eia3e303bd84919422@mail.gmail.com>
	<1217597759.3454.356.camel@pmac.infradead.org>
	<1217598976.3454.359.camel@pmac.infradead.org>
	<76bd70e30808010905j3010a6bfy534c068a662d348d@mail.gmail.com>
	<1217607571.3454.417.camel@pmac.infradead.org>
	<76bd70e30808011047u3cd0a56cg3b2d62e01afed014@mail.gmail.com>
	<20080802182644.GE30454@fieldses.org>
Content-Type: text/plain
Date: Sat, 02 Aug 2008 21:42:32 +0100
Message-Id: <1217709752.2500.5.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-nfs@vger.kernel.org, chucklever@gmail.com, Neil Brown <neilb@suse.de>,
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

On Sat, 2008-08-02 at 14:26 -0400, J. Bruce Fields wrote:
> Could you add a readdirplus vfs operation which took a flag indicating
> how much extra information you're going to need?

Actually, if we're screwing with readdir then xfs would like to know how
much it's going to be asked to read, rather than just have the filldir
callback return zero when it's done.

> The three cases where readdir can be called are:
>         - ordinary readdir, for which the existing filldir_t provides
>           all the information needed.
>         - nfsv3 readdirplus, where the only additional information
>           needed is whether there's a mountpoint.

It also wants a file handle. For which I think it just needs
i_generation in addition to the information it already has.

>         - nfsv4 readdir, where we may need all the stat info, acls,
>           etc., etc.

We _might_, but most of the time we won't. It might be OK to fall back
to the existing double-buffer hack for the cases where we _do_ need that
extra information.

I think a ->lookup_fh() method (which _expects_ to be called from within
filldir, and hence does its locking automatically) is the way to go.

One alternative might just be a full lookup method with the same locking
rules: ->lookup_locked(). That might be easier to implement, and would
solve the problem even for the corner cases of NFSv4. Although I still
think we'd do best to avoid populating the inode cache with _all_
children when we do a readdirplus. 

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
