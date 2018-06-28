Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRar-0004jP-OJ
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:44:26 +0000
Received: by mail-io0-x244.google.com with SMTP id e13-v6so4314771iof.6
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2018 00:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Jun 2018 09:43:30 +0200
Message-ID: <CACRpkdaEsEAiGpieJK1AA8HHLzZc7Tdc932rhdayg06rFU1hNA@mail.gmail.com>
Subject: Re: [[LINUX PATCH v10] 4/4] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
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

Thank you for your patch!

> Add driver for arm pl353 static memory controller nand interface with HW ECC
> support. This controller is used in Xilinx Zynq SoC for interfacing the NAND
> flash memory.
>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>

This driver has the same problem as the other patches:
use the ARM_AMBA primecell magic numbers detection, and
the PrimeCell bus.

Otherwise it looks good to me!

Yours,
Linus Walleij
