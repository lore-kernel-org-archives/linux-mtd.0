Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bn50K-0004Zt-D6
 for linux-mtd@lists.infradead.org; Thu, 22 Sep 2016 14:29:38 +0000
Received: by mail-lf0-x241.google.com with SMTP id l131so4171879lfl.0
 for <linux-mtd@lists.infradead.org>; Thu, 22 Sep 2016 07:29:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD6G_RRHP+pKJOAMO0UtNNtSnpSmE_FrKU5=o8FUAkKjP_fSyQ@mail.gmail.com>
References: <1470775225-19787-1-git-send-email-jteki@openedev.com>
 <CAD6G_RRHP+pKJOAMO0UtNNtSnpSmE_FrKU5=o8FUAkKjP_fSyQ@mail.gmail.com>
From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 22 Sep 2016 19:59:13 +0530
Message-ID: <CAD6G_RQRPRbo-+nUK+xiOjiZDG1W4v2JTawxQ2LDzx9LfMmSBw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: spi-nor: Add quad page program support
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jagan Teki <jteki@openedev.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 29, 2016 at 6:54 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> On Wed, Aug 10, 2016 at 2:10 AM, Jagan Teki <jteki@openedev.com> wrote:
>> Add quad page program support with the use of nor->flags
>> and then controller will use 4 lines for data transmission
>> which is quite faster than page program(02h)
>>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Jagan Teki <jteki@openedev.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
>>  include/linux/mtd/spi-nor.h   |  2 ++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..f88bd7e 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -75,6 +75,7 @@ struct flash_info {
>>                                          * bit. Must be used with
>>                                          * SPI_NOR_HAS_LOCK.
>>                                          */
>> +#define SPI_NOR_QUAD_WRITE     BIT(10) /* Flash supports Quad Write */
>>  };
>>
>>  #define JEDEC_MFR(info)        ((info)->id[0])
>> @@ -1306,6 +1307,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>         struct device *dev = nor->dev;
>>         struct mtd_info *mtd = &nor->mtd;
>>         struct device_node *np = spi_nor_get_flash_node(nor);
>> +       bool need_quad = false;
>>         int ret;
>>         int i;
>>
>> @@ -1441,6 +1443,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>                         return ret;
>>                 }
>>                 nor->flash_read = SPI_NOR_QUAD;
>> +               need_quad = true;
>>         } else if (mode == SPI_NOR_DUAL && info->flags & SPI_NOR_DUAL_READ) {
>>                 nor->flash_read = SPI_NOR_DUAL;
>>         }
>> @@ -1465,6 +1468,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>         }
>>
>>         nor->program_opcode = SPINOR_OP_PP;
>> +       if (nor->flags == SNOR_F_USE_QPP && info->flags & SPI_NOR_QUAD_WRITE) {
>> +               if (!need_quad)
>> +                       ret = set_quad_mode(nor, info);
>> +                       if (ret) {
>> +                               dev_err(dev, "quad mode not supported\n");
>> +                               return ret;
>> +                       }
>> +               }
>> +               nor->program_opcode = SPINOR_OP_QPP;
>> +       }
>>
>>         if (info->addr_width)
>>                 nor->addr_width = info->addr_width;
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index c425c7b..aa0e6cd 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -46,6 +46,7 @@
>>  #define SPINOR_OP_READ_1_1_2   0x3b    /* Read data bytes (Dual SPI) */
>>  #define SPINOR_OP_READ_1_1_4   0x6b    /* Read data bytes (Quad SPI) */
>>  #define SPINOR_OP_PP           0x02    /* Page program (up to 256 bytes) */
>> +#define SPINOR_OP_QPP          0x32    /* Quad Page program */
>>  #define SPINOR_OP_BE_4K                0x20    /* Erase 4KiB block */
>>  #define SPINOR_OP_BE_4K_PMC    0xd7    /* Erase 4KiB block on PMC chips */
>>  #define SPINOR_OP_BE_32K       0x52    /* Erase 32KiB block */
>> @@ -119,6 +120,7 @@ enum spi_nor_ops {
>>  enum spi_nor_option_flags {
>>         SNOR_F_USE_FSR          = BIT(0),
>>         SNOR_F_HAS_SR_TB        = BIT(1),
>> +       SNOR_F_USE_QPP          = BIT(2),
>>  };
>>
>>  /**
>> --
>> 2.7.4
>>
>
> Ping!

Any comments? will resend rebased v2 if it is OK?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
