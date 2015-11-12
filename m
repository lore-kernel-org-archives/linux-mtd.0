Received: from mail-ob0-x242.google.com ([2607:f8b0:4003:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwk02-0007S7-92
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 05:00:43 +0000
Received: by obcyn7 with SMTP id yn7so3542646obc.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 21:00:19 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <1447077023.31665.72.camel@linux.intel.com>
References: <1446691741-8393-1-git-send-email-punnaia@xilinx.com>
 <1447077023.31665.72.camel@linux.intel.com>
Date: Thu, 12 Nov 2015 10:30:18 +0530
Message-ID: <CAGnW=BZT6HafmSPUM-xi_egkKh5XKQ0W0o5YVrXeiGNig5nvPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] mtd: nand: Add support for Arasan Nand Flash
 Controller
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, geert@linux-m68k.org,
 "michals@xilinx.com" <michals@xilinx.com>, wangzhou1@hisilicon.com,
 Florian Fainelli <f.fainelli@gmail.com>, gsi@denx.de, haokexin@gmail.com,
 rogerq@ti.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary <kpc528@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 9, 2015 at 7:20 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, 2015-11-05 at 08:19 +0530, Punnaiah Choudary Kalluri wrote:
>> Added the basic driver for Arasan Nand Flash Controller used in
>> Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
>> correction.
>>
>
>> +config MTD_NAND_ARASAN
>> +     tristate "Support for Arasan Nand Flash controller"
>> +     depends on MTD_NAND
>
> This looks useless since you can't see the item without MTD_NAND is
> chosen.
>
>> +     help
>> +       Enables the driver for the Arasan Nand Flash controller on
>> +       Zynq UltraScale+ MPSoC.
>> +
>>  endif # MTD_NAND
>>
>
> +obj-$(CONFIG_MTD_NAND_ARASAN)          += arasan_nfc.o
>
> "nfc" part a bit ambiguous since NFC might be Near Field Communication.
>
> Perhaps "nand_fc" or something like that?
>

This driver is under mtd/nand so, there is no point of confusion here and
in this context nfc is nand flash controller.

<snip>
>> +static u8 anfc_page(u32 pagesize)
>> +{
>> +     switch (pagesize) {
>> +     case 512:
>> +             return PAGE_SIZE_512;
>> +     case 2048:
>> +             return PAGE_SIZE_2K;
>> +     case 4096:
>> +             return PAGE_SIZE_4K;
>> +     case 8192:
>> +             return PAGE_SIZE_8K;
>> +     case 16384:
>> +             return PAGE_SIZE_16K;
>> +     case 1024:
>
> Why not keep sorted here?
>

It is sorted based on the return value. I will change the
sorting order based on the page size bytes.

>> +             return PAGE_SIZE_1K;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return 0;
>
>
>
>> +}
>> +
>> +static inline void anfc_enable_intrs(struct anfc *nfc, u32 val)
>> +{
>> +     writel(val, nfc->base + INTR_STS_EN_OFST);
>> +     writel(val, nfc->base + INTR_SIG_EN_OFST);
>> +}
>> +
>> +static int anfc_wait_for_event(struct anfc *nfc, u32 event)
>> +{
>> +     struct completion *comp;
>> +     int ret;
>> +
>> +     if (event == XFER_COMPLETE)
>> +             comp = &nfc->xfercomp;
>> +     else
>> +             comp = &nfc->bufrdy;
>> +
>> +     ret = wait_for_completion_timeout(comp,
>> msecs_to_jiffies(EVNT_TIMEOUT));
>> +
>> +     return ret;
>
> return func();
>
>> +}
>> +
>> +static inline void anfc_setpktszcnt(struct anfc *nfc, u32 pktsize,
>> +                                 u32 pktcount)
>> +{
>> +     writel(pktsize | (pktcount << PKT_CNT_SHIFT), nfc->base +
>> PKT_OFST);
>> +}
>> +
>> +static inline void anfc_set_eccsparecmd(struct anfc *nfc, u8 cmd1,
>> u8 cmd2)
>> +{
>> +     writel(cmd1 | (cmd2 << CMD2_SHIFT) |
>> +            (nfc->caddr_cycles << ADDR_CYCLES_SHIFT),
>> +            nfc->base + ECC_SPR_CMD_OFST);
>> +}
>> +
>> +static void anfc_setpagecoladdr(struct anfc *nfc, u32 page, u16 col)
>> +{
>> +     u32 val;
>> +
>> +     writel(col | (page << PG_ADDR_SHIFT), nfc->base +
>> MEM_ADDR1_OFST);
>> +
>> +     val = readl(nfc->base + MEM_ADDR2_OFST);
>> +     val = (val & ~MEM_ADDR_MASK) |
>> +           ((page >> PG_ADDR_SHIFT) & MEM_ADDR_MASK);
>> +     writel(val, nfc->base + MEM_ADDR2_OFST);
>> +}
>> +
>> +static void anfc_prepare_cmd(struct anfc *nfc, u8 cmd1, u8 cmd2,
>> +                          u8 dmamode, u32 pagesize, u8
>> addrcycles)
>> +{
>> +     u32 regval;
>> +
>> +     regval = cmd1 | (cmd2 << CMD2_SHIFT);
>> +     if (dmamode && nfc->dma)
>> +             regval |= DMA_ENABLE << DMA_EN_SHIFT;
>> +     if (addrcycles)
>> +             regval |= addrcycles << ADDR_CYCLES_SHIFT;
>> +     if (pagesize)
>> +             regval |= anfc_page(pagesize) << PAGE_SIZE_SHIFT;
>> +     writel(regval, nfc->base + CMD_OFST);
>> +}
>> +
>> +static int anfc_device_ready(struct mtd_info *mtd,
>> +                          struct nand_chip *chip)
>> +{
>> +     u8 status;
>> +     unsigned long timeout = jiffies + STATUS_TIMEOUT;
>> +
>> +     do {
>> +             chip->cmdfunc(mtd, NAND_CMD_STATUS, 0, 0);
>> +             status = chip->read_byte(mtd);
>> +             if (status & ONFI_STATUS_READY) {
>
>> +                     if (status & ONFI_STATUS_FAIL)
>> +                             return NAND_STATUS_FAIL;
>
> This is invariant to the loop, perhaps move outside.
>

Nand device is ready means it is ready to accept next command and
it is done with previous command. It doesn't mean that previous
command is success, it can fail also.

>> +                     break;
>> +             }
>> +             cpu_relax();
>> +     } while (!time_after_eq(jiffies, timeout));
>> +
>> +     if (time_after_eq(jiffies, timeout)) {
>> +             pr_err("%s timed out\n", __func__);
>
> dev_err?
>
>> +             return -ETIMEDOUT;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int anfc_read_oob(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> +                      int page)
>> +{
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>
> Since you use it more than once might be a good idea to do something
> like
>
> #define to_anfc() container_of()
>
>> +
>> +     chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
>> +     if (nfc->dma)
>> +             nfc->rdintrmask = XFER_COMPLETE;
>> +     else
>> +             nfc->rdintrmask = READ_READY;
>> +     chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +
>> +     return 0;
>> +}
>> +
>> +static int anfc_write_oob(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> +                       int page)
>> +{
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>> +
>> +     nfc->iswriteoob = true;
>> +     chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
>> +     chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +     nfc->iswriteoob = false;
>> +
>> +     return 0;
>> +}
>> +
>> +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int
>> len)
>> +{
>> +     u32 i, pktcount, buf_rd_cnt = 0, pktsize;
>
> Type for i looks unsigned int, why u32? Same question for all variables
> that are not used to directly program HW.
>

what is the problem with u32 here ? may be i am missing something here but
i really want to know the reason.

>> +     u32 *bufptr = (u32 *)buf;
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>> +     dma_addr_t paddr = 0;
>> +
>> +     if (nfc->curr_cmd == NAND_CMD_READ0) {
>> +             pktsize = nfc->pktsize;
>>
>
>
>> +             if (mtd->writesize % pktsize)
>> +                     pktcount = mtd->writesize / pktsize + 1;
>> +             else
>> +                     pktcount = mtd->writesize / pktsize;
>
> DIV_ROUND_UP ?
>
>
>> +     } else {
>> +             pktsize = len;
>> +             pktcount = 1;
>> +     }
>> +
>> +     anfc_setpktszcnt(nfc, pktsize, pktcount);
>> +
>> +     if (nfc->dma) {
>> +             paddr = dma_map_single(nfc->dev, buf, len,
>> DMA_FROM_DEVICE);
>> +             if (dma_mapping_error(nfc->dev, paddr)) {
>> +                     dev_err(nfc->dev, "Read buffer mapping
>> error");
>> +                     return;
>> +             }
>> +             writel(lower_32_bits(paddr), nfc->base +
>> DMA_ADDR0_OFST);
>> +             writel(upper_32_bits(paddr), nfc->base +
>> DMA_ADDR1_OFST);
>> +             anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +             writel(PROG_PGRD, nfc->base + PROG_OFST);
>> +             anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +             dma_unmap_single(nfc->dev, paddr, len,
>> DMA_FROM_DEVICE);
>> +             return;
>> +     }
>> +
>> +     anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +     writel(PROG_PGRD, nfc->base + PROG_OFST);
>> +
>> +     while (buf_rd_cnt < pktcount) {
>> +
>> +             anfc_wait_for_event(nfc, READ_READY);
>> +             buf_rd_cnt++;
>> +
>> +             if (buf_rd_cnt == pktcount)
>> +                     anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +
>> +             for (i = 0; i < pktsize / 4; i++)
>> +                     bufptr[i] = readl(nfc->base +
>> DATA_PORT_OFST);
>> +
>> +             bufptr += (pktsize / 4);
>
> Useless parens.
>
>> +
>> +             if (buf_rd_cnt < pktcount)
>> +                     anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +     }
>> +
>> +     anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +}
>> +
>> +static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
>> int len)
>> +{
>> +     u32 buf_wr_cnt = 0, pktcount = 1, i, pktsize;
>
> Useless assignment of pktcount. Check all your definition blocks for
> similar thing.
>
>> +     u32 *bufptr = (u32 *)buf;
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>> +     dma_addr_t paddr = 0;
>> +
>> +     if (nfc->iswriteoob) {
>> +             pktsize = len;
>> +             pktcount = 1;
>> +     } else {
>> +             pktsize = nfc->pktsize;
>> +             pktcount = mtd->writesize / pktsize;
>> +     }
>> +
>> +     anfc_setpktszcnt(nfc, pktsize, pktcount);
>> +
>> +     if (nfc->dma) {
>> +             paddr = dma_map_single(nfc->dev, (void *)buf, len,
>> +                                    DMA_TO_DEVICE);
>> +             if (dma_mapping_error(nfc->dev, paddr)) {
>> +                     dev_err(nfc->dev, "Write buffer mapping
>> error");
>> +                     return;
>> +             }
>>
>
>> +             writel(lower_32_bits(paddr), nfc->base +
>> DMA_ADDR0_OFST);
>> +             writel(upper_32_bits(paddr), nfc->base +
>> DMA_ADDR1_OFST);
>
> lo_hi_writeq();
>
> Or even writeq() if it's acceptable by HW.
>

Ok. let me check if this function is available across all
the platforms.

Thanks for the detailed review. Rest all comments i agree with you
and i will fix them in next version.

Regards,
Punnaiah
