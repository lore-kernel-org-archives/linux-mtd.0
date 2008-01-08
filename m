Received: from az33egw01.freescale.net ([192.88.158.102])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JCIaq-0006Wc-DH
	for linux-mtd@lists.infradead.org; Tue, 08 Jan 2008 17:50:35 +0000
Date: Tue, 8 Jan 2008 11:48:09 -0600
From: Scott Wood <scottwood@freescale.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/4] nand base: Give drivers a chance to do late
	initialization.
Message-ID: <20080108174809.GB5188@loki.buserror.net>
References: <20071213171551.GA4459@loki.buserror.net>
	<1199779069.4111.379.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1199779069.4111.379.camel@shinybook.infradead.org>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 08, 2008 at 07:57:49AM +0000, David Woodhouse wrote:
> 
> On Thu, 2007-12-13 at 11:15 -0600, Scott Wood wrote:
> > Some nand controllers, such as the Freescale enhanced local bus controller,
> > need to do late initialization based on details of the chip that has been
> > probed, such as chip size, large/small pages, etc.  A late_init() callback
> > method is added to allow this.
> 
> Do you really need this so late? Can't it be done between
> nand_scan_ident() and nand_scan_tail()? That's why we split nand_scan()
> into two in the first place...

Yeah, that'd work.  I'll send an updated driver soon.

-Scott
