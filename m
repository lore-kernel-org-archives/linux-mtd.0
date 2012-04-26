From: "Mohammed, Afzal" <afzal@ti.com>
To: Tony Lindgren <tony@atomide.com>
Subject: RE: [TMP] OMAP3EVM: Test gpmc nand & smsc911x
Date: Thu, 26 Apr 2012 05:21:45 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E970122@DBDE01.ent.ti.com>
References: <cover.1333640054.git.afzal@ti.com>
 <bb95fec60401f7cf6ac77200a12baf3fc83852f5.1333640054.git.afzal@ti.com>
 <20120425164726.GU3739@atomide.com>
In-Reply-To: <20120425164726.GU3739@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Hilman, Kevin" <khilman@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
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

On Wed, Apr 25, 2012 at 22:17:26, Tony Lindgren wrote:
> Obviously we can't merge any of this if until all the board-*.c files
> are changed and tested.
>=20
> Can you maybe still keep the old interfaces in addition to the new ones
> so we can do the conversion one board-*.c file at a time while keeping
> things working?

As there are peripherals using helper functions, to handle those, you
meant to create a new altered similar function to deal for each too ?,
while keeping existing functions as such.

i.e. like having gpmc_smsc911x_init & gpmc_smsc911x_new_init for
each peripheral ?, with gpmc_smsc911x_new_init using gpmc driver,
and gpmc_smsc911x_init as is.

Regards
Afzal
