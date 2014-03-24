Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRvPR-0002p7-8C
 for linux-mtd@lists.infradead.org; Mon, 24 Mar 2014 03:18:45 +0000
Date: Mon, 24 Mar 2014 10:28:05 +0800
From: Huang Shijie <b32955@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: gpmi: add gpmi_devdata{} to simplify the code
Message-ID: <20140324022803.GA11377@localhost>
References: <1395397179-17449-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4ECF@DBDE04.ent.ti.com>
 <532C15EB.9010600@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4F02@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB4F02@DBDE04.ent.ti.com>
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 11:15:21AM +0000, Gupta, Pekon wrote:
> >From: Huang Shijie [mailto:b32955@freescale.com]
> >=E4=BA=8E 2014=E5=B9=B403=E6=9C=8821=E6=97=A5 18:29, Gupta, Pekon =E5=86=
=99=E9=81=93:
> >> Ezequiel has got approval for 2 new generic MTD bindings (refer l2-m=
td.git)
> >> 	commit 8dd49165ef5f46b5ad9ba296c559ccff315f9421
> >> 	mtd: nand: Add a devicetree binding for ECC strength and ECC step s=
ize
> >> So, I think<1>  can be replaced by "nand-ecc-strength".
> >>
> >>
> >"nand-ecc-strength" is add the ECC strength for the NAND, but my patch
> >is add
> >the maximum ECC strength the BCH controller can support.
> >
> >they are different things.
> >
> Ok then it's also tied to your IP / SoC revision right ?

yes.
>=20
> >>> >
> >>> >    [2] add the gpmi_devdata_imx{23|28|6q} to replace the gpmi_ids=
.
> >>> >
> >> Can you use "compatible" string in DT for this ?
> >>
> >>
> >sorry, could you please give me an example?
> >
> >I do not know what's your meaning. :(
> >
>=20
> Can you use something like this, instead of populating static for each =
chip.
>=20
> if (of_device_is_compatible(of_node, "imx23") || of_device_is_compatibl=
e(child, "imx28")) {
> 	bch_max_ecc_strength =3D 20;
> 	max_chain_delay =3D 16;
> } elseif (of_device_is_compatible(of_node, "imx6q") {
> 	bch_max_ecc_strength =3D 40;
> 	max_chain_delay =3D 12;
> } elseif (of_device_is_compatible(of_node, "imx6sx") {
> 	bch_max_ecc_strength =3D 40;
> 	max_chain_delay =3D 0; /* whatever is here */
> } else {
> 	bch_max_ecc_strength =3D 1; /* whatever is default */
> 	max_chain_delay =3D 0; /* whatever is default */
> }
>=20

thanks Pekon. But as Ezequiel said, i also think that this patch is more =
readable.

Thanks again
Huang Shijie
