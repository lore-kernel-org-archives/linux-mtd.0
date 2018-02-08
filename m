Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ejqra-0007pu-5Y
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 18:24:04 +0000
Date: Thu, 8 Feb 2018 19:23:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>, boris.brezillon@bootlin.com,
 marcel.ziswiler@toradex.com, richard@nod.at, bpringle@sympatico.ca,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [RFC PATCH v2] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180208192347.692a2d93@xps13>
In-Reply-To: <20180208190744.615a25ef@xps13>
References: <20180114220012.30039-1-stefan@agner.ch>
 <20180208190744.615a25ef@xps13>
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


> > +}
> > =20
> > -	switch (command) {
> > -	case NAND_CMD_SEQIN:
> > -		/* Use valid column/page from preread... */
> > -		vf610_nfc_addr_cycle(nfc, column, page);
> > -		nfc->buf_offset =3D 0;
> > +static int vf610_nfc_exec_op(struct nand_chip *chip,
> > +			     const struct nand_operation *op,
> > +			     bool check_only) =20
>=20
> The soul of ->exec_op() is here :) However this implementation looks
> very specific to the kind of tasks you are used to do with one specific
> chip. What if someone wants to support a new command that implies
> several command/address/data cycles interleaved? Maybe one solution
> would be to rework a bit by using a case statement in a for loop. If
> the indentation level is too high, you may use helpers to do small
> tasks like sending a command or addresse cycle. What do you think?

Actually, instead of writing your own implementation, maybe you should
just write the helpers I mentioned above and fill a parser patterns
array to give to the NAND core's parser, simplifying again the
implementation.


Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
