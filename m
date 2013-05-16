Message-ID: <1368696748.15764.184.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] mtd: atmel_nand: enable Nand Flash Controller (NFC)
 support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Thu, 16 May 2013 12:32:28 +0300
In-Reply-To: <1366712997-17639-1-git-send-email-josh.wu@atmel.com>
References: <1366712997-17639-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@atmel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-04-23 at 18:29 +0800, Josh Wu wrote:
> This patch series enable NFC support for SAMA5 soc. It can send command,
> address cycles automaticly. Also when enable NFC sram, NFC will transfer
> data to sram. Which can save lots of cpu time.
> 
> Josh Wu (4):
>   mtd: atmel_nand: replace pmecc enable code with one function.
>   mtd: atmel_nand: add Nand Flash Controller (NFC) support
>   mtd: atmel_nand: enable Nand Flash Controller (NFC) read data
>     via sram
>   mtd: atmel_nand: enable Nand Flash Controller (NFC) write via
>     sram

Please, re-base against the latest l2-mtd.git tree. The patches do not
compile:

--------------------------------------------------------------------------------
Failed to build the following commit for configuration "arm-at91cap9_defconfig" (architecture arm)":

2bd4bff mtd: atmel_nand: enable Nand Flash Controller (NFC) write via sram

drivers/mtd/nand/atmel_nand.c: In function 'nfc_nand_command':
drivers/mtd/nand/atmel_nand.c:1848: error: 'NAND_CMD_DEPLETE1' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c:1848: error: (Each undeclared identifier is reported only once
drivers/mtd/nand/atmel_nand.c:1848: error: for each function it appears in.)
drivers/mtd/nand/atmel_nand.c:1854: error: 'NAND_CMD_STATUS_ERROR' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c:1855: error: 'NAND_CMD_STATUS_ERROR0' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c:1856: error: 'NAND_CMD_STATUS_ERROR1' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c:1857: error: 'NAND_CMD_STATUS_ERROR2' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c:1858: error: 'NAND_CMD_STATUS_ERROR3' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c: In function 'nfc_sram_init':
drivers/mtd/nand/atmel_nand.c:1979: warning: assignment from incompatible pointer type
make[4]: *** [drivers/mtd/nand/atmel_nand.o] Error 1

-- 
Best Regards,
Artem Bityutskiy
