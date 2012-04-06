From: "Mohammed, Afzal" <afzal@ti.com>
To: "Hunter, Jon" <jon-hunter@ti.com>
Subject: RE: [PATCH v3 1/9] ARM: OMAP2+: gpmc: driver conversion
Date: Fri, 6 Apr 2012 06:52:03 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A9317C5E58@DBDE01.ent.ti.com>
References: <cover.1333640054.git.afzal@ti.com>
 <cefbe934da40f0a169b1e3a75c46451e5546a8bd.1333640054.git.afzal@ti.com>
 <4F7DFED5.4030000@ti.com>
In-Reply-To: <4F7DFED5.4030000@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Hilman, Kevin" <khilman@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hiremath,
 Vaibhav" <hvaibhav@ti.com>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "vimal.newwork@gmail.com" <vimal.newwork@gmail.com>,
 "grinberg@compulab.co.il" <grinberg@compulab.co.il>,
 "mike@compulab.co.il" <mike@compulab.co.il>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jon,

On Fri, Apr 06, 2012 at 01:51:41, Hunter, Jon wrote:
> > +struct gpmc_irq	{
> > +	unsigned		irq;
> > +	u32			regval;
>=20
> Are you using regval to indicate the bit-mask? If so, maybe call it=20
> "bitmask" instead.

Yes, bitmask would be better.

> > +			switch (gpmc->irq[i].regval) {
> > +			case GPMC_IRQ_WAIT0EDGEDETECTION:
> > +			case GPMC_IRQ_WAIT1EDGEDETECTION:
> > +			case GPMC_IRQ_WAIT2EDGEDETECTION:
> > +			case GPMC_IRQ_WAIT3EDGEDETECTION:
> > +				val =3D __ffs(gpmc->irq[i].regval);
> > +				val -=3D __ffs(GPMC_IRQ_WAIT0EDGEDETECTION);
> > +				gpmc_cs_configure(cs->cs,
> > +					GPMC_CONFIG_WAITPIN, val);
>=20
> Why is the configuration of the wait pin done here? It is possible to=20
> use the wait pin may be used without enabling the interrupt.
>=20
> Where do you handle allocating the wait pins to ensure two devices don't=
=20
> attempt to use the same one? Like how the CS are managed.
>=20
> Also, where you you configure the polarity of the wait pins? I would=20
> have thought it would make sense to have the wait pin configured as part=
=20
> of the cs configuration.

I will revisit waitpin configurations.

> > +	for (i =3D 0, j =3D 0, cs =3D gdp->cs_data; i<  gdp->num_cs; cs++, i+=
+) {
> > +		dev->gpmc_res[j] =3D gpmc_setup_cs_mem(cs, gdp, gpmc);
> > +		if (dev->gpmc_res[j++].flags&  IORESOURCE_MEM)
> > +			j +=3D gpmc_setup_cs_irq(gpmc, gdp, cs,
> > +						dev->gpmc_res + j);
> > +		else {
> > +			dev_err(gpmc->dev, "error: setup for %s\n", gdp->name);
> > +			devm_kfree(gpmc->dev, dev->gpmc_res);
> > +			dev->gpmc_res =3D NULL;
> > +			dev->num_gpmc_res =3D 0;
> > +			return -EINVAL;
> > +		}
> >   	}
>=20
> This section of code is not straight-forward to read. I see what you are=
=20
> doing, but I am wondering if this could be improved.
>=20
> First of all, returning a structure from a function is making this code=20
> harder to read. Per the CodingStyle document in the kernel, it is=20
> preferred for a function to return success or failure if the function is=
=20
> an action, like a setup.
>=20
> Secondly, do you need to pass cs, gdp and gpmc to gpmc_setup_cs_mem()?=20
> It appears that gdp and gpmc are only used for prints. You could=20
> probably avoid passing gdp and move the print to outside this function.

This section will be modified to make it clearer.

> > +	if (gpmc->num_irq<  GPMC_NR_IRQ) {
> > +		dev_warn(gpmc->dev, "Insufficient interrupts for device\n");
> > +		return -EINVAL;
> > +	} else if (gpmc->num_irq>  GPMC_NR_IRQ)
> > +		gpmc->num_irq =3D GPMC_NR_IRQ;
>=20
> Hmmm ... why not just have ...
>=20
> 	if (gpmc->num_irq !=3D GPMC_NR_IRQ) {
> 		dev_warn(...);
> 		return -EINVAL;
> 	}

This will cause irq setup to fail if num_irq > GPMC_NR_IRQ, even though
irq setup could have been done w/o any problem, only because platform
indicated willingness to accommodate more number of interrupts than
actually required for this device.

> This also raises the question why bother passing num_irq if we always=20
> want it to be GPMC_NR_IRQ? Why not always initialise them all driver?

Because num_irq (or available irqs for fictitious irq chip) is platform spe=
cific.

> > +	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > +	if (res =3D=3D NULL)
> > +		dev_warn(gpmc->dev, "Failed to get resource: irq\n");
> > +	else
> > +		gpmc->master_irq =3D res->start;
>=20
> Why not return an error if the IRQ is not found? We don't know if anyone=
=20
> will be trying to use them.

Why do you want to do that ?

If someone (say NAND) wants to work with irq, and if interrupt is not
available, NAND driver can fail, and suppose smsc911x ethernet is present
and he is not using gpmc irq, if we fail here, smsc911x also would
not work, which would have worked otherwise.

It is a different matter that even NAND setup will happen properly,
even if interrupt is not available, it is only when NAND is told to
work with IRQ, it fails, please see nand patches.

And as of now in mainline (with the code as is), there is not a single
board that will need gpmc irq for gpmc peripherals to work.

I feel we should try to get more devices working rather than preventing
more devices from working, when it could have.

> > +	for (gdq =3D gp->device_pdata, gd =3D gpmc->device; *gdq; gdq++, i++)=
 {
> > +		ret =3D gpmc_setup_device(*gdq, gd, gpmc);
> > +		if (IS_ERR_VALUE(ret))
> > +			dev_err(gpmc->dev, "gpmc setup on %s failed\n",
> > +								(*gdq)->name);
> > +		else
> > +			gd++;
> > +	}
>=20
> Would a while loop be simpler?

My preference is to go with "for"

>=20
> The above loop appears to terminate when *gdq =3D=3D 0. Is this always=20
> guaranteed? In other words, safe?

This is a standard idiom for array of pointers

>=20
> I see that "i" is not being used in the above loop either.

That was left over code, it will be removed.

> > +struct gpmc_cs_data {
> > +	unsigned		cs;
> > +	unsigned long		mem_size;
> > +	unsigned long		mem_start;
> > +	unsigned long		mem_offset;
> > +	struct gpmc_config	*config;
> > +	unsigned		num_config;
> > +	struct gpmc_timings	*timing;
> > +	unsigned		irq_flags;
>=20
> I found the name irq_flags a bit unclear. This appears to be a mask for=20
> the interrupts used. So may be this should be "irq_mask" or just "irqs".

Probably, this confusion arose as an attempt was made to club irq bit field=
s
with irq capability, so as to reduce additional macro definitions.

Here my preference is to keep irq_flags (or can be irq_capabilities), defin=
e
a new set of macros, and use bitmask in struct gpmc_irq

Thanks for the comments.

Regards
Afzal
