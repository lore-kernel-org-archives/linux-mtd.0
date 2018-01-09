Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYwjA-0007YZ-7L
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 16:26:18 +0000
To: <yogeshnarayan.gaur@nxp.com>
References: <1515493602-19626-2-git-send-email-yogeshnarayan.gaur@nxp.com>
Subject: Re: [PATCH v1 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
CC: <linux-mtd@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <han.xu@nxp.com>, <festevam@gmail.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, <suresh.gupta@nxp.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <80885d95-a6d4-b3a6-4249-f87379e6dc45@exceet.de>
Date: Tue, 9 Jan 2018 17:25:57 +0100
MIME-Version: 1.0
In-Reply-To: <1515493602-19626-2-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

Hello Yogesh,

> Add support to create dynamic LUT entry.
> 
> Current approach of creating LUT entries for various cmds like read, write,
> erase, readid, readsr, we, wd etc is that when QSPI controller gets
> initialized at that time static LUT entries for these cmds get created.
> 
> Patch add support to create the LUT at run time based on the operation
> being performed.
> 
> Added API fsl_qspi_prepare_lut(), this API would going to be called from
> fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write, fsl_qspi_read and
> fsl_qspi_erase APIs.
> This API would fetch required info like opcode, protocol info, dummy info
> for creating LUT from instance of 'struct spi_nor' and then prepare LUT
> entry for the required command.

I'm just about to get started working on a similar topic, so I have some 
general (maybe stupid) questions concerning the dynamic LUT implementation:

Why do you actually need to be able to switch between different kind of 
commands for READ/WRITE/ERASE at time of execution?

Wouldn't it be better to init the LUT statically, after the chip was 
detected and at that time decide which READ/WRITE/ERASE command is best 
for the connected chip?

Have you tested what kind of impact the dynamic loading of a command 
sequence to the LUT registers before each operation has on the performance?

In the context of the upcoming SPI NAND framework, I am working on NAND 
support for the FSL QSPI controller.
I have a working driver at [1] derived from the NOR driver.
As discussed with Boris ([2]) the plan is to add NAND support to the NOR 
driver until a common spi-flash layer is available to hold code, that is 
used by both types of SPI flash, NOR and NAND.

To achieve this, some kind of dynamic LUT allocation is needed, too.
But at first glance it seems me, that it would be better to actually use 
the LUT entries as much as possible and create the entries at time of 
init depending on flash type (NOR/NAND) and flash capabilities 
(QUAD/DUAL/QIO READ/WRITE...).

In the exotic case of needing to switch between different command sets 
(for hybrid NOR/NAND devices, see [3]) one could reinit the LUT for the 
current target upon selecting it.

Or maybe it is even better to create a mechanism that fills the LUT with 
entries when they are first needed and be able to reuse them until the 
space in the LUT runs out and entries need to be overriden.

What do you think?

As I'm quite new to this, maybe someone can point to other 
implementations with similar approaches for reference, if there are any.

Thanks and regards,

Frieder

[1]: 
https://github.com/fschrempf/linux-0day/blob/spi-nand-exceet/drivers/mtd/nand/spi/controllers/fsl-quadspi-controller.c
[2]: http://lists.infradead.org/pipermail/linux-mtd/2018-January/078592.html
[3]: http://lists.infradead.org/pipermail/linux-mtd/2018-January/078488.html
