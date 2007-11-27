Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IwxMX-0002gT-A4
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 10:08:23 +0000
Date: Tue, 27 Nov 2007 10:55:18 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
Message-ID: <20071127095518.GA29456@lazybastard.org>
References: <20071127073616.GA22556@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071127073616.GA22556@party>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 November 2007 16:36:16 +0900, Kyungmin Park wrote:
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index bf64686..70881bc 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -110,7 +110,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
>  #define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE))
>  #endif
>  
> -#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
> +#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH && !(c->mtd->flags & MTD_MULTI_LEVEL_CHIP))
>  
>  #define jffs2_flash_write_oob(c, ofs, len, retlen, buf) ((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
>  #define jffs2_flash_read_oob(c, ofs, len, retlen, buf) ((c)->mtd->read_oob((c)->mtd, ofs, len, retlen, buf))
> diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index f71dac4..80334d7 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -30,12 +30,14 @@ struct mtd_oob_buf {
>  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
>  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
>  #define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
> +#define MTD_MULTI_LEVEL_CHIP	0x4000	/* Multi Level Chip */
>  
>  // Some common devices / combinations of capabilities
>  #define MTD_CAP_ROM		0
>  #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
>  #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
> +#define MTD_CAP_MLC_NANDFLASH	(MTD_WRITEABLE | MTD_MULTI_LEVEL_CHIP)

NAK.  This does not describe the limitations of your chip, but a random
name.  In fact, the limitations appear to be identical to
(MTD_NORFLASH & !MTD_BIT_WRITEABLE).

Maybe something like ALLOW_SEPERATE_OOB_WRITE with reversed logic?

Jörn

-- 
It does not require a majority to prevail, but rather an irate,
tireless minority keen to set brush fires in people's minds.
-- Samuel Adams
