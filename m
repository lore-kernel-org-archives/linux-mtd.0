Received: from mail-wg0-f54.google.com ([74.125.82.54])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TyiHj-0008Ox-AS
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2013 12:21:32 +0000
Received: by mail-wg0-f54.google.com with SMTP id fm10so187952wgb.33
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2013 04:21:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1359045599-1305-4-git-send-email-hauke@hauke-m.de>
References: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
 <1359045599-1305-4-git-send-email-hauke@hauke-m.de>
Date: Fri, 25 Jan 2013 13:21:29 +0100
Message-ID: <CACna6rzkiHQhDfR1biqODL9kEvat2ObN_Gwjg1EsDpRgOwMKow@mail.gmail.com>
Subject: Re: [PATCH 3/6] mtd: bcm47xxnflash: fix message
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/1/24 Hauke Mehrtens <hauke@hauke-m.de>:
> This is not a serial flash driver, but a nand flash driver
>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/bcm47xxnflash/main.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm=
47xxnflash/main.c
> index 8363a9a..616b56a 100644
> --- a/drivers/mtd/nand/bcm47xxnflash/main.c
> +++ b/drivers/mtd/nand/bcm47xxnflash/main.c
> @@ -94,7 +94,7 @@ static int __init bcm47xxnflash_init(void)
>          */
>         err =3D platform_driver_probe(&bcm47xxnflash_driver, bcm47xxnflas=
h_probe);
>         if (err)
> -               pr_err("Failed to register serial flash driver: %d\n", er=
r);
> +               pr_err("Failed to register bcm47xx nand flash driver: %d\=
n", err);

WARNING:LONG_LINE: line over 80 characters

--=20
Rafa=C5=82
