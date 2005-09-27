Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKFd5-0004Qa-08
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 09:36:36 -0400
Message-ID: <43394A92.9000400@yandex.ru>
Date: Tue, 27 Sep 2005 17:35:14 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F186337C136F8081E8E2828E88A0@phx.gbl>
In-Reply-To: <BAY17-F186337C136F8081E8E2828E88A0@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

zhao forrest wrote:
> Hi,
> 
> This is the revision 3 of erase block header patch.
> Compare with revision 2, the main changes are:
> 1 to keep consistency, rename struct jffs2_eraseblock_header
> to struct jffs2_raw_ebh
> 2 change the type of has_ebh to uint32_t
> 3 store the real length into totlen
> 4 rename fs_version into reserved in order to give it a
> useful name.

Here is my review. Sure, not full yet.

1. The patch is not against the latest MTD.

Hunk #4 FAILED at 191.
1 out of 4 hunks FAILED -- saving rejects to file include/linux/jffs2.h.rej


2. The patch is not applied with 'patch -p1', use

"diff -auNrp mtd/ mtd_EBH_EBS/", not
"diff -auNrp ./mtd/ ./mtd_EBH_EBS/"

3. Really _very_ minor. Could you please add the definition of struct
jffs2_raw_ebh in jffs2.h after the definitions of other nodes, not before.

4. From your patch:
----------------------------
+
+	if (!priv->jeb->has_ebh) {
+		priv->jeb->has_ebh = 1;
+	}
----------------------------
a. Joern already pointed, just set it unconditionally.
b. This flag is set in a function which does not exist in eCos. eCos
will be broken. I would move this to jffs2_erase_succeeded().


5. From your patch:
----------------------------
 		struct kvec vecs[1];
-		struct jffs2_unknown_node marker = {
+		struct jffs2_raw_ebh marker = {
 			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
-			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
-			.totlen =	cpu_to_je32(c->cleanmarker_size)
+			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
+			.totlen =	cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
+			.reserved =     0,
+			.compat_fset =  JFFS2_EBH_COMPAT_FSET,
+			.incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
+			.rocompat_fset = JFFS2_EBH_ROCOMPAT_FSET,
+			.erase_count =  cpu_to_je32(jeb->erase_count),
+			.dsize =        cpu_to_je16(0),
+			.data_crc =     cpu_to_je32(0)
 		};
----------------------------
I understand that you just do things as JFFS2 does. But there is a
better way. IMO, there is no need to define the EBH object straight in
jffs2_mark_erased_block(). Define it at the top of erase.c.

Furthermore, the same static object is initialized in
jffs2_write_nand_ebh() (wbuf.c). Please, share the same object.

I would also move jffs2_write_nand_ebh() to erase.c.

And please, for readability, don't name this structure 'marker' ...


6. From your patch:
----------------------------
 	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
+	c->ebh_size = sizeof(struct jffs2_raw_ebh);
----------------------------
Use PAD() here, and don't use PAD(c->ebh_size) elsewhere.

And could you please add a comment at the definition of struct
jffs2_eraseblock which will clarify what is ebh_size?


7. From your patch:
----------------------------
@@ -196,6 +196,9 @@ struct jffs2_eraseblock
 	struct jffs2_raw_node_ref *last_node;

 	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage
collected */
+
+	uint32_t has_ebh;
+	uint32_t erase_count;
 };
----------------------------
struct jffs2_eraseblock has an 'int bad_count' field which actually
stores only small values. To save some memory I would better do:
- int bad_count;
+ uint16_t bad_count
+ uint16_t flags;

and add a JFFS2_EBFLAGS_HAS_EBH flag instead of has_ebh field. This
would save 4 bytes for each 'struct jffs2_eraseblock' object.

8. From your patch:
----------------------------
+		if ((!jeb->has_ebh && jeb->free_size != c->sector_size -
c->cleanmarker_size) ||
+		    (jeb->has_ebh && c->ebh_size && jeb->free_size != c->sector_size
- jeb->first_node->__totlen) ||
+		    (jeb->has_ebh && !c->ebh_size && jeb->free_size != c->sector_size))
----------------------------
See the previous review about __totlen usage. use ref_totlen() instead.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
