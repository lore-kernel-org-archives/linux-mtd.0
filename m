Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJqo0-0008Vt-Da
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 07:06:15 -0400
Message-ID: <4337D5E4.6040706@yandex.ru>
Date: Mon, 26 Sep 2005 15:05:08 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F3179BEFDF1ABD013971FD1E88B0@phx.gbl>
	<20050926084154.GC17756@wohnheim.fh-wedel.de>
In-Reply-To: <20050926084154.GC17756@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Also did not review carefully, just nodes.


  			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
-			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
-			.totlen =	cpu_to_je32(c->cleanmarker_size)
+			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
+			.totlen =	cpu_to_je32(PAD(c->ebh_size)),
---------------------------------------------------
As we discussed, we should store real EBH node size it .totlen, not the 
EBH size + paddings to the end of page, etc. Please, store the EBH size 
on flash in c->ebg_size, no problems, but let 'totlen' have the same 
semantica as all other nodes.



  		marker_ref->next_in_ino = NULL;
  		marker_ref->next_phys = NULL;
  		marker_ref->flash_offset = jeb->offset | REF_NORMAL;
-		marker_ref->__totlen = c->cleanmarker_size;
+		marker_ref->__totlen = PAD(c->ebh_size);
---------------------------------------------------
Why do you use PAD() here? What for?

  			
  		jeb->first_node = jeb->last_node = marker_ref;
  			
-		jeb->free_size = c->sector_size - c->cleanmarker_size;
-		jeb->used_size = c->cleanmarker_size;
+		jeb->free_size = c->sector_size - PAD(c->ebh_size);
+		jeb->used_size = PAD(c->ebh_size);
---------------------------------------------------
And here



  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage 
collected */
+
+	uint8_t has_ebh;
+	uint32_t erase_count;
  };
---------------------------------------------------
'uint8_t has_ebh'? I would make it just int ...



+struct jffs2_eraseblock_header
+{
+	jint16_t magic;
+	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	uint8_t  fs_version; /* the version of this JFFS2 fs image */
+	uint8_t  compat_fset;
+	uint8_t  incompat_fset;
+	uint8_t  rocompat_fset;
+	jint32_t erase_count; /* the erase count of this erase block */
+	jint16_t dsize; /* the size of additional data behind node_crc */
+	jint32_t node_crc;
+	jint32_t data_crc;
+	jint32_t data[0];
+} __attribute__((packed));
+
  struct jffs2_raw_dirent
  {
---------------------------------------------------
On-flash nodes has name started from jffs2_raw_, could you please be 
consistend and call your strucrure, say, jffs2_raw_eraseblock_header or 
jffs2_raw_ebh?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
