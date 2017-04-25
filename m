Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d372h-0007S4-P0
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 20:26:37 +0000
Received: by mail-wr0-x244.google.com with SMTP id g12so8569203wrg.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 13:26:14 -0700 (PDT)
Subject: Re: [PATCH v8 1/4] mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4
 protocols
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
References: <cover.1493149757.git.cyrille.pitchen@wedev4u.fr>
 <cc10c875139d7235fbc4dc8c14ae419e71b9c649.1493149757.git.cyrille.pitchen@wedev4u.fr>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <681ffcab-6911-0d50-94a8-1dd94e87063b@gmail.com>
Date: Tue, 25 Apr 2017 22:25:54 +0200
MIME-Version: 1.0
In-Reply-To: <cc10c875139d7235fbc4dc8c14ae419e71b9c649.1493149757.git.cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/25/2017 10:08 PM, Cyrille Pitchen wrote:
> From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> 
> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
> framework about the actual hardware capabilities supported by the SPI
> controller and its driver.
> 
> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
> telling the spi-nor framework about the hardware capabilities supported by
> the SPI flash memory and the associated settings required to use those
> hardware caps.
> 
> Then, to improve the readability of spi_nor_scan(), the discovery of the
> memory settings and the memory initialization are now split into two
> dedicated functions.
> 
> 1 - spi_nor_init_params()
> 
> The spi_nor_init_params() function is responsible for initializing the
> 'struct spi_nor_flash_parameter'. Currently this structure is filled with
> legacy values but further patches will allow to override some parameter
> values dynamically, for instance by reading the JESD216 Serial Flash
> Discoverable Parameter (SFDP) tables from the SPI memory.
> The spi_nor_init_params() function only deals with the hardware
> capabilities of the SPI flash memory: especially it doesn't care about
> the hardware capabilities supported by the SPI controller.
> 
> 2 - spi_nor_setup()
> 
> The second function is called once the 'struct spi_nor_flash_parameter'
> has been initialized by spi_nor_init_params().
> With both 'struct spi_nor_flash_parameter' and 'struct spi_nor_hwcaps',
> the new argument of spi_nor_scan(), spi_nor_setup() computes the best
> match between hardware caps supported by both the (Q)SPI memory and
> controller hence selecting the relevant settings for (Fast) Read and Page
> Program operations.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

[...]

-- 
Best regards,
Marek Vasut
