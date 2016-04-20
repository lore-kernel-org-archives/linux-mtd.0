Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1astON-00072C-Mz
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2016 14:46:13 +0000
Date: Wed, 20 Apr 2016 07:45:45 -0700
From: Tony Lindgren <tony@atomide.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Roger Quadros <rogerq@ti.com>, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/17] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20160420144545.GE5995@atomide.com>
References: <20160416105711.5310d2d0@bbrezillon> <5714D3A4.2050405@ti.com>
 <5714D8AA.9040304@ti.com> <20160418151305.17a42437@bbrezillon>
 <5714E5AA.5050200@ti.com> <20160418161001.2a1c0bed@bbrezillon>
 <5714F185.5080103@ti.com> <20160418165755.77d1d661@bbrezillon>
 <5716289B.4060302@ti.com> <20160419221129.59b559fb@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160419221129.59b559fb@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Boris Brezillon <boris.brezillon@free-electrons.com> [160419 13:13]:
> On Tue, 19 Apr 2016 15:46:19 +0300
> Roger Quadros <rogerq@ti.com> wrote:
> 
> > 
> > After all the changes we discussed in [1] I was able to test nand/next-with-gpmc-rework
> > and it worked fine.
> > 
> > [1] - http://thread.gmane.org/gmane.comp.hardware.netbook.arm.sunxi/22596/focus=22936
> > 
> > I'd be happy to test the branch again after you've incorporated all changes.
> 
> Just pushed what's supposed to be my new nand/next into
> nand/next-with-gpmc-rework, can you test it? I'll push it to nand/next
> once I have your confirmation that everything is good.

Looks good to me too, merges fine with my for-next and still
works for me.

Thanks,

Tony
