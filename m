Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg6tM-0003tj-99
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 09:37:54 +0000
Received: by mail-lf0-x243.google.com with SMTP id z127so8619899lfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 01:37:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b9e88910-c883-394d-09eb-0e29d0f297aa@gmail.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-11-git-send-email-peterpandong@micron.com>
 <b9e88910-c883-394d-09eb-0e29d0f297aa@gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 21 Feb 2017 17:37:29 +0800
Message-ID: <CAAyFORJevzfjqi99zsU_dkzn=-EaoakYRPQPUUe+rKEw3Bjj6g@mail.gmail.com>
Subject: Re: [PATCH 10/11] nand: spi: Add generic SPI controller support
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnaud,

On Tue, Feb 21, 2017 at 5:25 PM, Arnaud Mouiche
<arnaud.mouiche@gmail.com> wrote:
>
>
> On 21/02/2017 09:00, Peter Pan wrote:
>>
>> This commit supports to use generic spi controller
>> as SPI NAND controller.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>   drivers/mtd/nand/spi/Kconfig             |   2 +
>>   drivers/mtd/nand/spi/Makefile            |   1 +
>>   drivers/mtd/nand/spi/chips/Kconfig       |   5 +
>>   drivers/mtd/nand/spi/chips/Makefile      |   1 +
>>   drivers/mtd/nand/spi/chips/generic_spi.c | 269
>> +++++++++++++++++++++++++++++++
>>   5 files changed, 278 insertions(+)
>>   create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
>>   create mode 100644 drivers/mtd/nand/spi/chips/Makefile
>>   create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c
>
> [...]
>
>> +/*
>> + * generic_spi_nand_cmd_fn - to process a command to send to the SPI-NAND
>> + * by generic SPI bus
>> + * @chip: SPI-NAND device structure
>> + * @cmd: command structure
>> + * Description:
>> + *   Set up the command buffer to send to the SPI controller.
>> + *   The command buffer has to initialized to 0.
>> + */
>> +static int generic_spi_nand_cmd_fn(struct spi_nand_chip *chip,
>> +                               struct spi_nand_cmd *cmd)
>> +{
>> +       struct spi_nand_cmd_cfg *cmd_cfg = spi_nand_get_cmd_cfg(cmd->cmd);
>> +       struct spi_message message;
>> +       struct spi_transfer x[3];
>> +       struct spi_device *spi = chip->priv;
>> +       u8 buf[SPINAND_MAX_ADDR_LEN];
>> +
>> +       spi_message_init(&message);
>> +       memset(x, 0, sizeof(x));
>> +       x[0].len = 1;
>> +       x[0].tx_nbits = 1;
>> +       x[0].tx_buf = &cmd->cmd;
>> +       spi_message_add_tail(&x[0], &message);
>> +
>> +       if (cmd_cfg->addr_bytes || cmd_cfg->dummy_bytes) {
>> +               if (cmd_cfg->addr_bytes > cmd->n_addr) {
>> +                       memcpy(buf, cmd->addr, cmd->n_addr);
>> +                       memset(cmd->addr, 0, cmd->n_addr);
>> +                       memcpy(cmd->addr + cmd_cfg->addr_bytes -
>> cmd->n_addr,
>> +                               buf, cmd->n_addr);
>> +               }
>> +               x[1].len = cmd_cfg->addr_bytes + cmd_cfg->dummy_bytes;
>> +               x[1].tx_nbits = cmd_cfg->addr_bits;
>> +               x[1].tx_buf = cmd->addr;
>> +               spi_message_add_tail(&x[1], &message);
>> +       }
>> +       if (cmd->n_tx) {
>> +               x[2].len = cmd->n_tx;
>> +               x[2].tx_nbits = cmd_cfg->data_bits;
>> +               x[2].tx_buf = cmd->tx_buf;
>> +               spi_message_add_tail(&x[2], &message);
>> +       } else if (cmd->n_rx) {
>> +               x[2].len = cmd->n_rx;
>> +               x[2].rx_nbits = cmd_cfg->data_bits;
>> +               x[2].rx_buf = cmd->rx_buf;
>> +               spi_message_add_tail(&x[2], &message);
>> +       }
>> +       return spi_sync(spi, &message);
>> +}
>> +
>>
> Just a spi speed consideration.
> All the spi drivers I've work with are not very good for scatter/gather, and
> performance are dropping especially when you gather only 1 to 3 bytes parts.
> But we can manage this optimization later anyway, with proper speed figures,
> once the spinand framework will be merged.

I also found the speed issue when debugging. For opcode and address transfer
and get/set feature, CPU polling is better than DMA while CPU resource
is wasted.

Thanks,
Peter Pan
