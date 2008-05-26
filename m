Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0jQZ-0003Pl-QP
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 20:36:20 +0000
Date: Mon, 26 May 2008 22:36:06 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: andrewm@isoar.ca
Subject: Re: Problem with Micron 256 MB NAND on 440EPx
Message-ID: <20080526203606.GA32041@mail.gnudd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <483B132D.80103@isoar.ca>
References: <483B132D.80103@isoar.ca>  <48079979.3030201@isoar.ca>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I've now verified with a logic analyzer that the NFREN strobe is active 
> during when NFRDYBSY is low (NAND chip is busy), and latching bogus data 
> as a result (the bus has pull-ups so 0xff).

I had a similar problem with the NDFC on an old kernel. I finally
tracked it down to a missing mb() (i.e. eieio on the ppc).  The
problem was triggered by DMA activity on the bus, but could also be
exposed by lowering NDFC speed.  The hw controller would thus check
the R/B* pin before the command reached the nand device, so it was not
busy (yet).  Since I was working with an old kernel and always tight
of time, I didn't check if the problem was still present in modern
code.

>From your description it looks like it's the same problem.
Back then, the fix was the following one on a 2.6.19.2 .

--- ./drivers/mtd/nand/ndfc.c	19 Mar 2007 09:53:08 -0000	1.1
+++ ./drivers/mtd/nand/ndfc.c	31 Aug 2007 15:40:48 -0000
@@ -76,6 +76,7 @@
 {
 	struct ndfc_controller *ndfc = &ndfc_ctrl;
 
+	wmb();
 	return __raw_readl(ndfc->ndfcbase + NDFC_STAT) & NDFC_STAT_IS_READY;
 }

Hope this helps
/alessandro
