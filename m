From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
Date: Wed, 27 Nov 2013 10:27:06 +0100
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1385447575-23773-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201311271027.06982.marex@denx.de>
Cc: broonie@linaro.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 sourav.poddar@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> 1.) Why add a new framework for SPI NOR?
>   The SPI-NOR controller such as Freescale's Quadspi controller is working
>   in a different way from the SPI bus. It should knows the NOR commands to
>   find the right LUT sequence. Unfortunately, the current code can not meet
>   this requirement.

Is there any kind of documentation for this controller available? I cannot quite 
understand how this controller works and why can it not be used with our current 
infrastructure.

Best regards,
Marek Vasut
