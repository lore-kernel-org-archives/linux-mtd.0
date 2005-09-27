Received: from bay17-f6.bay17.hotmail.com ([64.4.43.56] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EK9if-0007Hp-9n
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 03:17:51 -0400
Message-ID: <BAY17-F6CC7B5950D57B60A67C44E88A0@phx.gbl>
In-Reply-To: <4337D5E4.6040706@yandex.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Tue, 27 Sep 2005 15:17:39 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
>Also did not review carefully, just nodes.
>
>
>  			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
>-			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
>-			.totlen =	cpu_to_je32(c->cleanmarker_size)
>+			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
>+			.totlen =	cpu_to_je32(PAD(c->ebh_size)),
>---------------------------------------------------
>As we discussed, we should store real EBH node size it .totlen, not 
>the EBH size + paddings to the end of page, etc. Please, store the 
>EBH size on flash in c->ebg_size, no problems, but let 'totlen' have 
>the same semantica as all other nodes.
>
OK.

>
>
>  		marker_ref->next_in_ino = NULL;
>  		marker_ref->next_phys = NULL;
>  		marker_ref->flash_offset = jeb->offset | REF_NORMAL;
>-		marker_ref->__totlen = c->cleanmarker_size;
>+		marker_ref->__totlen = PAD(c->ebh_size);
>---------------------------------------------------
>Why do you use PAD() here? What for?
>
I'll not eliminate this PAD(), you may grep "__totlen" to find the
reason.
 
>
>  		jeb->first_node = jeb->last_node = marker_ref;
>
>-		jeb->free_size = c->sector_size - c->cleanmarker_size;
>-		jeb->used_size = c->cleanmarker_size;
>+		jeb->free_size = c->sector_size - PAD(c->ebh_size);
>+		jeb->used_size = PAD(c->ebh_size);
>---------------------------------------------------
>And here
>
Also I'll not eliminate this PAD(). The reason is the same as the
above.

>
>
>  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage 
>collected */
>+
>+	uint8_t has_ebh;
>+	uint32_t erase_count;
>  };
>---------------------------------------------------
>'uint8_t has_ebh'? I would make it just int ...
>
OK.

>
>
>+struct jffs2_eraseblock_header
>+{
>+	jint16_t magic;
>+	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
>+	jint32_t totlen;
>+	jint32_t hdr_crc;
>+	uint8_t  fs_version; /* the version of this JFFS2 fs image */
>+	uint8_t  compat_fset;
>+	uint8_t  incompat_fset;
>+	uint8_t  rocompat_fset;
>+	jint32_t erase_count; /* the erase count of this erase block */
>+	jint16_t dsize; /* the size of additional data behind node_crc */
>+	jint32_t node_crc;
>+	jint32_t data_crc;
>+	jint32_t data[0];
>+} __attribute__((packed));
>+
>  struct jffs2_raw_dirent
>  {
>---------------------------------------------------
>On-flash nodes has name started from jffs2_raw_, could you please be 
>consistend and call your strucrure, say, jffs2_raw_eraseblock_header 
>or jffs2_raw_ebh?
>
OK.

Thanks,
Forrest
