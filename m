Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSU0v-000493-PA
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:02:10 +0000
Received: by pvh11 with SMTP id 11so1181898pvh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 06:02:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307078050.4167.1.camel@phoenix>
References: <1307078050.4167.1.camel@phoenix>
Date: Fri, 3 Jun 2011 15:02:07 +0200
Message-ID: <BANLkTikNC8F2TPY2TFHuHtU=-xhwef2ikw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: fix a memory leak
From: Daniel Mack <zonque@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Lei Wen <adrian.wenl@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Cc Lei Wen)

On Fri, Jun 3, 2011 at 7:14 AM, Axel Lin <axel.lin@gmail.com> wrote:
> In pxa3xx_nand_remove, we should call nand_release instead of
> mtd_device_unregister to properly free bad block table memory
> and bad block descriptor memory.
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 1fb3b3a..f7040ea 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1119,7 +1119,7 @@ static int pxa3xx_nand_remove(struct platform_devic=
e *pdev)
> =A0 =A0 =A0 =A0clk_put(info->clk);
>
> =A0 =A0 =A0 =A0if (mtd) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd_device_unregister(mtd);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_release(mtd);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(mtd);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.4.1
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
