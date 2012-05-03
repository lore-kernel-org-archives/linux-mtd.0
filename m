From: "Mohammed, Afzal" <afzal@ti.com>
To: "Hunter, Jon" <jon-hunter@ti.com>
Subject: RE: [PATCH v4 02/39] ARM: OMAP2+: gpmc: Adapt to HWMOD
Date: Thu, 3 May 2012 08:37:05 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98299B@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <e0cf9678cb9a44d2a16401383ab8496eb825c291.1335874494.git.afzal@ti.com>
 <4FA04A8C.4050703@ti.com>
In-Reply-To: <4FA04A8C.4050703@ti.com>
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
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
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

On Wed, May 02, 2012 at 02:11:48, Hunter, Jon wrote:
> > +
> > +	pdata->clk_prd =3D gpmc_get_fclk_period();
>=20
> Does this need to be done here? May be this should be done in the probe
> function. You could store the handle to the main clk in the pdata.

This is done so that migration of gpmc driver to the drivers folder
would be smooth, remember that this function will still live here.
=20
> > +		pr_err("error: clk_get on %s\n", oh->main_clk);
> > +		return -EINVAL;
> >  	}
> > =20
> >  	clk_enable(gpmc_l3_clk);
>=20
> I would have thought we should be able to remove the gpmc_init function
> completely by now. Most of the code should be moved to the probe function=
.
>=20
> Also now with hwmod in place, we should be able to remove the
> clk_enable/disable functions and use the pm_runtime APIs instead.

There was no plan to add rpm in this series, but now that you have
brought it up, I will adapt the driver to rpm.

Regards
Afzal
