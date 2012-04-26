From: "Mohammed, Afzal" <afzal@ti.com>
To: Tony Lindgren <tony@atomide.com>
Subject: RE: [PATCH v3 0/9] Convert OMAP GPMC to driver
Date: Thu, 26 Apr 2012 05:18:15 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E9700FE@DBDE01.ent.ti.com>
References: <cover.1333638917.git.afzal@ti.com>
 <20120425164424.GT3739@atomide.com>
In-Reply-To: <20120425164424.GT3739@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Hilman, Kevin" <khilman@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>, Greg KH <greg@kroah.com>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

Hi Tony,

On Wed, Apr 25, 2012 at 22:14:25, Tony Lindgren wrote:
> > Once driver is acceptable, platform code for other peripherals
> > connected via GPMC would be adapted to make use of GPMC driver. And
> > then the board modifications. But before that HWMOD entry has to be
> > populated for respective SoC(s ?).
> =20
> No, we can't do it this way, it breaks things. We need to first
> convert everything to use the new GPMC driver, then move it.=20

Sorry, my statements were not clear, I meant once driver is
acceptable & still living in mach-omap2, platform code dealing
with peripherals on gpmc would be adapted to make use of gpmc
driver. Moving driver to new location is only planned as a
separate commit after, before mentioned changes. Hope with this
clarification we are on same track.=20

> =20
> > Now DESTINATION FOR THIS DRIVER has to be decided. Original plan was
> > to consider GPMC as MFD. The peripheral(s) connected to GPMC being
> > considered childs of MFD.
>=20
> Let's not put it into MFD. This is a bus driver. But that
> decision can wait as we cleary have quite a few things to convert
> first under arch/arm/mach-omap2.
> =20
> > Various options that could be seen so far on where this driver can go,
> > 1. mfd
> > 2. misc
> > 3. drivers/platform/arm/ (create an new one?)
> > 4. memory (create a new one ?)
>=20
> It's a parallel bus driver, not memory not misc, not MFD.

Greg suggested to send gpmc driver to new memory folder.

In the next version, gpmc driver would still be in mach-omap2,
moving to new location can be done later.

Regards
Afzal
