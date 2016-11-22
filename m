Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c98qf-0008Kc-PY
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 11:02:50 +0000
Date: Tue, 22 Nov 2016 12:02:27 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
Subject: Re: ONFI timing mode with onfi_set_features unsupported
Message-ID: <20161122110227.6m4waiv4odpl7qep@pengutronix.de>
References: <20161121132327.hup6bi7zqu54jsia@pengutronix.de>
 <20161121145104.376349f8@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161121145104.376349f8@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 21, 2016 at 02:51:04PM +0100, Boris Brezillon wrote:
> Hi Sascha,
> 
> On Mon, 21 Nov 2016 14:23:27 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > Hi all,
> > 
> > I have a i.MX6ul here with a Cypress S34ML04G2 connected. This Nand chip
> > has ONFI support, but onfi_set_features is unsupported (opt_cmd is
> > 0x3b). Currently the gpmi Nand driver calls nand_onfi_set_features(),
> > gets -EINVAL as error and continues with a very slow default timing.
> > 
> > I assume the nand_onfi_set_features() call is just unnecessary for this
> > chip, if I skip it, the chip works with the fast timing.
> > 
> > Any idea how to cope with this situation? I attached the most obvious
> > patch, but it looks a bit hackish. Any suggestions or is the patch fine
> > as is?
> 
> It looks good to me. Why do you find this code hackish?
> Of course, it would be even better to implement the
> ->setup_data_interface() method.

Indeed, but my current project doesn't allow to spend that much time at
the moment.

> 
> BTW, can you patch the core to only send the ->set_feature() command
> (to change the timings mode) when the chip supports it?

With hackish I mean that I think the problem should be solved in the
core. How about returning -EOPNOTSUPP from onfi_set_features() when the
operation is not supported? The caller could then decide what to do
without testing for bits in the onfi param page.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
