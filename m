Date: Sun, 28 Aug 2016 18:54:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 lede-dev@lists.infradead.org, Zoltan HERPAI <wigyori@uid0.hu>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 openwrt-devel@lists.openwrt.org
Subject: Re: [PATCH 3/3] init: auto-create ubiblock device for non-UBIFS
 rootfs on UBI
Message-ID: <20160828185415.20d3b34b@bbrezillon>
In-Reply-To: <20160827194437.GA17566@makrotopia.org>
References: <20160827194437.GA17566@makrotopia.org>
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

On Sat, 27 Aug 2016 21:44:46 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  init/do_mounts.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 7 deletions(-)
> 
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index dea5de9..485df12 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -28,6 +28,7 @@
>  #include <linux/slab.h>
>  #include <linux/ramfs.h>
>  #include <linux/shmem_fs.h>
> +#include <linux/mtd/ubi.h>

Really??? You include UBI stuff in generic kernel code? Come on. Linux
is defining clear interfaces to be implemented by drivers/FS for a good
reason: the core code should be implementation agnostic, and you're
just breaking this rule.

>  
>  #include <linux/nfs_fs.h>
>  #include <linux/nfs_fs_sb.h>
> @@ -179,6 +180,47 @@ done:
>  }
>  #endif
>  
> +#if defined(CONFIG_MTD_UBI_BLOCK) && !defined(CONFIG_MTD_UBI_MODULE)
> +#define UBIFS_NODE_MAGIC  0x06101831
> +static inline int ubi_vol_is_ubifs(struct ubi_volume_desc *desc)
> +{
> +	int ret;
> +	uint32_t magic_of, magic;
> +	ret = ubi_read(desc, 0, (char *)&magic_of, 0, 4);
> +	if (ret)
> +		return 0;
> +	magic = le32_to_cpu(magic_of);
> +	return magic == UBIFS_NODE_MAGIC;
> +}

This is even worst. Now your parsing data within a specific volume to
determine if the volume is likely to contain a UBIFS FS. And all that
is done in core kernel code.

> +
> +static void ubiblock_create_rootdev(char *name)
> +{
> +	int ret, is_ubifs;
> +	struct ubi_volume_desc *desc;
> +	struct ubi_volume_info vi;
> +	dev_t bdev;
> +
> +	desc = ubi_open_volume_str(name, UBI_READONLY);
> +	if (IS_ERR(desc))
> +		return;
> +
> +	ubi_get_volume_info(desc, &vi);
> +
> +	is_ubifs = ubi_vol_is_ubifs(desc);
> +	ubi_close_volume(desc);
> +
> +	if (is_ubifs)
> +		return;
> +
> +	ret = ubiblock_create_dev(&vi, &bdev);
> +	if (!ret) {
> +		pr_notice("ubiblock%u_%u: '%s' set to be root filesystem\n",
> +			  vi.ubi_num, vi.vol_id, vi.name);
> +		ROOT_DEV = bdev;
> +	}
> +}

And it continues here. Now you're automatically creating a ubiblock
device based on the UBIFS detection, and again, this is in core kernel
code.

> +#endif
> +
>  /*
>   *	Convert a name into device number.  We accept the following variants:
>   *
> @@ -569,14 +611,20 @@ void __init prepare_namespace(void)
>  
>  	if (saved_root_name[0]) {
>  		root_device_name = saved_root_name;
> -		if (!strncmp(root_device_name, "mtd", 3) ||
> -		    !strncmp(root_device_name, "ubi", 3)) {
> -			mount_block_root(root_device_name, root_mountflags);
> -			goto out;
> +#if defined(CONFIG_MTD_UBI_BLOCK) && !defined(CONFIG_MTD_UBI_MODULE)
> +		if (!strncmp(root_device_name, "ubi", 3))
> +			ubiblock_create_rootdev(root_device_name);
> +#endif
> +		if (ROOT_DEV == 0) {
> +			if (!strncmp(root_device_name, "mtd", 3) ||
> +			    !strncmp(root_device_name, "ubi", 3)) {
> +				mount_block_root(root_device_name, root_mountflags);
> +				goto out;
> +			}
> +			ROOT_DEV = name_to_dev_t(root_device_name);
> +			if (strncmp(root_device_name, "/dev/", 5) == 0)
> +				root_device_name += 5;
>  		}
> -		ROOT_DEV = name_to_dev_t(root_device_name);
> -		if (strncmp(root_device_name, "/dev/", 5) == 0)
> -			root_device_name += 5;

And the last piece: you're making use of all the hacks you've
introduced earlier to create your blockdevice and pass it to the 'mount
blockdev FS' logic.

I hope you understand why this patch is not acceptable.

>  	}
>  
>  	if (initrd_load())
