Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEJKA-0002aN-UU
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 07:01:35 +0000
Date: Mon, 14 Jan 2008 17:21:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/3] mtd: Factor out OF partition support from the NOR
	driver.
Message-Id: <20080114172116.a2e5aa18.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__14_Jan_2008_17_21_16_+1100_NU.7Z4NFu9YqzcPb"
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Mon__14_Jan_2008_17_21_16_+1100_NU.7Z4NFu9YqzcPb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Scott,

[Corrected list address.]

On Fri, 11 Jan 2008 14:43:16 -0600 Scott Wood <scottwood@freescale.com> wro=
te:
>
> +++ b/drivers/mtd/ofpart.c

> +int __devinit of_mtd_parse_partitions(struct device *dev,

> +	nr_parts =3D 0;
> +	for (pp =3D node->child; pp; pp =3D pp->sibling)

	for_each_child_of_node(node, pp)

> +		nr_parts++;

> +	for (pp =3D of_get_next_child(node, NULL), i =3D 0; pp;=20
> +	     pp =3D of_get_next_child(node, pp), i++) {

	i =3D 0;
	for_each_child_of_node(node, pp) {

> +		const u32 *reg;
> +		int len;
> +
> +		reg =3D of_get_property(pp, "reg", &len);
> +		if (!reg || (len !=3D 2*sizeof(u32))) {

Spaces around '*'.

> +			of_node_put(pp);
> +			dev_err(dev, "Invalid 'reg' on %s\n", node->full_name);
> +			kfree(*pparts);
> +			*pparts =3D NULL;
> +			return -EINVAL;
> +		}
> +		(*pparts)[i].offset =3D reg[0];
> +		(*pparts)[i].size =3D reg[1];
> +
> +		partname =3D of_get_property(pp, "label", &len);
> +		if (!partname)
> +			partname =3D of_get_property(pp, "name", &len);
> +		(*pparts)[i].name =3D (char *)partname;
> +
> +		if (of_get_property(pp, "read-only", &len))
> +			(*pparts)[i].mask_flags =3D MTD_WRITEABLE;

		i++;

> +	}

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jan_2008_17_21_16_+1100_NU.7Z4NFu9YqzcPb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHiv9gTgG2atn1QN8RAsqkAJ4+JkcEuYDvRh1biaxLzD8tEGkRtQCdHrm+
4dNFr2v0LsGYLnhugQ76DnA=
=4BwO
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jan_2008_17_21_16_+1100_NU.7Z4NFu9YqzcPb--
