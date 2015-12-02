Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a48wZ-00088t-Ue
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 15:03:47 +0000
Date: Wed, 2 Dec 2015 07:03:17 -0800
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20151202150317.GC23396@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <20151026212346.GJ13239@google.com> <562F45BF.8020205@ti.com>
 <20151130195449.GI64635@google.com> <565DB18C.7040505@ti.com>
 <20151202032643.GF64635@google.com> <565E7DAC.7060401@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565E7DAC.7060401@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [151201 21:13]:
> On 02/12/15 08:56, Brian Norris wrote:
> > 
> > I'll take another pass over your patch set, but if things are looking
> > better, how do you expect to merge this? There are significant portions
> > that touch at least 2 or 3 different subsystem trees, AFAICT.
> 
> Tony could create an immutable branch with all the dts and memory changes.
> You could base the mtd changes on top of that?

If we all agree on that it will be immutable Roger can set up the branch
with our acks and we can all merge it in as needed. I believe v4.4-rc1
should work as a base for us all?

Regards,

Tony
