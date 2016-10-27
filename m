Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzqvp-0001b5-Ee
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 20:05:46 +0000
Date: Thu, 27 Oct 2016 22:05:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 3/3] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Message-ID: <20161027220524.61560d14@bbrezillon>
In-Reply-To: <1477595642-11454-4-git-send-email-zach.brown@ni.com>
References: <1477595642-11454-1-git-send-email-zach.brown@ni.com>
 <1477595642-11454-4-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 Oct 2016 14:14:02 -0500
Zach Brown <zach.brown@ni.com> wrote:

> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> Use the MTD function 'max_bad_blocks' to compute the UBI bad_peb_limit,
> if the function is implemented for an MTD and doesn't return an error.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> ---
>  drivers/mtd/ubi/build.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 85d54f3..0648863 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -584,6 +584,15 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
>  	int limit, device_pebs;
>  	uint64_t device_size;
>  
> +	/* If the MTD provides a max_bad_blocks function, use that value. Fall
> +	 * back to max_beb_per1024 if that function returns an error.
> +	 */
> +	if (ubi->mtd->_max_bad_blocks) {
> +		limit = ubi->mtd->_max_bad_blocks(ubi->mtd, 0, ubi->mtd->size);
> +		if (limit > 0)
> +			return limit;
> +	}

Please use the helper I was suggesting in patch 1.

> +
>  	if (!max_beb_per1024)
>  		return 0;
>  
