Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdsfW-0007nv-58
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 07:39:11 +0000
Received: by mail-it0-x243.google.com with SMTP id v71-v6so10296276itb.3
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 00:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1531294612-29526-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1531294612-29526-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Jul 2018 09:38:47 +0200
Message-ID: <CACRpkdaGynwq_sApAgahAY7vQ_HaPqTRhzpWPDCu_PtMc2zoCg@mail.gmail.com>
Subject: Re: [LINUX PATCH v11 2/3] memory: pl353: Add driver for arm pl353
 static memory controller
To: naga.sureshkumar.relli@xilinx.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>, Roger Quadros <rogerq@ti.com>,
 Ladislav Michl <ladis@linux-mips.org>, ada@thorsis.co,
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

On Wed, Jul 11, 2018 at 9:37 AM Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:

> Add driver for arm pl353 static memory controller. This controller is used in
> Xilinx Zynq SoC for interfacing the NAND and NOR/SRAM memory devices.
>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v11:
>  - Added amba device registration and removed platform device, since it
>    is an ARM Primecell Peripheral and it should register as an amba device
>    as per Linus Walleji.

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
