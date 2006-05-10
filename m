Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdnlq-0006oV-74
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 08:26:33 -0400
Date: Wed, 10 May 2006 14:26:26 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
Message-ID: <20060510122626.GB31935@wohnheim.fh-wedel.de>
References: <20060502214507.C56443DC@arbetsmyra.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060502214507.C56443DC@arbetsmyra.dyndns.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch for passing JFFS2 options at mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2 May 2006 23:44:19 +0200, Ronny L Nilsson wrote:
> 
> Attached is a patch for passing mount options to JFFS2. I was in the 
> need for controlling the compression mode for JFFS2 filesystems on a 
> per mount basis but found that up till now a recompile of the kernel 
> was the only way to change the active mode in use (?). With this patch 
> different filesystems can use different compressor modes, configurable 
> at mount time. They can change mode on the fly via a remount too.
> 
> For example:
> mount -t jffs2 mtd1 /flash -o compressor=none
> mount -t jffs2 mtd1 /flash -o compressor=priority

Sounds good.  People always wanted to control compression on an
inode-basis, but nothing ever showed up.

> diff -rup linux-2.6.15/fs/jffs2/compr.c linux-2.6.15-jffs2-mountoptions/fs/jffs2/compr.c
> --- linux-2.6.15/fs/jffs2/compr.c	2006-01-04 07:12:40.000000000 +0100
> +++ linux-2.6.15-jffs2-mountoptions/fs/jffs2/compr.c	2006-05-01 16:52:51.000000000 +0200
> @@ -9,7 +9,7 @@
>   *
>   * For licensing information, see the file 'LICENCE' in this directory.
>   *
> - * $Id: compr.c,v 1.46 2005/11/07 11:14:38 gleixner Exp $
> + * $Id: compr.c,v 1.1.2.1 2006/05/01 14:52:51 rln Exp $
>   *
>   */
>  

You should remove this hunk from the patch.  Otherwise it just won't
apply for most people.

> @@ -268,7 +265,6 @@ int jffs2_unregister_compressor(struct j
>          return 0;
>  }
>  
> -#ifdef CONFIG_JFFS2_PROC
>  
>  #define JFFS2_STAT_BUF_SIZE 16000
>  

This makes sense, but should go in a seperate patch.

> @@ -330,18 +326,37 @@ char *jffs2_get_compression_mode_name(vo
>          return "unkown";
>  }
>  
> -int jffs2_set_compression_mode_name(const char *name)
> +
> +int jffs2_get_dflt_compression_mode(void)
> +{
> +/* Setting default compression mode */
> +#ifdef CONFIG_JFFS2_CMODE_NONE
> +        D1(printk(KERN_INFO "JFFS2: default compression mode: none\n");)
> +        return JFFS2_COMPR_MODE_NONE;
> +#else
> +#ifdef CONFIG_JFFS2_CMODE_SIZE

#elif

> +        D1(printk(KERN_INFO "JFFS2: default compression mode: size\n");)
> +        return JFFS2_COMPR_MODE_SIZE;
> +#else
> +        D1(printk(KERN_INFO "JFFS2: default compression mode: priority\n");)
> +	return JFFS2_COMPR_MODE_PRIORITY;
> +#endif
> +#endif
> +}

[...]

> +static int parse_options(struct jffs2_sb_info *c, char *data) {
> +	substring_t args[MAX_OPT_ARGS];
> +	int needCompr = (c->compression_mode == JFFS2_COMPR_MODE_UNKNOWN);	/* Set default only once. */
> +	int token;
> +	char *p, *arg;
> +
> +	while (data && strlen(data) && (p = strsep(&data, ","))) {
> +		if (!*p) continue;

		if (!*p)
			continue;

> +
> +		token = match_token(p, tokens, args);
> +		switch (token) {
> +			case OPT_COMPRESSOR:
> +				arg = match_strdup(&args[0]);
		case OPT_COMPRESSOR:
			arg = match_strdup(&args[0]);
			...
> +				needCompr = jffs2_set_compression_mode_name(c, arg);
> +				kfree(arg);
> +				break;
> +
> +			default:
> +				break;
> +		}
> +	}
> +
> +	/* Was a valid compressor set by user? 
> +	 * Otherwise set default. */
> +	if(needCompr) c->compression_mode = jffs2_get_dflt_compression_mode();
	if (needCompr)
		c->compression_mode = jffs2_get_dflt_compression_mode();

> @@ -491,6 +537,10 @@ int jffs2_do_fill_super(struct super_blo
>  	}
>  	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
>  
> +	/* Parse mount options */
> +	c->compression_mode = JFFS2_COMPR_MODE_UNKNOWN;
> +	parse_options(c, data);
> +
>  	if ((ret = jffs2_do_mount_fs(c)))
>  		goto out_inohash;

Why do you need JFFS2_COMPR_MODE_UNKNOWN?  Wouldn't it make more sense
to do exactly the same thing as now - have a compile time default -
and merely allow users to add a mount option to change the default?

> @@ -14,8 +14,8 @@
>  #include <linux/rwsem.h>
>  
>  #define JFFS2_SB_FLAG_RO 1
> -#define JFFS2_SB_FLAG_SCANNING 2 /* Flash scanning is in progress */
> -#define JFFS2_SB_FLAG_BUILDING 4 /* File system building is in progress */
> +#define JFFS2_SB_FLAG_SCANNING 2    /* Flash scanning is in progress */
> +#define JFFS2_SB_FLAG_BUILDING 4    /* File system building is in progress */
>  
>  struct jffs2_inodirty;

Seperate cleanup patch


Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
