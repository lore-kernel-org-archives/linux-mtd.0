Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY4KE-0005BJ-UH
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 06:53:12 +0000
Date: Wed, 27 Jun 2018 08:52:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Dmitry
 Osipenko <digetx@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
Message-ID: <20180627085257.67aa1eb8@xps13>
In-Reply-To: <993e40ac-1f06-c2ee-e9fb-4523df368cb7@canonical.com>
References: <993e40ac-1f06-c2ee-e9fb-4523df368cb7@canonical.com>
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

Hi Colin, Stefan,

+linux-mtd

Thanks Colin for the report.

On Tue, 26 Jun 2018 16:18:29 +0100, Colin Ian King
<colin.king@canonical.com> wrote:

> Hi there,
>=20
> Static analysis with CoverityScan reported a potential issue with the
> following commit:
>=20
> commit 0f7b126ca91101d02d525f7cc880e8c71202a2b7
> Author: Stefan Agner <stefan@agner.ch>
> Date:   Sun Jun 24 23:27:25 2018 +0200
>=20
>     mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
>=20
>=20
> in function tegra_nand_cmd it looks like there maybe potential to pass a
> negative value in size into memcpy():
>=20
>         case NAND_OP_DATA_OUT_INSTR:
>=20
> negative_return_fn: Function nand_subop_get_data_len(subop, op_id)
> returns a negative number.
>=20
> var_assign: Assigning: unsigned variable size =3D nand_subop_get_data_len.
>=20
>                 size =3D nand_subop_get_data_len(subop, op_id);
>                 offset =3D nand_subop_get_data_start_off(subop, op_id);

Stefan,

I thought a bit about this and I don't think the right place for such a
fix are the NAND controller drivers (marvell and vf610 have the same
issue). Both nand_subop_get_data/addr_len/start_off() are core helpers
and their result is predictable in a manner that only a bug in your
parsing function would trigger an error value. I think this is safe for
the four helpers to have WARN_ON() on the error conditions to catch
the developer's attention and just return (unsigned int) 0 in this case.

I will propose something soon.

Thanks,
Miqu=C3=A8l
