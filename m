Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOKa0-0002HP-Eo
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 09:08:42 +0000
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Rob Lippert
 <roblip@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1498115883-31499-1-git-send-email-clg@kaod.org>
 <1498115883-31499-2-git-send-email-clg@kaod.org>
 <CAN+5HW374WiykqEDLuErjaJprXkVAhsVT7n_4iLPbrUEdCaP6w@mail.gmail.com>
 <188d3715-29e4-f4ae-a1e2-3aa29410f98b@kaod.org>
 <7fe580ee-5802-001a-2da6-6a6e75e0658b@kaod.org>
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Message-ID: <69129be7-1216-7069-bcff-764ed5e31351@microchip.com>
Date: Fri, 23 Jun 2017 11:08:15 +0200
MIME-Version: 1.0
In-Reply-To: <7fe580ee-5802-001a-2da6-6a6e75e0658b@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cédric,

Le 23/06/2017 à 09:02, Cédric Le Goater a écrit :
> On 06/23/2017 08:35 AM, Cédric Le Goater wrote:
>> On 06/22/2017 07:17 PM, Rob Lippert wrote:
>>> On Thu, Jun 22, 2017 at 12:18 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>>> Implements support for the dual IO read mode on aspeed SMC/FMC
>>>> controllers which uses both MISO and MOSI lines for data during a read
>>>> to double the read bandwidth.
>>>>
>>>> Based on work from Robert Lippert <roblip@gmail.com>
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> Cc: Robert Lippert <roblip@gmail.com>
>>>> ---
>>>>
>>>>  Changes since v1:
>>>>
>>>>  - reworked the patch to fit the new spi-nor hwcaps
>>>>  - added dual address and data IO
>>>>  - took ownership due to the amount of rewritten code.
>>>>
>>>>  drivers/mtd/spi-nor/aspeed-smc.c | 52 +++++++++++++++++++++++++++++++---------
>>>>  1 file changed, 41 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>>> index 0106357421bd..93ca2ee65f51 100644
>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>>> @@ -373,6 +373,33 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>>>>         }
>>>>  }
>>>>
>>>> +static int aspeed_smc_get_io_mode(struct aspeed_smc_chip *chip)
>>>> +{
>>>> +       switch (chip->nor.read_proto) {
>>>> +       case SNOR_PROTO_1_1_1:
>>>> +               return 0;
>>>> +       case SNOR_PROTO_1_1_2:
>>>> +               return CONTROL_IO_DUAL_DATA;
>>>> +       case SNOR_PROTO_1_2_2:
>>>> +               return CONTROL_IO_DUAL_ADDR_DATA;
>>>> +       default:
>>>> +               dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +}
>>>> +
>>>> +static void aspeed_smc_set_io_mode(struct aspeed_smc_chip *chip)
>>>> +{
>>>> +       u32 io_mode = aspeed_smc_get_io_mode(chip);
>>>> +       u32 ctl;
>>>> +
>>>> +       if (io_mode > 0) {
>>>> +               ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
>>>> +               ctl |= io_mode;
>>>> +               writel(ctl, chip->ctl);
>>>> +       }
>>>> +}
>>>> +
>>>>  static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>>>                                     size_t len, u_char *read_buf)
>>>>  {
>>>> @@ -385,6 +412,7 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>>>         for (i = 0; i < chip->nor.read_dummy / 8; i++)
>>>>                 aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
>>>>
>>>> +       aspeed_smc_set_io_mode(chip);
>>>
>>> Does this actually work for 1_2_2 mode?  I figured you would need to
>>> set it to dual mode before sending the address (but after the command)
>>> a few lines up from here.
>>
>> yes. This needs a fix for CONTROL_IO_DUAL_ADDR_DATA. 
> 
> I was wondering why I didn't see the BB command being used.
> The spi-nor layer only provides the SNOR_PROTO_1_2_2 definition
> but only the SNOR_PROTO_1_1_2 is handled for the moment. 
> Any how, this patch needs some more work.

If you want to test your controller with SPI 1-2-2, you will need this
patch:
http://patchwork.ozlabs.org/patch/778995/

As you noticed, currently SPI 1-2-2 and 1-4-4 protocols has been
introduced in the spi-nor subsystem so the SPI controller drivers can
declare their hardware capabilities but you will need the SFDP patch to
take advantage of these capabilities.

If you succeed in using SPI 1-2-2 with the Aspeed controller, don't
hesitate to add your Tested-by tag on the SFDP patch ;)

Best regards,

Cyrille


> 
> Thanks,
> 
> C. 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
