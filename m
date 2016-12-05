Received: from mail-dm3nam03on0079.outbound.protection.outlook.com
 ([104.47.41.79] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDwSU-00073G-Sn
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 16:49:46 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Florian Fainelli <f.fainelli@gmail.com>, Kevin Hao <haokexin@gmail.com>,
 "gsi@denx.de" <gsi@denx.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Punnaiah Choudary <kpc528@gmail.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Michal Simek
 <michals@xilinx.com>, Brian Norris <computersforpeace@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "rogerq@ti.com" <rogerq@ti.com>, "Marek
 Vasut" <marex@denx.de>
Subject: RE: [PATCH v5 2/3] mtd: nand: Add support for Arasan Nand Flash
 Controller
Date: Mon, 5 Dec 2016 16:49:11 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B76423EFA4@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1448116788-9802-1-git-send-email-punnaia@xilinx.com>
 <20160308153810.43db903b@bbrezillon>
 <CAGnW=BY8zXTcOEqKgA8sFNY4CgZ1PW11x7cRMnru+0cyNm-bNw@mail.gmail.com>
 <20160309105007.4500aeb5@bbrezillon> <20161205100120.11dc1117@bbrezillon>
In-Reply-To: <20161205100120.11dc1117@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: Monday, December 05, 2016 2:31 PM
> To: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>; Kevin Hao
> <haokexin@gmail.com>; gsi@denx.de; linux-kernel@vger.kernel.org; Andy
> Shevchenko <andriy.shevchenko@linux.intel.com>; Punnaiah Choudary
> <kpc528@gmail.com>; wangzhou1@hisilicon.com; geert@linux-m68k.org;
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>; linux-
> mtd@lists.infradead.org; Punnaiah Choudary Kalluri <punnaia@xilinx.com>;
> Michal Simek <michals@xilinx.com>; Brian Norris
> <computersforpeace@gmail.com>; David Woodhouse
> <dwmw2@infradead.org>; rogerq@ti.com; Marek Vasut <marex@denx.de>
> Subject: Re: [PATCH v5 2/3] mtd: nand: Add support for Arasan Nand Flash
> Controller
>=20
> +Marek who reviewed v6
>=20
> Hi Punnaiah,
>=20
> I see you sent a v6, but you never answered the questions/remarks I had i=
n
> this email.
>

=20
My appolgies. Somehow I missed the below mail.

> Can you please try to answer them (I'd like to understand how the control=
ler
> works)?
>

Sure.
https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultras=
cale-trm.pdf
NAND chapter starts from page 577
=20
> Thanks,
>=20
> Boris
>=20
> On Wed, 9 Mar 2016 10:50:07 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>=20
> > Hi Punnaiah,
> >
> > On Wed, 9 Mar 2016 00:10:52 +0530
> > punnaiah choudary kalluri <punnaia@xilinx.com> wrote:
> >
> >
> > > >> +static const struct anfc_ecc_matrix ecc_matrix[] =3D {
> > > >> +     {512,   512,    1,      0,      0x3},
> > > >> +     {512,   512,    4,      1,      0x7},
> > > >> +     {512,   512,    8,      1,      0xD},
> > > >> +     /* 2K byte page */
> > > >> +     {2048,  512,    1,      0,      0xC},
> > > >> +     {2048,  512,    4,      1,      0x1A},
> > > >> +     {2048,  512,    8,      1,      0x34},
> > > >> +     {2048,  512,    12,     1,      0x4E},
> > > >> +     {2048,  1024,   24,     1,      0x54},
> > > >> +     /* 4K byte page */
> > > >> +     {4096,  512,    1,      0,      0x18},
> > > >> +     {4096,  512,    4,      1,      0x34},
> > > >> +     {4096,  512,    8,      1,      0x68},
> > > >> +     {4096,  512,    12,     1,      0x9C},
> > > >> +     {4096,  1024,   4,      1,      0xA8},
> > > >> +     /* 8K byte page */
> > > >> +     {8192,  512,    1,      0,      0x30},
> > > >> +     {8192,  512,    4,      1,      0x68},
> > > >> +     {8192,  512,    8,      1,      0xD0},
> > > >> +     {8192,  512,    12,     1,      0x138},
> > > >> +     {8192,  1024,   24,     1,      0x150},
> > > >> +     /* 16K byte page */
> > > >> +     {16384, 512,    1,      0,      0x60},
> > > >> +     {16384, 512,    4,      1,      0xD0},
> > > >> +     {16384, 512,    8,      1,      0x1A0},
> > > >> +     {16384, 512,    12,     1,      0x270},
> > > >> +     {16384, 1024,   24,     1,      0x2A0}
> > > >> +};
> > > >
> > > > Do you really need this association table. IMO, those are
> > > > information you could deduce from nand_chip info (ecc_strength,
> > > > ecc_step_size, ...). eccsize can be calculated this way:
> > > >
> > > >         info->pagesize =3D mtd->writesize;
> > > >         info->codeword_size =3D chip->ecc_step_ds;
> > > >         info->eccbits =3D chip->ecc_strength_ds;
> > > >
> > > >         if (info->eccbits > 1)
> > > >                 info->bch =3D true;
> > > >
> > > >         steps =3D info->pagesize / info->codeword_size;
> > > >
> > > >         if (!bch)
> > > >                 info->eccsize =3D 3 * steps;
> > > >         else
> > > >                 info->eccsize =3D
> > > >                         DIV_ROUND_UP(fls(8 * info->codeword_size) *
> > > >                                      ecc->strength * steps, 8);
> > > >
> > > > And, too bad we have to deal with another engine operating at the
> > > > bit level instead of aligning each ECC step to the next byte (GPMI
> > > > engine does that too, and it's a pain to deal with).
> > > >
> > >
> > > 1. There is no direct formula for calculating the ecc size. For bch
> > > ecc algorithms, the ecc size can vary based on the chosen
> > > polynomial.
> >
> > I checked for all the table entries, and this formula works (note that
> > it takes the codeword_size into account, which is probably what you
> > are talking about when mentioning the different polynomials).
> >

Agree. I have tried your formula and calculated the ecc size and they are
Matching to the table. Polynomial part is still not clear and I have reques=
ted
the IP vendor for more information on this.

> > >
> > > 2. This controller supports only the page sizes, number of ecc bits
> > > and code word size defined in the table. driver returns error if
> > > there is no match for the  page size and codeword size.
> >
> > I agree for the pagesize, ECC step_size and ECC strength limitations,
> > but that's something you can check without having this association
> > table. And from my experience, keeping such tables to describe all the
> > possible associations is not a good idea :-/.
> >

Yes I removed it and updated the code in v6.

> > [...]
> >
> > > >> +static int anfc_read_page_hwecc(struct mtd_info *mtd,
> > > >> +                             struct nand_chip *chip, uint8_t *buf=
,
> > > >> +                             int oob_required, int page) {
> > > >> +     u32 val;
> > > >> +     struct anfc *nfc =3D to_anfc(mtd);
> > > >> +
> > > >> +     anfc_set_eccsparecmd(nfc, NAND_CMD_RNDOUT,
> > > >> + NAND_CMD_RNDOUTSTART);
> > > >> +
> > > >> +     val =3D readl(nfc->base + CMD_OFST);
> > > >> +     val =3D val | ECC_ENABLE;
> > > >> +     writel(val, nfc->base + CMD_OFST);
> > > >> +
> > > >> +     if (nfc->dma)
> > > >> +             nfc->rdintrmask =3D XFER_COMPLETE;
> > > >> +     else
> > > >> +             nfc->rdintrmask =3D READ_READY;
> > > >> +
> > > >> +     if (!nfc->bch)
> > > >> +             nfc->rdintrmask =3D MBIT_ERROR;
> > > >> +
> > > >> +     chip->read_buf(mtd, buf, mtd->writesize);
> > > >> +
> > > >> +     val =3D readl(nfc->base + ECC_ERR_CNT_OFST);
> > > >> +     if (nfc->bch) {
> > > >> +             mtd->ecc_stats.corrected +=3D val & PAGE_ERR_CNT_MAS=
K;
> > > >> +     } else {
> > > >> +             val =3D readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
> > > >> +             mtd->ecc_stats.corrected +=3D val;
> > > >> +             val =3D readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
> > > >> +             mtd->ecc_stats.failed +=3D val;
> > > >> +             /* Clear ecc error count register 1Bit, 2Bit */
> > > >> +             writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
> > > >> +             writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
> > > >> +     }
> > > >
> > > > Not sure if your controller already handles the 'bitflips in
> > > > erased pages' case, but you might want to have a look at the
> > > > nand_check_erased_ecc_chunk() [4] function if that's not the case.
> > > >
> > >
> > > it will not handle the bitflips in erased pages. I will check this on=
e.
> > >
> > > >> +     nfc->err =3D false;
> > > >> +
> > > >> +     if (oob_required)
> > > >> +             chip->ecc.read_oob(mtd, chip, page);
> > > >
> > > > You should disable the ECC engine before leaving the function.
> > > >
> > >
> > > Not needed. Because ecc state need to be configured for every nand
> command.
> > > so, no need to disable explicitly.
> >
> > Except, you don't know what the next NAND command will be, and if it's
> > a raw access ECC_ENABLE bit has to be cleared.
> > Also, you don't know when the NAND command is sent, which type of read
> > will take place, so putting that in ->cmdfunc() is not a solution.
> >

ECC will be enabled only for page read/write operations defined for hwecc.
In all other cases it will be diabled.
As per the controller spec, the ecc should be enabled while framing the=20
Command register itself and before issuing the command in program register.
So, every time, a new command issued this bit will be overwritten.

> > >
> > > >> +
> > > >> +     return 0;
> > > >> +}
> > > >> +
> >
> > [...]
> >
> > > >> +
> > > >> +static u8 anfc_read_byte(struct mtd_info *mtd) {
> > > >> +     struct anfc *nfc =3D to_anfc(mtd);
> > > >> +
> > > >> +     return nfc->buf[nfc->bufshift++];
> > > >
> > > > ->read_byte() should normally be a wrapper around ->read_buf(),
> > > > ->because
> > > > you don't know ahead of time, how many time ->read_byte() will be
> > > > called after the CMD/ADDR cycles, and thus cannot deduce how much
> > > > should be put in the temporary buffer.
> > > > So I'd suggest you put the logic to fill nfc->buf[] directly in
> > > > there instead of putting it in ->cmdfunc().
> > > >
> > >
> > > Controller doesn't support dma for readid, parameter page commands
> > > and the response for these commands shall be read from the fifo
> > > which is of 32 bit width.
> >
> > Okay, but I was not referring to DMA here. If ->read_buf() always
> > implies using DMA, then maybe you should rework it to make DMA
> > operations optional, and only activate them when ->read_page() is used.
> >

Ok.=20

> > >
> > > Also for status command, the response shall be read from the
> > > controller register.
> > >
> > > Arasan controller will not allow byte reads. So, i have opted this
> > > implemetation.
> > >
> > > In either case, number of bytes to be read will not ne known. For
> > > now, it estimates the number of bytes to be read based on the
> > > command that is issued and resets the buffer shift counter if it see
> > > a new command request.
> >
> > Which is not a good idea. As I said, you can't guess how many bytes
> > the framework will read after a specific command (CCed Ezequiel, who,
> > IIRC, had this kind of problems with the pxa3xx driver).
> >

Agree. But I don't have a choice here. I have just verified the pxa3xx
Implementation for read_byte and it also using the similar approach.
The framework should definitely read the finite number of bytes and it
Should be as per the onfi spec. Could you point me the case/command
That may read variable number of bytes ?



> > >
> > > Also its not a generic controller, supports only the commands
> > > defined in the program register.
> > >
> >
> > Hm, are you sure there's no way to send raw commands, or CMD and ADDR
> > cycles independently?
> > AFAICS, you're still configuring the ADDR and CMD cycles manually (in
> > anfc_prepare_cmd()), which seems pretty generic to me...
> >
    Yes. But yet the outset we need to write the specific command bit in
program register though we program the addr and command registers.
you could see the macros start with PROG_XXX for programing the specific
command in program register. After writing this bit, then only controller s=
tarts
the communication with the flash device.

> > >
> > >
> > > >> +}
> >
> > [...]
> >
> > > >> +static void anfc_cmd_function(struct mtd_info *mtd,
> > > >> +                           unsigned int cmd, int column, int
> > > >> +page_addr) {
> > > >> +     struct anfc *nfc =3D to_anfc(mtd);
> > > >> +     bool wait =3D false, read =3D false;
> > > >> +     u32 addrcycles, prog;
> > > >> +     u32 *bufptr =3D (u32 *)nfc->buf;
> > > >> +
> > > >> +     nfc->bufshift =3D 0;
> > > >> +     nfc->curr_cmd =3D cmd;
> > > >> +
> > > >> +     if (page_addr =3D=3D -1)
> > > >> +             page_addr =3D 0;
> > > >> +     if (column =3D=3D -1)
> > > >> +             column =3D 0;
> > > >> +
> > > >> +     switch (cmd) {
> > > >> +     case NAND_CMD_RESET:
> > > >> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> > > >> +             prog =3D PROG_RST;
> > > >> +             wait =3D true;
> > > >> +             break;
> > > >> +     case NAND_CMD_SEQIN:
> > > >> +             addrcycles =3D nfc->raddr_cycles + nfc->caddr_cycles=
;
> > > >> +             anfc_prepare_cmd(nfc, cmd, NAND_CMD_PAGEPROG, 1,
> > > >> +                              mtd->writesize, addrcycles);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             break;
> > > >> +     case NAND_CMD_READOOB:
> > > >> +             column +=3D mtd->writesize;
> > > >> +     case NAND_CMD_READ0:
> > > >> +     case NAND_CMD_READ1:
> > > >> +             addrcycles =3D nfc->raddr_cycles + nfc->caddr_cycles=
;
> > > >> +             anfc_prepare_cmd(nfc, NAND_CMD_READ0,
> NAND_CMD_READSTART, 1,
> > > >> +                              mtd->writesize, addrcycles);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             break;
> > > >> +     case NAND_CMD_RNDOUT:
> > > >> +             anfc_prepare_cmd(nfc, cmd, NAND_CMD_RNDOUTSTART, 1,
> > > >> +                              mtd->writesize, 2);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             if (nfc->dma)
> > > >> +                     nfc->rdintrmask =3D XFER_COMPLETE;
> > > >> +             else
> > > >> +                     nfc->rdintrmask =3D READ_READY;
> > > >> +             break;
> > > >> +     case NAND_CMD_PARAM:
> > > >> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             anfc_setpktszcnt(nfc, sizeof(struct nand_onfi_params=
), 1);
> > > >> +             anfc_readfifo(nfc, PROG_RDPARAM,
> > > >> +                             sizeof(struct nand_onfi_params));
> > > >> +             break;
> > > >> +     case NAND_CMD_READID:
> > > >> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             anfc_setpktszcnt(nfc, ONFI_ID_LEN, 1);
> > > >> +             anfc_readfifo(nfc, PROG_RDID, ONFI_ID_LEN);
> > > >> +             break;
> > > >> +     case NAND_CMD_ERASE1:
> > > >> +             addrcycles =3D nfc->raddr_cycles;
> > > >> +             prog =3D PROG_ERASE;
> > > >> +             anfc_prepare_cmd(nfc, cmd, NAND_CMD_ERASE2, 0, 0,
> addrcycles);
> > > >> +             column =3D page_addr & 0xffff;
> > > >> +             page_addr =3D (page_addr >> PG_ADDR_SHIFT) & 0xffff;
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             wait =3D true;
> > > >> +             break;
> > > >> +     case NAND_CMD_STATUS:
> > > >> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> > > >> +             anfc_setpktszcnt(nfc, nfc->spktsize/4, 1);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             prog =3D PROG_STATUS;
> > > >> +             wait =3D read =3D true;
> > > >> +             break;
> > > >> +     case NAND_CMD_GET_FEATURES:
> > > >> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             anfc_setpktszcnt(nfc, nfc->spktsize, 1);
> > > >> +             anfc_readfifo(nfc, PROG_GET_FEATURE, 4);
> > > >> +             break;
> > > >> +     case NAND_CMD_SET_FEATURES:
> > > >> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > >> +             anfc_setpagecoladdr(nfc, page_addr, column);
> > > >> +             anfc_setpktszcnt(nfc, nfc->spktsize, 1);
> > > >> +             break;
> > > >> +     default:
> > > >> +             return;
> > > >> +     }
> > > >> +
> > > >> +     if (wait) {
> > > >> +             anfc_enable_intrs(nfc, XFER_COMPLETE);
> > > >> +             writel(prog, nfc->base + PROG_OFST);
> > > >> +             anfc_wait_for_event(nfc, XFER_COMPLETE);
> > > >> +     }
> > > >> +
> > > >> +     if (read)
> > > >> +             bufptr[0] =3D readl(nfc->base + FLASH_STS_OFST); }
> > > >
> > > > Can you try to implement ->cmd_ctrl() instead of ->cmdfunc(). This
> > > > way you'll benefit from all the improvements we'll to the default
> > > > nand_command_lp() and nand_command() implementation, and this
> also
> > > > ease maintenance on our side.
> > > > According to what I've seen so far this should be doable.
> > > >
> > >
> > > I see your point but since this controller is providing the glue
> > > logic for issuing the nand commands, i doubt adopting cmd_ctrl would
> > > be not stright forward. IMHO, cmd_ctrl shall be used for controllers
> > > that provide low level access and allow more confgurable options.
> >
> > And as pointed above, your controller seems to be able to do that, but
> > maybe I'm missing something.
> >
> > I know it implies reworking your driver, but as I said, if we keep
> > adding new drivers which are not able to send generic CMDs, then we'll
> > be screwed when we'll want to add support for newer NANDs (MLC
> NANDs),
> > which are usually providing private/vendor-specific commands for
> > common functions (like read-retry).
> >
As I mentioned, the controller can issue up to 26 commands defined
In onfi 3.1 spec. No support for any other private/vendor specific commands=
.
The program register has 26 bits to trigger the any of one of these 26 comm=
ands
In a given time.

