Received: from mail-sn1nam02on0058.outbound.protection.outlook.com
 ([104.47.36.58] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwRMI-0003M0-Of
 for linux-mtd@lists.infradead.org; Mon, 25 Sep 2017 11:15:32 +0000
From: Mathias Thore <Mathias.Thore@infinera.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, "Cyrille
 Pitchen" <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] mtd: Fix partition alignment check on multi-erasesize
 devices
Date: Mon, 25 Sep 2017 11:15:01 +0000
Message-ID: <e06c750712f04878ad5f40f2df1ccfbb@sv-ex13-prd1.infinera.com>
References: <20170925081957.19177-1-boris.brezillon@free-electrons.com>
In-Reply-To: <20170925081957.19177-1-boris.brezillon@free-electrons.com>
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


> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: den 25 september 2017 10:20
> To: David Woodhouse; Brian Norris; Boris Brezillon; Marek Vasut; Richard
> Weinberger; Cyrille Pitchen; linux-mtd@lists.infradead.org
> Cc: Mathias Thore; Chris Packham; stable@vger.kernel.org
> Subject: [PATCH v2] mtd: Fix partition alignment check on multi-erasesize
> devices
>=20
> Commit 1eeef2d7483a ("mtd: handle partitioning on devices with 0
> erasesize") introduced a regression on heterogeneous erase region devices=
.
> Alignment of the partition was tested against the master eraseblock size
> which can be bigger than the slave one, thus leading to some partitions b=
eing
> marked as read-only.
>=20
> Update wr_alignment to match this slave erasesize after this erasesize ha=
s
> been determined by picking the biggest erasesize of all the regions
> embedded in the MTD partition.
>=20
> Reported-by: Mathias Thore <Mathias.Thore@infinera.com>
> Fixes: 1eeef2d7483a ("mtd: handle partitioning on devices with 0 erasesiz=
e")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Tested-by: Mathias Thore <Mathias.Thore@infinera.com>
Reviewed-by: Mathias Thore <Mathias.Thore@infinera.com>

> ---
> Changes in v2:
> - Fix build error reported by Mathias
> ---
>  drivers/mtd/mtdpart.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c index
> 5736b0c90b33..a308e707392d 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -581,6 +581,14 @@ static struct mtd_part *allocate_partition(struct
> mtd_info *parent,
>  		slave->mtd.erasesize =3D parent->erasesize;
>  	}
>=20
> +	/*
> +	 * Slave erasesize might differ from the master one if the
> master
> +	 * exposes several regions with different erasesize. Adjust
> +	 * wr_alignment accordingly.
> +	 */
> +	if (!(slave->mtd.flags & MTD_NO_ERASE))
> +		wr_alignment =3D slave->mtd.erasesize;
> +
>  	tmp =3D slave->offset;
>  	remainder =3D do_div(tmp, wr_alignment);
>  	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
> --
> 2.11.0
