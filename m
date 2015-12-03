Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Vdn-0007Lx-Rg
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2015 15:17:52 +0000
Date: Thu, 3 Dec 2015 07:17:25 -0800
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20151203151724.GI23396@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <20151203050905.GE120110@google.com> <565FDC4E.4000200@ti.com>
 <20151203062206.GB16368@brian-ubuntu> <566004F1.2040806@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566004F1.2040806@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [151203 01:02]:
> On 03/12/15 11:52, Brian Norris wrote:
> > On Thu, Dec 03, 2015 at 11:38:14AM +0530, Roger Quadros wrote:
> > 
> > I think I may have misunderstood the branch proposal. If Tony queues up:
> > 
> >   l2-mtd.git (or just up to commit a61ae81a1907)
> >   +
> >   your patches
> > 
> > and I pull that back into l2-mtd.git as well, then we don't need to
> > worry about patches that touch multiple "trees". Just do whatever makes
> > things clearest, including disregarding some of my comments along the
> > line of (3).
> 
> Tony,
> 
> Are you fine with this?

I'm fine with what you guys prefer as long as I have some immutable branch
I can merge in too in case of conflicts :)

Regards,

Tony
