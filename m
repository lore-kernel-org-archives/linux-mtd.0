Received: from mail.phycard.de ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK3MS-0003Ja-KI
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 12:52:29 +0000
Message-ID: <1467636717.4618.19.camel@lws-tremmet.phytec.de>
Subject: mtd: nand: omap2: check for elm_id removed
From: Teresa Remmet <t.remmet@phytec.de>
To: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org
Cc: tony@atomide.com, Roger Quadros <rogerq@ti.com>,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com
Date: Mon, 04 Jul 2016 14:51:57 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

with commit c9711ec5250b22fd94e9b34c17c095e001a90e66
("mtd: nand: omap: Clean up device tree support")
the old "elm_id" property check has been removed. So only "ti,elm-id" is
valid now.
I noticed that the old property is still used by 3 boards:

git grep elm_id arch/arm/boot/dts/*
arch/arm/boot/dts/am335x-baltos.dtsi:           elm_id = <&elm>;
arch/arm/boot/dts/am335x-igep0033.dtsi:         elm_id = <&elm>;
arch/arm/boot/dts/am335x-phycore-som.dtsi:              elm_id = <&elm>;

I wonder if the right way would be to patch the device trees, or to add
the check again and to keep backward compatibility?

I may provide a patch then.

Regards,
Teresa
