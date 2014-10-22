Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgznC-0005gK-3g
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 17:33:50 +0000
Received: by mail-qg0-f48.google.com with SMTP id i50so2956273qgf.35
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 10:33:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413998606-9589-1-git-send-email-computersforpeace@gmail.com>
References: <1413998606-9589-1-git-send-email-computersforpeace@gmail.com>
Date: Wed, 22 Oct 2014 10:33:28 -0700
Message-ID: <CAN8TOE9yDA=v_v-48ZiG=5+Dk_JamxYxd_0jrWGtwQ5QXGrszA@mail.gmail.com>
Subject: Re: [PATCH] mtd: docg3: fix 'defined but not used' warning
From: Brian Norris <computersforpeace@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 22, 2014 at 10:23 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
>    drivers/mtd/devices/docg3.c:2122:28: warning: 'docg3_dt_ids' defined but not used [-Wunused-variable]
>     static struct of_device_id docg3_dt_ids[] = {

I suppose I should add that this only happens when CONFIG_OF=n. I'll
add this to the commit message if/when I apply this.

Brian

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/devices/docg3.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index abd94668a05d..0d9d3ee68b61 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -2119,11 +2119,13 @@ static int __exit docg3_release(struct platform_device *pdev)
>         return 0;
>  }
>
> +#ifdef CONFIG_OF
>  static struct of_device_id docg3_dt_ids[] = {
>         { .compatible = "m-systems,diskonchip-g3" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, docg3_dt_ids);
> +#endif
>
>  static struct platform_driver g3_driver = {
>         .driver         = {
