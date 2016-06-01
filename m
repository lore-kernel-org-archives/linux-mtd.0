Received: from mail-yw0-x22a.google.com ([2607:f8b0:4002:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b89Id-00079s-N6
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 16:47:20 +0000
Received: by mail-yw0-x22a.google.com with SMTP id x189so23996121ywe.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2016 09:46:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160530104213.79ff4a28@bbrezillon>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <20160530104213.79ff4a28@bbrezillon>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Wed, 1 Jun 2016 12:46:18 -0400
Message-ID: <CAKekbesoPajRAE1d=df1bWM=YF2MmMnC8-UHEmEkYuV1y+PFhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: brcmnand: Add check for erased page bitflips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,



On Mon, May 30, 2016 at 4:42 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Kamal,
>
> On Fri, 29 Apr 2016 16:21:24 -0400
> Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
>> Check for erased page bitflips in a page. And if well within
>> threshold return data as all 0xff.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 83 +++++++++++++++++++++++++++++++++---
>>  1 file changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index e052839..29a9abd 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -1490,6 +1490,64 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>>       return ret;
>>  }
>>
>> +/*
>> + * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
>> + * error
>> + *
>> + * Because the HW ECC signals an ECC error if an erase paged has even a single
>> + * bitflip, we must check each ECC error to see if it is actually an erased
>> + * page with bitflips, not a truly corrupted page.
>> + *
>> + * On a real error, return a negative error code (-EBADMSG for ECC error), and
>> + * buf will contain raw data.
>> + * Otherwise, fill buf with 0xff and return the maximum number of
>> + * bitflips-per-ECC-sector to the caller.
>> + *
>> + */
>> +static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>> +               struct nand_chip *chip, void *buf, u64 addr)
>> +{
>> +     int i, sas, oob_nbits, data_nbits;
>> +     void *oob = chip->oob_poi;
>> +     unsigned int max_bitflips = 0;
>> +     int page = addr >> chip->page_shift;
>> +     int ret;
>> +
>> +     if (!buf) {
>> +             buf = chip->buffers->databuf;
>> +             /* Invalidate page cache */
>> +             chip->pagebuf = -1;
>> +     }
>> +
>> +     sas = mtd->oobsize / chip->ecc.steps;
>> +     oob_nbits = sas << 3;
>> +     data_nbits = chip->ecc.size << 3;
>> +
>> +     /* read without ecc for verification */
>> +     chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>> +     ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
>
> Do you really need to read the whole page in raw mode? Usually, only
> reading the OOB sections is enough.
>

Just so that the HW ecc algo does not kick in we read the page in raw
mode. OOB registers are filled as part of this read. Also just the
data might have bit flips and OOB might be all FFs, we still need to
read  page data. Generally we read again to make sure that the hw ecc
algo did not change the data after calculations in the original  read
where it reported uncorrectable error.  I will double check this.

>> +     if (ret)
>> +             return ret;
>> +
>> +     for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
>> +             unsigned int bitflips = 0;
>> +
>> +             bitflips += oob_nbits - bitmap_weight(oob, oob_nbits);
>> +             bitflips += data_nbits - bitmap_weight(buf, data_nbits);
>> +
>> +             buf += chip->ecc.size;
>> +             addr += chip->ecc.size;
>
> You seem to duplicate nand_check_erased_ecc_chunk() here. Do you have a
> good reason for doing that?
>

Hmmm I see what you are saying. Let me try setting the
NAND_ECC_GENERIC_ERASED_CHECK option and see if we can get away
without having to read raw.  I will have to test and make sure on
uncorrectable error the hw leaves the return page data buffers and oob
buffers in raw state.

If that works as expected I will get rid of this duplication and send
a revised change which shall make use of the
NAND_ECC_GENERIC_ERASED_CHECK option.

Thanks
Kamal
