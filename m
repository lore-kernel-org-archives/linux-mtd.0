Received: from 19.mo6.mail-out.ovh.net ([188.165.56.177])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOICo-0008JZ-Ar
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 06:36:36 +0000
Received: from player735.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id D3F39F2103
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 08:36:08 +0200 (CEST)
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
To: Rob Lippert <roblip@gmail.com>
References: <1498115883-31499-1-git-send-email-clg@kaod.org>
 <1498115883-31499-2-git-send-email-clg@kaod.org>
 <CAN+5HW374WiykqEDLuErjaJprXkVAhsVT7n_4iLPbrUEdCaP6w@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <188d3715-29e4-f4ae-a1e2-3aa29410f98b@kaod.org>
Date: Fri, 23 Jun 2017 08:35:52 +0200
MIME-Version: 1.0
In-Reply-To: <CAN+5HW374WiykqEDLuErjaJprXkVAhsVT7n_4iLPbrUEdCaP6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/22/2017 07:17 PM, Rob Lippert wrote:
> On Thu, Jun 22, 2017 at 12:18 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> Implements support for the dual IO read mode on aspeed SMC/FMC
>> controllers which uses both MISO and MOSI lines for data during a read
>> to double the read bandwidth.
>>
>> Based on work from Robert Lippert <roblip@gmail.com>
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Cc: Robert Lippert <roblip@gmail.com>
>> ---
>>
>>  Changes since v1:
>>
>>  - reworked the patch to fit the new spi-nor hwcaps
>>  - added dual address and data IO
>>  - took ownership due to the amount of rewritten code.
>>
>>  drivers/mtd/spi-nor/aspeed-smc.c | 52 +++++++++++++++++++++++++++++++---------
>>  1 file changed, 41 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 0106357421bd..93ca2ee65f51 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -373,6 +373,33 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>>         }
>>  }
>>
>> +static int aspeed_smc_get_io_mode(struct aspeed_smc_chip *chip)
>> +{
>> +       switch (chip->nor.read_proto) {
>> +       case SNOR_PROTO_1_1_1:
>> +               return 0;
>> +       case SNOR_PROTO_1_1_2:
>> +               return CONTROL_IO_DUAL_DATA;
>> +       case SNOR_PROTO_1_2_2:
>> +               return CONTROL_IO_DUAL_ADDR_DATA;
>> +       default:
>> +               dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>> +               return -EINVAL;
>> +       }
>> +}
>> +
>> +static void aspeed_smc_set_io_mode(struct aspeed_smc_chip *chip)
>> +{
>> +       u32 io_mode = aspeed_smc_get_io_mode(chip);
>> +       u32 ctl;
>> +
>> +       if (io_mode > 0) {
>> +               ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
>> +               ctl |= io_mode;
>> +               writel(ctl, chip->ctl);
>> +       }
>> +}
>> +
>>  static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>                                     size_t len, u_char *read_buf)
>>  {
>> @@ -385,6 +412,7 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>         for (i = 0; i < chip->nor.read_dummy / 8; i++)
>>                 aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
>>
>> +       aspeed_smc_set_io_mode(chip);
> 
> Does this actually work for 1_2_2 mode?  I figured you would need to
> set it to dual mode before sending the address (but after the command)
> a few lines up from here.

yes. This needs a fix for CONTROL_IO_DUAL_ADDR_DATA. 

Thanks,

C.

> 
>>         aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
>>         aspeed_smc_stop_user(nor);
>>         return len;
>> @@ -711,6 +739,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>  {
>>         struct aspeed_smc_controller *controller = chip->controller;
>>         const struct aspeed_smc_info *info = controller->info;
>> +       u32 io_mode;
>>         u32 cmd;
>>
>>         if (chip->nor.addr_width == 4 && info->set_4b)
>> @@ -733,20 +762,19 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>          * TODO: Adjust clocks if fast read is supported and interpret
>>          * SPI-NOR flags to adjust controller settings.
>>          */
>> -       if (chip->nor.read_proto == SNOR_PROTO_1_1_1) {
>> -               if (chip->nor.read_dummy == 0)
>> -                       cmd = CONTROL_COMMAND_MODE_NORMAL;
>> -               else
>> -                       cmd = CONTROL_COMMAND_MODE_FREAD;
>> -       } else {
>> -               dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>> -               return -EINVAL;
>> -       }
>> +       io_mode = aspeed_smc_get_io_mode(chip);
>> +       if (io_mode < 0)
>> +               return io_mode;
>> +
>> +       if (chip->nor.read_dummy == 0)
>> +               cmd = CONTROL_COMMAND_MODE_NORMAL;
>> +       else
>> +               cmd = CONTROL_COMMAND_MODE_FREAD;
>>
>> -       chip->ctl_val[smc_read] |= cmd |
>> +       chip->ctl_val[smc_read] |= cmd | io_mode |
>>                 CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
>>
>> -       dev_dbg(controller->dev, "base control register: %08x\n",
>> +       dev_dbg(controller->dev, "read control register: %08x\n",
>>                 chip->ctl_val[smc_read]);
>>         return 0;
>>  }
>> @@ -757,6 +785,8 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>         const struct spi_nor_hwcaps hwcaps = {
>>                 .mask = SNOR_HWCAPS_READ |
>>                         SNOR_HWCAPS_READ_FAST |
>> +                       SNOR_HWCAPS_READ_1_1_2 |
>> +                       SNOR_HWCAPS_READ_1_2_2 |
>>                         SNOR_HWCAPS_PP,
>>         };
>>         const struct aspeed_smc_info *info = controller->info;
>> --
>> 2.7.5
>>
