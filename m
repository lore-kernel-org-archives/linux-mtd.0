Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqyMx-0006Uv-Vp
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 07:08:32 +0000
Received: by wicll6 with SMTP id ll6so145488787wic.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 00:08:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445913313-18917-1-git-send-email-computersforpeace@gmail.com>
References: <1445913313-18917-1-git-send-email-computersforpeace@gmail.com>
Date: Tue, 27 Oct 2015 08:08:09 +0100
Message-ID: <CAH6sp9MXiEfMfj-eCwjdQVo5GXTxxt4mftnmBX_eQ6Yrje-6Mg@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of: assign parent for the concatenated MTD
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 27, 2015 at 3:35 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> If there is more than one map region for this device, then the
> concatenated MTD will not have a parent device assigned to it -- only
> the sub-devices (which are not actually registered with the framework)
> will have their parents assigned. Let's assign the concatenated device
> correctly.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Frans Klaver <fransklaver@gmail.com>
> ---
> This has a minor context conflict with [1], so I've just based this patch on
> top of it. I could adjust the context, depending on which comes first.
>
> (I noticed this while passing through drivers for [1])
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062825.html
>
>  drivers/mtd/maps/physmap_of.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 6ebe674262cc..305eaa4c15d4 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -309,6 +309,7 @@ static int of_flash_probe(struct platform_device *dev)
>         if (err)
>                 goto err_out;
>
> +       info->cmtd->dev.parent = &dev->dev;
>         info->cmtd->dev.of_node = dp;
>         part_probe_types = of_get_probes(dp);
>         if (!part_probe_types) {

That seems sensible.

Thanks,
Frans
