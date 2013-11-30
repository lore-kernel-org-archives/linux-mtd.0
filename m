Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vmigk-0008HG-Lh
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 11:26:19 +0000
Date: Sat, 30 Nov 2013 08:17:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20131130111721.GA2330@localhost>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <20131127012338.GS9468@ld-irv-0074.broadcom.com>
 <20131129122551.GC2815@localhost>
 <20131130091556.GD29397@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131130091556.GD29397@norris.computersforpeace.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Alexander Shiyan <shc_work@mail.ru>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Sat, Nov 30, 2013 at 01:15:56AM -0800, Brian Norris wrote:
> 
> > Can anyone help me understand if there's *any* valid use case where we
> > want to specify a-priori the bus width, considering it's completely
> > discoverable at run-time?
> 
> I think the primary use case should be to reflect a limitation in the
> hardware (besides just the flash chip). It can mean that the controller
> itself only supports one bus width, or that the board is only wired up
> for x8, for instance.
> 

What do you mean by "reflect a limitation" of the hardware?

Maybe I'm not really following you, but it sounds as you're mixing up
the NAND device buswidth and the memory controller buswidth. At least
I consider them as two different parameters for two different pieces
of hardware.

Consider OMAP, just as an example. We currently have two DT properties:

1. nand-bus-width: not related to OMAP but kernel wide. It's supposed
   to specify the devices buswidth.

2. gpmc,device-width: It specifies how the controller should be
   configured (it doesn't really specify hardware, but configuration,
   sadly).

I now realise maybe this piece of DT binding is not a good example of DT.

Anyway, once again: Why would we need to set "nand-bus-width" to specify
the flash device width given we can discover that as soon as the NAND
is detected?

Notice, that this discussion is independent of the discussion about removing
the NAND_BUSWIDTH_AUTO. It's just about removing a DT property for a
parameter that's runtime configurable.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
