Received: from mho-04-ewr.mailhop.org ([204.13.248.74]
 helo=mho-02-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7AoQ-0003Hg-3p
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 19:53:58 +0000
Date: Thu, 30 Aug 2012 12:53:49 -0700
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v3 10/10] mtd: nand: omap2: use gpmc provided irqs
Message-ID: <20120830195349.GW1303@atomide.com>
References: <cover.1344609341.git.afzal@ti.com>
 <c5a608a70a875191e1323958c74fb2ac8dfa34b3.1344609341.git.afzal@ti.com>
 <1345895326.1815.4.camel@kyv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345895326.1815.4.camel@kyv>
Cc: artem.bityutskiy@linux.intel.com, Afzal Mohammed <afzal@ti.com>,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy <dedekind1@gmail.com> [120825 04:49]:
> On Tue, 2012-08-21 at 15:14 +0530, Afzal Mohammed wrote:
> > GPMC platform initialization provides it's clients
> > with interrupts that can be used through struct
> > resource. Make use of it for irq mode functionality.
> > 
> > Also now write protect disable is done by GPMC,
> > hence remove it.
> > 
> > Signed-off-by: Afzal Mohammed <afzal@ti.com>
> 
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Thanks I'll apply these into omap devel-gpmc branch.

Regards,

Tony
