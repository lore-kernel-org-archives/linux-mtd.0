Message-ID: <505C3E6C.70309@atmel.com>
Date: Fri, 21 Sep 2012 18:16:12 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: fix the compile error which miss
 label "err_ecc_ioremap".
References: <1347347412-24214-1-git-send-email-josh.wu@atmel.com>
 <20120920052333.GC17667@game.jcrosoft.org>
In-Reply-To: <20120920052333.GC17667@game.jcrosoft.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: vikram186@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, J.C

On 9/20/2012 1:23 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 15:10 Tue 11 Sep     , Josh Wu wrote:
>> Add err_ecc_ioremap label to fix following errors:
>> ---8<---
>>    CC      drivers/mtd/nand/atmel_nand.o
>> drivers/mtd/nand/atmel_nand.c: In function 'atmel_nand_probe':
>> drivers/mtd/nand/atmel_nand.c:1423: error: label 'err_ecc_ioremap' used but not defined
>> make[3]: *** [drivers/mtd/nand/atmel_nand.o] Error 1
>> make[2]: *** [drivers/mtd/nand] Error 2
>> make[1]: *** [drivers/mtd] Error 2
>> make: *** [drivers] Error 2
>> --->8---
> switch to devm_xxx instead this will simplify the error patch and remove patch

understood. I will push a patch  which use devm_xxx. That should remove 
many code of the error handling. Thanks

Best Regards,
Josh Wu

>
> Best Regards,
> J.
