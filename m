Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs18c-0002GK-Fr
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 07:31:40 +0000
Date: Tue, 21 Aug 2018 09:31:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "absahu@codeaurora.org" <absahu@codeaurora.org>, "peterpandong@micron.com"
 <peterpandong@micron.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20180821093125.05fb46a4@xps13>
In-Reply-To: <MWHPR02MB26235AF18211E3FB39076396AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180820184013.57fd7b5c@bbrezillon>
 <MWHPR02MB26235AF18211E3FB39076396AF310@MWHPR02MB2623.namprd02.prod.outlook.com>
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

> > And why is it an s32 and not a u32? =20
> To monitor NAND_CMD_STATUS.
> Sometimes core will just send status command without reading back the sta=
tus data and later
> It will try to read one byte using ->exec_op().
> So Arasan has FLASH_STS register and whenever we initiate a status comman=
d, the controller
> Will update this register with the value returned by the flash device.
> So we need to return this value when core is asking about 1 byte status v=
alue without issuing the command.
> And in driver we are using memset(nfc_op, 0, sizeof(struct anfc_op)), thi=
s will make cmnds[4] to zeros but 0x0 is also
> NAND_CMD_READ0, so inorder to differentiate whether to give status data o=
r not, I just assigned=20
> 	nfc_op->cmnds[0] =3D NAND_CMD_NONE;
>=20
> May be this case we can now eliminate as per your suggestion(defining a s=
eparate hook for each pattern) and thanks for that.
> >  =20
> > > +	u32 type;
> > > +	u32 len;
> > > +	u32 naddrs;
> > > +	u32 col;
> > > +	u32 row;
> > > +	unsigned int data_instr_idx;
> > > +	unsigned int rdy_timeout_ms;
> > > +	unsigned int rdy_delay_ns;
> > > +	const struct nand_op_instr *data_instr; }; =20
> >=20
> > Please make sure you actually need to redefine all these fields. Looks =
like some them could be
> > extracted directly from the nand_op_instr objects. =20
> Ok, all these values are getting updated in anfc_parse_instructions()

In anfc_parse_instructions():

+			nfc_op->data_instr =3D instr;
+			nfc_op->type =3D NAND_OP_DATA_IN_INSTR;

This looks pointless.

+			nfc_op->data_instr_idx =3D op_id;
+			break;
+		case NAND_OP_DATA_OUT_INSTR:
+			nfc_op->data_instr =3D instr;
+			nfc_op->type =3D NAND_OP_DATA_IN_INSTR;
+			nfc_op->data_instr_idx =3D op_id;
+			break;
+		case NAND_OP_WAITRDY_INSTR:
+			nfc_op->rdy_timeout_ms =3D instr->ctx.waitrdy.timeout_ms;

This one also.

+			nfc_op->rdy_delay_ns =3D instr->delay_ns;

And this one too.

Once you'll have a per pattern callback, I suppose you won't need it
anymore.

> >  =20
> > > +
> > > +/**
> > > + * struct anfc_nand_chip - Defines the nand chip related information
> > > + * @node:		used to store NAND chips into a list.
> > > + * @chip:		NAND chip information structure.
> > > + * @bch:		Bch / Hamming mode enable/disable.
> > > + * @bchmode:		Bch mode. =20
> >=20
> > What's the difference between bch and bchmode? =20
> @bch -> to select error correction method(either BCH or Hamming)
> @bchmode -> to select ECC correctability (4/8/12/24 bit ECC)

Then something like "strength" or "ecc_strength" would be more
meaningful.


Thanks,
Miqu=C3=A8l
