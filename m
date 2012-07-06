Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn2je-0005XZ-An
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 07:13:51 +0000
Date: Fri, 6 Jul 2012 00:13:35 -0700
From: Tony Lindgren <tony@atomide.com>
To: "Mohammed, Afzal" <afzal@ti.com>
Subject: Re: [PATCH v2 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
Message-ID: <20120706071335.GJ1122@atomide.com>
References: <cover.1339586624.git.afzal@ti.com>
 <1340789755.29342.12.camel@sauron.fi.intel.com>
 <20120702073547.GA1122@atomide.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9A267A@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C8443D0743D26F4388EA172BF4E2A7A93E9A267A@DBDE01.ent.ti.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
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

* Mohammed, Afzal <afzal@ti.com> [120703 05:10]:
> Hi Tony,
> 
> On Mon, Jul 02, 2012 at 13:05:47, Tony Lindgren wrote:
> > * Artem Bityutskiy <artem.bityutskiy@linux.intel.com> [120627 02:36]:
> > > On Wed, 2012-06-13 at 17:02 +0530, Afzal Mohammed wrote:
> 
> > > > This series cleans up gpmc mtd interactions so that GPMC driver
> > > > conversion which is going to happen shortly would happen smoothly
> > > > by not creating much disturbance outside of arch/arm/*omap*/
> > > 
> > > Dunno if Tony picked this, but the MTD changes look good an the quick
> > > glance. Feel free to add
> > > 
> > > Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > 
> > Thanks will add to the drivers/mtd touching patches in this series.
> 
> Can you please consider this series for inclusion in the coming merge
> window. This series can live by itself and is not dependent on any
> other patches.

Yes I have some of the gpmc patches applied locally on top of the
dmaengine changes from Russell. Will update and push out once we have
an immutable commit for the dmaengine changes available.

Regards,

Tony
