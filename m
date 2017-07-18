Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXNfL-0006Px-9n
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 08:15:38 +0000
Received: by mail-wr0-x234.google.com with SMTP id 12so17563607wrb.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2017 01:15:12 -0700 (PDT)
Date: Tue, 18 Jul 2017 09:15:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com
Subject: Re: [PATCH 2/3] mfd: syscon: atmel-smc: add helper to retrieve
 register layout
Message-ID: <20170718081508.yo6uld5ip5hr6ipk@dell>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-3-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170711074015.30440-3-ludovic.desroches@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Jul 2017, Ludovic Desroches wrote:

> For HSMC controller, the register layout depends on the device i.e. the
> offset of setup, pulse, cycle, mode and timings registers is not the
> same. An helper is added to provide the correct register layout.
> 
> Fixes: fe9d7cb22ef3 ("mfd: syscon: atmel-smc: Add new helpers to ease
> SMC regs manipulation")
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  drivers/memory/atmel-ebi.c               | 13 +++++--
>  drivers/mfd/atmel-smc.c                  | 67 +++++++++++++++++++++++++-------
>  drivers/mtd/nand/atmel/nand-controller.c | 10 +++--
>  include/linux/mfd/syscon/atmel-smc.h     | 32 ++++++++++-----
>  4 files changed, 92 insertions(+), 30 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
