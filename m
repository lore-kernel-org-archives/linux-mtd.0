Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMyXt-0002hC-Rj
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 11:39:03 +0000
Message-ID: <1394451471.6627.10.camel@weser.hi.pengutronix.de>
Subject: Re: [linux-sunxi] Re: [RFC PATCH v2 08/14] mtd: nand: add sunxi
 NAND flash controller support
From: Lucas Stach <l.stach@pengutronix.de>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Date: Mon, 10 Mar 2014 12:37:51 +0100
In-Reply-To: <531D9F4B.6040505@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-9-git-send-email-b.brezillon.dev@gmail.com>
 <20140129175641.GF1427@obsidianresearch.com>
 <20140129184619.GC27143@localhost>
 <20140129191005.GG1427@obsidianresearch.com> <531D9F4B.6040505@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-sunxi@googlegroups.com, linux-mtd@lists.infradead.org,
 Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, den 10.03.2014, 12:17 +0100 schrieb Boris BREZILLON:
> Hello Jason,
> 
> Le 29/01/2014 20:10, Jason Gunthorpe a écrit :
> > On Wed, Jan 29, 2014 at 03:46:20PM -0300, Ezequiel Garcia wrote:
> >
> >> After CE# has been pulled high and then transitioned low again, the host
> >> should issue a Set Features to select the appropriate asynchronous timing mode.
> >> """
> > Oh, I had forgot you should do a set feature too
> >
> > Boris, I think the core core should handle this dance and the driver
> > should just implement a call back to change the timing mode on the
> > interface..
> >
> > If I ever get a moment I can work on support for timing setting in the
> > mvebu driver, I have boards here with ONFI NAND..
> 
> Any progress on this ?
> I'm about to post the 3rd version of this series and if you already have
> something working I could base my work on your proposal.
> 

I'm also interested in seeing this moving forward. I'm currently porting
the Tegra NAND drive to mainline and at least the OF ONFI mode and ONFI
mode to timing converter parts of this series are really helpful.

Regards,
Lucas
-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
