Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwmqz-0005We-Sx
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:03:34 +0000
Received: by wmec201 with SMTP id c201so19840906wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 00:03:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
Date: Thu, 12 Nov 2015 09:03:11 +0100
Message-ID: <CAH6sp9OhB3y=0GazcL5Lj-C5z-pRerncQ_KQM0xpP3nmAqF_gw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
From: Frans Klaver <fransklaver@gmail.com>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: baruch@tkos.co.il, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
 Luis de Bethencourt <luis@debethencourt.com>, s.hauer@pengutronix.de,
 u.kleine-koenig@pengutronix.de,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Nov 12, 2015 at 8:46 AM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later.

Did you actually run into this? It seems to me that this driver is
only probed if and only if we have a match and that therefore
of_match_device will always return a valid pointer (it is using the
same match table). Am I missing something?


> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/mtd/nand/mxc_nand.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 136e73a..9e42431 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1464,8 +1464,7 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>  {
>         struct device_node *np = host->dev->of_node;
>         struct mxc_nand_platform_data *pdata = &host->pdata;
> -       const struct of_device_id *of_id =
> -               of_match_device(mxcnd_dt_ids, host->dev);
> +       const struct of_device_id *of_id;
>         int buswidth;
>
>         if (!np)
> @@ -1482,6 +1481,9 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>
>         pdata->width = buswidth / 8;
>
> +       of_id = of_match_device(mxcnd_dt_ids, host->dev);
> +       if (!of_id)
> +               return -ENODEV;
>         host->devtype_data = of_id->data;
>
>         return 0;
> --
> 2.4.10
>

Thanks,
Frans
