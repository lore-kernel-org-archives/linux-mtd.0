Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MIdyk-0002pE-Te
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 07:30:17 +0000
Subject: Re: [PATCH] [UBI] Volume table update fix
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <6b5362aa0906190401l51bcf28bg44b9a7a9f49aa773@mail.gmail.com>
References: <6b5362aa0906190401l51bcf28bg44b9a7a9f49aa773@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 10:29:56 +0300
Message-Id: <1245655796.9487.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for the patch. Below are my minor/stylistic notes.

> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index 1afc61e..c776037 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -84,7 +84,7 @@ static struct ubi_vtbl_record empty_vtbl_record;
>  int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
>  			   struct ubi_vtbl_record *vtbl_rec)
>  {
> -	int i, err;
> +	int copy, err, err1;
>  	uint32_t crc;
>  	struct ubi_volume *layout_vol;
> 
> @@ -99,19 +99,41 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
>  	}
> 
>  	memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record));
> -	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
> -		err = ubi_eba_unmap_leb(ubi, layout_vol, i);
> +	for (copy = 0; copy < UBI_LAYOUT_VOLUME_EBS; copy++) {
> +		err = ubi_eba_unmap_leb(ubi, layout_vol, copy);
>  		if (err)
> -			return err;
> +			goto out_error;
> 
> -		err = ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
> +		err = ubi_eba_write_leb(ubi, layout_vol, copy, ubi->vtbl, 0,
>  					ubi->vtbl_size, UBI_LONGTERM);
>  		if (err)
> -			return err;
> +			goto out_error;
>  	}
> 
>  	paranoid_vtbl_check(ubi);
>  	return 0;
> +
> +out_error:
> +	/* If first copy was written,volume creation is successful.
> +	* But switch to read only mode as we have only one copy.
> +	* If first copy itself was not written, older version is in copy 2.
> +	* Unmap first copy and call wl_flush.
> +	* Volume creating is unsuccessful.
> +	*/

Please, clean-up the comment. Split lines nicer - you have 79 characters
per line, use the same starting '/*' as other UBI comments do. Just
glance at the other UBI comments. BTW, the commit message has somewhat
unclean line splitting as well.

> +	ubi_err("Error writing volume table copy #%d", copy+1);

UBI prints should not start with capital letters, because the printing
macros add prefixes. Take a look at other UBI prints.

> +	err1 = ubi_eba_unmap_leb(ubi, layout_vol, copy);
> +	if (!err1) {
> +		ubi_wl_flush(ubi);
> +		/* Don't bother about error in flush
> +		 * We are going read only any ways
> +		 */
Please. clean up this comment a little. You might as well just kill it. 

> +	}
> +	ubi_ro_mode(ubi);
> +	ubi_msg("Try detaching and attaching UBI again");

Please, remove this message. The kernel messages should not be used for
suggestions like this. They are not FAQ.

> +	if (copy > 0)
> +		return 0;
> +	else
> +		return err;
This is a tricky place, IMO, and deserves a comment. Could we have
something like:

/*
 * If the first volume table copy has been changed then overall the
 * operation has succeeded, because the change would be there if we now
 * re-attached the UBI device. Thus, return success in this case.
 */

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
