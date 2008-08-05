Received: from ipmail04.adl2.internode.on.net ([203.16.214.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQIGy-0000ex-0G
	for linux-mtd@lists.infradead.org; Tue, 05 Aug 2008 08:52:06 +0000
Date: Tue, 5 Aug 2008 18:51:57 +1000
From: Dave Chinner <david@fromorbit.com>
To: chucklever@gmail.com
Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
Message-ID: <20080805085157.GG21635@disturbed>
References: <1217597759.3454.356.camel@pmac.infradead.org>
	<1217598976.3454.359.camel@pmac.infradead.org>
	<76bd70e30808010905j3010a6bfy534c068a662d348d@mail.gmail.com>
	<1217607571.3454.417.camel@pmac.infradead.org>
	<76bd70e30808011047u3cd0a56cg3b2d62e01afed014@mail.gmail.com>
	<20080802182644.GE30454@fieldses.org>
	<18581.40178.976747.769343@notabene.brown>
	<76bd70e30808031015l36db41bexf319e85ba7acc4e9@mail.gmail.com>
	<18582.21855.2092.903688@notabene.brown>
	<76bd70e30808032319u65e35dbdj9cc5be07e1aef829@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76bd70e30808032319u65e35dbdj9cc5be07e1aef829@mail.gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org,
	Neil Brown <neilb@suse.de>, "J. Bruce Fields" <bfields@fieldses.org>,
	linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 04, 2008 at 02:19:12AM -0400, Chuck Lever wrote:
> So, the JFFS2 locking problem is a garbage-collection issue.  I'm not
> sure this is the case with other file systems like XFS and OCFS2.  My
> impression was that XFS had a transaction logging deadlock,

Just to clarify - XFS has a directory buffer lock deadlock. That is,
while reading the contents of the directory buffer it is locked to
prevent modifications from occurring while extracting the contents.
Looking up an entry in the directory also requires the directory
buffer lock (for the same reason), so calling the lookup while
already holding the directory buffer lock (i.e from the filldir
callback) will deadlock.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
