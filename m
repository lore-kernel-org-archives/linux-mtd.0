Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1vOI-0006Dv-VF
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 08:25:19 +0000
Received: by wgbez12 with SMTP id ez12so1569669wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 01:25:12 -0700 (PDT)
Date: Thu, 16 Aug 2012 11:25:07 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: use the whole MTD device size to get
 bad_peb_limit
Message-ID: <20120816112507.01b7c0f0@pixies.home.jungo.com>
In-Reply-To: <1345043331.3393.151.camel@sauron.fi.intel.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-4-git-send-email-richard.genoud@gmail.com>
 <1345043331.3393.151.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, Richard,

On Wed, 15 Aug 2012 18:08:51 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 1. Invalid blocks are block that contain one or more bad bits beyond
> ECC.

I would remove this one sentence from the log, it is misleading; invalid
blocks are not necessarily related to ECC.

>  		if (CONFIG_MTD_UBI_BEB_LIMIT > 0) {
> -			int percent = CONFIG_MTD_UBI_BEB_LIMIT;
> -			int limit = mult_frac(ubi->peb_count, percent, 100);
> +			int per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
> +			int limit, device_pebs;
> +			uint64_t device_size;
> +
> +			/*
> +			 * Here we are using size of the entire flash chip and
> +			 * not just the MTD partition size because the maximum
> +			 * number of bad eraseblocks is a percentage of the
> +			 * whole device and bad eraseblocks are not fairly
> +			 * distributed over the flash chip. So the worst case
> +			 * is that all the bad eraseblocks of the chip are in
> +			 * the MTD partition we are attaching (ubi->mtd).
> +			 */
> +			device_size = mtd_get_device_size(ubi->mtd);
> +			device_pebs = mtd_div_by_eb(device_size, ubi->mtd);
> +			limit = mult_frac(device_pebs, per1024, 1024);
>  
>  			/* Round it up */
> -			if (mult_frac(limit, 100, percent) < ubi->peb_count)
> +			if (mult_frac(limit, 1024, per1024) < ubi->peb_count)

Oops... should be: 

+			if (mult_frac(limit, 1024, per1024) < device_pebs)

Regards,
Shmulik
