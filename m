Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF7gl-0006qU-IX
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 22:29:04 +0000
Subject: Re: [PATCH] ubi: Make recover_peb power cut aware
To: linux-mtd@lists.infradead.org
References: <1466461539-18389-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, pfaehler@isse.de, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <57686E12.80102@nod.at>
Date: Tue, 21 Jun 2016 00:28:34 +0200
MIME-Version: 1.0
In-Reply-To: <1466461539-18389-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.06.2016 um 00:25 schrieb Richard Weinberger:
> recover_peb() was never power cut aware,
> if a power cut happened right after writing the VID header
> upon next attach UBI would blindly use the new partial written
> PEB and all data from the old PEB is lost.
> 
> In order to make recover_peb() power cut aware, write the new
> VID with a proper crc and copy_flag set such that the UBI attach
> process will detect whether the new PEB is completely written
> or not.
> We cannot directly use ubi_eba_atomic_leb_change() since we'd
> have to unlock the LEB which is facing a write error.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Jörg Pfähler <pfaehler@isse.de>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/eba.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 5780dd1..b6b0714 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -575,6 +575,7 @@ static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
>  	int err, idx = vol_id2idx(ubi, vol_id), new_pnum, data_size, tries = 0;
>  	struct ubi_volume *vol = ubi->volumes[idx];
>  	struct ubi_vid_hdr *vid_hdr;
> +	uint32_t crc;
>  
>  	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
>  	if (!vid_hdr)
> @@ -599,14 +600,8 @@ retry:
>  		goto out_put;
>  	}
>  
> -	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
> -	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
> -	if (err) {
> -		up_read(&ubi->fm_eba_sem);
> -		goto write_error;
> -	}
> +	ubi_assert(vid_hdr->vol_type == UBI_VID_DYNAMIC);
>  
> -	data_size = offset + len;
>  	mutex_lock(&ubi->buf_mutex);
>  	memset(ubi->peb_buf + offset, 0xFF, len);
>  
> @@ -621,6 +616,18 @@ retry:
>  
>  	memcpy(ubi->peb_buf + offset, buf, len);
>  
> +	data_size = offset + len;
> +	crc = crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size);
> +	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
> +	vid_hdr->copy_flag = 1;
> +	vid_hdr->data_size = cpu_to_be32(data_size);
> +	vid_hdr->data_crc = cpu_to_be32(crc);
> +	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
> +	if (err) {
> +		up_read(&ubi->fm_eba_sem);
> +		goto out_unlock;

As always, right after sending a patch I spot an issue... ;-\
We need to goto write_error here (and release buf_mutex first).

Thanks,
//richard
