Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddXLB-0002IG-Tz
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 07:48:15 +0000
Date: Fri, 4 Aug 2017 09:47:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 06/25] dt-bindings: qcom_nandc: remove chip select
 compatible string
Message-ID: <20170804094747.58ba2bb9@bbrezillon>
In-Reply-To: <1500464893-11352-7-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-7-git-send-email-absahu@codeaurora.org>
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

On Wed, 19 Jul 2017 17:17:54 +0530
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
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Docum=
entation/devicetree/bindings/mtd/qcom_nandc.txt
> index 4511918..b24adfe 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -28,7 +28,6 @@ chip-selects which (may) contain NAND flash chips. Thei=
r properties are as
>  follows.
> =20
>  Required properties:
> -- compatible:		should contain "qcom,nandcs"
>  - reg:			a single integer representing the chip-select
>  			number (e.g., 0, 1, 2, etc.)
>  - #address-cells:	see partition.txt
> @@ -62,7 +61,6 @@ nand@1ac00000 {
>  	#size-cells =3D <0>;
> =20
>  	nandcs@0 {
> -		compatible =3D "qcom,nandcs";
>  		reg =3D <0>;
> =20
>  		nand-ecc-strength =3D <4>;
