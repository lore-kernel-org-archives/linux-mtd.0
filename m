From: "Mohammed, Afzal" <afzal@ti.com>
To: "Hunter, Jon" <jon-hunter@ti.com>
Subject: RE: [PATCH v4 04/39] ARM: OMAP2+: gpmc: Acquire NAND CS value
Date: Thu, 3 May 2012 08:42:11 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E9829B0@DBDE01.ent.ti.com>
References: <cover.1335874494.git.afzal@ti.com>
 <10220de398d22fad5de783d8f58fc55ebac85338.1335874494.git.afzal@ti.com>
 <4FA05292.7030902@ti.com>
In-Reply-To: <4FA05292.7030902@ti.com>
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

On Wed, May 02, 2012 at 02:46:02, Hunter, Jon wrote:
> > Some boards depend on bootloader to update chip select value for NAND.
> > It is felt that Kernel should not depend on bootloader to get CS, as
> > for a particular board CS is hardwired and is fixed, hence this can
> > directly be updated in Kernel. But as CS value for boards that depend
> > on this behaviour is not available, educate gpmc driver to acquire
> > chip select value for NAND. this ideally should be removed once CS
> > for those boards are available.
>=20
> Do you know how many boards require this? If so which are those boards?

devkit8000, beagle board, omap3touchbook, overo.

Beagle board, found out to be zero.

> Should this code be marked with a FIXME?

Will let Tony decide it.

Regards
Afzal
