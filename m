Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsUiT-0005bp-88
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2013 09:43:58 +0000
Received: by mail-pb0-f45.google.com with SMTP id rp16so5256488pbb.4
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 01:43:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131216043040.GB27109@shlinux2.ap.freescale.net>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
 <20131216043040.GB27109@shlinux2.ap.freescale.net>
Date: Mon, 16 Dec 2013 10:43:34 +0100
Message-ID: <CAGWqfij_FQrXoBkhsL-noMxHyJV1yOyj8BO+ABCZFMP8Hv5upA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 16, 2013 at 5:30 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Sun, Dec 15, 2013 at 07:44:21PM +0100, Elie De Brauwer wrote:
>> The BCH block typically used with a i.MX28 and GPMI block is only
>> able to correct bitflips on data actually streamed through the block.
>> When erasing a block the data does not stream through the BCH block
>> and therefore no ECC data is written to the NAND chip. This causes
>> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
>> found in an erased page. Typically causing problems at higher levels
>> (ubifs corrupted empty space warnings).
>>
>> This patch configures the BCH block to mark a block as 'erased' if
>> no more than ecc_strength bitflips are found. Next HW_BCH_STATUS0:ALLONES
>> is used to check if the data read were all ones. If this was not
>> the case a slow path is entered where bitflips are counted and
>> corrected in software, allowing the upper layers to take proper actions.
>>
>> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
>> Acked-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  drivers/mtd/nand/gpmi-nand/bch-regs.h  |    2 ++
>>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   17 +++++++++++++
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   43 +++++++++++++++++++++++++++++---
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 +
>>  4 files changed, 60 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
>> index 588f537..a30502f 100644
>> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
>> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
>> @@ -30,7 +30,9 @@
>>  #define BM_BCH_CTRL_COMPLETE_IRQ             (1 << 0)
>>
>>  #define HW_BCH_STATUS0                               0x00000010
>> +#define BM_BCH_STATUS0_ALLONES_MASK          (1 << 4)
>>  #define HW_BCH_MODE                          0x00000020
>> +#define BM_BCH_MODE_ERASE_THRESHOLD_MASK     0xff
>>  #define HW_BCH_ENCODEPTR                     0x00000030
>>  #define HW_BCH_DATAPTR                               0x00000040
>>  #define HW_BCH_METAPTR                               0x00000050
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> index aaced29..4551a38 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> @@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>>                       | BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>>                       r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>>
>> +     /*
>> +      * Set the tolerance for bitflips when reading erased blocks
>> +      * equal to the ecc_strength.
>> +      */
> Please also add the following comment :
>    "We even detect the bitflips for SLC nand."
>
>> +     writel(bch_geo->ecc_strength & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
>> +             r->bch_regs + HW_BCH_MODE);
>> +
>
> After discuss with the IC owner, we could set the bch_geo->gf_len here.
>
> The bch_geo->gf_len is 13 or 14 now.
>
> For the sake of safe, I suggest to set (bch_geo->gf_len / 2) for the ERASE_THRESHOLD.
>
> I think this value is enough for us.
>
>
>>       /* Set *all* chip selects to use layout 0. */
>>       writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>>
>> @@ -1094,6 +1101,16 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
>>       return reg & mask;
>>  }
>>
>> +/* Returns 1 if the last transaction consisted only out of ones. */
>> +int gpmi_allones(struct gpmi_nand_data *this)
>> +{
>> +     struct resources *r = &this->resources;
>> +     uint32_t reg = readl(r->gpmi_regs + HW_BCH_STATUS0);
> please add a empty line here.
>> +     if (reg & BM_BCH_STATUS0_ALLONES_MASK)
>> +             return 1;
>> +     return 0;
> We can simplify the code to:
>         return reg & BM_BCH_STATUS0_ALLONES_MASK;
>

I was doing some stress testing on this piece of code today, but I'm
afraid the ALLONES solution apparently does not work. If I look at the
BCH_STATUS0 register while doing some heavy flash access, the
(entire) register remains zero at all times, while I would at least expect the
ALLONES_MASK to change when I'm reading erased sectors. Any
suggestions on this ? Since if we can't rely on the functioning of this bit
it would be better to stick to the first version of the patch (with the gf_len
threshold in place).

my 2 cents
E.



-- 
Elie De Brauwer
