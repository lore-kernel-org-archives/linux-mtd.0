Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJItI-0003Q6-7s
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 13:24:22 +0000
Date: Thu, 17 May 2018 15:24:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Helmut Grohne <h.grohne@intenta.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Boris Brezillon"
 <Boris.Brezillon@bootlin.com>
Subject: Re: [LINUX, v8, 2/2] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20180517152402.50187702@xps13>
In-Reply-To: <DM2PR02MB1418743DD67EAB0DBBA180D0AF860@DM2PR02MB1418.namprd02.prod.outlook.com>
References: <1521024505-30677-1-git-send-email-nagasureshkumarrelli@gmail.com>
 <20180503125600.vkv5vowdyjz5p2zt@laureti-dev>
 <20180503162530.437f147a@xps13>
 <DM2PR02MB1418743DD67EAB0DBBA180D0AF860@DM2PR02MB1418.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

On Fri, 4 May 2018 06:46:50 +0000, Naga Sureshkumar Relli
<nagasure@xilinx.com> wrote:

> Hi Miquel & Helmut,
>=20
> Thanks for updating the latest changes.
>=20
> > -----Original Message-----
> > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > Sent: Thursday, May 3, 2018 7:56 PM
> > To: Helmut Grohne <h.grohne@intenta.de>
> > Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>; linux-mtd@lists.infra=
dead.org; Boris
> > Brezillon <Boris.Brezillon@bootlin.com>
> > Subject: Re: [LINUX, v8, 2/2] mtd: rawnand: pl353: Add basic driver for=
 arm pl353 smc nand
> > interface
> >=20
> > Hi Naga,
> >=20
> > On Thu, 3 May 2018 14:56:01 +0200, Helmut Grohne <h.grohne@intenta.de>
> > wrote:
> >  =20
> > > On Wed, Mar 14, 2018 at 04:18:25PM +0530, Naga Sureshkumar Relli wrot=
e: =20
> > > > +	xnand->row_addr_cycles =3D nand_chip->onfi_params.addr_cycles & 0=
xF;
> > > > +	xnand->col_addr_cycles =3D
> > > > +				(nand_chip->onfi_params.addr_cycles >> 4) & 0xF; =20
> > >
> > > Meanwhile onfi_params have been removed from the mainline and this
> > > patch no longer builds against v4.17-rc3. Can you resend a version
> > > that builds against with more recent kernels? =20
> >=20
> > Actually I'm not sure you need addr_cycles from the ONFI param page. Wh=
at about non-
> > ONFI chips? Anyway you won't find this entry anymore as the param page =
is now freed after
> > probe.
> >=20
> > I don't get why you need this though?
> > Maybe you should have a look at the NAND_ROW_ADDR_3 flag? =20
>=20
> The arm SMC pl353 controller operates in cmd phase and data phase.
> In cmd phase it requires number of address cycles, hence we are using this
> By reading from parameter page.
> DOC: http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/DDI0380G_s=
mc_pl350_series_r2p1_trm.pdf
> if you see table2-2 NAND AXI address setup, it describes the usage of cmd
> and data phases.
> If we remove this onfi_params, is there an alternative to write the numbe=
r of address cycles filed in
> Cmd phase register?=20
> Or can I use max value?, that means as per spec it supports max of 7 addr=
ess cycles(it is a 3bit value).

In ->exec_op():
If your operation contains address cycles, you'll get the number with
nand_subop_get_num_addr_cyc(subop, op_id). You already retrieve
correctly that number from your ->exec_op() implementation. I don't
think you need anything else.

In ->ecc.read/write*() helpers:
The number of column cycles is 1 if mtd->writesize <=3D 512, otherwise
it is 2. The number of row cycles is 3 if the NAND_ROW_ADDR_3 flag is
present in chip->options, otherwise it is 2 (it won't change, just
check it once at probe time).

Thanks,
Miqu=C3=A8l
