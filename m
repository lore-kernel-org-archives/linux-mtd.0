Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXi7o-0002yf-DL
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 07:10:54 +0000
Date: Tue, 26 Jun 2018 09:10:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Message-ID: <20180626091005.08d56b2a@xps13>
In-Reply-To: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
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

Hi Martin, Boris,

On Fri, 22 Jun 2018 16:50:25 +0200, Martin Kaiser <martin@kaiser.cx>
wrote:

> mxcnd_probe_dt is called from mxcnd_probe, which is not marked as __init.
>=20

I think this line is just a side note and should be at the end of the
commit log.

> Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
> potentially be called at any time. After the __init functions are cleaned,
> mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.

The above paragraph explains the problem and the solution, you can just
add something like "mcvnd_probe is untouched because it is already not
marked as __init" instead of the first line.

>=20
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Boris, do you think this patch is a good candidate for stable?

If yes, Martin, could you please add a couple of stable/fixes tags above
your SoB?

Thanks,
Miqu=C3=A8l

> ---
> I hope that my understanding is correct.
>=20
> In practice, I could not get the kernel to crash, my compiler would
> inline mxcnd_probe_dt into mxcnd_probe and ignore the __init.
>=20
> If I marked mxcnd_probe_dt as noinline, I could trigger a crash as
> follows
>=20
> [root@host ]# echo bb000000.nand > /sys/bus/platform/drivers/mxc_nand/unb=
ind
> [root@host ]# echo bb000000.nand > /sys/bus/platform/drivers/mxc_nand/bind
> Internal error: Oops - undefined instruction: 0 [#1] ARM
> ...
>=20
>  drivers/mtd/nand/raw/mxc_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_n=
and.c
> index 26cef21..90cfb5e 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -1686,7 +1686,7 @@ static const struct of_device_id mxcnd_dt_ids[] =3D=
 {
>  };
>  MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
> =20
> -static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
> +static int mxcnd_probe_dt(struct mxc_nand_host *host)
>  {
>  	struct device_node *np =3D host->dev->of_node;
>  	const struct of_device_id *of_id =3D
> @@ -1700,7 +1700,7 @@ static int __init mxcnd_probe_dt(struct mxc_nand_ho=
st *host)
>  	return 0;
>  }
>  #else
> -static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
> +static int mxcnd_probe_dt(struct mxc_nand_host *host)
>  {
>  	return 1;
>  }
