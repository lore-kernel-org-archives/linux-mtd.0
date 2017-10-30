Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e95R9-0004xd-HJ
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 08:28:49 +0000
Date: Mon, 30 Oct 2017 09:28:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pan Bian <bianpan2016@163.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: ubi: fastmap: use kmem_cache_free to deallocate memory
Message-ID: <20171030092824.464ea876@bbrezillon>
In-Reply-To: <1509280802-14620-1-git-send-email-bianpan2016@163.com>
References: <1509280802-14620-1-git-send-email-bianpan2016@163.com>
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

On Sun, 29 Oct 2017 20:40:02 +0800
Pan Bian <bianpan2016@163.com> wrote:

> Memory allocated by kmem_cache_alloc() should not be deallocated with
> kfree(). Use kmem_cache_free() instead.
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Richard, maybe you can add:

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Cc: <stable@vger.kernel.org>

> ---
>  drivers/mtd/ubi/fastmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 5a832bc..717db749 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -1063,7 +1063,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
>  		if (!e) {
>  			while (i--)
> -				kfree(fm->e[i]);
> +				kmem_cache_free(ubi_wl_entry_slab, fm->e[i]);
>  
>  			ret = -ENOMEM;
>  			goto free_hdr;
