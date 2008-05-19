Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JxzIL-0004rD-Ip
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 06:56:29 +0000
Date: Mon, 19 May 2008 16:56:23 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: ext2 for read-only file system on UBI
Message-ID: <20080519065623.GA17246@cloud.net.au>
References: <20080519062149.GA16462@cloud.net.au>
	<1211179073.27243.22.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1211179073.27243.22.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, thanks for your response.

On Mon, May 19, 2008 at 09:37:53AM +0300, Artem Bityutskiy wrote:
> On Mon, 2008-05-19 at 16:21 +1000, Hamish Moffatt wrote:
> > My embedded device has a read-only root file system which is only
> > replaced by writing a whole image (dd, flashcp, ubiupdatevol etc).
> > 
> > Using gluebi and mtdblock, I think I can put a traditional block file
> > system (eg ext2) on top of NAND flash. What are the disadvantages of
> > this? (For the read-only application only.)
> 
> For read-only it should be ok, although I am not sure mtdblock will like
> non power of 2 eraseblock sizes. But this should be trivial to fix.
> 
> > Background: I've got older hardware which uses ext2 on top of compact
> > flash in IDE mode, and new hardware which has replaced the compact flash
> > with NAND. I'd like to share an ext2 image between the two if possible.
> 
> Should be possible for R/O. Different sizes of eraseblocks may add extra
> work though.
> 
> > The read-write file systems use ubifs. I'm only considering this for the
> > read-only volumes. One obvious disadvantage is lack of compression. Are
> > there others? Do I still get the reliability of ubi? 
> 
> No, should be fine. Well, you'll still have WL across whole NAND chip,
> yes. You'll still have bit-flip handling.

So, is there a benefit to Nancy's proposed ubi block layer as opposed to
gluebi + mtdblock?
( http://lists.infradead.org/pipermail/linux-mtd/2008-May/021609.html )

regards
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
