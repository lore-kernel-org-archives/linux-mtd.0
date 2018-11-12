Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM9vL-0001Qk-Pq
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 10:58:33 +0000
Date: Mon, 12 Nov 2018 11:58:10 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Martin Lund <martin.lund@keep-it-simple.com>
Cc: naga.sureshkumar.relli@xilinx.com, miquel.raynal@bootlin.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, michals@xilinx.com, nagasuresh12@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181112115810.6f931cfb@bbrezillon>
In-Reply-To: <CAB7pii1WbALtH1AHjocpC976ytrCV5gM6JGXawoN--scvEx8Mw@mail.gmail.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CAB7pii1WbALtH1AHjocpC976ytrCV5gM6JGXawoN--scvEx8Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Nov 2018 11:55:36 +0100
Martin Lund <martin.lund@keep-it-simple.com> wrote:

> Hi Naga,
> 
> Just a few review comments for the v12 version.
> 
> On Fri, Nov 9, 2018 at 6:00 AM Naga Sureshkumar Relli
> <naga.sureshkumar.relli@xilinx.com> wrote:
> > +#define PKT_OFST               0x00
> > +#define PKT_CNT_SHIFT          12
> > +
> > +#define MEM_ADDR1_OFST         0x04
> > +#define MEM_ADDR2_OFST         0x08  
> 
> For the sake of readability I think *_OFFSET is preferred, especially
> since the driver already includes short macro names. I think this is
> similar to the EVNT vs EVENT point.
> The majority of drivers in the Linux kernel do not shorten OFFSET -> OFST.
> 
> 
> > +static void anfc_rw_pio_op(struct mtd_info *mtd, u8 *buf, int len,
> > +                          bool do_read, int prog, int pktcount, int pktsize)
> > +{
> > +       struct nand_chip *chip = mtd_to_nand(mtd);
> > +       struct anfc_nand_controller *nfc = to_anfc(chip->controller);
> > +       struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > +       u32 *bufptr = (u32 *)buf;
> > +       u32 cnt = 0, intr = 0;
> > +
> > +       anfc_config_dma(nfc, 0);
> > +
> > +       if (pktsize == 0)
> > +               pktsize = len;
> > +
> > +       anfc_setpktszcnt(nfc, pktsize, pktcount);
> > +
> > +       if (!achip->strength)
> > +               intr = MBIT_ERROR;
> > +
> > +       if (do_read)
> > +               intr |= READ_READY;
> > +       else
> > +               intr |= WRITE_READY;
> > +       anfc_enable_intrs(nfc, intr);
> > +       writel(prog, nfc->base + PROG_OFST);
> > +       while (cnt < pktcount) {
> > +               anfc_wait_for_event(nfc);
> > +               cnt++;
> > +               if (cnt == pktcount)
> > +                       anfc_enable_intrs(nfc, XFER_COMPLETE);
> > +               if (do_read)
> > +                       ioread32_rep(nfc->base + DATA_PORT_OFST, bufptr,
> > +                                    pktsize / 4);
> > +               else
> > +                       iowrite32_rep(nfc->base + DATA_PORT_OFST, bufptr,
> > +                                     pktsize / 4);
> > +               bufptr += (pktsize / 4);
> > +               if (cnt < pktcount)
> > +                       anfc_enable_intrs(nfc, intr);
> > +       }
> > +       anfc_wait_for_event(nfc);
> > +}  
> 
> Throughout the driver all calls to anfc_wait_for_event() ignores the
> timeout return value. It would be nice to see some error handling in
> case it times out - at minimum consider printing out an error message
> since timeout on NAND operations are fairly critical and should
> generally not occur. Perhaps even an argument can be made for
> returning -ETIMEDOUT in case of timeout.

Yes please, check anfc_wait_for_event() return code and propagate the
error to the upper layer.
