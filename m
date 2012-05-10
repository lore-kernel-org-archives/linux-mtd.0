From: "Mohammed, Afzal" <afzal@ti.com>
To: "Hunter, Jon" <jon-hunter@ti.com>
Subject: RE: [PATCH v4 02/39] ARM: OMAP2+: gpmc: Adapt to HWMOD
Date: Thu, 10 May 2012 05:17:39 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98A2AA@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <e0cf9678cb9a44d2a16401383ab8496eb825c291.1335874494.git.afzal@ti.com>
 <4FA04A8C.4050703@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E98299B@DBDE01.ent.ti.com>
 <4FA4041D.9010000@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E987159@DBDE01.ent.ti.com>
 <4FA7F473.7060607@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E987902@DBDE01.ent.ti.com>
 <4FA9380F.90700@ti.com>
In-Reply-To: <4FA9380F.90700@ti.com>
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

On Tue, May 08, 2012 at 20:43:19, Hunter, Jon wrote:

> >> In fact if you migrate to runtime pm then we should not have the clk_g=
et
> >> in the gpmc_init any more.
> >=20
> > Even if converted to RPM, to get clk rate, clk_get has to be done
> > somewhere, right ?
>=20
> Yes exactly. However, you could now do this in the driver itself like
> the probe function. Or may be just pass the frequency of the gpmc fclk
> to the driver and let the driver convert to the period. No reason we
> need to convert to the period outside of the driver. Hence, we can keep
> the function to do the conversion static in the driver and don't need to
> expose externally.

But platform need period before driver is probed (for calculating
peripheral timings to be passed for driver)

Regards
Afzal
