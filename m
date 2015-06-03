Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z03KI-0006my-WE
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 07:43:04 +0000
Message-ID: <556EAFE9.9080003@nod.at>
Date: Wed, 03 Jun 2015 09:42:33 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>
Subject: Re: [PATCH] UBI: Remove unnecessary `\'
References: <556D7EF1.6010305@nod.at>
 <29f5431ae885a8345034e519e8fc43fd8f67b48f.1433295361.git.shengyong1@huawei.com>
In-Reply-To: <29f5431ae885a8345034e519e8fc43fd8f67b48f.1433295361.git.shengyong1@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.06.2015 um 03:37 schrieb Sheng Yong:
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>  drivers/mtd/ubi/fastmap.c | 2 +-
>  drivers/mtd/ubi/wl.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 9eee904..4aa2fd8 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -316,7 +316,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  			list_add_tail(&victim->u.list, &ai->erase);
>  
>  			if (av->highest_lnum == be32_to_cpu(new_vh->lnum))
> -				av->last_data_size = \
> +				av->last_data_size =
>  					be32_to_cpu(new_vh->data_size);
>  
>  			dbg_bld("vol %i: AEB %i's PEB %i is the newer",
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 16214d3..275d9fb 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1581,7 +1581,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  	dbg_wl("found %i PEBs", found_pebs);
>  
>  	if (ubi->fm) {
> -		ubi_assert(ubi->good_peb_count == \
> +		ubi_assert(ubi->good_peb_count ==
>  			   found_pebs + ubi->fm->used_blocks);
>  
>  		for (i = 0; i < ubi->fm->used_blocks; i++) {

Applied.

Thanks,
//richard
