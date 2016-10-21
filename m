Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxdge-0007Sl-3s
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 17:32:59 +0000
Received: by mail-pf0-x22c.google.com with SMTP id s8so60148314pfj.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 10:31:57 -0700 (PDT)
Date: Fri, 21 Oct 2016 10:31:54 -0700
From: Michael Halcrow <mhalcrow@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, alexcope@google.com
Subject: Re: [PATCH 26/26] ubifs: Raise write version to 5
Message-ID: <20161021173154.GB17121@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-27-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-27-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:41PM +0200, Richard Weinberger wrote:
> Starting with version 5 the following properties change:
>  - UBIFS_FLG_DOUBLE_HASH is mandatory
>  - UBIFS_FLG_ENCRYPTION is optional but depdens on UBIFS_FLG_DOUBLE_HASH
>  - Filesystems with unknown super block flags will be rejected, this
>    allows us in future to add new features without raising the UBIFS
>    write version.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/sb.c          | 17 +++++++++++++++++
>  fs/ubifs/ubifs-media.h |  4 +++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
> index 54cef70ea16f..7f1ead29e727 100644
> --- a/fs/ubifs/sb.c
> +++ b/fs/ubifs/sb.c
> @@ -466,6 +466,16 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
>  		goto failed;
>  	}
>  
> +	if (!c->double_hash && c->fmt_version >= 5) {
> +		err = 16;
> +		goto failed;
> +	}
> +
> +	if (c->encrypted && c->fmt_version < 5) {
> +		err = 17;
> +		goto failed;
> +	}
> +
>  	return 0;
>  
>  failed:
> @@ -624,6 +634,13 @@ int ubifs_read_superblock(struct ubifs_info *c)
>  	c->double_hash = !!(sup_flags & UBIFS_FLG_DOUBLE_HASH);
>  	c->encrypted = !!(sup_flags & UBIFS_FLG_ENCRYPTION);
>  
> +	if ((sup_flags & ~UBIFS_FLG_MASK) != 0) {
> +		ubifs_err(c, "Unknown feature flags found: %#x",
> +			  sup_flags & ~UBIFS_FLG_MASK);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
>  #ifndef CONFIG_UBIFS_FS_ENCRYPTION
>  	if (c->encrypted) {
>  		ubifs_err(c, "file system contains encrypted files but UBIFS"
> diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
> index bdc7935a5e41..e8c23c9d4f4a 100644
> --- a/fs/ubifs/ubifs-media.h
> +++ b/fs/ubifs/ubifs-media.h
> @@ -46,7 +46,7 @@
>   * UBIFS went into mainline kernel with format version 4. The older formats
>   * were development formats.
>   */
> -#define UBIFS_FORMAT_VERSION 4
> +#define UBIFS_FORMAT_VERSION 5

Alex Cope is working on a fix for file name encryption in ext4 so that
common plaintext prefixes don't result in common ciphertext prefixes.
Older kernels will not be able to read the new file names.

>  
>  /*
>   * Read-only compatibility version. If the UBIFS format is changed, older UBIFS
> @@ -429,6 +429,8 @@ enum {
>  	UBIFS_FLG_ENCRYPTION = 0x10,
>  };
>  
> +#define UBIFS_FLG_MASK (UBIFS_FLG_BIGLPT|UBIFS_FLG_SPACE_FIXUP|UBIFS_FLG_DOUBLE_HASH|UBIFS_FLG_ENCRYPTION)
> +
>  /**
>   * struct ubifs_ch - common header node.
>   * @magic: UBIFS node magic number (%UBIFS_NODE_MAGIC)
> -- 
> 2.7.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
