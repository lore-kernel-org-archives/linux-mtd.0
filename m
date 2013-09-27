Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPdyA-0006yu-Us
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 19:44:56 +0000
Message-ID: <5245E01D.3020104@nod.at>
Date: Fri, 27 Sep 2013 21:44:29 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] UBI: fastmap: fix a mem leak on error path
References: <1380296235-24194-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1380296235-24194-1-git-send-email-richard.genoud@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.09.2013 17:37, schrieb Richard Genoud:
> If the scan_pool() function fails, the "free" list is not freed.
> This leads to destroy_ai(ai) complaining with:
> "kmem_cache_destroy ubi_ainf_peb_slab: Slab cache still has objects"

Hmm, I *think* we need to take care about used and eba_orphans too.
Tomorrow I'll have time to investigate...

Thanks,
//richard

> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  drivers/mtd/ubi/fastmap.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 05067f5..22eb527 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -841,6 +841,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  fail_bad:
>  	ret = UBI_BAD_FASTMAP;
>  fail:
> +	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
> +		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
> +		list_del(&tmp_aeb->u.list);
> +	}
>  	return ret;
>  }
>  
> 
