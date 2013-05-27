Message-ID: <51A32E9F.7090009@atmel.com>
Date: Mon, 27 May 2013 17:59:59 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v2 0/4] mtd: atmel_nand: enable Nand Flash Controller
 (NFC) support
References: <1368784308-7600-1-git-send-email-josh.wu@atmel.com>
 <20130524195525.GL24476@game.jcrosoft.org>
In-Reply-To: <20130524195525.GL24476@game.jcrosoft.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/25/2013 3:55 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 17:51 Fri 17 May     , Josh Wu wrote:
>> This patch series enable NFC support for SAMA5 soc. It can send command,
>> address cycles automaticly. Also when enable NFC sram, NFC will transfer
>> data to sram. Which can save lots of cpu time.
> can you give some stats please

I already have some test stats in the followed patches. Maybe I can put 
the summary here too.

>
> and performance comparaisan NFS vs DMA

OK. I will add the DMA test data.

Best Regards,
Josh Wu

>
> Best Regards,
> J.
>> v1 --> v2:
>>   1) rebase it with latest l2-mtd git tree:
>>      - remove useless nand commands (NAND_CMD_DEPLETE1, NAND_CMD_STATUS_ERRORx).
>>      - adopt to the new nand write function's parameters. Add error message when
>>        handle subpage write via nfc sram.
>>   2) rewrite pmecc_enable function. Now I use exist NAND_ECC_READ/WRITE const
>>      instead of using a new enum definition.
>>
>> Josh Wu (4):
>>    mtd: atmel_nand: replace pmecc enable code with one function.
>>    mtd: atmel_nand: add Nand Flash Controller (NFC) support
>>    mtd: atmel_nand: enable Nand Flash Controller (NFC) read data via
>>      sram
>>    mtd: atmel_nand: enable Nand Flash Controller (NFC) write via sram
>>
>>   .../devicetree/bindings/mtd/atmel-nand.txt         |    4 +
>>   drivers/mtd/nand/atmel_nand.c                      |  657 ++++++++++++++++++--
>>   drivers/mtd/nand/atmel_nand_nfc.h                  |  106 ++++
>>   3 files changed, 718 insertions(+), 49 deletions(-)
>>   create mode 100644 drivers/mtd/nand/atmel_nand_nfc.h
>>
>> -- 
>> 1.7.9.5
>>
