Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbJSi-0000Sn-Hx
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 00:16:41 +0000
Date: Tue, 29 Oct 2013 21:16:14 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 0/5] Assorted OMAP2 NAND clean-ups
Message-ID: <20131030001613.GB2527@localhost>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AE2A@DBDE04.ent.ti.com>
 <20131025114836.GD2489@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2BADF@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2BADF@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Pekon,

On Tue, Oct 29, 2013 at 08:14:34PM +0000, Gupta, Pekon wrote:
> 
> Sorry I'm bit out of my place.. so not able to sync often with mails..
> However plz see my replies below..
> 

Sure, no problem. Thanks for taking the time to discuss this!

[..]
> > 
> > You seem to think that GPMC + NAND should be able to automagically detect
> > the device and work, but I don't think that's even physically possible, for
> > the reasons you have just exposed.
> > 
> > I think this fix is simple enough.
> > 
> No, I still think there should be a way to tell the user that there is a
> mis-match between bus-width configured in DT, and that detected
> by ONFI probe. If it was straight forward, this would have been already
> accepted earlier :-)
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-October/049154.html
> 
> (read the comments from Brian by following above patch thread)
> 

Hmm... Well, I think your whole point of view is:

1. Mixing what's NAND controller and what's GPMC controller.
They are two different controllers, which means two different
drivers, and different parameters.

So from this perspective, trying to 'fix' GPMC configuration
from the NAND driver is a completely bad idea.

2. Trying to over-report the status to the user. The GPMC _must_
be properly configured before anything else. These NAND aren't plug
and play, so the 'user' knows the bus width anyway. If the user
has misconfigured the GPMC, then it's fine for things to not work.

Keep in mind the DT is not a configuration tool, but rather it's a
way to describe hardware. So, hardware parameters as bus width needs
to be properly described.

I've followed the above patch and, as far as I can read, Brian says: (quoting)

""
My opinion: the platform- and device-tree-provided buswidth is
unnecessary; it was previouisly only a suggestion which your driver
would readily discard, and it isn't really needed now. You can probably
get by with just NAND_BUSWIDTH_AUTO and (at most) a warning if the
auto-configured buswidth is different than the platform specified.

But the real point: you need to clearly communicate what you are
choosing in this patch. Either you want to

 (1) strictly follow the buswidth provided by the platform or

 (2) use the nand_base.c BUSWIDTH_AUTO automatic configuration.

Trying to mix both (as your patch currently does) just makes
everything worse.
""

Note that, in the above, Brian is talking about the NAND buswidth,
(not the GPMC). As he suggests, the proper thing to do is to simply
use BUSWIDTH_AUTO and discard any other parameter.

> > 
> > BTW: The GPMC code ignores the DT value in 'gpmc,device-width' and uses
> > 'nand-bus-width' instead, but that's a different bug and a different fix :)
> > 
> I think you mean the opposie.. GPMC driver uses gpmc,device-width..
> Refer: $KERNEL/arch/arm/mach-omap2/gpmc.c
> @@gpmc_read_settings_dt(...)
> 	of_property_read_u32(np, "gpmc,device-width", &p->device_width);
> 
> 'nand-bus-width' is not used anywhere instead..
> 

No, I meant just that: the current GPMC driver _ignores_ the DT value for
gpmc,device-width and overrides it with the 'nand-bus-width'.
See below for a stripped version of gpmc_nand_init():

int gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data,
		   struct gpmc_timings *gpmc_t)
{
[...]
		if (gpmc_nand_data->of_node) {
			gpmc_read_settings_dt(gpmc_nand_data->of_node, &s);
		} else {
			/* .... */
		}

		s.device_nand = true;

		if (gpmc_nand_data->devsize == NAND_BUSWIDTH_16)
			s.device_width = GPMC_DEVWIDTH_16BIT;
		else
			s.device_width = GPMC_DEVWIDTH_8BIT;
}

The code first reads 'device_width' from gpmc_read_settings_dt(), and then
overrides it with the NAND buswidth value! Once again, the above repeats
the 'mixing parameter' scheme you are suggesting.

(I've already submitted a patchset fixing this. See here:
http://www.spinics.net/lists/arm-kernel/msg282594.html)

I think our current discussion can be summarized as this:

  * Should we fix the GPMC buswidth configuration, using the
    auto-detected NAND buswidth?

IMO, the answer is "NO!", as it results in fucked-up design.

But it's a _design_ choice, there's no technical reason why you can't
export some GPMC configuration function and call it from the driver.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
