Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6isZ-0000Tu-VM
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 15:08:56 +0000
Message-ID: <1375802039.30770.153.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 04/25] mtd: nand: gpmi-nand: janitorial cleanup: (commas
 after last element of struct initializer)
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Date: Tue, 06 Aug 2013 18:13:59 +0300
In-Reply-To: <20985.63269.929367.546435@ipc1.ka-ro>
References: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
 <1375279887-17928-2-git-send-email-LW@KARO-electronics.de>
 <51F9C4C2.8040403@freescale.com> <20985.63269.929367.546435@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-08-01 at 07:50 +0200, Lothar Waßmann wrote:
> Hi,
> 
> Huang Shijie writes:
> > 于 2013年07月31日 22:11, Lothar Waßmann 写道:
> > > Signed-off-by: Lothar Waßmann<LW@KARO-electronics.de>
> > > ---
> > >   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 ++++----
> > >   1 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > index f557a1d..4f7ec59 100644
> > > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > > @@ -1569,19 +1569,19 @@ static const struct platform_device_id gpmi_ids[] = {
> > >   	{ .name = "imx23-gpmi-nand", .driver_data = IS_MX23, },
> > >   	{ .name = "imx28-gpmi-nand", .driver_data = IS_MX28, },
> > >   	{ .name = "imx6q-gpmi-nand", .driver_data = IS_MX6Q, },
> > > -	{},
> > > +	{}
> > >   };
> > >
> > >   static const struct of_device_id gpmi_nand_id_table[] = {
> > >   	{
> > >   		.compatible = "fsl,imx23-gpmi-nand",
> > > -		.data = (void *)&gpmi_ids[IS_MX23]
> > > +		.data = (void *)&gpmi_ids[IS_MX23],
> > >   	}, {
> > >   		.compatible = "fsl,imx28-gpmi-nand",
> > > -		.data = (void *)&gpmi_ids[IS_MX28]
> > > +		.data = (void *)&gpmi_ids[IS_MX28],
> > >   	}, {
> > >   		.compatible = "fsl,imx6q-gpmi-nand",
> > > -		.data = (void *)&gpmi_ids[IS_MX6Q]
> > > +		.data = (void *)&gpmi_ids[IS_MX6Q],
> > >   	}, {}
> > >   };
> > >   MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
> > is it any bad influence if we do not apply this patch?
> > 
> > I am not clear what we can benefit from this patch.
> > 
> less eye sore when looking at the code and eventual copies of it in
> other places.

For some reasons I do not have these patches in my mailbox. Would you
please re-send them, and add the acks there too?

-- 
Best Regards,
Artem Bityutskiy
