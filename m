Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb2Zy-0003Wz-B8
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 11:05:32 +0000
Subject: Re: [PATCH v1 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>, "festevam@gmail.com"
 <festevam@gmail.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Suresh
 Gupta <suresh.gupta@nxp.com>, Poonam Aggrwal <poonam.aggrwal@nxp.com>
References: <1515493602-19626-2-git-send-email-yogeshnarayan.gaur@nxp.com>
 <80885d95-a6d4-b3a6-4249-f87379e6dc45@exceet.de>
 <DB6PR0402MB2838BA43DBDBD8AF3AEDA04D99170@DB6PR0402MB2838.eurprd04.prod.outlook.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <466636da-a65c-0f19-2ca7-7126eaa90cb9@exceet.de>
Date: Mon, 15 Jan 2018 12:05:09 +0100
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2838BA43DBDBD8AF3AEDA04D99170@DB6PR0402MB2838.eurprd04.prod.outlook.com>
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

On 12.01.2018 05:44, Yogesh Narayan Gaur wrote:
> Hello Frieder,
> 
>> -----Original Message-----
>> From: Frieder Schrempf [mailto:frieder.schrempf@exceet.de]
>> Sent: Tuesday, January 09, 2018 9:56 PM
>> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
>> Cc: linux-mtd@lists.infradead.org; Boris Brezillon <boris.brezillon@free-
>> electrons.com>; cyrille.pitchen@wedev4u.fr; computersforpeace@gmail.com;
>> Han Xu <han.xu@nxp.com>; festevam@gmail.com; Prabhakar Kushwaha
>> <prabhakar.kushwaha@nxp.com>; Suresh Gupta <suresh.gupta@nxp.com>
>> Subject: Re: [PATCH v1 1/2] mtd: fsl-quadspi: add support to create dynamic LUT
>> entry
>>
>> Hello Yogesh,
>>
>>> Add support to create dynamic LUT entry.
>>>
>>> Current approach of creating LUT entries for various cmds like read,
>>> write, erase, readid, readsr, we, wd etc is that when QSPI controller
>>> gets initialized at that time static LUT entries for these cmds get created.
>>>
>>> Patch add support to create the LUT at run time based on the operation
>>> being performed.
>>>
>>> Added API fsl_qspi_prepare_lut(), this API would going to be called
>>> from fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write,
>>> fsl_qspi_read and fsl_qspi_erase APIs.
>>> This API would fetch required info like opcode, protocol info, dummy
>>> info for creating LUT from instance of 'struct spi_nor' and then
>>> prepare LUT entry for the required command.
>>
>> I'm just about to get started working on a similar topic, so I have some general
>> (maybe stupid) questions concerning the dynamic LUT implementation:
>>
>> Why do you actually need to be able to switch between different kind of
>> commands for READ/WRITE/ERASE at time of execution?
> Actually we want to handle different NOR flash devices on different chip select.
> QSPI controller has 4 chip select and one can use different flashes on all different chip select (that might not be the use case for today). We analyzed that the flash have different parameters for the same command and this is true for NAND devices.
> Also reg_protocol information, required for read register, read any register commands, read SFDP register, not available at the time of nor scan.
> This change was done after understanding the requirement for NAND and Hybrid flash also.
> NXP is going to support hybrid flash which has NOR and NAND at one chip select. So, to handle these type of flashes dynamic LUT is the best approach, condition NAND framework also provide required information (datalines, dummy bytes, addrlen)as provided by NOR framework as of now.
> To handle all chip select and hybrid complexities, this dynamic LUT need to be required as we can have maximum 16 static LUT entries.

Thank you for the explanation. I think you're right, it's too difficult 
to set up a static LUT for all the different kinds of flash commands 
within the limit of 16 LUT entries.

>>
>> Wouldn't it be better to init the LUT statically, after the chip was detected and at
>> that time decide which READ/WRITE/ERASE command is best for the connected
>> chip?
> As explained above if we have different flashes on different chip select (even for 2 flash we can maximum provide 8 LUT entries for different flashes).
> It is tough to handle such scenario and lead to code complexity.

I see.

>>
>> Have you tested what kind of impact the dynamic loading of a command
>> sequence to the LUT registers before each operation has on the performance?
> We are programming 4 LUT register for every command sent from MTD layer. Theoretically it is max 16bytes per command.
> It looks to be trivial overhead. We are doing analysis of performance impact of dynamic LUT creation.

Ok. I guess you're right. I made a single quick test with my FSL NAND 
driver, running mtd_speedtest with 20 MHz QSPI clock and I can see only 
minor differences between a static LUT and a dynamic LUT implementation.

>>
>> In the context of the upcoming SPI NAND framework, I am working on NAND
>> support for the FSL QSPI controller.
> Hope you will take care of having support of NAND on chip select 1 and 2.

My current driver doesn't handle multiple chips, but I hope at some 
point I can merge my driver with the existing NOR driver and also 
support multiple chips.

> 
>> I have a working driver at [1] derived from the NOR driver.
>> As discussed with Boris ([2]) the plan is to add NAND support to the NOR driver
>> until a common spi-flash layer is available to hold code, that is used by both
>> types of SPI flash, NOR and NAND.
>>
>> To achieve this, some kind of dynamic LUT allocation is needed, too.
>> But at first glance it seems me, that it would be better to actually use the LUT
>> entries as much as possible and create the entries at time of init depending on
>> flash type (NOR/NAND) and flash capabilities (QUAD/DUAL/QIO
>> READ/WRITE...).
>>
>> In the exotic case of needing to switch between different command sets (for
>> hybrid NOR/NAND devices, see [3]) one could reinit the LUT for the current
>> target upon selecting it.
>>
>> Or maybe it is even better to create a mechanism that fills the LUT with entries
>> when they are first needed and be able to reuse them until the space in the LUT
>> runs out and entries need to be overriden.
>>
>> What do you think?
> Right, we also though of this approach but we think this would going to increase the code complexity so the simple and best possible approach we use is to create run-time LUT for every command when function ptr (read_reg, write_reg, read, write and erase) gets invoked.

Ok.

Thanks,

Frieder
