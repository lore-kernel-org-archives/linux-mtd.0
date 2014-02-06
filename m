From: "Gupta, Pekon" <pekon@ti.com>
To: Jingoo Han <jg1.han@samsung.com>, "'Brian Norris'"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/8] mtd: devices: elm: Remove unnecessary OOM messages
Date: Thu, 6 Feb 2014 06:27:23 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6E602@DBDE04.ent.ti.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
 <000301cf2301$e987e310$bc97a930$%han@samsung.com>
In-Reply-To: <000301cf2301$e987e310$bc97a930$%han@samsung.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 'David Woodhouse' <dwmw2@infradead.org>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Jingoo Han [mailto:jg1.han@samsung.com]
>
>The site-specific OOM messages are unnecessary, because they
>duplicate the MM subsystem generic OOM message.
>
>Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>---
> drivers/mtd/devices/elm.c |    4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
>index d1dd6a3..437ed3a 100644
>--- a/drivers/mtd/devices/elm.c
>+++ b/drivers/mtd/devices/elm.c
>@@ -354,10 +354,8 @@ static int elm_probe(struct platform_device *pdev)
> 	struct elm_info *info;
>
> 	info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>-	if (!info) {
>-		dev_err(&pdev->dev, "failed to allocate memory\n");
>+	if (!info)
> 		return -ENOMEM;
>-	}
>
> 	info->dev =3D &pdev->dev;
>
>--
>1.7.10.4
>
Acked-by: Pekon Gupta <pekon@ti.com>
+ avinashphilipk@gmail.com

with regards, pekon
