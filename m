Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEFB0-0000jB-HJ
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 14:25:44 +0000
Date: Thu, 3 May 2018 16:25:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <h.grohne@intenta.de>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon
 <Boris.Brezillon@bootlin.com>
Subject: Re: [LINUX, v8, 2/2] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20180503162530.437f147a@xps13>
In-Reply-To: <20180503125600.vkv5vowdyjz5p2zt@laureti-dev>
References: <1521024505-30677-1-git-send-email-nagasureshkumarrelli@gmail.com>
 <20180503125600.vkv5vowdyjz5p2zt@laureti-dev>
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

On Thu, 3 May 2018 14:56:01 +0200, Helmut Grohne <h.grohne@intenta.de>
wrote:

> On Wed, Mar 14, 2018 at 04:18:25PM +0530, Naga Sureshkumar Relli wrote:
> > +	xnand->row_addr_cycles =3D nand_chip->onfi_params.addr_cycles & 0xF;
> > +	xnand->col_addr_cycles =3D
> > +				(nand_chip->onfi_params.addr_cycles >> 4) & 0xF; =20
>=20
> Meanwhile onfi_params have been removed from the mainline and this patch
> no longer builds against v4.17-rc3. Can you resend a version that builds
> against with more recent kernels?

Actually I'm not sure you need addr_cycles from the ONFI param
page. What about non-ONFI chips? Anyway you won't find this entry
anymore as the param page is now freed after probe.

I don't get why you need this though?
Maybe you should have a look at the NAND_ROW_ADDR_3 flag?

Thanks,
Miqu=C3=A8l

>=20
> Helmut
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
