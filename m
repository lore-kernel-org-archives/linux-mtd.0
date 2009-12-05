Received: from openfortress.nl ([213.189.19.244] helo=fame.vanrein.org)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGyip-0008AL-5E
	for linux-mtd@lists.infradead.org; Sat, 05 Dec 2009 17:47:11 +0000
Date: Sat, 5 Dec 2009 17:47:02 +0000
From: Rick van Rein <rick@groengemak.nl>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Flash I/O not enabled in MSR_DIVIL_BALL_OPTS
Message-ID: <20091205174702.GA3240@phantom.vanrein.org>
References: <20091130084004.GE23351@phantom.vanrein.org>
	<1259777470.3744.484.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1259777470.3744.484.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Rick van Rein <rick@groengemak.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

> If you have the NAND hardware connected, then surely your firmware ought
> to be setting the MSRs appropriately?

I broken open a bit more hardware and found an ATA-to-flash interface
between companion chip and flashes.  Sigh, instead of 100 MB/s I am now
limited to 2.4 MB/s and cannot employ this wonderful direct-NAND-stuff.

Thanks for responding though!

-Rick
