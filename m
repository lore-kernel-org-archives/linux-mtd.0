Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJUIn-0004KH-FM
	for linux-mtd@lists.infradead.org; Sun, 25 Sep 2005 07:04:15 -0400
Date: Sun, 25 Sep 2005 13:04:12 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050925110412.GB25279@wohnheim.fh-wedel.de>
References: <BAY17-F141EA92F45DB70328CE1C5E8960@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F141EA92F45DB70328CE1C5E8960@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Erase block header(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 September 2005 14:53:09 +0800, zhao forrest wrote:
> 
> This is the revised version of eraseblock header patch.
> Compared with previous version, the following changes are
> made:
> 1 eliminate the too long lines, and make them shorter
> 2 change eraseblock_heaer_size to ebh_size; has_eraseblock
> _header to has_ebh to avoid long variable name
> 3 change jffs2_write_nand_cleanmarker() to jffs2_write_nand_ebh()
> to avoid confusion
> 4 change jffs2_check_nand_cleanmarker() to
> jffs2_check_nand_cleanmarker_ebh() to avoid confusion

I ignored all the code and took a look at the new node type only.

> +struct jffs2_eraseblock_header
> +{
> +	jint16_t magic;
> +	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
> +	jint32_t totlen;
> +	jint32_t hdr_crc;
> +	uint8_t  fs_version; /* the version of this JFFS2 fs image */

Version is completely useless.

> +	uint8_t  compat_fset;
> +	uint8_t  incompat_fset;
> +	uint8_t  rocompat_fset;
> +	jint32_t erase_count; /* the erase count of this erase block */
> +	jint16_t dsize; /* the size of additional data behind node_crc */

Breaks alignment and pretty useless.  Information can be deduced from
totlen.  Remove.

> +	jint32_t node_crc;
> +	jint32_t data_crc;

Combine and move up, just below hdr_crc.

> +	jint32_t data[0];
> +} __attribute__((packed));
> +
>  struct jffs2_raw_dirent
>  {
>  	jint16_t magic;
 


Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
