Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYQkQ-0002kK-U7
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 06:49:44 +0000
Received: by mail-it0-x242.google.com with SMTP id p185-v6so10921438itp.4
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jun 2018 23:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1529563351-2241-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Jun 2018 08:49:18 +0200
Message-ID: <CACRpkdZiY2vAXQSuAgjKfHKtYT_UZD-apEbpS1RT5ZGFutYQeA@mail.gmail.com>
Subject: Re: [[LINUX PATCH v10] 2/4] memory: pl353: Add driver for arm pl353
 static memory controller
To: naga.sureshkumar.relli@xilinx.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>, Roger Quadros <rogerq@ti.com>,
 Ladislav Michl <ladis@linux-mips.org>, ada@thorsis.com,
 honghui.zhang@mediatek.com,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nagasureshkumarrelli@gmail.com, michals@xilinx.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 21, 2018 at 8:43 AM Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:

> Add driver for arm pl353 static memory controller. This controller is used in
> Xilinx Zynq SoC for interfacing the NAND and NOR/SRAM memory devices.
>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>

(...)

> +config PL353_SMC
> +       tristate "ARM PL35X Static Memory Controller(SMC) driver"
> +       default y
> +       depends on ARM
> +       depends on ARCH_ZYNQ

depends on ARM_AMBA

> +#include <linux/platform_device.h>

This is a PrimeCell with the ARM primecell ID registers
specified, so it should not use platform device.

Use <linux/amba/bus.h>

It further needs to match on these magic values (found in
0xfe0 etc) and use the name "apb_pclk" for the peripheral
(silicon) clock.

See examples such as:
drivers/mmc/host/mmci.c
drivers/tty/serial/amba-pl011.c
drivers/video/fbdev/amba-clcd.c
drivers/hwtracing/coresight/*
etc for examples.

Also see and reference the special PrimeCell DT bindings:
Documentation/devicetree/bindings/arm/primecell.txt

Yours,
Linus Walleij
