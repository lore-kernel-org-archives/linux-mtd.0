Received: from tyo201.gate.nec.co.jp ([202.32.8.214])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EDaJB-0006o1-P6
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 00:16:18 -0400
Message-ID: <43210C7A.60109@ak.jp.nec.com>
Date: Fri, 09 Sep 2005 13:15:54 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
In-Reply-To: <20050908194915.GG20668@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,J=F6rn.

Thanks for reviewing in spite of so long patch.

 > Sounds good.
 >
 > It appears as if your patch or something based on it will win.  So
 > let's have a look...
 >
 > I notice that you make a couple of mistakes by copying them from
 > existing jffs2 code.  You are excused for that, no doubt.  But I still
 > don't want copies of old mistakes to go in, just because we have a bad
 > example.

Is this using uint32_t, xattr scanning code and so on ?


 > Review is just partial.  It's late enough already and I need to get
 > some sleep.

Please take a rest slowly on the weekend.
I'll modify my patch during this period. ;-)


 >>--- mtd-0829/fs/jffs2/fs.c	2005-08-06 18:00:16.000000000 -0400
 >>+++ mtd-0829.xattr/fs/jffs2/fs.c	2005-09-06 10:28:53.000000000 -0400
 >>@@ -217,6 +217,8 @@ void jffs2_clear_inode (struct inode *in
 >> =09
 >> 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inod=
e->i_ino, inode->i_mode));
 >>
 >>+	if (f->inocache && !f->inocache->nlink)
 >>+		jffs2_xattr_clear_inode(c, f->inocache);
 >
 >
 > Move the test into jffs2_xattr_clear_inode().

OK, I'll modify it.


 >>@@ -504,6 +506,9 @@ int jffs2_do_fill_super(struct super_blo
 >> 	}
 >> 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_=
inode_cache *));
 >>
 >>+	if ((ret =3D jffs2_init_xattr_caches(c)))
 >>+		goto out_inohash;
 >>+
 >
 >
 > 	ret =3D jffs2_init_xattr_caches(c);
 > 	if (ret)
 > 		goto out_inohash;
 >
 > I agree with gcc, when it warns about assignments in conditions.  What
 > I don't agree with is the proposal to use double brackets.

OK, I'll modify this and similar codes at different location if exist.


 >> struct jffs2_full_dirent *jffs2_alloc_full_dirent(int namesize)
 >>@@ -169,6 +195,7 @@ struct jffs2_raw_node_ref *jffs2_alloc_r
 >> 	struct jffs2_raw_node_ref *ret;
 >> 	ret =3D kmem_cache_alloc(raw_node_ref_slab, GFP_KERNEL);
 >> 	JFFS2_DBG_MEMALLOC("%p\n", ret);
 >>+	memset(ret, 0, sizeof(*ret));	/* to guarantee owner=3D=3DNULL */
 >
 >
 > This could be optimized a little by using the constructor/destructor
 > stuff in slabs.  Not too important.

