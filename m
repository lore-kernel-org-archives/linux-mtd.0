Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dphKC-0003vP-Vt
 for linux-mtd@lists.infradead.org; Wed, 06 Sep 2017 20:53:39 +0000
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: parse Serial Flash Discoverable
 Parameters (SFDP) tables
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <cover.1498481714.git.cyrille.pitchen@microchip.com>
 <bd2526cb6d08011ba2e5e6ef8282b6d68d888b88.1498481714.git.cyrille.pitchen@microchip.com>
 <CAMuHMdU_34gtsDmnEKYHk_pRCz6owTED7xVzNuaCkQA7L2gdPg@mail.gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <ca99e4b6-a413-9553-6756-1653ad5b02d3@wedev4u.fr>
Date: Wed, 6 Sep 2017 22:52:53 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU_34gtsDmnEKYHk_pRCz6owTED7xVzNuaCkQA7L2gdPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Geert,

thanks for your report: I'm writing a bug fix right now!

Best regards,

Cyrille

Le 06/09/2017 à 18:51, Geert Uytterhoeven a écrit :
> Hi Cyrille, Boris,
> 
> On Mon, Jun 26, 2017 at 3:10 PM, Cyrille Pitchen
> <cyrille.pitchen@microchip.com> wrote:
>> This patch adds support to the JESD216 rev B standard and parses the SFDP
>> tables to dynamically initialize the 'struct spi_nor_flash_parameter'.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> 
> This patch, which is now commit f384b352cbf0310f ("mtd: spi-nor: parse
> Serial Flash
> Discoverable Parameters (SFDP) tables") in -next, and which was included in the
> "MTD updates for 4.14" pull request, broke QSPI FLASH on R-Car Gen2.
> 
> E.g. on r8a7794/alt, the following warning is printed with
> CONFIG_DMA_API_DEBUG=y:
> 
>     WARNING: CPU: 1 PID: 1 at lib/dma-debug.c:1188 check_for_stack+0xcc/0x114
>     rcar-dmac e6720000.dma-controller: DMA-API: device driver maps
> memory from stack [addr=ef43dad8]
>     Modules linked in:
>     CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 4.13.0-rcar2-initrd-00404-g3d49bfdcf5ecd040 #76
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     [<c020e664>] (unwind_backtrace) from [<c020a13c>] (show_stack+0x10/0x14)
>     [<c020a13c>] (show_stack) from [<c06a5c50>] (dump_stack+0x7c/0x9c)
>     [<c06a5c50>] (dump_stack) from [<c021ef58>] (__warn+0xcc/0xfc)
>     [<c021ef58>] (__warn) from [<c021efbc>] (warn_slowpath_fmt+0x34/0x44)
>     [<c021efbc>] (warn_slowpath_fmt) from [<c0403228>]
> (check_for_stack+0xcc/0x114)
>     [<c0403228>] (check_for_stack) from [<c0403a9c>]
> (debug_dma_map_sg+0xe4/0x168)
>     [<c0403a9c>] (debug_dma_map_sg) from [<c04cd7b8>] (spi_map_buf+0x2f4/0x32c)
>     [<c04cd7b8>] (spi_map_buf) from [<c04ce560>]
> (__spi_pump_messages+0x430/0x4d8)
>     [<c04ce560>] (__spi_pump_messages) from [<c04ce77c>]
> (__spi_sync+0x168/0x194)
>     [<c04ce77c>] (__spi_sync) from [<c04ce7cc>] (spi_sync+0x24/0x3c)
>     [<c04ce7cc>] (spi_sync) from [<c04c97fc>] (m25p80_read+0x2e4/0x300)
>     [<c04c97fc>] (m25p80_read) from [<c04c99d8>] (spi_nor_read_sfdp+0x58/0xa8)
>     [<c04c99d8>] (spi_nor_read_sfdp) from [<c04c9fc8>]
> (spi_nor_init_params+0x2e8/0x5f4)
>     [<c04c9fc8>] (spi_nor_init_params) from [<c04cb510>]
> (spi_nor_scan+0xc4/0x830)
>     [<c04cb510>] (spi_nor_scan) from [<c04c9928>] (m25p_probe+0x110/0x168)
>     [<c04c9928>] (m25p_probe) from [<c04cce0c>] (spi_drv_probe+0x84/0xa0)
>     [<c04cce0c>] (spi_drv_probe) from [<c0470f80>]
> (driver_probe_device+0x150/0x2d0)
>     [<c0470f80>] (driver_probe_device) from [<c046f7fc>]
> (bus_for_each_drv+0x84/0x94)
>     [<c046f7fc>] (bus_for_each_drv) from [<c0470d98>]
> (__device_attach+0x88/0xfc)
>     [<c0470d98>] (__device_attach) from [<c0470450>]
> (bus_probe_device+0x28/0x80)
>     [<c0470450>] (bus_probe_device) from [<c046ebac>] (device_add+0x3f8/0x50c)
>     [<c046ebac>] (device_add) from [<c04cef54>] (spi_add_device+0xd0/0x14c)
>     [<c04cef54>] (spi_add_device) from [<c04cf308>]
> (of_register_spi_device+0x200/0x2f4)
>     [<c04cf308>] (of_register_spi_device) from [<c04cf878>]
> (spi_register_controller+0x47c/0x5e4)
>     [<c04cf878>] (spi_register_controller) from [<c04cfa10>]
> (devm_spi_register_controller+0x30/0x6c)
>     [<c04cfa10>] (devm_spi_register_controller) from [<c04d190c>]
> (rspi_probe+0x258/0x404)
>     [<c04d190c>] (rspi_probe) from [<c0472780>] (platform_drv_probe+0x50/0xa0)
>     [<c0472780>] (platform_drv_probe) from [<c0470f80>]
> (driver_probe_device+0x150/0x2d0)
>     [<c0470f80>] (driver_probe_device) from [<c0471180>]
> (__driver_attach+0x80/0xa4)
>     [<c0471180>] (__driver_attach) from [<c046f740>]
> (bus_for_each_dev+0x6c/0x90)
>     [<c046f740>] (bus_for_each_dev) from [<c047064c>]
> (bus_add_driver+0xc8/0x1e4)
>     [<c047064c>] (bus_add_driver) from [<c0471a14>] (driver_register+0x9c/0xe0)
>     [<c0471a14>] (driver_register) from [<c0201718>]
> (do_one_initcall+0xa8/0x14c)
>     [<c0201718>] (do_one_initcall) from [<c0c00d84>]
> (kernel_init_freeable+0x114/0x:
>     [<c0c00d84>] (kernel_init_freeable) from [<c06b6244>]
> (kernel_init+0x8/0x10c)
>     [<c06b6244>] (kernel_init) from [<c0206b68>] (ret_from_fork+0x14/0x2c)
> 
> This leads to the SPI FLASH size being misdetected as zero:
> 
>     -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>     +m25p80 spi0.0: s25fl512s (0 Kbytes)
>      3 ofpart partitions found on MTD device spi0.0
>      Creating 3 MTD partitions on "spi0.0":
>      0x000000000000-0x000000040000 : "loader"
>     +mtd: partition "loader" is out of reach -- disabled
>      0x000000040000-0x000000080000 : "system"
>     +mtd: partition "system" is out of reach -- disabled
>      0x000000080000-0x000004000000 : "user"
>     +mtd: partition "user" is out of reach -- disabled
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
