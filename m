Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZ68h-0002vP-Hm
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 09:02:41 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IYD00I2JTK9JI70@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 09:02:34 -0400 (EDT)
Date: Thu, 27 Apr 2006 09:02:33 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <445081B4.8070801@intel.com>
To: Alexander Belyakov <alexander.belyakov@intel.com>
Message-id: <Pine.LNX.4.64.0604270859130.18816@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
	<445081B4.8070801@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 Apr 2006, Alexander Belyakov wrote:

> Nicolas Pitre wrote:
> > 
> > That won't work with Sibley.
> > 
> 
> It does work for Sibley. I've checked it for both NAND and Sibley before
> posting.
> 
> > Sibley flash must write everything all at once with
> > a single writev call.
> > 
> 
> Not sure what did you  mean by that. But I should say that concat_writev()
> function does writes by page-sized chunks even if one vector entry has size
> less than one page. Function just "glues" it with the next vector entry (or
> its part) if any. So there are no writes with size less than pagesize, except
> first and last pages if we have unaligned data in downcoming vector.

Which means you have to copy data into your page, which is against the 
point of writev().  If you're copying data into a separate page in order 
to use write() then JFFS2 could simply do it itself and writev() 
eliminated entirely.


Nicolas
