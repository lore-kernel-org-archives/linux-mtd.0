Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK3W1-0001lB-R1
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 13:02:22 +0000
Date: Mon, 4 Jul 2016 15:01:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, tony@atomide.com, Roger Quadros
 <rogerq@ti.com>, computersforpeace@gmail.com
Subject: Re: mtd: nand: omap2: check for elm_id removed
Message-ID: <20160704150159.0af47ad5@bbrezillon>
In-Reply-To: <1467636717.4618.19.camel@lws-tremmet.phytec.de>
References: <1467636717.4618.19.camel@lws-tremmet.phytec.de>
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

On Mon, 04 Jul 2016 14:51:57 +0200
Teresa Remmet <t.remmet@phytec.de> wrote:

> Hello,
> 
> with commit c9711ec5250b22fd94e9b34c17c095e001a90e66
> ("mtd: nand: omap: Clean up device tree support")
> the old "elm_id" property check has been removed. So only "ti,elm-id" is
> valid now.
> I noticed that the old property is still used by 3 boards:
> 
> git grep elm_id arch/arm/boot/dts/*
> arch/arm/boot/dts/am335x-baltos.dtsi:           elm_id = <&elm>;
> arch/arm/boot/dts/am335x-igep0033.dtsi:         elm_id = <&elm>;
> arch/arm/boot/dts/am335x-phycore-som.dtsi:              elm_id = <&elm>;
> 
> I wonder if the right way would be to patch the device trees, or to add
> the check again and to keep backward compatibility?

We should probably do both, though backward compat is usually dependent
on the platform maintainer (some accept to break DT backward compat).

Anyway, all DTs should be patched to use the new binding, so you can at
least send a patch doing that.

> 
> I may provide a patch then.
> 
> Regards,
> Teresa
> 
