Received: from mail-cys01nam02on0615.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::615]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNdKV-0003am-TZ
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 12:34:38 +0000
Subject: Re: [LINUX PATCH v12 1/3] dt-bindings: mtd: arasan: Add device tree
 binding documentation
To: Martin Lund <martin.lund@keep-it-simple.com>,
 <naga.sureshkumar.relli@xilinx.com>
CC: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, =?UTF-8?Q?Marek_Va=c5=a1ut?=
 <marek.vasut@gmail.com>, naga sureshkumar <nagasuresh12@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <robh@kernel.org>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CAB7pii3kx75ajF=8TsU7mWrmrzoHLiy7uAb+PirGw04BH65bZg@mail.gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <6ce1726a-f24d-17b8-d839-0a51c424a850@xilinx.com>
Date: Fri, 16 Nov 2018 13:33:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAB7pii3kx75ajF=8TsU7mWrmrzoHLiy7uAb+PirGw04BH65bZg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16. 11. 18 12:50, Martin Lund wrote:
> Hi Naga,
> 
> I've been working on running up the latest kernel (v4.20-rc2) on our
> custom Xilinx hw board so that I can test the v12 version of your
> Arasan nand driver.
> 
> I've managed to get the driver successfully up and running and ready
> for testing with a Micron MT29F64G08AFAAAWP device. However, setting
> it up I've found a few inaccuracies in the documentation of the device
> tree bindings.
> 
> This is the device configuration that ended up working for me with
> linux v4.20-rc2:
> 
>        nfc: nand@ff100000 {
>             compatible = "xlnx,zynqmp-nand", "arasan,nfc-v3p10";
>             reg = <0x0 0xff100000 0x0 0x1000>;
>             clock-names = "clk_sys", "clk_flash";
>             clocks = <&clk200>, <&clk100>;
>             interrupt-parent = <&gic>;
>             interrupts = <0 14 4>;
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             nand@0 {
>                 reg = <0>;
>                 nand-ecc-mode = "hw";
>             };
>         };
> 
> Compared with the example you will notice that "clock-name" should be
> "clock-names". reg was missing a "0x0".

clock-names and even that names - you are right it is not correct and
should be fixed.

Missing 0x0 in reg doesn't matter because it depends on address/size cells.

> I think it is helpful to provide a real-world working example, so you
> might also consider changing the example "clocks" configuration to
> clk200/clk100 since there is no clk_misc among the clock sources of
> any of the xilinx zynqmp board device tree configurations.

Real example is the best normally just c&p from existing dts is the way
to go.
But in connection to clocks it doesn't matter what exactly should be
there and I don't think there is any consistency in that. Hopefully this
will be removed by yaml conversion.

Thanks,
Michal
