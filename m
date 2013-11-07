Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeFY9-0001mP-RD
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 02:42:26 +0000
Message-ID: <527AFEB6.20004@freescale.com>
Date: Thu, 7 Nov 2013 10:45:10 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: Revert "mtd: gpmi: scan two nand chips"
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1383758172-29798-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C207=C8=D5 01:16, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> This revert is needed so that the revert of commit f720e7ce5=20
> ("mtd: gpmi: remove the nand_scan()") can be succesfully applied.
>
> This reverts commit cdef39de399fc6806f85c60ef97c9e394b3a92d4.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 7ac2280..a5c60c4 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1674,7 +1674,7 @@ static int gpmi_nfc_init(struct gpmi_nand_data *t=
his)
>  	if (ret)
>  		goto err_out;
> =20
> -	ret =3D nand_scan_ident(mtd, 2, NULL);
> +	ret =3D nand_scan_ident(mtd, 1, NULL);
>  	if (ret)
>  		goto err_out;
> =20
Please do not revert the patches.

It's not the right way to fix this.
I will spend some time to this bug today.

thanks

Huang Shijie
