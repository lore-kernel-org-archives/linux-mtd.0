Date: Sun, 28 Aug 2016 18:42:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 lede-dev@lists.infradead.org, Zoltan HERPAI <wigyori@uid0.hu>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 openwrt-devel@lists.openwrt.org
Subject: Re: [PATCH 1/3] UBIFS, UBI: move volume string parser from UBIFS to
 UBI
Message-ID: <20160828184244.14a5f51f@bbrezillon>
In-Reply-To: <20160827194346.GA17551@makrotopia.org>
References: <20160827194346.GA17551@makrotopia.org>
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

On Sat, 27 Aug 2016 21:43:53 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

No explanation on why you do that. Please make reviewers life easier
and explain what you're trying to achieve.

This patch on its own is not a problem, as long as you have another FS
base on UBI (I'm not talking about ubiblock) that is making use of it
at some point.

But that's not the purpose of this series: you're not adding any FS,
you're just adding ugly hacks in do_mounts.c (patch 3). But I'll
comment directly in there.

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/mtd/ubi/kapi.c  | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/ubifs/super.c        | 64 +-----------------------------------------------
>  include/linux/mtd/ubi.h |  1 +
>  3 files changed, 67 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> index e844887..3dda9c3 100644
> --- a/drivers/mtd/ubi/kapi.c
> +++ b/drivers/mtd/ubi/kapi.c
> @@ -20,6 +20,7 @@
>  
>  /* This file mostly implements UBI kernel API functions */
>  
> +#include <linux/ctype.h>
>  #include <linux/module.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> @@ -329,6 +330,69 @@ struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
>  EXPORT_SYMBOL_GPL(ubi_open_volume_path);
>  
>  /**
> + * ubi_open_volume_str - parse UBI device name string and open the UBI device.
> + * @name: UBI volume name
> + * @mode: UBI volume open mode
> + *
> + * The primary method of mounting UBIFS is by specifying the UBI volume
> + * character device node path. However, UBIFS may also be mounted withoug any
> + * character device node using one of the following methods:
> + *
> + * o ubiX_Y    - mount UBI device number X, volume Y;
> + * o ubiY      - mount UBI device number 0, volume Y;
> + * o ubiX:NAME - mount UBI device X, volume with name NAME;
> + * o ubi:NAME  - mount UBI device 0, volume with name NAME.
> + *
> + * Alternative '!' separator may be used instead of ':' (because some shells
> + * like busybox may interpret ':' as an NFS host name separator). This function
> + * returns UBI volume description object in case of success and a negative
> + * error code in case of failure.
> + */
> +struct ubi_volume_desc *ubi_open_volume_str(const char *name, int mode)
> +{
> +	struct ubi_volume_desc *ubi;
> +	int dev, vol;
> +	char *endptr;
> +
> +	/* First, try to open using the device node path method */
> +	ubi = ubi_open_volume_path(name, mode);
> +	if (!IS_ERR(ubi))
> +		return ubi;
> +
> +	/* Try the "nodev" method */
> +	if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
> +		return ERR_PTR(-EINVAL);
> +
> +	/* ubi:NAME method */
> +	if ((name[3] == ':' || name[3] == '!') && name[4] != '\0')
> +		return ubi_open_volume_nm(0, name + 4, mode);
> +
> +	if (!isdigit(name[3]))
> +		return ERR_PTR(-EINVAL);
> +
> +	dev = simple_strtoul(name + 3, &endptr, 0);
> +
> +	/* ubiY method */
> +	if (*endptr == '\0')
> +		return ubi_open_volume(0, dev, mode);
> +
> +	/* ubiX_Y method */
> +	if (*endptr == '_' && isdigit(endptr[1])) {
> +		vol = simple_strtoul(endptr + 1, &endptr, 0);
> +		if (*endptr != '\0')
> +			return ERR_PTR(-EINVAL);
> +		return ubi_open_volume(dev, vol, mode);
> +	}
> +
> +	/* ubiX:NAME method */
> +	if ((*endptr == ':' || *endptr == '!') && endptr[1] != '\0')
> +		return ubi_open_volume_nm(dev, ++endptr, mode);
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +EXPORT_SYMBOL_GPL(ubi_open_volume_str);
> +
> +/**
>   * ubi_close_volume - close UBI volume.
>   * @desc: volume descriptor
>   */
> @@ -365,6 +429,7 @@ void ubi_close_volume(struct ubi_volume_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(ubi_close_volume);
>  
> +
>  /**
>   * leb_read_sanity_check - does sanity checks on read requests.
>   * @desc: volume descriptor
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 1fd90c0..a59fa2f 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1887,68 +1887,6 @@ const struct super_operations ubifs_super_operations = {
>  	.sync_fs       = ubifs_sync_fs,
>  };
>  
> -/**
> - * open_ubi - parse UBI device name string and open the UBI device.
> - * @name: UBI volume name
> - * @mode: UBI volume open mode
> - *
> - * The primary method of mounting UBIFS is by specifying the UBI volume
> - * character device node path. However, UBIFS may also be mounted withoug any
> - * character device node using one of the following methods:
> - *
> - * o ubiX_Y    - mount UBI device number X, volume Y;
> - * o ubiY      - mount UBI device number 0, volume Y;
> - * o ubiX:NAME - mount UBI device X, volume with name NAME;
> - * o ubi:NAME  - mount UBI device 0, volume with name NAME.
> - *
> - * Alternative '!' separator may be used instead of ':' (because some shells
> - * like busybox may interpret ':' as an NFS host name separator). This function
> - * returns UBI volume description object in case of success and a negative
> - * error code in case of failure.
> - */
> -static struct ubi_volume_desc *open_ubi(const char *name, int mode)
> -{
> -	struct ubi_volume_desc *ubi;
> -	int dev, vol;
> -	char *endptr;
> -
> -	/* First, try to open using the device node path method */
> -	ubi = ubi_open_volume_path(name, mode);
> -	if (!IS_ERR(ubi))
> -		return ubi;
> -
> -	/* Try the "nodev" method */
> -	if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
> -		return ERR_PTR(-EINVAL);
> -
> -	/* ubi:NAME method */
> -	if ((name[3] == ':' || name[3] == '!') && name[4] != '\0')
> -		return ubi_open_volume_nm(0, name + 4, mode);
> -
> -	if (!isdigit(name[3]))
> -		return ERR_PTR(-EINVAL);
> -
> -	dev = simple_strtoul(name + 3, &endptr, 0);
> -
> -	/* ubiY method */
> -	if (*endptr == '\0')
> -		return ubi_open_volume(0, dev, mode);
> -
> -	/* ubiX_Y method */
> -	if (*endptr == '_' && isdigit(endptr[1])) {
> -		vol = simple_strtoul(endptr + 1, &endptr, 0);
> -		if (*endptr != '\0')
> -			return ERR_PTR(-EINVAL);
> -		return ubi_open_volume(dev, vol, mode);
> -	}
> -
> -	/* ubiX:NAME method */
> -	if ((*endptr == ':' || *endptr == '!') && endptr[1] != '\0')
> -		return ubi_open_volume_nm(dev, ++endptr, mode);
> -
> -	return ERR_PTR(-EINVAL);
> -}
> -
>  static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
>  {
>  	struct ubifs_info *c;
> @@ -2105,7 +2043,7 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
>  	 * because this might be a new mount point, and UBI allows only one
>  	 * read-write user at a time.
>  	 */
> -	ubi = open_ubi(name, UBI_READONLY);
> +	ubi = ubi_open_volume_str(name, UBI_READONLY);
>  	if (IS_ERR(ubi)) {
>  		pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
>  		       current->pid, name, (int)PTR_ERR(ubi));
> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
> index 1e271cb..0b92aa5 100644
> --- a/include/linux/mtd/ubi.h
> +++ b/include/linux/mtd/ubi.h
> @@ -241,6 +241,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode);
>  struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
>  					   int mode);
>  struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode);
> +struct ubi_volume_desc *ubi_open_volume_str(const char *pathname, int mode);
>  
>  int ubi_register_volume_notifier(struct notifier_block *nb,
>  				 int ignore_existing);
