Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIRMF-0000Ro-VD
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 03:10:10 +0000
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v5739XJC005502
 for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2017 12:09:33 +0900
Received: by mail-yw0-f181.google.com with SMTP id 63so286508ywr.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2017 20:09:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170607000133.69fbf82b@bbrezillon>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
 <1496704922-12261-5-git-send-email-yamada.masahiro@socionext.com>
 <20170607000133.69fbf82b@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Jun 2017 12:09:31 +0900
Message-ID: <CAK7LNATXygK2f71J8gggGQRuEdJ21CJfg9WVCYXgO=+NRBwcLg@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] mtd: nand: denali: avoid hard-coding ECC step,
 strength, bytes
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-06-07 7:01 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Tue,  6 Jun 2017 08:21:43 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> This driver was originally written for the Intel MRST platform with
>> several platform-specific parameters hard-coded.
>>
>> Currently, the ECC settings are hard-coded as follows:
>>
>>   #define ECC_SECTOR_SIZE 512
>>   #define ECC_8BITS       14
>>   #define ECC_15BITS      26
>>
>> Therefore, the driver can only support two cases.
>>  - ecc.size = 512, ecc.strength = 8    --> ecc.bytes = 14
>>  - ecc.size = 512, ecc.strength = 15   --> ecc.bytes = 26
>>
>> However, these are actually customizable parameters, for example,
>> UniPhier platform supports the following:
>>
>>  - ecc.size = 1024, ecc.strength = 8   --> ecc.bytes = 14
>>  - ecc.size = 1024, ecc.strength = 16  --> ecc.bytes = 28
>>  - ecc.size = 1024, ecc.strength = 24  --> ecc.bytes = 42
>>
>> So, we need to handle the ECC parameters in a more generic manner.
>> Fortunately, the Denali User's Guide explains how to calculate the
>> ecc.bytes.  The formula is:
>>
>>   ecc.bytes = 2 * CEIL(13 * ecc.strength / 16)  (for ecc.size = 512)
>>   ecc.bytes = 2 * CEIL(14 * ecc.strength / 16)  (for ecc.size = 1024)
>>
>> For DT platforms, it would be reasonable to allow DT to specify ECC
>> strength by either "nand-ecc-strength" or "nand-ecc-maximize".  If
>> none of them is specified, the driver will try to meet the chip's ECC
>> requirement.
>>
>> For PCI platforms, the max ECC strength is used to keep the original
>> behavior.
>>
>> Newer versions of this IP need ecc.size and ecc.steps explicitly
>> set up via the following registers:
>>   CFG_DATA_BLOCK_SIZE       (0x6b0)
>>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
>>   CFG_NUM_DATA_BLOCKS       (0x6d0)
>>
>> For older IP versions, write accesses to these registers are just
>> ignored.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>
>> Changes in v4:
>>   - Rewrite by using generic helpers, nand_check_caps(),
>>     nand_match_ecc_req(), nand_maximize_ecc().
>>
>> Changes in v3:
>>   - Move DENALI_CAP_ define out of struct denali_nand_info
>>   - Use chip->ecc_step_ds as a hint to choose chip->ecc.size
>>     where possible
>>
>> Changes in v2:
>>   - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_
>>   - Make ECC 512 cap and ECC 1024 cap independent
>>   - Set up three CFG_... registers
>>
>>  .../devicetree/bindings/mtd/denali-nand.txt        |   7 ++
>>  drivers/mtd/nand/denali.c                          | 103 ++++++++++++++-------
>>  drivers/mtd/nand/denali.h                          |  11 ++-
>>  drivers/mtd/nand/denali_dt.c                       |   8 ++
>>  drivers/mtd/nand/denali_pci.c                      |   9 ++
>>  5 files changed, 101 insertions(+), 37 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> index e593bbe..b7742a7 100644
>> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> @@ -7,6 +7,13 @@ Required properties:
>>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>>    - interrupts : The interrupt number.
>>
>> +Optional properties:
>> +  - nand-ecc-step-size: see nand.txt for details.  If present, the value must be
>> +      512        for "altr,socfpga-denali-nand"
>> +  - nand-ecc-strength: see nand.txt for details.  Valid values are:
>> +      8, 15      for "altr,socfpga-denali-nand"
>> +  - nand-ecc-maximize: see nand.txt for details
>> +
>>  The device tree may optionally contain sub-nodes describing partitions of the
>>  address space. See partition.txt for more detail.
>>
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index 16634df..3204c51 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -886,8 +886,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
>>       return max_bitflips;
>>  }
>>
>> -#define ECC_SECTOR_SIZE 512
>> -
>>  #define ECC_SECTOR(x)        (((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
>>  #define ECC_BYTE(x)  (((x) & ECC_ERROR_ADDRESS__OFFSET))
>>  #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
>> @@ -899,6 +897,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>>                              struct denali_nand_info *denali,
>>                              unsigned long *uncor_ecc_flags, uint8_t *buf)
>>  {
>> +     unsigned int ecc_size = denali->nand.ecc.size;
>>       unsigned int bitflips = 0;
>>       unsigned int max_bitflips = 0;
>>       uint32_t err_addr, err_cor_info;
>> @@ -928,9 +927,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>>                        * an erased sector.
>>                        */
>>                       *uncor_ecc_flags |= BIT(err_sector);
>> -             } else if (err_byte < ECC_SECTOR_SIZE) {
>> +             } else if (err_byte < ecc_size) {
>>                       /*
>> -                      * If err_byte is larger than ECC_SECTOR_SIZE, means error
>> +                      * If err_byte is larger than ecc_size, means error
>>                        * happened in OOB, so we ignore it. It's no need for
>>                        * us to correct it err_device is represented the NAND
>>                        * error bits are happened in if there are more than
>> @@ -939,7 +938,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>>                       int offset;
>>                       unsigned int flips_in_byte;
>>
>> -                     offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
>> +                     offset = (err_sector * ecc_size + err_byte) *
>>                                               denali->devnum + err_device;
>>
>>                       /* correct the ECC error */
>> @@ -1345,13 +1344,55 @@ static void denali_hw_init(struct denali_nand_info *denali)
>>       denali_irq_init(denali);
>>  }
>>
>> -/*
>> - * Althogh controller spec said SLC ECC is forceb to be 4bit,
>> - * but denali controller in MRST only support 15bit and 8bit ECC
>> - * correction
>> - */
>> -#define ECC_8BITS    14
>> -#define ECC_15BITS   26
>> +static int denali_calc_ecc_bytes(int step_size, int strength)
>> +{
>> +     int coef;
>> +
>> +     switch (step_size) {
>> +     case 512:
>> +             coef = 13;
>> +             break;
>> +     case 1024:
>> +             coef = 14;
>> +             break;
>> +     default:
>> +             return -ENOTSUPP;
>> +     }
>> +
>> +     return DIV_ROUND_UP(strength * coef, 16) * 2;
>
> or just
>
>         return DIV_ROUND_UP(strength * fls(8 * step_size), 16) * 2;

Good idea.

I heard the Denali ECC engine uses BCH code.
I am not familiar with the algorithm,
but probably this generalized formula is correct.

>> +}
>> +
>> +static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
>> +                         struct denali_nand_info *denali)
>> +{
>> +     struct nand_ecc_caps caps;
>> +     int ret;
>> +
>> +     caps.stepinfos = denali->stepinfo;
>> +     caps.nstepinfos = 1;
>> +     caps.calc_ecc_bytes = denali_calc_ecc_bytes;
>> +     caps.oob_reserve_bytes = denali->bbtskipbytes;
>
> If you get rid of this oob_reserve_bytes field, you can define caps as
> a static const and even directly store ecc_caps in denali_nand_info.

To make caps static const, denali_calc_ecc_bytes must be exported
to be referenced from denali_dt/denali_pci.
I am reluctant to do it.





-- 
Best Regards
Masahiro Yamada
