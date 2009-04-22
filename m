Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LwVfu-0006ag-5v
	for linux-mtd@lists.infradead.org; Wed, 22 Apr 2009 06:11:21 +0000
Date: Wed, 22 Apr 2009 08:10:35 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: plagnioj@jcrosoft.com
Subject: Re: [PATCH V2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090422061035.GA29345@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
Cc: STEricsson_nomadik_linux@list.st.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks JC for your comments.

>> +		.name	= "MemInit(NAND)",
>> +		.offset	= MTDPART_OFS_APPEND,
>> +		.size	= SZ_256K,
> MemInit?
> why do you need this?

It's mandated by the boot rom. I added a comment.

>> +	}, {
>> +		.name	= "BootLoader(NAND)",
>> +		.offset	= MTDPART_OFS_APPEND,
>> +		.size	= SZ_2M,
>> +	}, {
> 2M for U-Boot? it's quite big

I agree, but I prefer to keep compatibility with what's shipped in the
evaluation kit.

>>  static struct platform_device *nhk8815_platform_devices[] __initdata = {
>> -	/* currently empty, will add keypad, touchscreen etc */
>> +	&nhk8815_nand_device,
>> +	/* will add keypad, touchscreen etc */
>>  };
> it will be better to create a devices file as done for at91 to simplify board
> adding

There is only one board, currently. And, I confess, I don't like the at91
approach: in two projects I had to change such generic file to account for
a different in the specific board. So I've left this as is.

>> +/* control and timing registers for CS0..CS3 */
>> +#define FSMC_BCR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x00))
>> +#define FSMC_BTR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x04))
>> +#define FSMC_BCR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x08))
>> +#define FSMC_BTR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x0c))

> why not this
> 
> /* control and timing registers for CS0..CS3 */
> #define FSMC_BCR(x)	(NOMADIK_FSMC_VA + (x << 3))
> #define FSMC_BTR(x)	(NOMADIK_FSMC_VA + (x << 3) + 0x04)
> [...]

Ok, I've done it.

> by the a description of each register will be nice

I think anyone with the board will have the manual. But I added a one-liner
for each of them, as you ask.

>> +#define NOMADIK_MTU0_VA		IO_ADDRESS(NOMADIK_MTU0_BASE)
>> +#define NOMADIK_MTU1_VA		IO_ADDRESS(NOMADIK_MTU1_BASE)
> NOMADIK_MTU_VA(x) will be better

No, not here. These are physical addresses within the register area,
just random 4k addresses, with no useful ordering nor similarities
to be factorized out.

>> +static inline int parity(int b) /* uses low 8 bits: returns 0 or all-1 */
>> +{
>> +	b = b ^ (b >> 4);
>> +	b = b ^ (b >> 2);
>> +	return (b ^ (b >> 1)) & 1
>> +		? ~0 : 0;
>> +}
> in U-Boot you chose to use the asembly implementation it will we nice if you
> can keep it sync

After Scott Wood asked to re-check if asm is needed, I found that the
generated code is the same, so I finally got this exact code in U-Boot.

/alessandro
