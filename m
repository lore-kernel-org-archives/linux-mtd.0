Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZft1-0002Uc-LV
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 11:49:04 +0000
Date: Fri, 25 Oct 2013 08:48:37 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 0/5] Assorted OMAP2 NAND clean-ups
Message-ID: <20131025114836.GD2489@localhost>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AE2A@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2AE2A@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On Fri, Oct 25, 2013 at 11:15:57AM +0000, Gupta, Pekon wrote:
> Hi,
> 
> > -----Original Message-----
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> [...]
> 
> > Pekon, Brian: Do you think this solution might work for 8-bit and 16-bit
> > devices?
> > 
> I think NAND_BUSWIDTH_AUTO (without GPMC changes) would fail in
> following scenarios..
> 
> Case-1: configuring gpmc,device-width=1 from DT when using x16 device.

... which is wrong. That's why we have a DT property to configure that.
The GPMC *must* be properly configured.

> As your NAND driver is using NAND_BUSWIDTH_AUTO, it should
> ignore this DT config, and based on ONFI params it should work as x16
> 

Hm.. I don't think so. The auto-stuff is just for the NAND driver, not
for the memory controller. I don't know much about hardware, but in my mind
I imagine them as different controllers.

> Case-2: configuring gpmc,device-width=2 from DT when using x8 device.

... which is also wrong.

Once again, you're mis-configuring the GPMC. We cannot expect the NAND
driver to work properly if the GPMC is not properly initialized, don't
you think?

> Actually having NAND_BUSWIDTH_AUTO would require change in GPMC
> driver also.. please refer my comments in.. 
> http://lists.infradead.org/pipermail/linux-mtd/2013-October/049284.html
> 

Well, I think the approach should be different and much simpler: GPMC
*must* be properly configured and then NAND can do ONFI detection
starting in 8-bit and then switching to 16-bit if needed.

This is what this patch is doing: it _fixes_ the NAND driver ONFI detection,
_provided_ the GPMC is well-prepared.

You seem to think that GPMC + NAND should be able to automagically detect
the device and work, but I don't think that's even physically possible, for
the reasons you have just exposed.

I think this fix is simple enough.

BTW: The GPMC code ignores the DT value in 'gpmc,device-width' and uses
'nand-bus-width' instead, but that's a different bug and a different fix :)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