I'll prepare a tiny and obvious constructor for jffs2_raw_node_ref.
NULL is set in raw->owner by default is important, the method of setting
is not so, I think.


 >>@@ -205,3 +232,35 @@ void jffs2_free_inode_cache(struct jffs2
 >> 	JFFS2_DBG_MEMALLOC("%p\n", x);
 >> 	kmem_cache_free(inode_cache_slab, x);
 >> }
 >>+
 >>+#ifdef CONFIG_JFFS2_XATTR
 >>+
 >>+struct jffs2_xattr_cache *jffs2_alloc_xattr_cache(void)
 >>+{
 >>+	struct jffs2_xattr_cache *xc;
 >
 >                           ^^^^^^
 > The name doesn't make sense.  You're referring to a single object, not
 > the complete cache.  Quite confusing.
 >
 >
 >>+	xc =3D kmem_cache_alloc(xattr_cache_slab, GFP_KERNEL);
 >
 >                                          ^^^^^
 > This is the cache.  A slab is just part of the cache.  So please
 > rename the two.

For example, how about the following names ?
"jffs2_xattr_datum" as an alternative of jffs2_xattr_cache.
"xattr_datum_cache" as an alternative of xattr_cache_slab.

In this case, "xc" defined as jffs2_xattr_cache structure
should be renamed to "xd" defined as jffs2_xattr_datum.


 >>+void jffs2_free_xattr_cache(struct jffs2_xattr_cache *xc)
 >>+{
 >>+	JFFS2_DBG_MEMALLOC("%p\n", xc);
 >>+	kmem_cache_free(xattr_cache_slab, xc);
 >>+}
 >>+
 >>+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
 >>+{
 >>+	struct jffs2_xattr_ref *ref;
 >
 >
 > This name makes sense.
 >
 >
 >>+	ref =3D kmem_cache_alloc(xattr_ref_slab, GFP_KERNEL);
 >
 >
 > s/slab/cache/

OK, I'll rename it.


 >>diff -rpNU3 mtd-0829/fs/jffs2/nodelist.h mtd-0829.xattr/fs/jffs2/nodel=
ist.h
 >>--- mtd-0829/fs/jffs2/nodelist.h	2005-08-17 18:00:12.000000000 -0400
 >>+++ mtd-0829.xattr/fs/jffs2/nodelist.h	2005-09-06 10:28:53.000000000 -=
0400
 >>@@ -20,6 +20,7 @@
 >> #include <linux/jffs2.h>
 >> #include <linux/jffs2_fs_sb.h>
 >> #include <linux/jffs2_fs_i.h>
 >>+#include <linux/jffs2_fs_x.h>
 >
 >
 > I p a l n.
 >
 > I prefer a longer name.  jffs2_fs_xattr.h would be fine.
 > jffs2_xattr.h would also, the "_fs" is more redundant that "attr".

OK, I'll rename "jffs2_fs_x.h" to "jffs2_xattr.h" and deploy it under
"fs/jffs2" as David says.


 >> #ifdef __ECOS
 >> #include "os-ecos.h"
 >>@@ -80,6 +81,7 @@ struct jffs2_raw_node_ref
 >> 	struct jffs2_raw_node_ref *next_phys;
 >> 	uint32_t flash_offset;
 >> 	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below *=
/
 >>+	void *owner;
 >
 >
 > This grows a node reference from 16/24 bytes to 20/32 bytes for 32/64
 > bit architectures.  I'm not entirely happy about that, but don't a
 > better solution either.

Indeed, it's involved the growing of object size.
But we must discriminate XATTR node from other non-inode node
and indicate jffs2_xattr_cache/jffs2_xattr_ref object from this.
I didn't have a good idea more than this.

And, I forgot to enclose the declaration of "void *owner"
by #ifdef - #endif.


 >>diff -rpNU3 mtd-0829/fs/jffs2/scan.c mtd-0829.xattr/fs/jffs2/scan.c
 >>--- mtd-0829/fs/jffs2/scan.c	2005-07-20 18:00:12.000000000 -0400
 >>+++ mtd-0829.xattr/fs/jffs2/scan.c	2005-09-06 10:28:53.000000000 -0400
 >>@@ -57,6 +57,12 @@ static int jffs2_scan_inode_node(struct
 >> 				 struct jffs2_raw_inode *ri, uint32_t ofs);
 >> static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jff=
s2_eraseblock *jeb,
 >> 				 struct jffs2_raw_dirent *rd, uint32_t ofs);
 >>+#ifdef CONFIG_JFFS2_XATTR
 >>+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs=
2_eraseblock *jeb,
 >>+				 struct jffs2_raw_xattr *rx, uint32_t ofs);
 >>+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2=
_eraseblock *jeb,
 >>+				struct jffs2_raw_xref *rr, uint32_t ofs);
 >>+#endif
 >
 >
 > You don't need the function definitions if you change the order inside
 > the file.

OK, I'll change the deployment of above functions.


 >> #define BLK_STATE_ALLFF		0
 >> #define BLK_STATE_CLEAN		1
 >>@@ -552,7 +558,40 @@ scan_more:=09
 >> 			if (err) return err;
 >> 			ofs +=3D PAD(je32_to_cpu(node->totlen));
 >> 			break;
 >>-
 >>+#ifdef CONFIG_JFFS2_XATTR
 >>+		case JFFS2_NODETYPE_XATTR:
 >>+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
 >>+				buf_len =3D min_t(uint32_t, buf_size, jeb->offset + c->sector_siz=
e - ofs);
 >>+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xattr node) left to en=
