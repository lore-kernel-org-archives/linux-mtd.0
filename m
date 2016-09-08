Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhuBe-0007Xj-Py
 for linux-mtd@lists.infradead.org; Thu, 08 Sep 2016 07:56:23 +0000
Date: Thu, 8 Sep 2016 09:55:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/7] mtd: nand: automate NAND timings selection
Message-ID: <20160908075530.e4o2gecxxlmedtlx@pengutronix.de>
References: <1473250902-31139-1-git-send-email-s.hauer@pengutronix.de>
 <1473250902-31139-4-git-send-email-s.hauer@pengutronix.de>
 <20160907154114.1aae0462@bbrezillon>
 <20160907143615.cholyvh6zyk7rnfj@pengutronix.de>
 <20160907165951.51f15505@bbrezillon>
 <20160907175917.2a4791d3@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160907175917.2a4791d3@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 07, 2016 at 05:59:17PM +0200, Boris Brezillon wrote:
> On Wed, 7 Sep 2016 16:59:51 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Wed, 7 Sep 2016 16:36:15 +0200
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > 
> > > Ok, I think now we are understanding each other. So I keep two timing
> > > instances in struct nand_chip, one for initialization and one optimized
> > > timing. They both get initialized once during chip detection and can be
> > > reused when needed.  
> > 
> > Hm, not sure we need to keep 2 instances around, all we need to save is
> > the 'best_onfi_timing_mode', or we can just update
> > ->default_onfi_timing_mode based on the result of the timing mode  
> > detection, so that, when nand_setup_data_interface() is called, all we
> > have to do is:
> > 
> > 	conf = chip->data_iface_conf;
> > 	conf->type = NAND_SDR_IFACE,
> > 	conf->timings.sdr = *onfi_async_timing_mode_to_sdr_timings(chip->default_onfi_timing_mode);
> > 	chip->setup_data_interface(mtd, conf, false);
> > 
> 
> After the discussion we had on IRC, I want to reconsider what I said.
> How about having a global nand_default_data_iface_config that would
> work will all chips (probably exposing mode 0 timings and an SDR
> interface).
> This one will be used even for DDR NANDs, because after a reset they
> return back to SDR mode, timing mode 0.
> 
> Now, I keep thinking that other timing modes should not be directly
> exposed.

sounds good. How do you think the default iface_config should be
exposed? Should I turn the onfi_sdr_timings array to struct
nand_data_interface like done before and add a accessor function for the
first element, something like:

const struct nand_data_interface *nand_default_data_interface(void);

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
