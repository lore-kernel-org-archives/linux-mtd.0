Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZU2h-0000HI-9j
 for linux-mtd@lists.infradead.org; Sat, 27 Feb 2016 01:51:36 +0000
Received: by mail-wm0-x232.google.com with SMTP id g62so92912546wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 17:51:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455316144-14464-1-git-send-email-robert.jarzmik@free.fr>
References: <1455316144-14464-1-git-send-email-robert.jarzmik@free.fr>
Date: Fri, 26 Feb 2016 22:51:13 -0300
Message-ID: <CAAEAJfCmL4qcKMiTOoM7ixJ_NCTTObUV1v=jE19aWS=18-vqTw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: fix dmaengine initialization
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 12 February 2016 at 19:29, Robert Jarzmik <robert.jarzmik@free.fr> wrote=
:
> When the driver is initialized in a pure device-tree platform, the
> driver's probe fails allocating the dma channel :
> [  525.624435] pxa3xx-nand 43100000.nand: no resource defined for data DM=
A
> [  525.632088] pxa3xx-nand 43100000.nand: alloc nand resource failed
>
> The reason is that the DMA IO resource is not acquired through platform
> resources but by OF bindings.
>
> Fix this by ensuring that DMA IO resources are only queried in the non
> device-tree case.
>
> Fixes: 8f5ba31aa565 ("mtd: nand: pxa3xx-nand: switch to dmaengine")
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index a168cbcc1086..afd487d4b67f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1750,7 +1750,7 @@ static int alloc_nand_resource(struct platform_devi=
ce *pdev)
>         if (ret < 0)
>                 return ret;
>
> -       if (use_dma) {
> +       if (!np && use_dma) {
>                 r =3D platform_get_resource(pdev, IORESOURCE_DMA, 0);
>                 if (r =3D=3D NULL) {
>                         dev_err(&pdev->dev,

Looking through the kernel tree, this change seems to be correct.

However, I'm still wondering how DMA resources are obtained in the
device-tree case. Can you explain it to me?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
