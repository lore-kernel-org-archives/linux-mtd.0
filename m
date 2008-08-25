Received: from rv-out-0708.google.com ([209.85.198.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KXV16-0001Hr-EQ
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 05:53:29 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1349866rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Aug 2008 22:53:27 -0700 (PDT)
Message-ID: <1516faed0808242253v653c83bdpaf68c92205651cae@mail.gmail.com>
Date: Mon, 25 Aug 2008 13:53:26 +0800
From: "Hong Xu" <hongxu.cn@gmail.com>
To: "Marc Pignat" <marc.pignat@hevs.ch>
Subject: Re: [PATCH] [NAND] This patch add support for HW ECC (HSIAO code) on
	AT91SAM9G20.
In-Reply-To: <200808221147.03690.marc.pignat@hevs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1516faed0808211959w793d22a0xeea14cf1096012be@mail.gmail.com>
	<200808221147.03690.marc.pignat@hevs.ch>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk, linux@maxim.org.za,
	linux@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,

On Fri, Aug 22, 2008 at 17:47, Marc Pignat <marc.pignat@hevs.ch> wrote:
> Hi all!
>
> On Friday 22 August 2008, Hong Xu wrote:
>> >From ce6b68cf009a94ab12a31d7f007003173b6cad2c Mon Sep 17 00:00:00 2001
>> From: Hong Xu <hong.xu@atmel.com>
>> Date: Fri, 22 Aug 2008 10:29:10 +0800
>> Subject: [PATCH] This patch add support for HW ECC on AT91SAM9G20.
>>
>> AT91SAM9G20 ECC controller is capable of 1-bits error correction
>> and 2-bit random detection for every 256 bytes of data. And this
>> patch chooses a working mode which can be compatible with software
>> ECC.
>
> ...
>
>>
>> +#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
>> +static struct nand_ecclayout nand_oob_16 = {
>> +     .eccbytes = 6,
>> +     .eccpos = {0, 1, 2, 3, 6, 7},
>> +     .oobfree = {
>> +             {.offset = 8,
>> +              . length = 8} }
>> +};
>
> static const?

To be strictly speaking, it's a static const. :-)

>
>> +
>> +static struct nand_ecclayout nand_oob_64 = {
>> +     .eccbytes = 24,
>> +     .eccpos = {
>> +                40, 41, 42, 43, 44, 45, 46, 47,
>> +                48, 49, 50, 51, 52, 53, 54, 55,
>> +                56, 57, 58, 59, 60, 61, 62, 63 },
>> +     .oobfree = {
>> +             {.offset = 2,
>> +              .length = 38} }
>> +};
>> +> ...
>
>> diff --git a/drivers/mtd/nand/atmel_nand_ecc.h
>> b/drivers/mtd/nand/atmel_nand_ecc.h
>> index 1ee7f99..41e072e 100644
>> --- a/drivers/mtd/nand/atmel_nand_ecc.h
>> +++ b/drivers/mtd/nand/atmel_nand_ecc.h
>> @@ -26,6 +26,30 @@
>>  #define              ATMEL_ECC_ECCERR                (1 << 1)                /* ECC Single Bit Error */
>>  #define              ATMEL_ECC_MULERR                (1 << 2)                /* Multiple Errors */
>>
>> +#ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW_HSIAO
>> +
>> +#define ATMEL_ECC_PER_256    (1 << 4)
>> +
>> +#define ATMEL_ECC_PR10               0x38
>> +#define ATMEL_ECC_PR11               0x3c
>> +#define ATMEL_ECC_PR12               0x40
>> +#define ATMEL_ECC_PR13               0x44
>> +#define ATMEL_ECC_PR14               0x48
>> +#define ATMEL_ECC_PR15               0x4c
>> +
>> +#else
>> +
>>  #define ATMEL_ECC_PR         0x0c                    /* Parity register */
>
> Never used, perhaps a future use?

No, it's used. For some AVR chips and At91SAM926x chips, 2 bytes of 4
ECC parity data are read from it.

>
> ...
>>  #endif
>
> Best regards
>
> Marc
>
>
>
