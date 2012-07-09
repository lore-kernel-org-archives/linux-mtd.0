Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoB09-0003Cd-Pz
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 10:15:34 +0000
Received: by wibhq4 with SMTP id hq4so2121628wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2012 03:15:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 9 Jul 2012 12:15:17 +0200
Message-ID: <CACQ1gAhOtCTVVnSvso1-jq+MyminKC2i244d9je=v0acAzzRBw@mail.gmail.com>
Subject: Re: [PATCH 2/5] ubi: Limit amount of reserved eraseblocks for bad PEB
 handling
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/7/4 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
> index f6a7d7a..e9dcb83 100644
> --- a/drivers/mtd/ubi/misc.c
> +++ b/drivers/mtd/ubi/misc.c
> @@ -98,10 +98,18 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
>   */
>  void ubi_calculate_reserved(struct ubi_device *ubi)
>  {
> -       ubi->beb_rsvd_level = ubi->good_peb_count/100;
> -       ubi->beb_rsvd_level *= CONFIG_MTD_UBI_BEB_RESERVE;
> -       if (ubi->beb_rsvd_level < MIN_RESEVED_PEBS)
> -               ubi->beb_rsvd_level = MIN_RESEVED_PEBS;
> +       /*
> +        * Calculate the actual number of PEBs currently needed to be reserved
> +        * for future bad eraseblock handling.
> +        */
> +       ubi->beb_rsvd_level = ubi->bad_peb_limit - ubi->bad_peb_count;
> +       if (ubi->beb_rsvd_level < 0) {
> +               ubi->beb_rsvd_level = 0;
> +               ubi_warn("number of bad PEBs (%d) is above the expected limit "
> +                        "(%d), not reserving any PEBs for bad PEB handling, "
> +                        "will use available PEBs (if any)",
> +                        ubi->bad_peb_count, ubi->bad_peb_limit);
> +       }
>  }
is it ok for beb_rsvd_level to be in the range [0..x[ instead of [2..x[ ?
