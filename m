Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emd8g-0005VM-HO
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 10:22:14 +0000
Subject: Re: [RFC PATCH 6/6] spi: Get rid of the spi_flash_read() API
To: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Kamal Dasu
 <kdasu.kdev@gmail.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-7-boris.brezillon@bootlin.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <674d7b22-a3ac-e812-04db-aa0acb1671b0@ti.com>
Date: Fri, 16 Feb 2018 15:51:00 +0530
MIME-Version: 1.0
In-Reply-To: <20180205232120.5851-7-boris.brezillon@bootlin.com>
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

Hi Boris,

On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> This API has been replaced by the spi_mem_xx() one, its only user
> (spi-nor) has been converted to spi_mem_xx() and all SPI controller
> drivers that were implementing the ->spi_flash_xxx() hooks are also
> implementing the spi_mem ones. So we can safely get rid of this API.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---

>  drivers/spi/spi-ti-qspi.c  | 41 ---------------------------------

> -static bool ti_qspi_spi_flash_can_dma(struct spi_device *spi,
> -				      struct spi_flash_read_message *msg)
> -{
> -	return virt_addr_valid(msg->buf);
> -}
> -


This causes kernel crash because spi_map_buf() now tries to map
vmalloc'd buffers in LPAE backed memory not accessible by 32bit DMA:

ubiattach -p /dev/mtd9
[  114.482439] Unable to handle kernel paging request at virtual address
bf867000
[  114.489689] pgd = 045b2870
[  114.492403] [bf867000] *pgd=ad22c003, *pmd=00000000
[  114.497309] Internal error: Oops: 2a06 [#1] PREEMPT SMP ARM
[  114.502903] Modules linked in: ecdh_generic extcon_usb_gpio
omap_aes_driver omap_sham omap_des des_generic crypto_engine omap_crypto
[  114.514894] CPU: 1 PID: 1862 Comm: ubiattach Not tainted
4.16.0-rc1-next-20180212-00009-gbaa4bd31694e-dirty #16
[  114.525023] Hardware name: Generic DRA74X (Flattened Device Tree)
[  114.531145] PC is at v7_dma_inv_range+0x30/0x48
[  114.535693] LR is at dma_cache_maint_page+0x110/0x124
[  114.540763] pc : [<c0218fdc>]    lr : [<c02149e0>]    p


We need ->can_dma like interface in spi_controller_mem_ops to prevent
such buffers being mapped for certain SoCs. Or SPI NOR framework needs
to use bounce buffers.


-- 
Regards
Vignesh
