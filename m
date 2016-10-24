Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byZnQ-0004MG-LO
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 07:35:49 +0000
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33547)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1byZn0-000Qog-Rw
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 03:35:26 -0400
Received: by mail-lf0-f43.google.com with SMTP id x79so195493281lff.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 00:35:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ad5a4648bd2486d5c8e671312a0a717fa2a6b2b8.1475668319.git.cyrille.pitchen@atmel.com>
References: <cover.1475668319.git.cyrille.pitchen@atmel.com>
 <ad5a4648bd2486d5c8e671312a0a717fa2a6b2b8.1475668319.git.cyrille.pitchen@atmel.com>
From: Jagan Teki <jagan@openedev.com>
Date: Mon, 24 Oct 2016 13:05:20 +0530
Message-ID: <CAD6G_RRDFaJU=u5qvscYw+3KEb3GqzJEWwCjePhogQT6XZzaBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] mtd: spi-nor: improve macronix_quad_enable()
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, Marek Vasut <marex@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 5, 2016 at 5:30 PM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> The patch checks whether the Quad Enable bit is already set in the Status
> Register. If so, the function exits immediately with a successful return
> code. Otherwise, a message is now printed telling we're setting the
> non-volatile bit.
>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Reviewed-by: Jagan Teki <jagan@openedev.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165d7d66..5c87b2d99507 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1211,6 +1211,11 @@ static int macronix_quad_enable(struct spi_nor *nor)
>         val = read_sr(nor);
>         if (val < 0)
>                 return val;
> +       if (val & SR_QUAD_EN_MX)
> +               return 0;
> +
> +       /* Update the Quad Enable bit. */
> +       dev_info(nor->dev, "setting Macronix Quad Enable (non-volatile) bit\n");
>         write_enable(nor);
>
>         write_sr(nor, val | SR_QUAD_EN_MX);

Safe to save ret and check the same as well.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
