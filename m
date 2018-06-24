Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fX4lb-0005Me-SZ
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 13:09:21 +0000
Date: Sun, 24 Jun 2018 15:09:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/14] ubi: Add module parameter to force a full scan
Message-ID: <20180624150908.2bb490bb@bbrezillon>
In-Reply-To: <20180613212344.11608-12-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
 <20180613212344.11608-12-richard@nod.at>
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

On Wed, 13 Jun 2018 23:23:41 +0200
Richard Weinberger <richard@nod.at> wrote:

> Using this parameter one can force UBI do to a full scan
> instead of using a fastmap.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/attach.c | 13 +++++++++----
>  drivers/mtd/ubi/build.c  |  5 ++++-
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index 9a8072cf458c..134b15f093c3 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -925,7 +925,7 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
>  	return err;
>  }
>  
> -static bool vol_ignored(int vol_id)
> +static bool vol_ignored(struct ubi_attach_info *ai, int vol_id)
>  {
>  	switch (vol_id) {
>  		case UBI_LAYOUT_VOLUME_ID:
> @@ -933,6 +933,9 @@ static bool vol_ignored(int vol_id)
>  	}
>  
>  #ifdef CONFIG_MTD_UBI_FASTMAP
> +	if (ai->force_full_scan)
> +		return false;
> +
>  	return ubi_is_fm_vol(vol_id);
>  #else
>  	return false;
> @@ -1143,7 +1146,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  	}
>  
>  	vol_id = be32_to_cpu(vidh->vol_id);
> -	if (vol_id > UBI_MAX_VOLUMES && !vol_ignored(vol_id)) {
> +	if (vol_id > UBI_MAX_VOLUMES && !vol_ignored(ai, vol_id)) {
>  		int lnum = be32_to_cpu(vidh->lnum);
>  
>  		/* Unsupported internal volume */
> @@ -1581,9 +1584,11 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
>  		force_scan = 1;
>  	}
>  
> -	if (force_scan)
> +	if (force_scan) {
> +		ubi_msg(ubi, "full scan forced");
> +		ai->force_full_scan = 1;
>  		err = scan_all(ubi, ai, 0);
> -	else {
> +	} else {
>  		err = scan_fast(ubi, &ai);
>  		if (err > 0 || mtd_is_eccerr(err)) {
>  			if (err != UBI_NO_FASTMAP) {
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index d2a726654ff1..1e3f75ede985 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -83,6 +83,7 @@ static struct mtd_dev_param mtd_dev_param[UBI_MAX_DEVICES];
>  static bool fm_autoconvert;
>  static bool fm_debug;
>  #endif
> +static bool force_scan;
>  
>  /* Slab cache for wear-leveling entries */
>  struct kmem_cache *ubi_wl_entry_slab;
> @@ -956,7 +957,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
>  	if (!ubi->fm_buf)
>  		goto out_free;
>  #endif
> -	err = ubi_attach(ubi, 0);
> +	err = ubi_attach(ubi, force_scan);
>  	if (err) {
>  		ubi_err(ubi, "failed to attach mtd%d, error %d",
>  			mtd->index, err);
> @@ -1458,6 +1459,8 @@ module_param(fm_autoconvert, bool, 0644);
>  MODULE_PARM_DESC(fm_autoconvert, "Set this parameter to enable fastmap automatically on images without a fastmap.");
>  module_param(fm_debug, bool, 0);
>  MODULE_PARM_DESC(fm_debug, "Set this parameter to enable fastmap debugging by default. Warning, this will make fastmap slow!");
> +module_param(force_scan, bool, 0644);
> +MODULE_PARM_DESC(force_scan, "Always do a full scan of the MTD and drop possible fastmap structures from the MTD.");

Should we do that on a per-UBI device basis? I mean, you might want to
force a full-scan but only on a specific UBI instance, not all of them,
right?

>  #endif
>  MODULE_VERSION(__stringify(UBI_VERSION));
>  MODULE_DESCRIPTION("UBI - Unsorted Block Images");
