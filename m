Received: from m50-134.163.com ([123.125.50.134])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCXMB-0000ej-KM
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2012 14:26:45 +0000
Message-ID: <4F71CE13.10706@163.com>
Date: Tue, 27 Mar 2012 22:26:27 +0800
From: Zhaoxiu Zeng <zengzhaoxiu@163.com>
MIME-Version: 1.0
To: paul.gortmaker@windriver.com, fransmeulenbroeks@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: Re: [PATCH] mtd/nand/nand_ecc.c: replace bitsperbyte table by
 a simple operation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Paul and Frans

Thanks for your reply.

I don't write a commit log because I have ugly eglish! :)

For all words which has only one "1" bit, "!(tmp & (tmp - 1))"
must be true, others except zero must be false!

In this instance we just need to check whether the result has
only one "1" bit, so "!(tmp & (tmp - 1))" is enough, and faster.
Rest changes are adjuvant.


> Dear Zhaoxiu
>
> Thanks for contributing this patch.
> However, I think it has some issues and should not be applied. See my
> remarks below
>
> 2012/3/24 Zhaoxiu Zeng <zengzhaoxiu <at> 163.com>:
>> Signed-off-by: Zhaoxiu Zeng <zengzhaoxiu <at> 163.com>
>>
>> ---
>> drivers/mtd/nand/nand_ecc.c | 50 +++++++++---------------------------------
>> 1 files changed, 11 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
>> index b7cfe0d..e05a0fd 100644
>> --- a/drivers/mtd/nand/nand_ecc.c
>> +++ b/drivers/mtd/nand/nand_ecc.c
>> @@ -85,30 +85,6 @@ static const char invparity[256] = {
>> };
>>
>> /*
>> - * bitsperbyte contains the number of bits per byte
>> - * this is only used for testing and repairing parity
>> - * (a precalculated value slightly improves performance)
>> - */
>> -static const char bitsperbyte[256] = {
>> - 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
>> - 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
>> - 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
>> - 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
>> - 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
>> - 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
>> - 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
>> - 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
>> - 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
>> - 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
>> - 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
>> - 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
>> - 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
>> - 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
>> - 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
>> - 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8,
>> -};
>> -
>> -/*
>> * addressbits is a lookup table to filter out the bits from the xor-ed
>> * ECC data that identify the faulty location.
>> * this is only used for repairing parity
>> @@ -448,12 +424,14 @@ int __nand_correct_data(unsigned char *buf,
>> unsigned int byte_addr;
>> /* 256 or 512 bytes/ecc */
>> const uint32_t eccsize_mult = eccsize >> 8;
>> + const uint32_t check_mask = eccsize_mult == 2 ? 0x555555 : 0x545555;
>> + uint32_t tmp;
>>
>> /*
>> * b0 to b2 indicate which bit is faulty (if any)
>> * we might need the xor result more than once,
>> * so keep them in a local var
>> - */
>> + */
>> #ifdef CONFIG_MTD_NAND_ECC_SMC
>> b0 = read_ecc[0] ^ calc_ecc[0];
>> b1 = read_ecc[1] ^ calc_ecc[1];
>> @@ -467,14 +445,11 @@ int __nand_correct_data(unsigned char *buf,
>>
>> /* repeated if statements are slightly more efficient than switch ... */
>> /* ordered in order of likelihood */
>> -
>> - if ((b0 | b1 | b2) == 0)
>> + tmp = ((uint32_t)b2 << 16) | ((uint32_t)b1 << 8) | b0;
> Not sure how efficient this is; on some systems shifting by N takes N
> clock cycles so this could be relatively expensive.
> (and the systems where it takes more clock cycles have a higher chance
> on not having hw crc correction).
>
>> + if (tmp == 0)
>> return 0; /* no error */
>>
>> - if ((((b0 ^ (b0 >> 1)) & 0x55) == 0x55) &&
>> - (((b1 ^ (b1 >> 1)) & 0x55) == 0x55) &&
>> - ((eccsize_mult == 1 && ((b2 ^ (b2 >> 1)) & 0x54) == 0x54) ||
>> - (eccsize_mult == 2 && ((b2 ^ (b2 >> 1)) & 0x55) == 0x55))) {
>> + if (((tmp ^ (tmp >> 1)) & check_mask) == check_mask) {
> Have you benchmarked this?
>
> And while it might be an optimisation, it is not mentioned in the
> commit message.
>
>> /* single bit error */
>> /*
>> * rp17/rp15/13/11/9/7/5/3/1 indicate which byte is the faulty
>> @@ -492,19 +467,16 @@ int __nand_correct_data(unsigned char *buf,
>> * We could also do addressbits[b2] >> 1 but for the
>> * performance it does not make any difference
>> */
>> - if (eccsize_mult == 1)
>> - byte_addr = (addressbits[b1] << 4) + addressbits[b0];
>> - else
>> - byte_addr = (addressbits[b2 & 0x3] << 8) +
>> - (addressbits[b1] << 4) + addressbits[b0];
>> + byte_addr = (addressbits[b1] << 4) + addressbits[b0];
>> + if (eccsize_mult == 2)
>> + byte_addr += (addressbits[b2 & 0x3] << 8);
> I'm not sure if this is a win. It *looks* like an optimisation since
> you factor out some common code. Then again within the if you need to
> add to byte_addr.
> For a naive compiler this is probably more expensive. For a good
> compiler this probably makes no difference at all.
>
>> bit_addr = addressbits[b2 >> 2];
>> /* flip the bit */
>> buf[byte_addr] ^= (1 << bit_addr);
>> return 1;
>> -
>> }
>> - /* count nr of bits; use table lookup, faster than calculating it */
>> - if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
>> +
>> + if (!(tmp & (tmp - 1)))
> This is not the same as the code you replace!!!
>
> take as example b0 = 1; b1 =0, b2 = 0;
> The original if statement will return true:
> bitsperbyte[b0] in that case is 1
> bitsperbyte[b1] = 0
> bitsperbyte[b2] = 0
> so (bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) equals 1 and
> ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1) yields 1 so true
>
> However if I take your code
> tmp = ((uint32_t)b2 << 16) | ((uint32_t)b1 << 8) | b0;
> taking the example values from above this results in tmp being 1;
> tmp & (tmp - 1) becomes 1 & 0 which effectively results in 0.
>
> So in my original code b0 = 1; b1 =0, b2 = 0; results in 1 being
> returned whereas your code will result in a log entry "incorrectable
> error" and a return of -1.
>
You ignore the "!" opeator, Frans.


> Given this, I'd say this patch is to be rejected.
>
> BTW: optimisations in this part of code are not too important. This is
> only called when ecc errors are to be corrected and that is not very
> likely.
> So perhaps it is not worth the time to improve it.
> (and yes, it might be possible to save some bytes by eliminating the
> array; then again the code and logic is not really trivial so good
> testing is needed)
>
> See also Documentation/mtd/nand_ecc.txt
> near the end there is a small section on correcting.
>
>> return 1; /* error in ECC data; no action needed */
>>
>> printk(KERN_ERR "uncorrectable error : ");
>> --
>> 1.7.7.6
>>
>>
> Best regards, Frans.
