Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie4.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEXft-0001Qq-5a
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 09:38:36 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson
 <Chris.Paterson2@renesas.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
Date: Tue, 14 Nov 2017 09:38:05 +0000
Message-ID: <TY1PR06MB089543675F2792B50910E9B0C0280@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

Dear All,

how does this patch look like?

Thanks,
Fabrizio

> Subject: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of supp=
orted chip names
>
> There are a few DT files that make use of sst25vf016b in their
> compatible strings, and the driver supports this chip already.
> This patch improves the documentation and therefore the result
> of ./scripts/checkpatch.pl.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Thank you Rob, thank you Geert, and sorry for the delay on this one.
> Here is v2.
>
> Changes in v2:
> * fixed subject prefix
> * added changelog
>
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Do=
cumentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 4cab5d8..bf56d77 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -31,6 +31,7 @@ Required properties:
>                   s25sl12801
>                   s25fl008k
>                   s25fl064k
> +                 sst25vf016b
>                   sst25vf040b
>                   sst25wf040b
>                   m25p40
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