> > Patching all NAND controllers to support those new NANDs is not a
> > viable option, this is why I'd like to avoid those custom ->cmdfunc()
> > implementations in new NAND drivers, unless I'm proven this is really
> > impossible to do.
> >
> > >
> > >
> >
> > [...]
> >
> > > >> +
> > > >> +static int anfc_init_timing_mode(struct anfc *nfc) {
> > > >> +     int mode, err;
> > > >> +     unsigned int feature[2], regval, i;
> > > >> +     struct nand_chip *chip =3D &nfc->chip;
> > > >> +     struct mtd_info *mtd =3D &nfc->mtd;
> > > >> +
> > > >> +     memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> > > >> +     /* Get nvddr timing modes */
> > > >> +     mode =3D onfi_get_sync_timing_mode(chip) & 0xff;
> > > >> +     if (!mode) {
> > > >> +             mode =3D fls(onfi_get_async_timing_mode(&nfc->chip))=
 - 1;
> > > >> +             regval =3D mode;
> > > >> +     } else {
> > > >> +             mode =3D fls(mode) - 1;
> > > >> +             regval =3D NVDDR_MODE | mode <<
> NVDDR_TIMING_MODE_SHIFT;
> > > >> +             mode |=3D ONFI_DATA_INTERFACE_NVDDR;
> > > >> +     }
> > > >> +
> > > >> +     feature[0] =3D mode;
> > > >> +     for (i =3D 0; i < nfc->num_cs; i++) {
> > > >> +             chip->select_chip(mtd, i);
> >
> > You select the chip here, but it's never de-selected, which means the
> > last chip in the array stay selected until someone send a new command.
> >

Yes. Corrected it. In general it has two values 0 or 1=20
0 for chip select 1 and 1 for chip select 2. So, ideally it will not affect=
 the CS line
Though you have not opted for de-select. So, I didn't caught this issue. Bu=
t
As per the sequence It need to deselected.

> > > >> +             err =3D chip->onfi_set_features(mtd, chip,
> > > >> +                                     ONFI_FEATURE_ADDR_TIMING_MOD=
E,
> > > >> +                                     (uint8_t *)feature);
> > > >> +             if (err)
> > > >> +                     return err;
> > > >> +     }
> > > >> +     writel(regval, nfc->base + DATA_INTERFACE_REG);
> > > >> +
> > > >> +     if (mode & ONFI_DATA_INTERFACE_NVDDR)
> > > >> +             nfc->spktsize =3D NVDDR_MODE_PACKET_SIZE;
> > > >
> > > > You seem to switch from SDR to DDR mode, but I don't see any
> > > > timing configuration. How is your controller able to adapt to
> > > > different NAND timings?
> > > >
> > >
> > > it is doing the timing mode configuration. it will adapt to the
> > > timing parameters defined in the ONFI 3.1 spec for each of tje
> > > timing mode i.e 0-5.
> >
> > I know what ONFI timings mode are, but usually when you change the
> > mode on the NAND side, you have to adapt your timings on the
> > controller side, and I don't see anything related to timings config on
> > the controller side here, hence my question.

Ok. Yes, you are correct. Controller is proving the option to configure the=
 timing
Modes. But not the way other controllers are doing like tRR, tWR..
It is providing the register called Data interface register which allow use=
 configuring the=20
Interface type i.e SDR/DDR and timing modes i.e. 0 to 5. So, controller wil=
l generate the
Required timings as per the ONFI spec and based on the timing mode selected=
.

> >
> > >
> > > >> +
> > > >> +     return 0;
> > > >> +}
> > > >> +
> > > >> +static int anfc_probe(struct platform_device *pdev) {
> > > >> +     struct anfc *nfc;
> > > >> +     struct mtd_info *mtd;
> > > >> +     struct nand_chip *nand_chip;
> > > >> +     struct resource *res;
> > > >> +     struct mtd_part_parser_data ppdata;
> > > >> +     int err;
> > > >> +
> > > >> +     nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> > > >> +     if (!nfc)
> > > >> +             return -ENOMEM;
> > > >> +
> > > >> +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > >> +     nfc->base =3D devm_ioremap_resource(&pdev->dev, res);
> > > >> +     if (IS_ERR(nfc->base))
> > > >> +             return PTR_ERR(nfc->base);
> > > >> +
> > > >> +     mtd =3D &nfc->mtd;
> > > >> +     nand_chip =3D &nfc->chip;
> > > >> +     nand_chip->priv =3D nfc;
> > > >> +     mtd->priv =3D nand_chip;
> > > >> +     mtd->name =3D DRIVER_NAME;
> > > >> +     nfc->dev =3D &pdev->dev;
> > > >> +     mtd->dev.parent =3D &pdev->dev;
> > > >> +
> > > >> +     nand_chip->cmdfunc =3D anfc_cmd_function;
> > > >> +     nand_chip->waitfunc =3D anfc_device_ready;
> > > >
> > > > You can leave nand_chip->waitfunc to NULL since your
> > > > implementation is doing exactly what the default implementation doe=
s.
> > > >
> > > >> +     nand_chip->chip_delay =3D 30;
> > > >> +     nand_chip->read_buf =3D anfc_read_buf;
> > > >> +     nand_chip->write_buf =3D anfc_write_buf;
> > > >> +     nand_chip->read_byte =3D anfc_read_byte;
> > > >> +     nand_chip->options =3D NAND_BUSWIDTH_AUTO |
> NAND_NO_SUBPAGE_WRITE;
> > > >> +     nand_chip->bbt_options =3D NAND_BBT_USE_FLASH;
> > > >> +     nand_chip->select_chip =3D anfc_select_chip;
> > > >> +     nand_chip->onfi_set_features =3D anfc_onfi_set_features;
> > > >> +     nfc->dma =3D of_property_read_bool(pdev->dev.of_node,
> > > >> +                                      "arasan,has-mdma");
> > > >> +     nfc->num_cs =3D 1;
> > > >> +     of_property_read_u32(pdev->dev.of_node, "num-cs",
> > > >> + &nfc->num_cs);
> > > >
> > > > Already mentioned by Brian, but you should have a look at the
> > > > sunxi-nand binding to see how to represent the NAND controller and
> > > > its chips in the DT.
> > > >
> > >
> > > Ok. i will check the implementation.
> > >
> > > >> +     platform_set_drvdata(pdev, nfc);
> > > >> +     init_completion(&nfc->bufrdy);
> > > >> +     init_completion(&nfc->xfercomp);
> > > >> +     nfc->irq =3D platform_get_irq(pdev, 0);
> > > >> +     if (nfc->irq < 0) {
> > > >> +             dev_err(&pdev->dev, "platform_get_irq failed\n");
> > > >> +             return -ENXIO;
> > > >> +     }
> > > >> +     err =3D devm_request_irq(&pdev->dev, nfc->irq, anfc_irq_hand=
ler,
> > > >> +                            0, "arasannfc", nfc);
> > > >> +     if (err)
> > > >> +             return err;
> > > >> +     nfc->clk_sys =3D devm_clk_get(&pdev->dev, "clk_sys");
> > > >> +     if (IS_ERR(nfc->clk_sys)) {
> > > >> +             dev_err(&pdev->dev, "sys clock not found.\n");
> > > >> +             return PTR_ERR(nfc->clk_sys);
> > > >> +     }
> > > >> +
> > > >> +     nfc->clk_flash =3D devm_clk_get(&pdev->dev, "clk_flash");
> > > >> +     if (IS_ERR(nfc->clk_flash)) {
> > > >> +             dev_err(&pdev->dev, "flash clock not found.\n");
> > > >> +             return PTR_ERR(nfc->clk_flash);
> > > >> +     }
> > > >> +
> > > >> +     err =3D clk_prepare_enable(nfc->clk_sys);
> > > >> +     if (err) {
> > > >> +             dev_err(&pdev->dev, "Unable to enable sys clock.\n")=
;
> > > >> +             return err;
> > > >> +     }
> > > >> +
> > > >> +     err =3D clk_prepare_enable(nfc->clk_flash);
> > > >> +     if (err) {
> > > >> +             dev_err(&pdev->dev, "Unable to enable flash clock.\n=
");
> > > >> +             goto clk_dis_sys;
> > > >> +     }
> > > >> +
> > > >> +     nfc->spktsize =3D SDR_MODE_PACKET_SIZE;
> > > >> +     err =3D nand_scan_ident(mtd, nfc->num_cs, NULL);
> > > >> +     if (err) {
> > > >> +             dev_err(&pdev->dev, "nand_scan_ident for NAND failed=
\n");
> > > >> +             goto clk_dis_all;
> > > >> +     }
> > > >> +     if (nand_chip->onfi_version) {
> > > >> +             nfc->raddr_cycles =3D nand_chip->onfi_params.addr_cy=
cles &
> 0xf;
> > > >> +             nfc->caddr_cycles =3D
> > > >> +                             (nand_chip->onfi_params.addr_cycles =
>> 4) & 0xf;
> > > >> +     } else {
> > > >> +             /*For non-ONFI devices, configuring the address cyle=
s as 5 */
> > > >> +             nfc->raddr_cycles =3D nfc->caddr_cycles =3D 5;
> > > >> +     }
> > > >
> > > > Hm, this should not be dependent on ONFI support. It all depends
> > > > on the CHIP size, which you can deduce from mtd->writesize.
> > > >
> > >
> > > Understood. but i have kept those values as fallback. In general
> > > this controller talks with onfi devices only.
> >
> > Hm, not sure this is a good argument. Your NAND controller should work
> > with both ONFI and non-ONFI NANDs: you don't know which NAND will be
> > available on future board designs...

Agree. But the controller itself claims it supports ONFI devices and the in=
it sequence
recommends to check ONFI signature first. Also our chip will not boot if th=
e device
Is not compliant to ONFI. So, it's a known limitation that the controller w=
ill not work
for non-ONFI devices.

Regards,
Punnaiah
> >
> > Anyway, the check you're looking for is in nand_base.c IIRC.
> >
> > Best Regards,
> >
> > Boris
> >
> >
