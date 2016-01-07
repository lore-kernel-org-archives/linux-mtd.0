Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH3gU-0001Wo-GS
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 06:04:31 +0000
Received: by mail-lf0-x22c.google.com with SMTP id c192so149854923lfe.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 22:04:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160106161635.61b5400f@bbrezillon>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <1450159178-29895-9-git-send-email-peterpandong@micron.com>
 <20160106161635.61b5400f@bbrezillon>
Date: Thu, 7 Jan 2016 14:04:08 +0800
Message-ID: <CAAyFORLq1bEubyug-10qy7GeNwP5V7VW0bLrDtpnsCE3D_tz_g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] mtd: nand_bbt: remove struct nand_chip from
 nand_bbt.c
From: Peter Pan <peterpansjtu@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>, Peter Pan <peterpandong@micron.com>,
 beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 karlzhang@micron.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 6, 2016 at 11:16 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 15 Dec 2015 05:59:34 +0000
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
>> From: Brian Norris <computersforpeace@gmail.com>
>>
>> This commit contains most of modification. But the job is quite
>> simple --- replace struct nand_chip with struct nand_bbt. There
>> is no algorithm change, just replacement.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/nand_bbt.c | 391 ++++++++++++++++++++++----------------------
>>  1 file changed, 193 insertions(+), 198 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
>> index a5c8ab5..b46b4ae 100644
>> --- a/drivers/mtd/nand/nand_bbt.c
>> +++ b/drivers/mtd/nand/nand_bbt.c
>
> [...]
>
>>  /**
>>   * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)
>> - * @mtd: MTD device structure
>> + * @bbt: NAND BBT structure
>>   *
>>   * The function checks, if a bad block table(s) is/are already available. If
>>   * not it scans the device for manufacturer marked good / bad blocks and writes
>> @@ -1000,21 +1000,21 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>>   * The bad block table memory is allocated here. It must be freed by calling
>>   * the nand_free_bbt function.
>>   */
>> -static int nand_scan_bbt(struct mtd_info *mtd)
>> +static int nand_scan_bbt(struct nand_bbt *bbt)
>>  {
>> -     struct nand_chip *this = mtd_to_nand(mtd);
>> -     int len, res;
>> +     struct mtd_info *mtd = bbt->mtd;
>> +     int len, res = 0;
>>       uint8_t *buf;
>> -     struct nand_bbt_descr *td = this->bbt_td;
>> -     struct nand_bbt_descr *md = this->bbt_md;
>> +     struct nand_bbt_descr *td = bbt->bbt_td;
>> +     struct nand_bbt_descr *md = bbt->bbt_md;
>>
>>       len = (mtd->size >> (this->bbt_erase_shift + 2)) ? : 1;
>
> 'this' is gone, which generates a compilation error.
>
>         len = (mtd->size >> (bbt->bbt_erase_shift + 2)) ? : 1;

Fix this in v3

>
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

Thanks
Peter Pan
