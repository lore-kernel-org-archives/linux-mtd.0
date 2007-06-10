Received: from moutng.kundenserver.de ([212.227.126.187])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxQHp-0001oN-RQ
	for linux-mtd@lists.infradead.org; Sun, 10 Jun 2007 12:29:08 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [Patch 15/18] fs/logfs/super.c
Date: Sun, 10 Jun 2007 18:27:49 +0200
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184927.GP8952@lazybastard.org>
In-Reply-To: <20070603184927.GP8952@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200706101827.50948.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 03 June 2007, J=C3=B6rn Engel wrote:
> +static int mtdread(struct super_block *sb, loff_t ofs, size_t len, void =
*buf)
> +{
> +	struct mtd_info *mtd =3D logfs_super(sb)->s_mtd;
> +	size_t retlen;
> +	int ret;
> +
> +	ret =3D mtd->read(mtd, ofs, len, &retlen, buf);
> +	BUG_ON(ret =3D=3D -EINVAL);
> +	if (ret)
> +		return ret;
> +
> +	/* Not sure if we should loop instead. */
> +	if (retlen !=3D len)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int mtdwrite(struct super_block *sb, loff_t ofs, size_t len, void=
 *buf)
> +{
> +	struct logfs_super *super =3D logfs_super(sb);
> +	struct mtd_info *mtd =3D super->s_mtd;
> +	struct inode *inode =3D super->s_dev_inode;
> +	size_t retlen;
> +	loff_t page_start, page_end;
> +	int ret;
> +
> +	if (super->s_flags & LOGFS_SB_FLAG_RO)
> +		return -EROFS;
> +
> +	BUG_ON((ofs >=3D mtd->size) || (len > mtd->size - ofs));
> +	BUG_ON(ofs !=3D (ofs >> super->s_writeshift) << super->s_writeshift);
> +	BUG_ON(len > PAGE_CACHE_SIZE);
> +	page_start =3D ofs & PAGE_CACHE_MASK;
> +	page_end =3D PAGE_CACHE_ALIGN(ofs + len) - 1;
> +	truncate_inode_pages_range(&inode->i_data, page_start, page_end);
> +	ret =3D mtd->write(mtd, ofs, len, &retlen, buf);
> +	if (ret || (retlen !=3D len))
> +		return -EIO;
> +
> +	return 0;
> +}

It seems that these functions are completely synchronous and afaics, the
writes are called in the pdflush context, effectively blocking out operatio=
ns
on other file systems at the time. Not sure if this is something that
should be fixed, but it seems to limit scalability on mtd backends.

It seems that jffs2 has the same behaviour.

> +static int bdwrite(struct super_block *sb, loff_t to, size_t len, void *=
buf)
> +{
> +	struct block_device *bdev =3D logfs_super(sb)->s_bdev;
> +	struct address_space *mapping =3D bdev->bd_inode->i_mapping;
> +	struct page *page;
> +	long index =3D to >> PAGE_SHIFT;
> +	long offset =3D to & (PAGE_SIZE-1);
> +	long copylen;
> +
> +	while (len) {
> +		copylen =3D min((ulong)len, PAGE_SIZE - offset);
> +
> +		page =3D read_cache_page(mapping, index,
> +				(filler_t*)mapping->a_ops->readpage, NULL);
> +		if (!page)
> +			return -ENOMEM;
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +		lock_page(page);
> +		memcpy(page_address(page) + offset, buf, copylen);
> +		set_page_dirty(page);
> +		unlock_page(page);
> +		page_cache_release(page);
> +
> +		buf +=3D copylen;
> +		len -=3D copylen;
> +		offset =3D 0;
> +		index++;
> +	}
> +	return 0;
> +}

How about using submit_bio here instead of going to the page cache?
That would avoid doubling all the memory consumption here.

> +/*
> + * logfs_crash_dump - dump debug information to device
> + *
> + * The LogFS superblock only occupies part of a segment.  This function =
will
> + * write as much debug information as it can gather into the spare space.
> + */
> +void logfs_crash_dump(struct super_block *sb)
> +{
> +	struct logfs_super *super =3D logfs_super(sb);
> +	int i, blockno =3D 2, bs =3D sb->s_blocksize;
> +	void *scratch =3D super->s_wblock[0];
> +	void *stack =3D (void *) ((ulong)current & ~0x1fffUL);
> +
> +	/* all wbufs */
> +	for (i=3D0; i<LOGFS_NO_AREAS; i++) {
> +		void *wbuf =3D super->s_area[i]->a_wbuf;
> +		u64 ofs =3D sb->s_blocksize + i*super->s_writesize;
> +		mtdwrite(sb, ofs, super->s_writesize, wbuf);
> +	}

shouldn't this use the ->write() function instead of hardcoding mtdwrite.

> +module_init(logfs_init);
> +module_exit(logfs_exit);

You are missing at least a MODULE_LICENSE and should probably
add the MODULE_AUTHOR and MODULE_DESCRIPTION tags as well.
Right now, it's impossible to even load the module, because
it uses a few GPL-only symbols.

	Arnd <><
