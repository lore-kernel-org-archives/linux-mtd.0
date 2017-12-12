Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOl62-00022G-2h
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 13:59:48 +0000
Received: by mail-lf0-x244.google.com with SMTP id f18so23284436lfg.8
 for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2017 05:59:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171212142033.5b19efec@bbrezillon>
References: <20171212083826.5000-1-greg@morpheus.ws>
 <20171212142033.5b19efec@bbrezillon>
From: Greg Cook <greg@morpheus.ws>
Date: Tue, 12 Dec 2017 21:59:20 +0800
Message-ID: <CAL92e2WzrsT61TmXwcsDyD2_7KdwB2BNqhf=U-ycB1QdRQ4F2w@mail.gmail.com>
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 December 2017 at 21:20, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Greg,
>
> Could you at least Cc the NAND maintainer when you submit something
> related to NAND!

It's my first time submitting a patch and I was following Sean's
instructions. I see now the recommendation is to use
'./scripts/get_maintainer.pl --norolestats 000*', which would have
CC'd in a LOT more people.

>
> On Tue, 12 Dec 2017 16:38:26 +0800
> Greg Cook <greg@morpheus.ws> wrote:
>
> Please add a commit message explaining what your fixing.
>

I have just resent it with a better subject line and a description. No
doubt this is also wrong ;)

>> Signed-off-by: Greg Cook <greg@morpheus.ws>
>> ---
>>  drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> index 021374f..cfa8c71 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>>
>>  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>>  {
>> -     if (info->ecc_bch) {
>> +     if (info->use_ecc && info->ecc_bch) {
>>               u32 val;
>>               int ret;
>>
>> @@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
>>
>>               if (info->cur_chunk < info->nfullchunks) {
>>                       info->step_chunk_size = info->chunk_size;
>> -                     info->step_spare_size = info->spare_size;
>> +                     if (info->use_ecc) {
>> +                             info->step_spare_size = info->spare_size;
>> +                     } else {
>> +                             info->step_spare_size = info->spare_size
>> +                                                     + info->ecc_size;
>> +                     }
>
> Curly braces are unneeded, ...

I disagree strongly because it costs a couple of keystrokes to add
them and I think it improves readability. *But* I see it is in the
Kernel coding style guidelines, so I grudgingly accept. I'm not going
to promise it won't happen again though...

> ...and I'd prefer to have the + operator at the
> end of the line. Or it could be written like that:
>
>                         info->step_spare_size = info->spare_size;
>                         if (!info->use_ecc)
>                                 info->step_spare_size += info->ecc_size;

Agreed. This is much nicer.

>
> Anyway, I'm still not convince this is the appropriate fix. As
> mentioned in my previous, I wonder why we're not activating ECC when
> reading OOB bytes. There's a good reason for having 2 different hooks
> to read/write OOBs: one is doing it in raw mode (with the ECC engine
> disabled), the other one is doing it with the ECC engine enabled.
> This driver not only omit raw accessors (which is already a bad news
> for everyone that needs to debug the driver) but it also do things
> differently for OOB and page access: OOB bytes are read in raw mode
> while pages are always accessed with the ECC engine enabled.
>
> OOB accesses are broken and should be fixed, I think we all agree on
> that, but we should fix it correctly, don't you think?
> And by correctly, I mean we should try to make things consistent at
> least (read OOB bytes with the ECC engine enabled).

All fair points. I assumed there was some deliberate reason why
READOOB was being done without ECC, so I made a point of not changing
that part. For an extra data-point, I should be able to try your
suggested fix on our 2nd-round prototypes in the new year (maybe
sooner, on one of my 1st round protos if I get time),

>
>>               } else {
>>                       info->step_chunk_size = info->last_chunk_size;
>>                       info->step_spare_size = info->last_spare_size;
>
> Can you try with the below patch and see if it fixes the timeout issue?
>
> --->8---
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 021374fe59dc..d1979c7dbe7e 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -961,6 +961,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
>
>         switch (command) {
>         case NAND_CMD_READ0:
> +       case NAND_CMD_READOOB:
>         case NAND_CMD_PAGEPROG:
>                 info->use_ecc = 1;
>                 break;
