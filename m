Received: from mail-db8lp0186.outbound.messaging.microsoft.com
 ([213.199.154.186] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdWer-0005NF-OW
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 02:46:22 +0000
Message-ID: <52785CA2.2090501@freescale.com>
Date: Tue, 5 Nov 2013 10:49:06 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Use devm_kzalloc()
References: <1383617225-8504-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1383617225-8504-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C205=C8=D5 10:07, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Using devm_kzalloc() can make the code simpler.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 7ac2280..4b6d802 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1732,7 +1732,7 @@ static int gpmi_nand_probe(struct platform_device=
 *pdev)
>  		return -ENODEV;
>  	}
> =20
> -	this =3D kzalloc(sizeof(*this), GFP_KERNEL);
> +	this =3D devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
>  	if (!this) {
>  		pr_err("Failed to allocate per-device memory\n");
>  		return -ENOMEM;
> @@ -1762,7 +1762,6 @@ exit_nfc_init:
>  	release_resources(this);
>  exit_acquire_resources:
>  	dev_err(this->dev, "driver registration failed: %d\n", ret);
> -	kfree(this);
> =20
>  	return ret;
>  }
> @@ -1773,7 +1772,6 @@ static int gpmi_nand_remove(struct platform_devic=
e *pdev)
> =20
>  	gpmi_nfc_exit(this);
>  	release_resources(this);
> -	kfree(this);
>  	return 0;
>  }
> =20

thanks!

Acked-by: Huang Shijie <b32955@freescale.com>
