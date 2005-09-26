Received: from bay17-f17.bay17.hotmail.com ([64.4.43.67] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJnwt-0002Rf-EU
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:03:20 -0400
Message-ID: <BAY17-F17EC8A97636E63E12669C5E88B0@phx.gbl>
In-Reply-To: <20050925110412.GB25279@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, dedekind@yandex.ru
Date: Mon, 26 Sep 2005 16:02:50 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Erase block header(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> > +struct jffs2_eraseblock_header
> > +{
> > +	jint16_t magic;
> > +	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
> > +	jint32_t totlen;
> > +	jint32_t hdr_crc;
> > +	uint8_t  fs_version; /* the version of this JFFS2 fs image */
>
>Version is completely useless.

I agree that version field is not used in my patch after compat_fset,
incompat_fset and rocompat_fset are introduced in my patch.
But I'm not sure if we should keep this field. 
Artem,
What's your opinion about this?

> > +	uint8_t  compat_fset;
> > +	uint8_t  incompat_fset;
> > +	uint8_t  rocompat_fset;
> > +	jint32_t erase_count; /* the erase count of this erase block */
> > +	jint16_t dsize; /* the size of additional data behind node_crc */
>
>Breaks alignment and pretty useless.  Information can be deduced from
>totlen.  Remove.
>
Sometimes we can't deduce the exact additional data size from totlen.
In particular this is true for NOR ECC. For example, sizeof(struct
 jffs2_eraseblock_header) is 34 bytes; totlen is 40 bytes, dsize is
0 byte.

Thanks,
Forrest
