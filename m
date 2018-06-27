Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY8u7-0003Rp-M9
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 11:46:33 +0000
Date: Wed, 27 Jun 2018 13:46:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 2/2] ubi: expose the volume CRC check skip flag
Message-ID: <20180627134620.607ba108@bbrezillon>
In-Reply-To: <c439cfe60b003c8b0158a0f57a95057ab7e93b90.1530099128.git-series.quentin.schulz@bootlin.com>
References: <cover.54081a233a7b9efc0fa933bdba97c73c85b20059.1530099128.git-series.quentin.schulz@bootlin.com>
 <c439cfe60b003c8b0158a0f57a95057ab7e93b90.1530099128.git-series.quentin.schulz@bootlin.com>
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

On Wed, 27 Jun 2018 13:33:20 +0200
Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> Now that we have the logic for skipping CRC check for static UBI volumes
> in the core, let's expose it to users.
> 
> This makes use of a padding byte in the volume description data
> structure as a flag. This flag only tell for now whether we should skip
> the CRC check of a volume.
> 
> This checks the UBI volume for which we are trying to skip the CRC check
> is static.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/ubi/cdev.c      |  4 ++++
>  drivers/mtd/ubi/vmt.c       |  3 +++
>  include/uapi/mtd/ubi-user.h | 16 ++++++++++++++--
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 45c3296..3eea1df 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -622,6 +622,10 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
>  	    req->vol_type != UBI_STATIC_VOLUME)
>  		goto bad;
>  
> +	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG &&
> +	    req->vol_type != UBI_STATIC_VOLUME)
> +		goto bad;
> +
>  	if (req->alignment > ubi->leb_size)
>  		goto bad;
>  
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index e2606a4..729588b 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -174,6 +174,9 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
>  	vol->dev.class = &ubi_class;
>  	vol->dev.groups = volume_dev_groups;
>  
> +	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG)
> +		vol->skip_check = 1;
> +
>  	spin_lock(&ubi->volumes_lock);
>  	if (vol_id == UBI_VOL_NUM_AUTO) {
>  		/* Find unused volume ID */
> diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
> index 5b04a49..ce76766 100644
> --- a/include/uapi/mtd/ubi-user.h
> +++ b/include/uapi/mtd/ubi-user.h
> @@ -285,6 +285,18 @@ struct ubi_attach_req {
>  	__s8 padding[10];
>  };
>  
> +/*
> + * UBI volume flags.
> + *
> + * @UBI_VOL_SKIP_CRC_CHECK_FLG: skip the CRC check done on static volumes at
> + *				open time. Only valid for static volumes and
> + *				should only be used if the volume user has a
> + *				way to verify data integrity
> + */
> +enum {
> +	UBI_VOL_SKIP_CRC_CHECK_FLG = 0x1,
> +};
> +
>  /**
>   * struct ubi_mkvol_req - volume description data structure used in
>   *                        volume creation requests.
> @@ -292,7 +304,7 @@ struct ubi_attach_req {
>   * @alignment: volume alignment
>   * @bytes: volume size in bytes
>   * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
> - * @padding1: reserved for future, not used, has to be zeroed
> + * @flags: volume flags (%UBI_VOL_SKIP_CRC_CHECK_FLG)
>   * @name_len: volume name length
>   * @padding2: reserved for future, not used, has to be zeroed
>   * @name: volume name
> @@ -321,7 +333,7 @@ struct ubi_mkvol_req {
>  	__s32 alignment;
>  	__s64 bytes;
>  	__s8 vol_type;
> -	__s8 padding1;
> +	__u8 flags;
>  	__s16 name_len;
>  	__s8 padding2[4];
>  	char name[UBI_MAX_VOLUME_NAME + 1];
