Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCkiF-0003um-QH
 for linux-mtd@lists.infradead.org; Thu, 31 Jul 2014 07:23:44 +0000
Received: by mail-pa0-f50.google.com with SMTP id et14so3065215pad.23
 for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2014 00:23:21 -0700 (PDT)
Date: Thu, 31 Jul 2014 00:23:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: Re: [PATCH RFC v4 3/4] nand: pl353: Add ONDIE ECC support
Message-ID: <20140731072317.GI11952@brian-ubuntu>
References: <1406561500-18264-1-git-send-email-punnaia@xilinx.com>
 <27fce982-6598-44a0-ad80-c13d02a952ee@BN1AFFO11FD042.protection.gbl>
 <20140731070643.GG11952@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140731070643.GG11952@brian-ubuntu>
Cc: mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, arnd@arndb.de,
 svemula@xilinx.com, michal.simek@xilinx.com,
 ezequiel.garcia@free-electrons.com, grant.likely@linaro.org,
 devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, anirudh@xilinx.com, joern@logfs.org,
 kpc528@gmail.com, robh+dt@kernel.org, acourbot@nvidia.com, pekon@ti.com,
 kalluripunnaiahchoudary@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org,
 ivan.khoronzhuk@ti.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 31, 2014 at 12:06:43AM -0700, Brian Norris wrote:
> On Mon, Jul 28, 2014 at 09:01:39PM +0530, Punnaiah Choudary Kalluri wrote:
> > +/* Generic flash bbt decriptors */
> > +static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
> > +static uint8_t mirror_pattern[] = { '1', 't', 'b', 'B' };
> > +
> > +static struct nand_bbt_descr bbt_main_descr = {
> > +	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> > +		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> > +	.offs = 4,
> > +	.len = 4,
> > +	.veroffs = 20,
> > +	.maxblocks = 4,
> > +	.pattern = bbt_pattern
> > +};
> > +
> > +static struct nand_bbt_descr bbt_mirror_descr = {
> > +	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> > +		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> > +	.offs = 4,
> > +	.len = 4,
> > +	.veroffs = 20,
> > +	.maxblocks = 4,
> > +	.pattern = mirror_pattern
> > +};
> 
> Why do you need a custom BBT descriptor? It's much better to use the
> standard ones. Perhaps you just want the NAND_BBT_NO_OOB_BBM option, so
> you get the bbt_{main,mirror}_no_oob_descr structs from nand_bbt.c.

I see you answered this:

 http://lists.infradead.org/pipermail/linux-mtd/2014-April/053451.html

That's unfortunate.

Brian
