Received: from mail-by2nam01on060d.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::60d]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMBZe-00036i-Us
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2018 12:44:16 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Martin Lund
 <martin.lund@keep-it-simple.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Michal Simek
 <michals@xilinx.com>, "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Mon, 12 Nov 2018 12:43:30 +0000
Message-ID: <MWHPR02MB2623C672241900608C181CD6AFC10@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CAB7pii1WbALtH1AHjocpC976ytrCV5gM6JGXawoN--scvEx8Mw@mail.gmail.com>
 <20181112115810.6f931cfb@bbrezillon>
In-Reply-To: <20181112115810.6f931cfb@bbrezillon>
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

Hi Boris &  Martin,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, November 12, 2018 4:28 PM
> To: Martin Lund <martin.lund@keep-it-simple.com>
> Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>; miquel.raynal@bootlin.c=
om;
> richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> marek.vasut@gmail.com; Michal Simek <michals@xilinx.com>; nagasuresh12@gm=
ail.com;
> linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; robh@kernel.=
org
> Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for =
Arasan NAND
> Flash Controller
>=20
> On Mon, 12 Nov 2018 11:55:36 +0100
> Martin Lund <martin.lund@keep-it-simple.com> wrote:
>=20
> > Hi Naga,
> >
> > Just a few review comments for the v12 version.
> >
> > On Fri, Nov 9, 2018 at 6:00 AM Naga Sureshkumar Relli
> > <naga.sureshkumar.relli@xilinx.com> wrote:
> > > +#define PKT_OFST               0x00
> > > +#define PKT_CNT_SHIFT          12
> > > +
> > > +#define MEM_ADDR1_OFST         0x04
> > > +#define MEM_ADDR2_OFST         0x08
> >
> > For the sake of readability I think *_OFFSET is preferred, especially
> > since the driver already includes short macro names. I think this is
> > similar to the EVNT vs EVENT point.
> > The majority of drivers in the Linux kernel do not shorten OFFSET -> OF=
ST.
> >
> >
> > > +static void anfc_rw_pio_op(struct mtd_info *mtd, u8 *buf, int len,
> > > +                          bool do_read, int prog, int pktcount, int
> > > +pktsize) {
> > > +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +       struct anfc_nand_controller *nfc =3D to_anfc(chip->controller=
);
> > > +       struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +       u32 *bufptr =3D (u32 *)buf;
> > > +       u32 cnt =3D 0, intr =3D 0;
> > > +
> > > +       anfc_config_dma(nfc, 0);
> > > +
> > > +       if (pktsize =3D=3D 0)
> > > +               pktsize =3D len;
> > > +
> > > +       anfc_setpktszcnt(nfc, pktsize, pktcount);
> > > +
> > > +       if (!achip->strength)
> > > +               intr =3D MBIT_ERROR;
> > > +
> > > +       if (do_read)
> > > +               intr |=3D READ_READY;
> > > +       else
> > > +               intr |=3D WRITE_READY;
> > > +       anfc_enable_intrs(nfc, intr);
> > > +       writel(prog, nfc->base + PROG_OFST);
> > > +       while (cnt < pktcount) {
> > > +               anfc_wait_for_event(nfc);
> > > +               cnt++;
> > > +               if (cnt =3D=3D pktcount)
> > > +                       anfc_enable_intrs(nfc, XFER_COMPLETE);
> > > +               if (do_read)
> > > +                       ioread32_rep(nfc->base + DATA_PORT_OFST, bufp=
tr,
> > > +                                    pktsize / 4);
> > > +               else
> > > +                       iowrite32_rep(nfc->base + DATA_PORT_OFST, buf=
ptr,
> > > +                                     pktsize / 4);
> > > +               bufptr +=3D (pktsize / 4);
> > > +               if (cnt < pktcount)
> > > +                       anfc_enable_intrs(nfc, intr);
> > > +       }
> > > +       anfc_wait_for_event(nfc);
> > > +}
> >
> > Throughout the driver all calls to anfc_wait_for_event() ignores the
> > timeout return value. It would be nice to see some error handling in
> > case it times out - at minimum consider printing out an error message
> > since timeout on NAND operations are fairly critical and should
> > generally not occur. Perhaps even an argument can be made for
> > returning -ETIMEDOUT in case of timeout.
>=20
> Yes please, check anfc_wait_for_event() return code and propagate the err=
or to the upper layer.
Ok, I will update

Thanks,
Naga Sureshkumar Relli
