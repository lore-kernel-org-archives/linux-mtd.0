Received: from bay17-f9.bay17.hotmail.com ([64.4.43.59] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKSS6-0005ga-PI
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 23:17:58 -0400
Message-ID: <BAY17-F908262094F1AD03A8C9E3E88D0@phx.gbl>
In-Reply-To: <43394A92.9000400@yandex.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Wed, 28 Sep 2005 11:17:49 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>Here is my review. Sure, not full yet.
>
>1. The patch is not against the latest MTD.
>
>Hunk #4 FAILED at 191.
>1 out of 4 hunks FAILED -- saving rejects to file 
include/linux/jffs2.h.rej
>
The revision 4 will be based on latest MTD CVS.
>
>2. The patch is not applied with 'patch -p1', use
>
>"diff -auNrp mtd/ mtd_EBH_EBS/", not
>"diff -auNrp ./mtd/ ./mtd_EBH_EBS/"
OK.

>
>3. Really _very_ minor. Could you please add the definition of struct
>jffs2_raw_ebh in jffs2.h after the definitions of other nodes, not before.
OK.

>4. From your patch:
>----------------------------
>+
>+	if (!priv->jeb->has_ebh) {
>+		priv->jeb->has_ebh = 1;
>+	}
>----------------------------
>a. Joern already pointed, just set it unconditionally.
>b. This flag is set in a function which does not exist in eCos. eCos
>will be broken. I would move this to jffs2_erase_succeeded().
OK.

>
>5. From your patch:
>----------------------------
>  		struct kvec vecs[1];
>-		struct jffs2_unknown_node marker = {
>+		struct jffs2_raw_ebh marker = {
>  			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
>-			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
>-			.totlen =	cpu_to_je32(c->cleanmarker_size)
>+			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
>+			.totlen =	cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
>+			.reserved =     0,
>+			.compat_fset =  JFFS2_EBH_COMPAT_FSET,
>+			.incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
>+			.rocompat_fset = JFFS2_EBH_ROCOMPAT_FSET,
>+			.erase_count =  cpu_to_je32(jeb->erase_count),
>+			.dsize =        cpu_to_je16(0),
>+			.data_crc =     cpu_to_je32(0)
>  		};
>----------------------------
>I understand that you just do things as JFFS2 does. But there is a
>better way. IMO, there is no need to define the EBH object straight in
>jffs2_mark_erased_block(). Define it at the top of erase.c.
>
>Furthermore, the same static object is initialized in
>jffs2_write_nand_ebh() (wbuf.c). Please, share the same object.
OK.

>I would also move jffs2_write_nand_ebh() to erase.c.
But when jffs2_write_nand_ebh() is put in wbuf.c, it will not be
compiled when CONFIG_JFFS2_FS_WRITEBUFFER is not defined.
I think it's better to put it in wbuf.c since it's the function
for wbuf. Make sense?


>And please, for readability, don't name this structure 'marker' ...
OK.

>6. From your patch:
>----------------------------
>  	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
>+	c->ebh_size = sizeof(struct jffs2_raw_ebh);
>----------------------------
>Use PAD() here, and don't use PAD(c->ebh_size) elsewhere.
>
OK.

>And could you please add a comment at the definition of struct
>jffs2_eraseblock which will clarify what is ebh_size?
OK.

>7. From your patch:
>----------------------------
>@@ -196,6 +196,9 @@ struct jffs2_eraseblock
>  	struct jffs2_raw_node_ref *last_node;
>
>  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage
>collected */
>+
>+	uint32_t has_ebh;
>+	uint32_t erase_count;
>  };
>----------------------------
>struct jffs2_eraseblock has an 'int bad_count' field which actually
>stores only small values. To save some memory I would better do:
>- int bad_count;
>+ uint16_t bad_count
>+ uint16_t flags;
>
>and add a JFFS2_EBFLAGS_HAS_EBH flag instead of has_ebh field. This
>would save 4 bytes for each 'struct jffs2_eraseblock' object.
OK. 

>8. From your patch:
>----------------------------
>+		if ((!jeb->has_ebh && jeb->free_size != c->sector_size -
>c->cleanmarker_size) ||
>+		    (jeb->has_ebh && c->ebh_size && jeb->free_size != c->sector_size
>- jeb->first_node->__totlen) ||
>+		    (jeb->has_ebh && !c->ebh_size && jeb->free_size != c->sector_size))
>----------------------------
>See the previous review about __totlen usage. use ref_totlen() instead.
>
OK.

I'll send out the revised patch soon.

Thanks,
Forrest
