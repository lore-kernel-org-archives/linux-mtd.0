Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMMn2-0000Zo-1H
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:56:56 +0000
Subject: Re: [PATCH v2 12/35] ubi: introduce a interface to get cdev in
 ubi_volume
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-13-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFD585.6000402@nod.at>
Date: Mon, 3 Aug 2015 22:56:37 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-13-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> We want to fill the sb->s_cdev in ubifs_fill_super(),
> so, we need to add a interface in ubi to get the cdev
> of an ubi_volume.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  drivers/mtd/ubi/kapi.c  | 6 ++++++
>  include/linux/mtd/ubi.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> index e844887..d3d1982 100644
> --- a/drivers/mtd/ubi/kapi.c
> +++ b/drivers/mtd/ubi/kapi.c
> @@ -862,3 +862,9 @@ int ubi_unregister_volume_notifier(struct notifier_block *nb)
>  	return blocking_notifier_chain_unregister(&ubi_notifiers, nb);
>  }
>  EXPORT_SYMBOL_GPL(ubi_unregister_volume_notifier);
> +
> +inline struct cdev *ubi_get_volume_cdev(struct ubi_volume_desc *desc)
> +{
> +	return &(desc->vol->cdev);
> +}
> +EXPORT_SYMBOL_GPL(ubi_get_volume_cdev);
> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
> index 1e271cb..301c6e9 100644
> --- a/include/linux/mtd/ubi.h
> +++ b/include/linux/mtd/ubi.h
> @@ -261,6 +261,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnum);
>  int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum);
>  int ubi_sync(int ubi_num);
>  int ubi_flush(int ubi_num, int vol_id, int lnum);
> +struct cdev *ubi_get_volume_cdev(struct ubi_volume_desc *desc);
>  
>  /*
>   * This function is the same as the 'ubi_leb_read()' function, but it does not
> 

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
