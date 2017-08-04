Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddXKl-0001uM-98
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 07:47:48 +0000
Date: Fri, 4 Aug 2017 09:47:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 05/25] mtd: nand: qcom: remove redundant chip select
 compatible string
Message-ID: <20170804094725.1034e5d9@bbrezillon>
In-Reply-To: <1500464893-11352-6-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-6-git-send-email-absahu@codeaurora.org>
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

On Wed, 19 Jul 2017 17:17:53 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> Currently the compatible =E2=80=9Cqcom,nandcs=E2=80=9D is being used for =
each
> connected NAND device to support for multiple NAND devices in the
> same bus. The same thing can be achieved by looking reg property
> for each sub nodes which contains the chip select number so this
> patch removes the use of =E2=80=9Cqcom,nandcs=E2=80=9D for specifying NAN=
D device
> sub nodes.
>=20
> Since there is no user for this driver currently in so
> changing compatible string is safe.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Applied to nand/next.

Thanks,

Boris

> ---
>  drivers/mtd/nand/qcom_nandc.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 8fa2f0c..110a26a 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2129,22 +2129,20 @@ static int qcom_nandc_probe(struct platform_devic=
e *pdev)
>  		goto err_setup;
> =20
>  	for_each_available_child_of_node(dn, child) {
> -		if (of_device_is_compatible(child, "qcom,nandcs")) {
> -			host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> -			if (!host) {
> -				of_node_put(child);
> -				ret =3D -ENOMEM;
> -				goto err_cs_init;
> -			}
> -
> -			ret =3D qcom_nand_host_init(nandc, host, child);
> -			if (ret) {
> -				devm_kfree(dev, host);
> -				continue;
> -			}
> +		host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +		if (!host) {
> +			of_node_put(child);
> +			ret =3D -ENOMEM;
> +			goto err_cs_init;
> +		}
> =20
> -			list_add_tail(&host->node, &nandc->host_list);
> +		ret =3D qcom_nand_host_init(nandc, host, child);
> +		if (ret) {
> +			devm_kfree(dev, host);
> +			continue;
>  		}
> +
> +		list_add_tail(&host->node, &nandc->host_list);
>  	}
> =20
>  	if (list_empty(&nandc->host_list)) {
