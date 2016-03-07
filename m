Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1acsRe-0003iC-Dm
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 10:31:22 +0000
Date: Mon, 7 Mar 2016 11:31:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Cc: <tony@atomide.com>, <computersforpeace@gmail.com>,
 <devicetree@vger.kernel.org>, <nsekhar@ti.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <linux-omap@vger.kernel.org>, <dwmw2@infradead.org>, <fcooper@ti.com>
Subject: Re: [PATCH v5 13/26] memory: omap-gpmc: Support general purpose
 input for WAITPINs
Message-ID: <20160307113100.2fb12bf4@bbrezillon>
In-Reply-To: <56DD519A.3070403@ti.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <1455916548-3441-14-git-send-email-rogerq@ti.com>
 <20160307103440.4b9d7a55@bbrezillon> <56DD519A.3070403@ti.com>
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

On Mon, 7 Mar 2016 12:02:02 +0200
Roger Quadros <rogerq@ti.com> wrote:

> Hi Boris,
> 
> On 07/03/16 11:34, Boris Brezillon wrote:
> > Hi Roger,
> > 
> > On Fri, 19 Feb 2016 23:15:35 +0200
> > Roger Quadros <rogerq@ti.com> wrote:
> > 
> >> OMAPs can have 2 to 4 WAITPINs that can be used as general purpose
> >> input if not used for memory wait state insertion.
> >>
> >> The first user will be the OMAP NAND chip to get the NAND
> >> read/busy status using gpiolib.
> > 
> > Just a comment on this approach. Why do you need to exposed native R/B
> > pins as GPIOs? I mean, other NAND controllers are supporting R/B
> > detection using dedicated logic, and they do not exposed those pins a
> > plain GPIOs. Have you considered adding another property (rb-native ?)
> > to deal with this case instead of emulating a GPIO controller?
> > Side note: I added an rb-gpios property in my sunxi-nand DT binding
> > because in some cases, the board design forces us to use a plain GPIO.
> 
> OMAPs can have more than one WAITpins which can be used in multiple ways
> - wait state insertion
> - general purpose input
> - edge detect interrupt
> 
> It is not automatically tied to NAND read/busy# mechanism and needs software
> to get the read/busy# state.
> The register to get WAIT pin status is not situated in the NAND controller
> register space but in the parent GPMC controller space.
> 
> So we've modelled the WAIT pins as irqchip and gpiochip and users can
> use them as they want.

Okay. Thanks for the detailed explanation.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
