Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvnWy-0001Va-ET
 for linux-mtd@lists.infradead.org; Sun, 16 Oct 2016 15:39:21 +0000
Date: Sun, 16 Oct 2016 17:38:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] ubi: fix swapped arguments to call to ubi_alloc_aeb
Message-ID: <20161016173856.11d486aa@bbrezillon>
In-Reply-To: <20161015160011.27600-1-colin.king@canonical.com>
References: <20161015160011.27600-1-colin.king@canonical.com>
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

On Sat, 15 Oct 2016 17:00:11 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Static analysis by CoverityScan detected the ec and pnum
> arguments are in the wrong order on a call to ubi_alloc_aeb.
> Swap the order to fix this.
> 
> Fixes: 91f4285fe389a27 ("UBI: provide helpers to allocate and free aeb elements")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/fastmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index d6384d9..4eed546 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -287,7 +287,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  
>  		/* new_aeb is newer */
>  		if (cmp_res & 1) {
> -			victim = ubi_alloc_aeb(ai, aeb->ec, aeb->pnum);
> +			victim = ubi_alloc_aeb(ai, aeb->pnum, aeb->ec);
>  			if (!victim)
>  				return -ENOMEM;
>  
