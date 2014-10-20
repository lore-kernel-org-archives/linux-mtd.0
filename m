Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgAoB-0008QF-OZ
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 11:07:29 +0000
Message-ID: <5444ECD2.2010107@nod.at>
Date: Mon, 20 Oct 2014 13:06:58 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrew Murray <amurray@embedded-bits.co.uk>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: ubi: Use UBI_METAONLY constraint for renames
References: <1413750419-7020-1-git-send-email-amurray@embedded-bits.co.uk>
In-Reply-To: <1413750419-7020-1-git-send-email-amurray@embedded-bits.co.uk>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.10.2014 um 22:26 schrieb Andrew Murray:
> Renaming a volume does not alter nor read volume data - thus the existing
> UBI_READWRITE constraint can be weakened. This patch provides a new
> UBI_METAONLY constraint and updates the UBI rename logic to use it.
> 
> This change permits the rename of a mounted volume which enables support
> for additional methods of firmware upgrade - see discussion at
> https://patchwork.ozlabs.org/patch/398784
> 
> This patch differs from that of the original discussion through the addition
> on an additional 'break' statement.

Thanks for pointing out. I fat-fingered that.

> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Tested-by: Andrew Murray <amurray@embedded-bits.co.uk>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Andrew Murray <amurray@embedded-bits.co.uk>

This is not a valid SoB chain. You are not the author of this patch
nor went it thought me. Please don't resend patches as your work.

While the patch works it needs some more thoughts.
So far I had no time to review all code paths.
Also the naming might need an update we have to differentiate between
touching volume data and the volume metadata.
i.e. exclusive access currently touches both. Maybe we need to interfere
with UBI_METAONLY too.

Thanks,
//richard

> ---
>  drivers/mtd/ubi/cdev.c  |  2 +-
>  drivers/mtd/ubi/kapi.c  | 12 +++++++++++-
>  drivers/mtd/ubi/ubi.h   |  5 ++++-
>  include/linux/mtd/ubi.h |  3 ++-
>  4 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 7646220..4c4c455 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -731,7 +731,7 @@ static int rename_volumes(struct ubi_device *ubi,
>  			goto out_free;
>  		}
>  
> -		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_READWRITE);
> +		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_METAONLY);
>  		if (IS_ERR(re->desc)) {
>  			err = PTR_ERR(re->desc);
>  			ubi_err("cannot open volume %d, error %d", vol_id, err);
> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> index 3aac1ac..b470619 100644
> --- a/drivers/mtd/ubi/kapi.c
> +++ b/drivers/mtd/ubi/kapi.c
> @@ -137,7 +137,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
>  		return ERR_PTR(-EINVAL);
>  
>  	if (mode != UBI_READONLY && mode != UBI_READWRITE &&
> -	    mode != UBI_EXCLUSIVE)
> +	    mode != UBI_EXCLUSIVE && mode != UBI_METAONLY)
>  		return ERR_PTR(-EINVAL);
>  
>  	/*
> @@ -186,6 +186,12 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
>  			goto out_unlock;
>  		vol->exclusive = 1;
>  		break;
> +
> +	case UBI_METAONLY:
> +		if (vol->metaonly)
> +			goto out_unlock;
> +		vol->metaonly = 1;
> +		break;
>  	}
>  	get_device(&vol->dev);
>  	vol->ref_count += 1;
> @@ -343,6 +349,10 @@ void ubi_close_volume(struct ubi_volume_desc *desc)
>  		break;
>  	case UBI_EXCLUSIVE:
>  		vol->exclusive = 0;
> +		break;
> +	case UBI_METAONLY:
> +		vol->metaonly = 0;
> +		break;
>  	}
>  	vol->ref_count -= 1;
>  	spin_unlock(&ubi->volumes_lock);
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 7bf4163..629973f 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -260,6 +260,7 @@ struct ubi_fm_pool {
>   * @readers: number of users holding this volume in read-only mode
>   * @writers: number of users holding this volume in read-write mode
>   * @exclusive: whether somebody holds this volume in exclusive mode
> + * @metaonly: whether somebody is altering only meta data of this volume
>   *
>   * @reserved_pebs: how many physical eraseblocks are reserved for this volume
>   * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
> @@ -308,6 +309,7 @@ struct ubi_volume {
>  	int readers;
>  	int writers;
>  	int exclusive;
> +	int metaonly;
>  
>  	int reserved_pebs;
>  	int vol_type;
> @@ -389,7 +391,8 @@ struct ubi_debug_info {
>   * @volumes_lock: protects @volumes, @rsvd_pebs, @avail_pebs, beb_rsvd_pebs,
>   *                @beb_rsvd_level, @bad_peb_count, @good_peb_count, @vol_count,
>   *                @vol->readers, @vol->writers, @vol->exclusive,
> - *                @vol->ref_count, @vol->mapping and @vol->eba_tbl.
> + *                @vol->metaonly, @vol->ref_count, @vol->mapping and
> + *                @vol->eba_tbl.
>   * @ref_count: count of references on the UBI device
>   * @image_seq: image sequence number recorded on EC headers
>   *
> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
> index c3918a0..1ace519 100644
> --- a/include/linux/mtd/ubi.h
> +++ b/include/linux/mtd/ubi.h
> @@ -38,7 +38,8 @@
>  enum {
>  	UBI_READONLY = 1,
>  	UBI_READWRITE,
> -	UBI_EXCLUSIVE
> +	UBI_EXCLUSIVE,
> +	UBI_METAONLY
>  };
>  
>  /**
> 