d of buf."
 >>+				          " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), =
buf_len, ofs));
 >>+				err =3D jffs2_fill_scan_buf(c, buf, ofs, buf_len);
 >>+				if (err)
 >>+					return err;
 >>+				buf_ofs =3D ofs;
 >>+				node =3D (void *)buf;
 >>+			}
 >>+			err =3D jffs2_scan_xattr_node(c, jeb, (void *)node, ofs);
 >>+			if (err)
 >>+				return err;
 >>+			ofs +=3D PAD(je32_to_cpu(node->totlen));
 >>+			break;
 >>+		case JFFS2_NODETYPE_XREF:
 >>+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
 >>+				buf_len =3D min_t(uint32_t, buf_size, jeb->offset + c->sector_siz=
e - ofs);
 >>+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xref node) left to end=
 of buf."
 >>+				          " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), =
buf_len, ofs));
 >>+				err =3D jffs2_fill_scan_buf(c, buf, ofs, buf_len);
 >>+				if (err)
 >>+					return err;
 >>+				buf_ofs =3D ofs;
 >>+				node =3D (void *)buf;
 >>+			}
 >>+			err =3D jffs2_scan_xref_node(c, jeb, (void *)node, ofs);
 >>+			if (err)
 >>+				return err;
 >>+			ofs +=3D PAD(je32_to_cpu(node->totlen));
 >>+			break;
 >>+#endif
 >
 >
 > By itself, this code is not too bad.  But it add a little more crap to
 > a function that is aching for a rewrite already.  Not sure.

Hmm,,, I wrote the above part of codes with referring to existing code.
If the policy is shown, I'll follow it. How should I do ?


 >>@@ -820,6 +860,190 @@ static int jffs2_scan_dirent_node(struct
 >> 	return 0;
 >> }
 >>
 >>+#ifdef CONFIG_JFFS2_XATTR
 >>+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs=
2_eraseblock *jeb,
 >>+				 struct jffs2_raw_xattr *rx, uint32_t ofs)
 >>+{
 >>+	struct jffs2_raw_node_ref *raw;
 >>+	struct jffs2_xattr_cache *xc;
 >>+	uint32_t crc;
 >>+	int xtype, nlen, vlen;
 >>+
 >>+	crc =3D crc32(0, rx, sizeof(*rx)-8);
 >>+	if (crc !=3D je32_to_cpu(rx->node_crc)) {
 >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Node CRC failed"
 >>+		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
 >>+		       ofs, je32_to_cpu(rx->node_crc), crc);
 >>+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
 >>+		return 0;
 >>+	}
 >>+
 >>+	nlen =3D JFFS2_XATTR_NAMELEN(je32_to_cpu(rx->length));
 >>+	vlen =3D JFFS2_XATTR_VALUELEN(je32_to_cpu(rx->length));
 >
 >
 > Types don't match.  nlen and vlen should become u32.

Is it enought for "int"?  JFFS2_XATTR_NAMELEN has 12-bit length, and
JFFS2_XATTR_VALUELEN has 20-bit length.

 > Btw, I agree with Linus.  u32 is _much_ nicer than uint32_t, not to
 > speak of the uint32_fast_t insanity.

Is is necessary to correct the part where other uint32_t used.


 >>+	if (je32_to_cpu(rx->totlen) !=3D sizeof(*rx)+PAD(nlen+1)+PAD(vlen)) =
{
 >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): length mimatch!"
 >>+		       " totlen=3D%d length=3D0x%08x nlen=3D%d vlen=3D%d on 0x%08x\=
n",
 >>+		       je32_to_cpu(rx->totlen), je32_to_cpu(rx->length), nlen, vlen=
