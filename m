Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLIK1-0001TA-8Q
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 21:58:34 +0000
Received: by oihq81 with SMTP id q81so45387799oih.2
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 14:58:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150731212053.GG10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-9-git-send-email-Frank.Li@freescale.com>
 <20150731212053.GG10676@google.com>
Date: Fri, 31 Jul 2015 16:58:10 -0500
Message-ID: <CAHrpEqQNW+ceQqCLaKSy2vmi5oj_hMzPzj5h=mpNXMW4QteZGw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] mtd: spi-nor: fsl-quadspi: fix unsupported cmd
 when run flash_erase
From: Zhi Li <lznuaa@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Allen Xu <b45815@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 31, 2015 at 4:20 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sat, Jul 25, 2015 at 02:06:28AM +0800, Frank.Li@freescale.com wrote:
>> From: Frank Li <Frank.Li@freescale.com>
>>
>> fsl-quadspi 21e0000.qspi: Unsupported cmd 0x20
>>
>> when config CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enable,
>> erase will use SPINOR_OP_BE_4K, which was not supported by fsl-quadspi
>> driver
>
> Slightly off topic: things looks pretty fragile here. /me thinks most of
> this can be written more cleanly...
>
>> Signed-off-by: Frank Li <Frank.Li@freescale.com>
>> Acked-by: Allen Xu <b45815@freescale.com>
>> ---
>>  drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
>> index 0f3f22d..e50da5c 100644
>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
>> @@ -396,11 +396,11 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>>       lut_base = SEQID_SE * 4;
>>
>>       if (q->nor_size <= SZ_16M) {
>> -             cmd = SPINOR_OP_SE;
>> +             cmd = q->nor[0].erase_opcode;
>>               addrlen = ADDR24BIT;
>>       } else {
>>               /* use the 4-byte address */
>> -             cmd = SPINOR_OP_SE;
>> +             cmd = q->nor[0].erase_opcode;
>>               addrlen = ADDR32BIT;
>>       }
>
> This whole block can be refactored to:
>
>         cmd = q->nor[0].erase_opcode;
>         addrlen = q->nor_size <= SZ_16M ? ADDR24BIT : ADDR32BIT;
>
> But really, this should be based on nor->addr_width...
>
>>
>> @@ -471,6 +471,8 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>>       case SPINOR_OP_BRWR:
>>               return SEQID_BRWR;
>>       default:
>> +             if (cmd == q->nor[0].erase_opcode)
>
> Related question: what happens if you have multiple flash chips
> connected, and they don't need the same opcodes? It looks like you
> program the LUT only for the opcodes of the first flash, so the second
> wouldn't work right.

Fsl-qspi controller assume you connect two same flash chips.
Two chip share the same opcodes.  all other command
like read,  both chip also must use the same opcode.

Frank Li

>
>> +                     return SEQID_SE;
>>               dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
>>               break;
>>       }
>
> Brian
