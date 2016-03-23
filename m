Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiefS-00029g-Qr
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 09:01:34 +0000
Date: Wed, 23 Mar 2016 10:00:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/3] mtd: nand: add enum nand_ecc_algo
Message-ID: <20160323100059.64ad9bb3@bbrezillon>
In-Reply-To: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
References: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
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

Hi Rafal,

On Tue, 22 Mar 2016 23:54:11 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Some time ago I started working on a new "nand-ecc-algo" property to allow
> specifying ECC algorithm for hardware ECC mode as well.
> Boris pointed out it's becoming a bit messy that way as we already have v=
alue
> NAND_ECC_SOFT_BCH.
> I suggested deprecating "soft_bch" value from nand-ecc-mode property and =
got
> Boris agreed and no objections from others. So there is how I want to imp=
lement
> this.
> If you agree on this way & apply my patches, I'll start modifying NAND dr=
ivers
> (similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BCH ex=
cept
> for handling backward compatibility.
> Then finally we should be able to add "nand-ecc-algo" property support pr=
operly.

I agree with patch 1 and 3, but I think we should create an
of_get_nand_ecc_algo() helper right now instead of relying on the
ecc->mode value to set ecc->algo (I'm referring to patch 2).

int of_get_nand_ecc_algo(struct device_node *np)
{
	const char *pm;
	int err, i;

	err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
	if (err < 0) {
		if (!of_property_read_string(np, "nand-ecc-mode", &pm)){
			if (!strcasecmp(pm, "soft"))
				err =3D NAND_ECC_HAMMING;
			else if (!strcasecmp(pm, "soft_bch"))
				err =3D NAND_ECC_BCH;
		}

		return err;
	}

	for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
		if (!strcasecmp(pm, nand_ecc_algos[i]))
			return i;

	return -EINVAL;
}
EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);

This way you'll be able to completely drop NAND_ECC_SOFT_BCH value when
all drivers have been patched.
BTW, even if we deprecate the DT property, we still have to support the
old format, so this extra "nand-ecc-mode" parsing will remain anyway.

And has already said ealier, I think we should also move the ecc layout
info somewhere else, and only leave ECC_NONE, ECC_HW and ECC_SOFT in
nand_ecc_modes_t enum. I'm not asking you to do that though, just
clarifying the separation I'd like to see ;).

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