, ofs);
 >>+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
 >>+		return 0;
 >>+	}
 >>+
 >>+	crc =3D crc32(0, rx->data, PAD(nlen+1)+PAD(vlen));
 >>+	if (crc !=3D je32_to_cpu(rx->data_crc)) {
 >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Data CRC failed"
 >>+		       " on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
 >>+		       ofs, je32_to_cpu(rx->data_crc), crc);
 >>+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
 >>+		return 0;
 >>+	}
 >>+
 >>+	xc =3D jffs2_find_xattr_cache_xid(c, je32_to_cpu(rx->xid));
 >>+	if (xc) {
 >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Duplicate XID Found"
 >>+		       " on node at 0x%08x XID=3D%d Later one ignored\n", ofs, xc->=
xid);
 >>+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
 >>+		return 0;
 >>+	}
 >
 >
 > How do you deal with xattr reference counting and lifetime?

When xc->xlist is empty, jffs2_xattr_cache type object will be released.
jffs2_xattr_ref type object is chained to xc->xlist.
list_empty(xc->xlist) means nobady refers this XATTR.


 >>+	xtype =3D jffs2_xattr_prefix_to_xtype(rx->data, nlen);
 >>+	if (JFFS2_XATTRTYPE_INVALID=3D=3Dxtype) {
 >>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Unsupported xattr type=
"
 >>+		       " on node at 0x%08x\n", ofs);
 >>+		USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
 >>+		return 0;
 >>+	}
 >
 >
 > Why is it required that JFFS2 knows the type of the xattr?

Hmm,,, I added this member to discriminate the prefix of xattr
without strncmp(). But it might be a bit ugly design.


 >>+static inline int jffs2_scan_xref_node_helper(struct jffs2_sb_info *c=
,
 >>+			struct jffs2_xattr_ref *new, struct jffs2_xattr_ref *old)
 >>+{
 >>+	/* (uint32_t)new->xc =3D=3D (uint32_t)old->xc has been made sure. */
 >>+	if ((uint32_t)new->ic =3D=3D (uint32_t)old->ic) {
 >
 >
 > Why the casts?  How can this be safe on 64bit machines?

This function is called before jffs2_build_xattr_cache() while FS-mountin=
g.
In this implementation, xid (uint32 value) is stored in jffs2_xattr_ref->=
xc
before jffs2_build_xattr_cache(), and ino (uint32 value) is stored in
jffs2_xattr_ref->ic.

After calling jffs2_build_xattr_cache(), xc and ic is used as a pointer
which indicate to jffs2_xattr_cache/jffs2_inode_cache.

It might be bad manner, but is the following implementation preferable ?

struct jffs2_xattr_ref {
         uint32_t seqno;
         struct list_head ilist;
         struct list_head xlist;
         union {
                 struct jffs2_xattr_cache *xc;
                 uint32_t xid;
         } x;
         union {
                 struct jffs2_inode_cache *ic;
                 uint32_t ino;
         } i;
         struct jffs2_raw_node_ref *node;
};


 >>+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2=
_eraseblock *jeb,
 >>+				struct jffs2_raw_xref *rr, uint32_t ofs)
 >>+{
 >>+	struct jffs2_raw_node_ref *raw;

              - snip -

 >>+	ref->seqno =3D je32_to_cpu(rr->seqno);
 >>+	if (ref->seqno > c->highest_seqno)
 >>+		c->highest_seqno =3D ref->seqno;
 >>+	ref->ic =3D (void *)je32_to_cpu(rr->ino);
 >>+	ref->xc =3D (void *)je32_to_cpu(rr->xid);
 >
 >
 > WTF?!?
 >
 > You read a je32 from flash and use that as a pointer?!?
 >
 > Please tell me I'm wrong.

If we use above emample, we can write it as follows:

     ref->i.ino =3D je32_to_cpu(rr->ino);
     ref->x.xid =3D je32_to_cpu(rr->xid);

In jffs2_build_xattr_cache(), we find up the jffs2_inode_cache and
jffs2_xattr_cache by using ino/xid as a key. Then the correct pointers
are stored in ref->ic and ref->xc after jffs2_build_xattr_cache().

Is it the situation to use union ?


Thanks for attentive comments.
--=20
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
