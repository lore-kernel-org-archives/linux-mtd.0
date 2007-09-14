Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IWAgn-00047r-9h
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 08:54:34 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l8ECoshF021596
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2007 08:50:54 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l8ECor8V412394
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2007 06:50:53 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l8ECorgM030544
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2007 06:50:53 -0600
Date: Fri, 14 Sep 2007 07:50:51 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: Increasing read request size in JFFS2
Message-ID: <20070914075051.3acd858d@weaponx.rchland.ibm.com>
In-Reply-To: <1189769907.14370.140.camel@sauron>
References: <8C9C4D8EE8B6B02-F08-232@webmail-mf13.sysops.aol.com>
	<1189769907.14370.140.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, payagond@aol.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 Sep 2007 14:38:27 +0300
Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Fri, 2007-09-14 at 07:24 -0400, payagond@aol.com wrote:
> > Hi,
> > I want to know, whether, we can exploit the fast sequential read 
> > (multiple pages at one go) feature of a nand flash device by existing 
> > JFFS2 code.
> > read_pages in readahead decides to call either 
> > mapping->a_ops->readpages or mapping->a_ops->readpage
> > can I implement jffs2_readpages to do so?
> > The problem I feel is (if I have understood correctly)
> > To read more pages at one shot, we need to anyway read the 
> > jffs2_raw_inode header first and then calculate the lenth to read, will 
> > it give me more performance than what is existing?
> > regards
> > payagond
> 
> JFFS2 reads maximum 3 2K NAND pages at a time, although very rarely.
> Mostly it reads one page if compression is enabled.

And isn't a performance gain only seen if the data is actually
in sequential pages on flash?  For fresh filesystems, that may be true.
But over time, the data for each individual file can scatter everywhere.

josh
