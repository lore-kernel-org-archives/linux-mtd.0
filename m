From: "Mohammed, Afzal" <afzal@ti.com>
To: "Hunter, Jon" <jon-hunter@ti.com>
Subject: RE: [PATCH v4 01/39] ARM: OMAP2+: gpmc: driver conversion
Date: Mon, 7 May 2012 11:01:02 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E987147@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <363273a9ef82d6836197929157aa9a8eb8f5171a.1335874494.git.afzal@ti.com>
 <4FA4035E.6020308@ti.com>
In-Reply-To: <4FA4035E.6020308@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Hilman, Kevin" <khilman@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Balbi,
 Felipe" <balbi@ti.com>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "Hiremath,
 Vaibhav" <hvaibhav@ti.com>,
 "vimal.newwork@gmail.com" <vimal.newwork@gmail.com>,
 "grinberg@compulab.co.il" <grinberg@compulab.co.il>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "notasas@gmail.com" <notasas@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jon,

On Fri, May 04, 2012 at 21:57:10, Hunter, Jon wrote:
> > -	gpmc_write_reg(GPMC_SYSCONFIG, l);
> > -	gpmc_mem_init();
> > +	switch (conf & GPMC_WAITPIN_MASK) {
> > +	case GPMC_WAITPIN_0:
> > +		idx =3D  GPMC_WAITPIN_IDX0;
> > +		break;
> > +	case GPMC_WAITPIN_1:
> > +		idx =3D  GPMC_WAITPIN_IDX1;
> > +		break;
> > +	case GPMC_WAITPIN_2:
> > +		idx =3D  GPMC_WAITPIN_IDX2;
> > +		break;
> > +	case GPMC_WAITPIN_3:
> > +		idx =3D  GPMC_WAITPIN_IDX3;
> > +		break;
> > +	/* no waitpin */
> > +	case 0:
> > +		break;
> > +	default:
> > +		dev_err(gpmc->dev, "multiple waitpins selected on CS:%u\n", cs);
> > +		return -EINVAL;
> > +		break;
> > +	}
>=20
> Why not combined case 0 and default? Both are invalid configurations so
> just report invalid selection.

Case 0 is not invalid, a case where waitpin is not used, default refers
to when a user selects multiple waitpins wrongly.

>=20
> > =20
> > -	/* initalize the irq_chained */
> > -	irq =3D OMAP_GPMC_IRQ_BASE;
> > -	for (cs =3D 0; cs < GPMC_CS_NUM; cs++) {
> > -		irq_set_chip_and_handler(irq, &dummy_irq_chip,
> > -						handle_simple_irq);
> > -		set_irq_flags(irq, IRQF_VALID);
> > -		irq++;
> > +	switch (conf & GPMC_WAITPIN_POLARITY_MASK) {
> > +	case GPMC_WAITPIN_ACTIVE_LOW:
> > +		polarity =3D LOW;
> > +		break;
> > +	case GPMC_WAITPIN_ACTIVE_HIGH:
> > +		polarity =3D HIGH;
> > +		break;
> > +	/* no waitpin */
> > +	case 0:
> > +		break;
> > +	default:
> > +		dev_err(gpmc->dev, "waitpin polarity set to low & high\n");
> > +		return -EINVAL;
> > +		break;
> >  	}
>=20
> Again, combine case 0 and default as these are invalid.

Similar to above

>=20
> > +		if (gd->have_waitpin) {
> > +			if (gd->waitpin !=3D idx ||
> > +					gd->waitpin_polarity !=3D polarity) {
> > +				dev_err(gpmc->dev, "error: conflict: waitpin %u with polarity %d o=
n device %s.%d\n",
> > +					gd->waitpin, gd->waitpin_polarity,
> > +					gd->name, gd->id);
> > +				return -EBUSY;
> > +			}
> > +		} else {
>=20
> Don't need the else as you are going to return in the above.

Not always, only in case of error

>=20
> > +			gd->have_waitpin =3D true;
> > +			gd->waitpin =3D idx;
> > +			gd->waitpin_polarity =3D polarity;
> > +		}
> > +
> > +		l &=3D ~GPMC_CONFIG1_WAIT_PIN_SEL_MASK;
> > +		l |=3D GPMC_CONFIG1_WAIT_PIN_SEL(idx);
> > +		gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, l);
> > +	} else if (polarity) {
> > +		dev_err(gpmc->dev, "error: waitpin polarity specified with out wait =
pin number on device %s.%d\n",
> > +							gd->name, gd->id);
> > +		return -EINVAL;
>=20
> Drop this else-if. The above switch statements will report the bad
> configuration. This seems a bit redundant.

This is required as switch statements will not report error if polarity
is specified, w/o waitpin to be used.

Regards
Afzal
