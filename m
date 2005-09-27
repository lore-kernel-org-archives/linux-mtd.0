Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKEJp-0002dT-UA
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 08:12:25 -0400
Date: Tue, 27 Sep 2005 14:12:26 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050927121226.GB20702@wohnheim.fh-wedel.de>
References: <BAY17-F186337C136F8081E8E2828E88A0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F186337C136F8081E8E2828E88A0@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 September 2005 15:51:42 +0800, zhao forrest wrote:
> 
> This is the revision 3 of erase block header patch.
> Compare with revision 2, the main changes are:
> 1 to keep consistency, rename struct jffs2_eraseblock_header
> to struct jffs2_raw_ebh
> 2 change the type of has_ebh to uint32_t
> 3 store the real length into totlen
> 4 rename fs_version into reserved in order to give it a
> useful name.


> diff -auNrp ./mtd/fs/jffs2/erase.c ./mtd_EBH_EBS/fs/jffs2/erase.c
> --- ./mtd/fs/jffs2/erase.c	2005-09-22 11:08:47.000000000 +0800
> +++ ./mtd_EBH_EBS/fs/jffs2/erase.c	2005-09-27 15:30:26.000000000 +0800
> @@ -210,6 +210,10 @@ static void jffs2_erase_callback(struct 
>  	} else {
>  		jffs2_erase_succeeded(priv->c, priv->jeb);
>  	}	
> +
> +	if (!priv->jeb->has_ebh) {
> +		priv->jeb->has_ebh = 1;
> +	}

The complete condition is bullock.  See last review.

>  	kfree(instr);
>  }
>  #endif /* !__ECOS */

[...]

> +struct jffs2_raw_ebh
> +{
> +	jint16_t magic;
> +	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
> +	jint32_t totlen;
> +	jint32_t hdr_crc;
> +	uint8_t  reserved; /* reserved for future use and alignment */
> +	uint8_t  compat_fset;
> +	uint8_t  incompat_fset;
> +	uint8_t  rocompat_fset;
> +	jint32_t erase_count; /* the erase count of this erase block */
> +	jint16_t dsize; /* the size of additional data behind node_crc */
> +	jint32_t node_crc;
> +	jint32_t data_crc;
> +	jint32_t data[0];
> +} __attribute__((packed));

Structure still doesn't make sense.  See my last review.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
