Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg6RE-0004kb-QW
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 09:08:51 +0000
Received: by mail-lf0-x244.google.com with SMTP id z127so8554767lfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 01:08:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170221093445.712ec39d@bbrezillon>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-3-git-send-email-peterpandong@micron.com>
 <20170221093445.712ec39d@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 21 Feb 2017 17:08:26 +0800
Message-ID: <CAAyFORJ6mDivPfuKVHDov_mZGCSDsFkEpPsTyo0jkY=KA7JPkQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] nand: spi: create spi_nand_chip struct
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
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

Hi Boris,

First, thanks for you comments. I regret I send it out too late!!

On Tue, Feb 21, 2017 at 4:34 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 21 Feb 2017 16:00:01 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> Create spi_nand_chip struct and helper functions.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  include/linux/mtd/spi-nand.h | 67 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>
>> diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
>> index 68442e08..23b16f0 100644
>> --- a/include/linux/mtd/spi-nand.h
>> +++ b/include/linux/mtd/spi-nand.h
>> @@ -16,6 +16,12 @@
>>  #ifndef __LINUX_MTD_SPI_NAND_H
>>  #define __LINUX_MTD_SPI_NAND_H
>>
>> +#include <linux/wait.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/flashchip.h>
>> +#include <linux/mtd/nand.h>
>> +
>>  /*
>>   * Standard SPI-NAND flash commands
>>   */
>> @@ -109,4 +115,65 @@
>>  #define SPI_NAND_MT29F_ECC_7_8_BIT   0x50
>>  #define SPI_NAND_MT29F_ECC_UNCORR    0x20
>>
>> +/**
>> + * struct spi_nand_chip - SPI-NAND Private Flash Chip Data
>> + * @base:            [INTERN] NAND device instance
>
> Drop extra tabs after the field name, and please drop these
> [INTERN/BOARDSPECIFIC] specifiers.

Fix this in v2.

>
>> + * @chip_lock:               [INTERN] protection lock
>> + * @name:            name of the chip
>> + * @wq:                      [INTERN] wait queue to sleep on if a SPI-NAND operation
>> + *                   is in progress used instead of the per chip wait queue
>> + *                   when a hw controller is available.
>> + * @mfr_id:          [BOARDSPECIFIC] manufacture id
>> + * @dev_id:          [BOARDSPECIFIC] device id
>> + * @state:           [INTERN] the current state of the SPI-NAND device
>> + * @read_cache_op:   [REPLACEABLE] Opcode of read from cache
>> + * @write_cache_op:  [REPLACEABLE] Opcode of program load
>> + * @buf:             [INTERN] buffer for read/write data
>> + * @oobbuf:          [INTERN] buffer for read/write oob
>> + * @controller_caps: [INTERN] capacities of SPI NAND controller
>> + * @size:            [INTERN] the size of chip
>> + * @options:         [BOARDSPECIFIC] various chip options. They can partly
>> + *                   be set to inform nand_scan about special functionality.
>> + * @ecc_strength:    [INTERN] ECC correctability from the datasheet.
>> + * @priv:            [BOARDSPECIFIC] pointer to controller data
>> + */
>> +struct spi_nand_chip {
>
> s/spi_nand_chip/spinand_device/
>
> Let's try to be consistent with the rawnand_device naming scheme. So in
> general s/spi_nand/spinand/

Fix this in v2.

>
>> +     struct nand_device      base;
>
> No tabs, just a single space.

Fix this in v2.

>
>> +     spinlock_t      chip_lock;
>
> s/chip_lock/lock/, why do you need a spinlock here?

Fix this in v2. The spinlock is used for get/put device. nand_get_device also
has a lock. I'll put this lock in controller struct, is this OK?

>
>> +     char            *name;
>> +     wait_queue_head_t wq;
>> +     u8              mfr_id;
>> +     u8              dev_id;
>
> Can we make it an array of u8 and then have pre-defined indexes like

Fix this in v2.

>
> #define SPINAND_MFR_ID          0
> #define SPINAND_DEV_ID          1
> ...
>
>> +     flstate_t       state;
>> +     u8              read_cache_op;
>> +     u8              write_cache_op;
>
> Hm, so these operations are manufacturer specific.

SPI NAND has x1/x2/x4/dual IO/quad IO modes for read/write. These two
are used to store opcode for read and write. The opcode for read and write
are uniform for vendors.

>
>> +     u8              *buf;
>> +     u8              *oobbuf;
>> +     u32             controller_caps;
>
> What flags do you plan to put here ^?

RIght now, the flags include support read/write mode(x1/x2/x4/dual/quad).

>
>> +     u64             size;
>
> Isn't it already defined in nand_device?

Yes you're right. Fix this in v2.

>
>> +     u32             options;
>
> Again, what do you plan to put in this field?

Some Micron chips need to select plane and die when read/write.

>
>> +     u32             ecc_strength;
>> +     void            *priv;
>
> Ok, it seems that ->priv is actually used to store controller specific
> data. Please rename it or do something like:
>
>         struct {
>                 void *priv;
>         } controller;
>
> It will avoid the kind of confusion we have in the rawnand framework.
>
> Since you also have controller caps, you could do:
>
>         struct {
>                 u32 caps;
>                 void *priv;
>                 /*
>                  * whatever is controller specific. probably a pointer
>                  * to the SPI controller or something like that.
>                  */
>         } controller;
>

Really valuable comment. Fix this in v2.

Thanks,
Peter Pan
