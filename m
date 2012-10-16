Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TO5M2-0001Ps-8c
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 11:30:35 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2659629bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2012 04:30:31 -0700 (PDT)
Message-ID: <507D454E.6060101@gmail.com>
Date: Tue, 16 Oct 2012 13:30:22 +0200
From: "=?ISO-8859-1?Q?Andreas_Bie=DFmann?=" <andreas.devel@googlemail.com>
MIME-Version: 1.0
To: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH] avr32: fix build error in atstk1006_defconfig
References: <1350371967-8914-1-git-send-email-josh.wu@atmel.com>
 <20121016091740.GA6243@samfundet.no>
In-Reply-To: <20121016091740.GA6243@samfundet.no>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Josh Wu <josh.wu@atmel.com>, linux-mtd@lists.infradead.org,
 fengguang.wu@intel.com, hskinnemoen@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16.10.2012 11:17, Hans-Christian Egtvedt wrote:
> Around Tue 16 Oct 2012 15:19:27 +0800 or thereabout, Josh Wu wrote:
>> fixed the following compile error when use avr32 atstk1006_defconfig:
>>   drivers/mtd/nand/atmel_nand.c: In function 'pmecc_err_location':
>>   drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'
>>
>> which was introduced by commit 1c7b874d33b463 ("mtd: at91: atmel_nand: add Programmable Multibit ECC controller support").
>> The PMECC for nand flash code uses writel_relaxed(). But in avr32, there is no macro "writel_relaxed" defined. This patch add writex_relaxed macro definitions.
>>
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>> ---
>>  arch/avr32/include/asm/io.h |    4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/avr32/include/asm/io.h b/arch/avr32/include/asm/io.h
>> index cf60d0a..fc6483f 100644
>> --- a/arch/avr32/include/asm/io.h
>> +++ b/arch/avr32/include/asm/io.h
>> @@ -165,6 +165,10 @@ BUILDIO_IOPORT(l, u32)
>>  #define readw_be			__raw_readw
>>  #define readl_be			__raw_readl
>>  
>> +#define writeb_relaxed			writeb
>> +#define writew_relaxed			writew
>> +#define writel_relaxed			writel
>> +
> 
> I'm wondering if they should be something similar to SH arch:
> 
> #define writeb_relaxed(v,c) ((void)__raw_writeb((__force u8)ioswabb(v),c))

I think it is OK to just use the writeX here. These are in fact an
inlined function built out of a macro. The inlined function does nearly
what you have written down here and in contrast to the ARM version omits
the memory barrier.
The main difference between __raw_ access and the writeX/readX access
for AVR32 is this little __swizzle_addr_. It takes the configuration of
SMC (8/16/32 bit access) into account which would be omitted when we
switch to __raw_ accessors here. This would be a major change if one
used the writeX/readX accessors before and switched the SMC to something
different than 32 Bit access.

Best regards

Andreas Bieﬂmann
