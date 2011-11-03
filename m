Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RLvx3-0007dF-PP
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2011 11:59:22 +0000
Date: Thu, 3 Nov 2011 12:59:15 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
Message-ID: <20111103115914.GA30600@parrot.com>
References: <1388924089.4520961320317174391.JavaMail.root@zimbra20-e3.priv.proxad.net>
	<333650967.4523301320318131386.JavaMail.root@zimbra20-e3.priv.proxad.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <333650967.4523301320318131386.JavaMail.root@zimbra20-e3.priv.proxad.net>
Cc: Mike Dunn <mikedunn@newsguy.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 03, 2011 at 11:02:11AM +0000, Robert Jarzmik wrote:
> > I can see two cleaner alternatives to solve this issue:
> >
> > 1. When you program a page, before writing hwecc to oob, adjust it like this:
> > 2. Use unprotected spare oob byte 15 as a programmming marker: remove it from
> > ...zip...
> 
> I would see a third one:
> 3. After reading the page, check bit DOC_ECCCONF1_PAGE_IS_WRITTEN in DOC_ECCCONF1 register.
>    I think this bit is calculated from the Hamming Code (not sure), but I'm pretty sure that
>    this bit is 0 when the page is blank, and 1 if the page was written before.
> 

OK, that's even simpler.
But as Matthieu pointed out, you would still need to clean-up bitflips in blank
pages for UBIFS...

BR,
--
Ivan
