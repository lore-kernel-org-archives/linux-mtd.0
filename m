Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgesR-0001jo-7T
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 20:18:24 +0000
Subject: Re: [PATCH] UBI: return ENOSPC if no enough space available
To: Sheng Yong <shengyong1@huawei.com>
References: <1443463039-8346-1-git-send-email-shengyong1@huawei.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5609A077.2010508@nod.at>
Date: Mon, 28 Sep 2015 22:17:59 +0200
MIME-Version: 1.0
In-Reply-To: <1443463039-8346-1-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.09.2015 um 19:57 schrieb Sheng Yong:
> UBI: attaching mtd1 to ubi0
> UBI: scanning is finished
> UBI error: init_volumes: not enough PEBs, required 706, available 686
> UBI error: ubi_wl_init: no enough physical eraseblocks (-20, need 1)
> UBI error: ubi_attach_mtd_dev: failed to attach mtd1, error -12 <= NOT ENOMEM
> UBI error: ubi_init: cannot attach mtd1
> 
> If available PEBs are not enough when initializing volumes, return -ENOSPC
> directly. If available PEBs are not enough when initializing WL, return
> -ENOSPC instead of -ENOMEM.
> 
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>  drivers/mtd/ubi/vtbl.c | 1 +
>  drivers/mtd/ubi/wl.c   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index 80bdd5b..d85c197 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -649,6 +649,7 @@ static int init_volumes(struct ubi_device *ubi,
>  		if (ubi->corr_peb_count)
>  			ubi_err(ubi, "%d PEBs are corrupted and not used",
>  				ubi->corr_peb_count);
> +		return -ENOSPC;
>  	}
>  	ubi->rsvd_pebs += reserved_pebs;
>  	ubi->avail_pebs -= reserved_pebs;
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 275d9fb..eb4489f9 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1601,6 +1601,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  		if (ubi->corr_peb_count)
>  			ubi_err(ubi, "%d PEBs are corrupted and not used",
>  				ubi->corr_peb_count);
> +		err = -ENOSPC;
>  		goto out_free;
>  	}
>  	ubi->avail_pebs -= reserved_pebs;
> 

Applied!

Thanks,
//richard
