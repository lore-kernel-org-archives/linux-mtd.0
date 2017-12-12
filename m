Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOkh7-0006ic-K5
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 13:34:07 +0000
Subject: Re: [PATCH] Fix OOB_READ bug where hardware FIFO is not drained
 completely. Fix potential bug for non-ECC operations.
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Greg Cook
 <greg@morpheus.ws>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@free-electrons.com>, "Kasper Revsbech (KREV)" <krev@triax.com>
References: <20171212083826.5000-1-greg@morpheus.ws>
 <20171212142033.5b19efec@bbrezillon>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <ab0ba0d5-09e9-4c9f-7798-b02fe9b54260@prevas.dk>
Date: Tue, 12 Dec 2017 14:33:43 +0100
MIME-Version: 1.0
In-Reply-To: <20171212142033.5b19efec@bbrezillon>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris
> Hi Greg,
>
> Could you at least Cc the NAND maintainer when you submit something
> related to NAND!
>
> On Tue, 12 Dec 2017 16:38:26 +0800
> Greg Cook <greg@morpheus.ws> wrote:
>
> Please add a commit message explaining what your fixing.
>
>> Signed-off-by: Greg Cook <greg@morpheus.ws>
>> ---
>>   drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> index 021374f..cfa8c71 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -677,7 +677,7 @@ static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
>>   
>>   static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>>   {
>> -	if (info->ecc_bch) {
>> +	if (info->use_ecc && info->ecc_bch) {
>>   		u32 val;
>>   		int ret;
>>   
>> @@ -1023,7 +1023,12 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
>>   
>>   		if (info->cur_chunk < info->nfullchunks) {
>>   			info->step_chunk_size = info->chunk_size;
>> -			info->step_spare_size = info->spare_size;
>> +			if (info->use_ecc) {
>> +				info->step_spare_size = info->spare_size;
>> +			} else {
>> +				info->step_spare_size = info->spare_size
>> +							+ info->ecc_size;
>> +			}
> Curly braces are unneeded, and I'd prefer to have the + operator at the
> end of the line. Or it could be written like that:
>
> 			info->step_spare_size = info->spare_size;
> 			if (!info->use_ecc)
> 				info->step_spare_size += info->ecc_size;
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
>
>>   		} else {
>>   			info->step_chunk_size = info->last_chunk_size;
>>   			info->step_spare_size = info->last_spare_size;
> Can you try with the below patch and see if it fixes the timeout issue?
>
> --->8---
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 021374fe59dc..d1979c7dbe7e 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -961,6 +961,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
>   
>          switch (command) {
>          case NAND_CMD_READ0:
> +       case NAND_CMD_READOOB:
>          case NAND_CMD_PAGEPROG:
>                  info->use_ecc = 1;
>                  break;
This fixes the timeout issue :-) Also without bbt...

root@output-module:~# nanddump -oa /dev/mtd1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 8
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x0ff00000...
UBIXSUBI

/Sean
