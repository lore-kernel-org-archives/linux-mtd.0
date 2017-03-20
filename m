Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cpz7P-00085V-Do
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 15:21:13 +0000
Date: Mon, 20 Mar 2017 16:20:48 +0100
From: Rabin Vincent <rabin.vincent@axis.com>
To: dedekind1@gmail.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi: fastmap: fix slab corruption
Message-ID: <20170320152048.GA8958@axis.com>
References: <1490023026-6327-1-git-send-email-rabin.vincent@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490023026-6327-1-git-send-email-rabin.vincent@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 20, 2017 at 04:17:06PM +0100, Rabin Vincent wrote:
>  /**
>   * ubi_scan_fastmap - scan the fastmap.
>   * @ubi: UBI device object
> @@ -847,7 +865,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  	struct ubi_vid_hdr *vh;
>  	struct ubi_ec_hdr *ech;
>  	struct ubi_fastmap_layout *fm;
> -	struct ubi_ainf_peb *tmp_aeb, *aeb;
> +	struct ubi_ainf_peb *aeb;
>  	int i, used_blocks, pnum, fm_anchor, ret = 0;
>  	size_t fm_size;
>  	__be32 crc, tmp_crc;
> @@ -857,9 +875,18 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  	if (fm_anchor < 0)
>  		return UBI_NO_FASTMAP;
>  
> -	/* Move all (possible) fastmap blocks into our new attach structure. */
> -	list_for_each_entry_safe(aeb, tmp_aeb, &scan_ai->fastmap, u.list)
> -		list_move_tail(&aeb->u.list, &ai->fastmap);
> +	/* Copy all (possible) fastmap blocks into our new attach structure. */
> +	list_for_each_entry(aeb, &scan_ai->fastmap, u.list) {
> +		struct ubi_ainf_peb *new;
> +
> +		new = clone_aeb(ai, aeb);
> +		if (!new) {
> +			ret = -ENOMEM;
> +			goto out;

I just noticed that this should be just a return instead of a goto out
since we haven't locked the semaphore yet.  I'll send a v2 with that
fixed if you think that the rest of the patch look sane.
