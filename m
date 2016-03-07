Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acrgz-0001Q6-Af
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 09:43:10 +0000
Date: Mon, 7 Mar 2016 10:38:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Cc: <tony@atomide.com>, <computersforpeace@gmail.com>,
 devicetree@vger.kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 javier@dowhile0.org, linux-omap@vger.kernel.org, dwmw2@infradead.org,
 fcooper@ti.com
Subject: Re: [PATCH v5 13/26] memory: omap-gpmc: Support general purpose
 input for WAITPINs
Message-ID: <20160307103855.57720146@bbrezillon>
In-Reply-To: <20160307103440.4b9d7a55@bbrezillon>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-14-git-send-email-rogerq@ti.com>
 <20160307103440.4b9d7a55@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 Mar 2016 10:34:40 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Roger,
> 
> On Fri, 19 Feb 2016 23:15:35 +0200
> Roger Quadros <rogerq@ti.com> wrote:
> 
> > OMAPs can have 2 to 4 WAITPINs that can be used as general purpose
> > input if not used for memory wait state insertion.
> > 
> > The first user will be the OMAP NAND chip to get the NAND
> > read/busy status using gpiolib.
> 
> Just a comment on this approach. Why do you need to exposed native R/B
> pins as GPIOs? I mean, other NAND controllers are supporting R/B
> detection using dedicated logic, and they do not exposed those pins a
> plain GPIOs. Have you considered adding another property (rb-native ?)

Just had a look at the sunxi-nand binding, and we chose "allwinner,rb"
for this native RB logic. So "ti,rb" would be the equivalent for the
gpmc driver.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
