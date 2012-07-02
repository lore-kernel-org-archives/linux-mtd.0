Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlbAp-0005Wl-5c
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 07:35:56 +0000
Date: Mon, 2 Jul 2012 00:35:47 -0700
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH v2 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
Message-ID: <20120702073547.GA1122@atomide.com>
References: <cover.1339586624.git.afzal@ti.com>
 <1340789755.29342.12.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340789755.29342.12.camel@sauron.fi.intel.com>
Cc: Afzal Mohammed <afzal@ti.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy <artem.bityutskiy@linux.intel.com> [120627 02:36]:
> On Wed, 2012-06-13 at 17:02 +0530, Afzal Mohammed wrote:
> > Hi,
> > 
> > This series cleans up gpmc mtd interactions so that GPMC driver
> > conversion which is going to happen shortly would happen smoothly
> > by not creating much disturbance outside of arch/arm/*omap*/
> 
> Dunno if Tony picked this, but the MTD changes look good an the quick
> glance. Feel free to add
> 
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Thanks will add to the drivers/mtd touching patches in this series.

Tony
