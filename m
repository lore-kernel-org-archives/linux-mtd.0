Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdD1z-0000rM-I2
 for linux-mtd@lists.infradead.org; Fri, 26 Aug 2016 09:02:32 +0000
Date: Fri, 26 Aug 2016 11:02:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] UBI: provide helpers to allocate and free aeb elements
Message-ID: <20160826110209.2d74170b@bbrezillon>
In-Reply-To: <1471937574-8045-8-git-send-email-boris.brezillon@free-electrons.com>
References: <1471937574-8045-1-git-send-email-boris.brezillon@free-electrons.com>
 <1471937574-8045-8-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 23 Aug 2016 09:32:54 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> This not only hides the aeb allocation internals (which is always good in
> case we ever want to change the allocation system), but also helps us
> factorize the initialization of some common fields (ec and pnum).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/ubi/attach.c  | 68 ++++++++++++++++++++++++++++++++++-------------
>  drivers/mtd/ubi/fastmap.c | 28 +++++++------------
>  drivers/mtd/ubi/ubi.h     |  3 +++
>  drivers/mtd/ubi/vtbl.c    |  4 +--
>  4 files changed, 65 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index be83c17d742b..ba88ff582f1a 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -182,6 +182,46 @@ static struct ubi_ainf_volume *ubi_find_or_add_av(struct ubi_attach_info *ai,
>  }
>  
>  /**
> + * ubi_alloc_aeb - allocate an aeb element
> + * @ai: attaching information
> + * @aeb: the element to free

The kernel doc is wrong. I'll fix that in v2.

> + *
> + * Allocate an aeb object and initialize the pnum and ec information.
> + * vol_id and lnum are set to UBI_UNKNOWN, and the other fields are
> + * initialized to zero.
> + * Note that the element is not added in any list or RB tree.
> + */
> +struct ubi_ainf_peb *ubi_alloc_aeb(struct ubi_attach_info *ai, int pnum,
> +				   int ec)
> +{
> +	struct ubi_ainf_peb *aeb;
> +
> +	aeb = kmem_cache_zalloc(ai->aeb_slab_cache, GFP_KERNEL);
> +	if (!aeb)
> +		return NULL;
> +
> +	aeb->pnum = pnum;
> +	aeb->ec = ec;
> +	aeb->vol_id = UBI_UNKNOWN;
> +	aeb->lnum = UBI_UNKNOWN;
> +
> +	return aeb;
> +}
> +
