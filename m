Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Umc-0000jV-JB
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 10:37:03 +0000
Received: by weyr3 with SMTP id r3so336329wey.36
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 03:36:59 -0700 (PDT)
Date: Thu, 23 Aug 2012 13:36:55 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
Message-ID: <20120823133655.72157b18@pixies.home.jungo.com>
In-Reply-To: <1345716615.2848.229.camel@sauron.fi.intel.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Aug 2012 13:10:15 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index aa60b30..865e4fa 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -860,9 +860,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>  	if (max_beb_per1024 < 0 || max_beb_per1024 > MAX_MTD_UBI_BEB_LIMIT)
>  		return -EINVAL;
>  
> -	if (!max_beb_per1024)
> -		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
> -
>  	/*
>  	 * Check if we already have the same MTD device attached.
>  	 *
> @@ -935,6 +932,15 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>  	if (err)
>  		goto out_free;
>  
> +	if (!max_beb_per1024) {
> +		if (!ubi->bad_allowed) {
> +			ubi_err("mtd%d does not admit of bad blocks, "
> +				"max_beb_per1024 cannot be used", mtd->index);
> +			goto out_free;
> +		}
> +		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
> +	}
> +

Artem, this is now located *after* the call to
	io_init(ubi, max_beb_per1024)
So falling to the default (in case max_beb_per1024 is zero) won't work.

Also, why displaying the error if max_beb_per1024 was NOT povided?
Shouldn't it be displayed only when max_beb_per1024 is other than zero?
What am I missing?

Regards,
Shmulik
