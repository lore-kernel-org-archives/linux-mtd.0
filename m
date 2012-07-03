Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm1rc-0004IO-2c
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 12:06:00 +0000
From: "Mohammed, Afzal" <afzal@ti.com>
To: Tony Lindgren <tony@atomide.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH v2 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
Date: Tue, 3 Jul 2012 12:05:46 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E9A267A@DBDE01.ent.ti.com>
References: <cover.1339586624.git.afzal@ti.com>
 <1340789755.29342.12.camel@sauron.fi.intel.com>
 <20120702073547.GA1122@atomide.com>
In-Reply-To: <20120702073547.GA1122@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tony,

On Mon, Jul 02, 2012 at 13:05:47, Tony Lindgren wrote:
> * Artem Bityutskiy <artem.bityutskiy@linux.intel.com> [120627 02:36]:
> > On Wed, 2012-06-13 at 17:02 +0530, Afzal Mohammed wrote:

> > > This series cleans up gpmc mtd interactions so that GPMC driver
> > > conversion which is going to happen shortly would happen smoothly
> > > by not creating much disturbance outside of arch/arm/*omap*/
> >=20
> > Dunno if Tony picked this, but the MTD changes look good an the quick
> > glance. Feel free to add
> >=20
> > Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>=20
> Thanks will add to the drivers/mtd touching patches in this series.

Can you please consider this series for inclusion in the coming merge
window. This series can live by itself and is not dependent on any
other patches.

Regards
Afzal
