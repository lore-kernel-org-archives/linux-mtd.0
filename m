Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZovC8-0002Yy-Fo
 for linux-mtd@lists.infradead.org; Wed, 21 Oct 2015 15:20:52 +0000
Date: Wed, 21 Oct 2015 08:20:28 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, fcooper@ti.com
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20151021152028.GO3078@atomide.com>
References: <20151006083346.GL23801@atomide.com> <56139A72.6040600@ti.com>
 <20151006100000.GN23801@atomide.com> <56139CE9.8020002@ti.com>
 <5613A256.8000105@ti.com> <20151006110134.GO23801@atomide.com>
 <5613ABEF.9000904@ti.com> <20151016212510.GF24370@atomide.com>
 <562496DB.4050803@ti.com> <56274D69.1090402@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56274D69.1090402@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [151021 01:31]:
> On 19/10/15 10:08, Roger Quadros wrote:
> > On 17/10/15 00:25, Tony Lindgren wrote:
> >> * Roger Quadros <rogerq@ti.com> [151006 04:13]:
> >>>
> >>> Fine. The updated series is now at
> >>>
> >>> git@github.com:rogerq/linux.git
> >>>  * [new branch]      for-v4.4/gpmc-v4
> >>
> >> Looks like it produces some build errors, this with RMKs 3430 and 4430
> >> only .configs:
> >>
> >> drivers/memory/omap-gpmc.c:2035:43: error: ‘struct gpio_chip’ has no
> >> member named ‘irqdomain’
> >> drivers/memory/omap-gpmc.c:2116:8: error: implicit declaration of
> >> function ‘gpiochip_irqchip_add’ [-Werror=implicit-function-declaration]
> >>
> > 
> > Good catch. We'll have to select GPIOLIB_IRQCHIP for this driver.
> > 
> >> Maybe run randconfig builds on it for overnight?
> > 
> > OK. I'll do that.
> 
> I couldn't run randconfig beyond few iterations as it keeps failing
> everywhere. How do we limit the randconfig options to OMAP only
> platforms?

You can use Felipe's scripts from github.

Regards,

Tony
