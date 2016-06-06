Received: from caladan.dune.hu ([78.24.191.180] helo=arrakis.dune.hu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA1p5-0000S8-VN
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 21:12:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 8F004B802FF
 for <linux-mtd@lists.infradead.org>; Mon,  6 Jun 2016 23:12:10 +0200 (CEST)
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
 [209.85.213.42])
 by arrakis.dune.hu (Postfix) with ESMTPSA id EFF63B80230
 for <linux-mtd@lists.infradead.org>; Mon,  6 Jun 2016 23:10:48 +0200 (CEST)
Received: by mail-vk0-f42.google.com with SMTP id c66so63287219vkb.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2016 14:10:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1465245341-16026-1-git-send-email-hauke@hauke-m.de>
References: <1465245341-16026-1-git-send-email-hauke@hauke-m.de>
From: Jonas Gorski <jogo@openwrt.org>
Date: Mon, 6 Jun 2016 23:10:27 +0200
Message-ID: <CAOiHx=kit1Fz2hTmyxStzCfGDDpc4vcx06E2JVmwve8tTWo7Gg@mail.gmail.com>
Subject: Re: [PATCH v2] MTD: lantiq: handle NO_XIP on cfi0001 flash
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 John Crispin <john@phrozen.org>
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

On 6 June 2016 at 22:35, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> From: John Crispin <john@phrozen.org>
>
> This uses the same device tree attribute as physmap_of.c
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/maps/lantiq-flash.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
> index c8febb3..88fc6d9 100644
> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -137,7 +137,11 @@ ltq_mtd_probe(struct platform_device *pdev)
>         if (!ltq_mtd->map)
>                 return -ENOMEM;
>
> -       ltq_mtd->map->phys = ltq_mtd->res->start;
> +       if (of_find_property(pdev->dev.of_node, "no-unaligned-direct-access",
> +                            NULL))
> +               ltq_mtd->map->phys = NO_XIP;

This does not what you think it does; i.e. preventing unaligned io
memory accesses. All it's used for is in two drivers
(cfi_cmdset_0001.c, lpddr_cmds.c) as a check whether to populate
_point/_unpoint. But it does not prevent the map_read/map_write
accessors from doing memcpy_{from,to}_io() with unaligned addresses,
which at least on MIPS results in unaligned accesses with LWL/LWR.
Which is what I assume you want to prevent.


Regards
Jonas
