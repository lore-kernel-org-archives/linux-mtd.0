Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONjDT-0001Aj-LE
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 09:10:56 +0000
Subject: Re: [PATCH] mtd: Added an ioctl to query the lock status of a
	flash sector.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20100531131214.GA15887@riccoc20.at.omicron.at>
References: <20100531131214.GA15887@riccoc20.at.omicron.at>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:05:03 +0300
Message-ID: <1276419903.19028.180.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-31 at 15:12 +0200, Richard Cochran wrote:
> This patchs adds a way for user space programs to find out whether a
> flash sector is locked. An optional driver method in the mtd_info struct
> provides the information.
> 
> Signed-off-by: Richard Cochran <richard.cochran@omicron.at>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |    8 ++++++++
>  drivers/mtd/mtdchar.c               |   14 ++++++++++++++
>  drivers/mtd/mtdpart.c               |   10 ++++++++++
>  include/linux/mtd/mtd.h             |    1 +
>  include/mtd/mtd-abi.h               |    1 +
>  5 files changed, 34 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 5fbf29e..67caca7 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -63,6 +63,7 @@ static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
>  static void cfi_intelext_sync (struct mtd_info *);
>  static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
> +static int cfi_intelext_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  #ifdef CONFIG_MTD_OTP
>  static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
>  static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
> @@ -448,6 +449,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
>  	mtd->sync    = cfi_intelext_sync;
>  	mtd->lock    = cfi_intelext_lock;
>  	mtd->unlock  = cfi_intelext_unlock;
> +	mtd->locked  = cfi_intelext_locked;
>  	mtd->suspend = cfi_intelext_suspend;
>  	mtd->resume  = cfi_intelext_resume;
>  	mtd->flags   = MTD_CAP_NORFLASH;

I think it is tiny bit nicer to name 'is_locked', which is a bit more
consistent with the already existing 'block_isbad'?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
