Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDYjH-000616-O3
 for linux-mtd@lists.infradead.org; Sat, 11 Nov 2017 16:34:01 +0000
Date: Sat, 11 Nov 2017 17:33:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org, "Mario J . Rugiero" <mrugiero@gmail.com>
Subject: Re: [PATCH v2] mtd: Avoid probe failures when mtd->dbg.dfs_dir is
 invalid
Message-ID: <20171111173334.4acc420e@bbrezillon>
In-Reply-To: <20171111150834.9416-1-boris.brezillon@free-electrons.com>
References: <20171111150834.9416-1-boris.brezillon@free-electrons.com>
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

On Sat, 11 Nov 2017 16:08:34 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Commit e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs
> entries") tried to make MTD related debugfs stuff consistent across the
> MTD framework by creating a root <debugfs>/mtd/ directory containing
> one directory per MTD device.
> 
> The problem is that, by default, the MTD layer only registers the
> master device if no partitions are defined for this master. This
> behavior breaks all drivers that expect mtd->dbg.dfs_dir to be filled
> correctly after calling mtd_device_register() in order to add their own
> debugfs entries.
> 
> The only way we can force all MTD masters to be registered no matter if
> they expose partitions or not is by enabling the
> CONFIG_MTD_PARTITIONED_MASTER option.
> 
> In such situations, there's no other solution but to accept skipping
> debugfs initialization when dbg.dfs_dir is invalid, and when this
> happens, inform the user that he should consider enabling
> CONFIG_MTD_PARTITIONED_MASTER.
> 
> Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
> Cc: <stable@vger.kernel.org>
> Cc: Mario J. Rugiero <mrugiero@gmail.com>

Forgot to add:

Reported-by: Richard Weinberger <richard@nod.at>

Also forgot to mention that this patch is supposed to replace patches
"mtd: Make sure MTD objects always have a valid debugfs dir" and
"mtd: mtdpart: Create a symlink to the master debugfs dir". Indeed,
after discussing it with Brian, I realized those patches were going
in the wrong direction: we should encourage people to move to
MTD_PARTITIONED_MASTER instead of constantly fixing this kind of bugs
(one other example in mind I have is that mtd->dev is not suitable for
any devm_xxx() methods because the underlying may or may not be
registered).

Regards,

Boris

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/devices/docg3.c |  7 ++++++-
>  drivers/mtd/nand/nandsim.c  | 13 +++++++++----
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 84b16133554b..0806f72102c0 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1814,8 +1814,13 @@ static void __init doc_dbg_register(struct mtd_info *floor)
>  	struct dentry *root = floor->dbg.dfs_dir;
>  	struct docg3 *docg3 = floor->priv;
>  
> -	if (IS_ERR_OR_NULL(root))
> +	if (IS_ERR_OR_NULL(root)) {
> +		if (IS_ENABLED(CONFIG_DEBUG_FS) &&
> +		    !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +			dev_warn(floor->dev.parent,
> +				 "CONFIG_MTD_PARTITIONED_MASTER must be enabled to expose debugfs stuff\n");
>  		return;
> +	}
>  
>  	debugfs_create_file("docg3_flashcontrol", S_IRUSR, root, docg3,
>  			    &flashcontrol_fops);
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 246b4393118e..44322a363ba5 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -520,11 +520,16 @@ static int nandsim_debugfs_create(struct nandsim *dev)
>  	struct dentry *root = nsmtd->dbg.dfs_dir;
>  	struct dentry *dent;
>  
> -	if (!IS_ENABLED(CONFIG_DEBUG_FS))
> +	/*
> +	 * Just skip debugfs initialization when the debugfs directory is
> +	 * missing.
> +	 */
> +	if (IS_ERR_OR_NULL(root)) {
> +		if (IS_ENABLED(CONFIG_DEBUG_FS) &&
> +		    !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +			NS_WARN("CONFIG_MTD_PARTITIONED_MASTER must be enabled to expose debugfs stuff\n");
>  		return 0;
> -
> -	if (IS_ERR_OR_NULL(root))
> -		return -1;
> +	}
>  
>  	dent = debugfs_create_file("nandsim_wear_report", S_IRUSR,
>  				   root, dev, &dfs_fops);
