Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoD0-00032L-Nt
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:20:04 -0400
Date: Mon, 26 Sep 2005 10:19:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050926081922.GA17756@wohnheim.fh-wedel.de>
References: <20050925110412.GB25279@wohnheim.fh-wedel.de>
	<BAY17-F17EC8A97636E63E12669C5E88B0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F17EC8A97636E63E12669C5E88B0@phx.gbl>
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

On Mon, 26 September 2005 16:02:50 +0800, zhao forrest wrote:
> 
> >> +struct jffs2_eraseblock_header
> >> +{
> >> +	jint16_t magic;
> >> +	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
> >> +	jint32_t totlen;
> >> +	jint32_t hdr_crc;
> >> +	uint8_t  fs_version; /* the version of this JFFS2 fs image */
> >
> >Version is completely useless.
> 
> I agree that version field is not used in my patch after compat_fset,
> incompat_fset and rocompat_fset are introduced in my patch.
> But I'm not sure if we should keep this field. 
> Artem,
> What's your opinion about this?

Just give it a useful name like "reserved" or "unused".  We still need
the alignment.

> >> +	uint8_t  compat_fset;
> >> +	uint8_t  incompat_fset;
> >> +	uint8_t  rocompat_fset;

What does "fset" mean?  Why not just "flags_compat" etc.?

> >> +	jint32_t erase_count; /* the erase count of this erase block */
> >> +	jint16_t dsize; /* the size of additional data behind node_crc */
> >
> >Breaks alignment and pretty useless.  Information can be deduced from
> >totlen.  Remove.
> >
> Sometimes we can't deduce the exact additional data size from totlen.
> In particular this is true for NOR ECC. For example, sizeof(struct
> jffs2_eraseblock_header) is 34 bytes; totlen is 40 bytes, dsize is
> 0 byte.

Even then it doesn't matter.  We just copy all fields and ignore the
ones we don't know about.  What we know about is defined in the three
flags fields.

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
