Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b89N8-0000Ld-1c
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 16:51:58 +0000
Received: by mail-yw0-x235.google.com with SMTP id c127so24189673ywb.1
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2016 09:51:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160530105005.62faa711@bbrezillon>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <1461961285-24159-2-git-send-email-kdasu.kdev@gmail.com>
 <20160530105005.62faa711@bbrezillon>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Wed, 1 Jun 2016 12:50:56 -0400
Message-ID: <CAKekbevuxMUsuKRuJE0cqNK_zAgG=64YOE6-OEYgY-neY7Ds1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma
 reads
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

On Mon, May 30, 2016 at 4:50 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 29 Apr 2016 16:21:25 -0400
> Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
>> This change provides a fix for controller bug where nand
>> controller could have a possible sticky error after a PIO
>> followed by a DMA read. The fix retries a read if we see
>> a uncorr_ecc after read to detect such sticky errors.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/nand/brcmnand/brcmnand.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 29a9abd..13c7784 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -1555,9 +1555,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>>       struct brcmnand_controller *ctrl = host->ctrl;
>>       u64 err_addr = 0;
>>       int err;
>> +     bool retry = true;
>>
>>       dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
>>
>> +try_dmaread:
>>       brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
>>
>>       if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
>> @@ -1579,7 +1581,18 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>>
>>       if (mtd_is_eccerr(err)) {
>>               int ret;
>> -
>> +             /*
>> +              * On controller version >=7.0 if we are doing a DMA read
>> +              * after a prior PIO read that reported uncorrectable error,
>> +              * the DMA engine captures this error following DMA read
>> +              * cleared only on subsequent DMA read, so just retry once
>> +              * to clear a possible false error reported for current DMA
>> +              * read
>> +              */
>
> Hm, shouldn't this BRCMNAND_UNCORR_COUNT bit be cleared just after
> doing the PIO/DMA read instead of doing it before executing a new read?
> This would solve your problem without the need for this extra retry, or
> am I missing something?
>

Clearing the count registers or the intr registers does not clear the
condition. Only a clean read (a page that does not have errors) clears
the condition. So if this was a false error  ( page is really clean)
and we read again, it will clear the condition.



Thanks
Kamal
