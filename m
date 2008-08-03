Received: from mx1.suse.de ([195.135.220.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KPcCc-0002bZ-Bt
	for linux-mtd@lists.infradead.org; Sun, 03 Aug 2008 11:56:46 +0000
From: Neil Brown <neilb@suse.de>
To: "J. Bruce Fields" <bfields@fieldses.org>
Date: Sun, 3 Aug 2008 21:56:34 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <18581.40178.976747.769343@notabene.brown>
Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
In-Reply-To: message from J. Bruce Fields on Saturday August 2
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
Cc: linux-nfs@vger.kernel.org, chucklever@gmail.com,
	Christoph Hellwig <hch@infradead.org>,
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

On Saturday August 2, bfields@fieldses.org wrote:
> 
> Though really I can't see any great objection to just moving xfs's hack
> up into nfsd.  It may not do everything, but it seems like an
> incremental improvement.

Because it is a hack, and hacks have a tendency to hide deeper
problems, and not be ever get cleaned up and generally to become a
burden to future generations.

However if you do go down that path, can I suggest:

 1/ get rid of the word "hack" throughout the code.  If you think it
    is sensible, make it appear sensible.
 2/ drop the "retry malloc of a smaller size" thing. 
    In fact, you can probably use one of the set of pages that has
    been reserved for the request.  It is very rare that a readdir
    request will be as big as the largest read.
 3/ Make the new way unconditional.  That gives it broader test
    coverage which can only be a good thing.  And what is good for the
    goose is good for the gander... (not that I'm calling anyone a
    goose).


But I still prefer the O_READDIRPLUS approach.

NeilBrown
