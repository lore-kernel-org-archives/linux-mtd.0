Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy02S-0008Ju-Ui
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 07:44:09 +0000
Date: Mon, 19 May 2008 17:44:03 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: ext2 for read-only file system on UBI
Message-ID: <20080519074403.GA17911@cloud.net.au>
References: <20080519062149.GA16462@cloud.net.au>
	<1211179073.27243.22.camel@sauron>
	<20080519065623.GA17246@cloud.net.au>
	<1211180904.27243.27.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1211180904.27243.27.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 19, 2008 at 10:08:24AM +0300, Artem Bityutskiy wrote:
> On Mon, 2008-05-19 at 16:56 +1000, Hamish Moffatt wrote:
> > > No, should be fine. Well, you'll still have WL across whole NAND chip,
> > > yes. You'll still have bit-flip handling.
> > 
> > So, is there a benefit to Nancy's proposed ubi block layer as opposed to
> > gluebi + mtdblock?
> > ( http://lists.infradead.org/pipermail/linux-mtd/2008-May/021609.html )
> 
> Yes, her layer is assumed to be R/W block device.
> 
> You could want to glance here as well:
> 
> http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_ext2_over_ubi

Thanks for the links. So, read-write with mtdblock is dangerous
(regardless of UBI) because it must erase and rewrite a whole block,
right? Proposed ubiblk (linked from above) would use UBI ops to make the
update operation safe.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
