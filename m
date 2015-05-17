Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu14c-0005OQ-Oa
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 16:05:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 52E8528BD05
 for <linux-mtd@lists.infradead.org>; Sun, 17 May 2015 18:04:07 +0200 (CEST)
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
 [209.85.220.178])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 8A4A628429D
 for <linux-mtd@lists.infradead.org>; Sun, 17 May 2015 18:04:02 +0200 (CEST)
Received: by qkgx75 with SMTP id x75so96808585qkg.1
 for <linux-mtd@lists.infradead.org>; Sun, 17 May 2015 09:05:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431877266-28566-7-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-7-git-send-email-hauke@hauke-m.de>
From: Jonas Gorski <jogo@openwrt.org>
Date: Sun, 17 May 2015 18:05:00 +0200
Message-ID: <CAOiHx=kGrsxLRT_Lf7PGm=hHm8azQYu5_AQVd6q+oOh2EXawsQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] mtd: brcmnand: run bcm47xxpart part parser in addition
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, rjui@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hauke,

On Sun, May 17, 2015 at 5:41 PM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> On the bcm53xx and bcm47xx SoC the bcm47xxpart partition parser is able
> to parse the partitions automatically by reading some special header
> used on these SoCs flash partition and some guessing. Without this
> patch the default list is used, with this patch this partition parser
> is used if the others haven't found a partition.
>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 468a212..cc5dc1e 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1879,6 +1879,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>         return 0;
>  }
>
> +static const char * const probes[] = {"cmdlinepart", "ofpart", "bcm47xxpart",
> +                                     NULL};
> +

I know this is a bit more work, but how about moving the
"linux,part-probe" parsing code from drivers/mtd/maps/physmap_of.c to
mtd_device_parse_register?

then mtd_device_parse_register could do something like

 if (!probes && ppdata && ppdata->of_node)
    probes = of_get_probes(ppdata->of_node);

and you could just add a linux,part-probe = "..."; property to the dts files

(It looks too easy/obvious so I guess I'm overlooking something fundamental ;P)

>  static int brcmnand_init_cs(struct brcmnand_host *host)
>  {
>         struct brcmnand_controller *ctrl = host->ctrl;
> @@ -1956,7 +1959,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
>         if (nand_scan_tail(mtd))
>                 return -ENXIO;
>
> -       return mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> +       return mtd_device_parse_register(mtd, probes, &ppdata, NULL, 0);
>  }

Then you wouldn't need to change this at all.


Regards
Jonas
