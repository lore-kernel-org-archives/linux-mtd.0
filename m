Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScXoQ-00073V-MZ
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 08:11:24 +0000
Date: Thu, 7 Jun 2012 09:11:08 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
Message-ID: <20120607081108.GO8262@n2100.arm.linux.org.uk>
References: <1338974414-5308-1-git-send-email-stigge@antcom.de>
 <1338989921.6875.50.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1338989921.6875.50.camel@sauron.fi.intel.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com, lars@metafoo.de,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 06, 2012 at 04:38:41PM +0300, Artem Bityutskiy wrote:
> On Wed, 2012-06-06 at 11:20 +0200, Roland Stigge wrote:
> > +#else
> > +#define lpc32xx_nand_resume NULL
> > +#define lpc32xx_nand_suspend NULL
> > +#endif
> 
> 0, not NULL.

Err, what planet are you on there.  These are _pointers_ to functions,
so using a _pointer_ is more correct than using an _integer_.
