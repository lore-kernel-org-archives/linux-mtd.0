Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGBWV-0006Ab-0l
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 20:46:52 +0000
Date: Thu, 23 Jun 2016 22:46:28 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] ubi: Make volume resize power cut aware
Message-ID: <20160623224628.0495c565@bbrezillon>
In-Reply-To: <1466703038-13044-1-git-send-email-richard@nod.at>
References: <1466703038-13044-1-git-send-email-richard@nod.at>
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

On Thu, 23 Jun 2016 19:30:38 +0200
Richard Weinberger <richard@nod.at> wrote:

> When the volume resize operation shrinks a volume,
> LEBs will be unmapped. Since unmapping will not erase these
> LEBs immediately we have to wait for that operation to finish.
> Otherwise in case of a power cut right after writing the new
> volume table the UBI attach process can find more LEBs than the
> volume table knows. This will render the UBI image unattachable.
> 
> Fix this issue by waiting for erase to complete and write the new volume table afterward.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

I hope this change won't uncover another bug in case some of the
UBI logic rely on the 'write vtbl record, then unmap unused LEBs'
sequence. But AFAICT it seems safe.

You should probably wait for other reviews before taking the patch
though.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/vmt.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 10059df..0138f52 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -488,13 +488,6 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
>  		spin_unlock(&ubi->volumes_lock);
>  	}
>  
> -	/* Change volume table record */
> -	vtbl_rec = ubi->vtbl[vol_id];
> -	vtbl_rec.reserved_pebs = cpu_to_be32(reserved_pebs);
> -	err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
> -	if (err)
> -		goto out_acc;
> -
>  	if (pebs < 0) {
>  		for (i = 0; i < -pebs; i++) {
>  			err = ubi_eba_unmap_leb(ubi, vol, reserved_pebs + i);
> @@ -512,6 +505,24 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
>  		spin_unlock(&ubi->volumes_lock);
>  	}
>  
> +	/*
> +	 * When we shrink a volume we have to flush all pending (erase) work.
> +	 * Otherwise it can happen that upon next attach UBI finds a LEB with
> +	 * lnum > highest_lnum and refuses to attach.
> +	 */
> +	if (pebs < 0) {
> +		err = ubi_wl_flush(ubi, vol_id, UBI_ALL);
> +		if (err)
> +			goto out_acc;
> +	}
> +
> +	/* Change volume table record */
> +	vtbl_rec = ubi->vtbl[vol_id];
> +	vtbl_rec.reserved_pebs = cpu_to_be32(reserved_pebs);
> +	err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
> +	if (err)
> +		goto out_acc;
> +
>  	vol->reserved_pebs = reserved_pebs;
>  	if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
>  		vol->used_ebs = reserved_pebs;
