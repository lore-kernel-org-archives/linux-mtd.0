Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9G9Z-0000JM-1s
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 18:50:49 +0000
Received: by mail-pg0-x242.google.com with SMTP id 3so2803963pgd.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 10:50:29 -0800 (PST)
Date: Tue, 22 Nov 2016 10:50:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zach Brown <zach.brown@ni.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Message-ID: <20161122185026.GC77253@google.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
 <1479757899-6849-3-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479757899-6849-3-git-send-email-zach.brown@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 21, 2016 at 01:51:36PM -0600, Zach Brown wrote:
> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> Use the MTD function 'max_bad_blocks' to compute the UBI bad_peb_limit,
> if the function is implemented for an MTD and doesn't return an error.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
> ---
>  drivers/mtd/ubi/build.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 85d54f3..e9940a9 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -584,6 +584,10 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
>  	int limit, device_pebs;
>  	uint64_t device_size;
>  
> +	limit = mtd_max_bad_blocks(ubi->mtd, 0, ubi->mtd->size);
> +	if (limit > 0)

I guess we're assuming 0 is an erroneous value? Otherwise, why would
mtd_can_have_bb() be true?

Brian

> +		return limit;
> +
>  	if (!max_beb_per1024)
>  		return 0;
>  
> -- 
> 2.7.4
> 
