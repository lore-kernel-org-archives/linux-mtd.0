Received: from imo-m23.mx.aol.com ([64.12.137.4])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFE0e-0001OX-Ts
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 12:51:58 -0400
Received: from Sebastiencouret@aol.com
	by imo-m23.mx.aol.com (mail_out_v38_r5.3.) id 3.25.67a7425e (15875)
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2005 12:46:21 -0400 (EDT)
Message-ID: <005e01c5b882$9b318420$0100000a@LuCyFir3>
From: =?iso-8859-1?Q?S=E9bastien_Couret?= <sebastiencouret@aol.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 13 Sep 2005 18:45:41 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0059_01C5B893.57A658F0"
Subject: Silent GCC4.0 warning
Reply-To: =?iso-8859-1?Q?S=E9bastien_Couret?= <sebastiencouret@aol.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


------=_NextPart_000_0059_01C5B893.57A658F0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi All,
I'm not used to post to this mailing list as i use jffs2 with ecos.

Here are JFFS2 patches to silent gcc 4.0 warnings.
Hope this helps

------=_NextPart_000_0059_01C5B893.57A658F0
Content-Type: application/octet-stream;
	name="jffs2.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="jffs2.patch"

diff -r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/checkout-ecoscentric/ecos/=
packages/fs/jffs2/current/ChangeLog /cvs-tempo/checkout-ecoscentric-devoted/=
ecos/packages/fs/jffs2/current/ChangeLog=0A--- /cvs-tempo/checkout-ecoscentr=
ic/ecos/packages/fs/jffs2/current/ChangeLog=092005-08-03 22:39:51.000000000=20=
+0200=0A+++ /cvs-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/jffs2/c=
urrent/ChangeLog=092005-09-02 11:25:28.000000000 +0200=0A@@ -1,5 +1,18 @@=
=0A+2005-09-02  Sebastien Couret <sebastien.couret@elios-informatique.fr>=
=0A+=0A+=09* src/compr_rubin.c: Silent gcc4 signedness warnings =0A+=09* src=
/erase.c      : Silent gcc4 warnings =0A+=09* src/flashio.c    : Silent gcc4=
 warnings=0A+=09* src/gc.c         : Silent gcc4 signedness warnings=0A+=09*=
 src/nodelist.c   : Silent gcc4 warnings=0A+=09* src/nodemgmt.c   : Silent g=
cc4 signedness warnings=0A+=09* src/pushpull.h   : Silent gcc4 signedness wa=
rnings=0A+=09* src/read.c       : Silent gcc4 signedness warnings=0A+=09* sr=
c/readinode.c  : Silent gcc4 warnings=0A+=09* src/write.c      : Silent gcc4=
 signedness warnings=0A+=09=0A 2005-08-03  Andrew Lunn  <andrew.lunn@ascom.c=
h>=0A =0A =09* tests/jffs2_1.c: Include <stdio.h> to stop compiler warning.=
=0A =0A 2005-07-30  Andrew Lunn  <andrew.lunn@ascom.ch>=0Adiff -r -u5 -N -x=20=
CVS -x '*~' -x '.#*' /cvs-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/=
current/src/compr_rubin.c /cvs-tempo/checkout-ecoscentric-devoted/ecos/packa=
ges/fs/jffs2/current/src/compr_rubin.c=0A--- /cvs-tempo/checkout-ecoscentric=
/ecos/packages/fs/jffs2/current/src/compr_rubin.c=092005-07-30 17:30:42.0000=
00000 +0200=0A+++ /cvs-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/j=
ffs2/current/src/compr_rubin.c=092005-09-02 11:16:33.000000000 +0200=0A@@ -1=
93,11 +193,11 @@=0A =09{=0A =09int outpos =3D 0;=0A =09int pos=3D0;=0A =09st=
ruct rubin_state rs;=0A =0A-=09init_pushpull(&rs.pp, cpage_out, *dstlen * 8,=
 0, 32);=0A+=09init_pushpull(&rs.pp,(char*) cpage_out, *dstlen * 8, 0, 32);=
=0A =0A =09init_rubin(&rs, bit_divider, bits);=0A =09=0A =09while (pos < (*s=
ourcelen) && !out_byte(&rs, data_in[pos]))=0A =09=09pos++;=0A@@ -297,11 +297=
,11 @@=0A =09=09=09 unsigned char *page_out, uint32_t srclen, uint32_t destl=
en)=0A {=0A =09int outpos =3D 0;=0A =09struct rubin_state rs;=0A =09=0A-=09i=
nit_pushpull(&rs.pp, cdata_in, srclen, 0, 0);=0A+=09init_pushpull(&rs.pp, (c=
har *)cdata_in, srclen, 0, 0);=0A =09init_decode(&rs, bit_divider, bits);=
=0A =09=0A =09while (outpos < destlen) {=0A =09=09page_out[outpos++] =3D in_=
byte(&rs);=0A =09}=0Adiff -r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/check=
out-ecoscentric/ecos/packages/fs/jffs2/current/src/erase.c /cvs-tempo/checko=
ut-ecoscentric-devoted/ecos/packages/fs/jffs2/current/src/erase.c=0A--- /cvs=
-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/current/src/erase.c=09200=
5-07-30 17:30:42.000000000 +0200=0A+++ /cvs-tempo/checkout-ecoscentric-devot=
ed/ecos/packages/fs/jffs2/current/src/erase.c=092005-09-02 11:14:07.00000000=
0 +0200=0A@@ -331,11 +331,11 @@=0A =09=09=09printk(KERN_WARNING "Short read=20=
from newly-erased block at 0x%08x. Wanted %d, got %zd\n", ofs, readlen, retl=
en);=0A =09=09=09goto fail;=0A =09=09}=0A =09=09for (i=3D0; i<readlen; i +=
=3D sizeof(unsigned long)) {=0A =09=09=09/* It's OK. We know it's properly a=
ligned */=0A-=09=09=09unsigned long *datum =3D ebuf + i;=0A+=09=09=09unsigne=
d long *datum =3D (unsigned long *)((char*) ebuf + i);=0A =09=09=09if (*datu=
m + 1) {=0A =09=09=09=09*bad_offset +=3D i;=0A =09=09=09=09printk(KERN_WARNI=
NG "Newly-erased block contained word 0x%lx at offset 0x%08x\n", *datum, *ba=
d_offset);=0A =09=09=09=09goto fail;=0A =09=09=09}=0A@@ -352,11 +352,11 @@=
=0A static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs=
2_eraseblock *jeb)=0A {=0A =09struct jffs2_raw_node_ref *marker_ref =3D NULL=
;=0A =09size_t retlen;=0A =09int ret;=0A-=09uint32_t bad_offset;=0A+=09uint3=
2_t bad_offset=3D0;=0A =0A =09switch (jffs2_block_check_erase(c, jeb, &bad_o=
ffset)) {=0A =09case -EAGAIN:=09goto refile;=0A =09case -EIO:=09goto filebad=
;=0A =09}=0Adiff -r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/checkout-ecosc=
entric/ecos/packages/fs/jffs2/current/src/flashio.c /cvs-tempo/checkout-ecos=
centric-devoted/ecos/packages/fs/jffs2/current/src/flashio.c=0A--- /cvs-temp=
o/checkout-ecoscentric/ecos/packages/fs/jffs2/current/src/flashio.c=092005-0=
7-30 17:30:42.000000000 +0200=0A+++ /cvs-tempo/checkout-ecoscentric-devoted/=
ecos/packages/fs/jffs2/current/src/flashio.c=092005-09-02 10:51:29.000000000=
 +0200=0A@@ -99,11 +99,11 @@=0A =09=09=09=09=09       vecs[j].iov_len);=0A=20=
=09=09=09=09=09cbufptr +=3D vecs[j].iov_len;=0A =09=09=09=09}=0A =09=09=09=
=09ret =3D=0A =09=09=09=09    jffs2_flash_write(c, to, sizetomalloc,=0A-=09=
=09=09=09=09=09      &thislen, cbuf);=0A+=09=09=09=09=09=09      &thislen,(u=
nsigned char *) cbuf);=0A =09=09=09=09if (thislen > totvecsize)=09// in case=
 it was aligned up=0A =09=09=09=09=09thislen =3D totvecsize;=0A =09=09=09=
=09totlen +=3D thislen;=0A =09=09=09=09free(cbuf);=0A =09=09=09=09goto write=
v_out;=0A@@ -118,11 +118,11 @@=0A =09=09=09=09lentowrite &=3D ~(sizeof (int)=
 - 1);=0A =09=09=09=09memcpy(buf, vecs[i].iov_base, lentowrite);=0A =0A =09=
=09=09=09ret =3D=0A =09=09=09=09    jffs2_flash_write(c, to, lentowrite,=0A-=
=09=09=09=09=09=09      &thislen, (char *) &buf);=0A+=09=09=09=09=09=09    =20=
 &thislen, (unsigned char *) &buf);=0A =09=09=09=09if (thislen > vecs[i].iov=
_len)=0A =09=09=09=09=09thislen =3D vecs[i].iov_len;=0A =09=09=09}=09// else=
=0A =09=09} else=0A =09=09=09ret =3D=0Adiff -r -u5 -N -x CVS -x '*~' -x '.#*=
' /cvs-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/current/src/gc.c /c=
vs-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/jffs2/current/src/gc.=
c=0A--- /cvs-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/current/src/g=
c.c=092005-07-30 17:30:42.000000000 +0200=0A+++ /cvs-tempo/checkout-ecoscent=
ric-devoted/ecos/packages/fs/jffs2/current/src/gc.c=092005-09-02 10:58:41.00=
0000000 +0200=0A@@ -525,11 +525,11 @@=0A =0A =09node =3D kmalloc(rawlen, GFP=
_KERNEL);=0A =09if (!node)=0A                return -ENOMEM;=0A =0A-=09ret=20=
=3D jffs2_flash_read(c, ref_offset(raw), rawlen, &retlen, (char *)node);=0A+=
=09ret =3D jffs2_flash_read(c, ref_offset(raw), rawlen, &retlen, (unsigned c=
har *)node);=0A =09if (!ret && retlen !=3D rawlen)=0A =09=09ret =3D -EIO;=
=0A =09if (ret)=0A =09=09goto out_node;=0A =0A@@ -592,11 +592,11 @@=0A  retr=
y:=0A =09nraw->flash_offset =3D phys_ofs;=0A =09nraw->__totlen =3D rawlen;=
=0A =09nraw->next_phys =3D NULL;=0A =0A-=09ret =3D jffs2_flash_write(c, phys=
_ofs, rawlen, &retlen, (char *)node);=0A+=09ret =3D jffs2_flash_write(c, phy=
s_ofs, rawlen, &retlen, (unsigned char *)node);=0A =0A =09if (ret || (retlen=
 !=3D rawlen)) {=0A =09=09printk(KERN_NOTICE "Write of %d bytes at 0x%08x fa=
iled. returned %d, retlen %zd\n",=0A                        rawlen, phys_ofs=
, ret, retlen);=0A =09=09if (retlen) {=0A@@ -689,11 +689,11 @@=0A =09=09mdat=
a =3D kmalloc(fn->size, GFP_KERNEL);=0A =09=09if (!mdata) {=0A =09=09=09prin=
tk(KERN_WARNING "kmalloc of mdata failed in jffs2_garbage_collect_metadata()=
\n");=0A =09=09=09return -ENOMEM;=0A =09=09}=0A-=09=09ret =3D jffs2_read_dno=
de(c, f, fn, mdata, 0, mdatalen);=0A+=09=09ret =3D jffs2_read_dnode(c, f, fn=
,(unsigned char *)mdata, 0, mdatalen);=0A =09=09if (ret) {=0A =09=09=09print=
k(KERN_WARNING "read of old metadata failed in jffs2_garbage_collect_metadat=
a(): %d\n", ret);=0A =09=09=09kfree(mdata);=0A =09=09=09return ret;=0A =09=
=09}=0A@@ -736,11 +736,11 @@=0A =09ri.dsize =3D cpu_to_je32(mdatalen);=0A=20=
=09ri.compr =3D JFFS2_COMPR_NONE;=0A =09ri.node_crc =3D cpu_to_je32(crc32(0,=
 &ri, sizeof(ri)-8));=0A =09ri.data_crc =3D cpu_to_je32(crc32(0, mdata, mdat=
alen));=0A =0A-=09new_fn =3D jffs2_write_dnode(c, f, &ri, mdata, mdatalen, p=
hys_ofs, ALLOC_GC);=0A+=09new_fn =3D jffs2_write_dnode(c, f, &ri,( unsigned=20=
char *) mdata, mdatalen, phys_ofs, ALLOC_GC);=0A =0A =09if (IS_ERR(new_fn))=20=
{=0A =09=09printk(KERN_WARNING "Error writing new dnode: %ld\n", PTR_ERR(new=
_fn));=0A =09=09ret =3D PTR_ERR(new_fn);=0A =09=09goto out;=0A@@ -762,11 +76=
2,11 @@=0A =09uint32_t alloclen, phys_ofs;=0A =09int ret;=0A =0A =09rd.magic=
 =3D cpu_to_je16(JFFS2_MAGIC_BITMASK);=0A =09rd.nodetype =3D cpu_to_je16(JFF=
S2_NODETYPE_DIRENT);=0A-=09rd.nsize =3D strlen(fd->name);=0A+=09rd.nsize=20=
=3D strlen((char*)fd->name);=0A =09rd.totlen =3D cpu_to_je32(sizeof(rd) + rd=
.nsize);=0A =09rd.hdr_crc =3D cpu_to_je32(crc32(0, &rd, sizeof(struct jffs2_=
unknown_node)-4));=0A =0A =09rd.pino =3D cpu_to_je32(f->inocache->ino);=0A=20=
=09rd.version =3D cpu_to_je32(++f->highest_version);=0A@@ -806,11 +806,11 @@=
=0A =09if (!jffs2_can_mark_obsolete(c)) {=0A =09=09struct jffs2_raw_dirent *=
rd;=0A =09=09struct jffs2_raw_node_ref *raw;=0A =09=09int ret;=0A =09=09size=
_t retlen;=0A-=09=09int name_len =3D strlen(fd->name);=0A+=09=09int name_len=
 =3D strlen((char*)fd->name);=0A =09=09uint32_t name_crc =3D crc32(0, fd->na=
me, name_len);=0A =09=09uint32_t rawlen =3D ref_totlen(c, jeb, fd->raw);=0A=20=
=0A =09=09rd =3D kmalloc(rawlen, GFP_KERNEL);=0A =09=09if (!rd)=0A@@ -838,11=
 +838,11 @@=0A =0A =09=09=09D1(printk(KERN_DEBUG "Check potential deletion d=
irent at %08x\n", ref_offset(raw)));=0A =0A =09=09=09/* This is an obsolete=20=
node belonging to the same directory, and it's of the right=0A =09=09=09   l=
ength. We need to take a closer look...*/=0A-=09=09=09ret =3D jffs2_flash_re=
ad(c, ref_offset(raw), rawlen, &retlen, (char *)rd);=0A+=09=09=09ret =3D jff=
s2_flash_read(c, ref_offset(raw), rawlen, &retlen, (unsigned char *)rd);=0A=20=
=09=09=09if (ret) {=0A =09=09=09=09printk(KERN_WARNING "jffs2_g_c_deletion_d=
irent(): Read error (%d) reading obsolete node at %08x\n", ret, ref_offset(r=
aw));=0A =09=09=09=09/* If we can't read it, we don't need to continue to ob=
solete it. Continue */=0A =09=09=09=09continue;=0A =09=09=09}=0A@@ -918,11 +=
918,11 @@=0A =09if(fn->frags > 1) {=0A =09=09size_t readlen;=0A =09=09uint32=
_t crc;=0A =09=09/* It's partially obsoleted by a later write. So we have to=
 =0A =09=09   write it out again with the _same_ version as before */=0A-=
=09=09ret =3D jffs2_flash_read(c, ref_offset(fn->raw), sizeof(ri), &readlen,=
 (char *)&ri);=0A+=09=09ret =3D jffs2_flash_read(c, ref_offset(fn->raw), siz=
eof(ri), &readlen, (unsigned char *)&ri);=0A =09=09if (readlen !=3D sizeof(r=
i) || ret) {=0A =09=09=09printk(KERN_WARNING "Node read failed in jffs2_garb=
age_collect_hole. Ret %d, retlen %zd. Data will be lost by writing new hole=20=
node\n", ret, readlen);=0A =09=09=09goto fill;=0A =09=09}=0A =09=09if (je16_=
to_cpu(ri.nodetype) !=3D JFFS2_NODETYPE_INODE) {=0Adiff -r -u5 -N -x CVS -x=20=
'*~' -x '.#*' /cvs-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/current=
/src/nodelist.c /cvs-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/jff=
s2/current/src/nodelist.c=0A--- /cvs-tempo/checkout-ecoscentric/ecos/package=
s/fs/jffs2/current/src/nodelist.c=092005-07-30 17:30:42.000000000 +0200=0A++=
+ /cvs-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/jffs2/current/src=
/nodelist.c=092005-09-02 10:41:40.000000000 +0200=0A@@ -26,11 +26,11 @@=0A=20=
=09struct jffs2_full_dirent **prev =3D list;=0A =09=0A =09JFFS2_DBG_DENTLIST=
("add dirent \"%s\", ino #%u\n", new->name, new->ino);=0A =0A =09while ((*pr=
ev) && (*prev)->nhash <=3D new->nhash) {=0A-=09=09if ((*prev)->nhash =3D=3D=20=
new->nhash && !strcmp((*prev)->name, new->name)) {=0A+=09=09if ((*prev)->nha=
sh =3D=3D new->nhash && !strcmp((char*)(*prev)->name,(char*)new->name)) {=
=0A =09=09=09/* Duplicate. Free one */=0A =09=09=09if (new->version < (*prev=
)->version) {=0A =09=09=09=09JFFS2_DBG_DENTLIST("Eep! Marking new dirent nod=
e is obsolete, old is \"%s\", ino #%u\n",=0A =09=09=09=09=09(*prev)->name, (=
*prev)->ino);=0A =09=09=09=09jffs2_mark_node_obsolete(c, new->raw);=0Adiff -=
r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/checkout-ecoscentric/ecos/packag=
es/fs/jffs2/current/src/nodemgmt.c /cvs-tempo/checkout-ecoscentric-devoted/e=
cos/packages/fs/jffs2/current/src/nodemgmt.c=0A--- /cvs-tempo/checkout-ecosc=
entric/ecos/packages/fs/jffs2/current/src/nodemgmt.c=092005-07-30 17:30:42.0=
00000000 +0200=0A+++ /cvs-tempo/checkout-ecoscentric-devoted/ecos/packages/f=
s/jffs2/current/src/nodemgmt.c=092005-09-02 10:44:45.000000000 +0200=0A@@ -5=
39,11 +539,11 @@=0A =09   and potentially put its eraseblock onto the erase_=
pending_list. Thus, we know that=0A =09   the block hasn't _already_ been er=
ased, and that 'ref' itself hasn't been freed yet=0A =09   by jffs2_free_all=
_node_refs() in erase.c. Which is nice. */=0A =0A =09D1(printk(KERN_DEBUG "o=
bliterating obsoleted node at 0x%08x\n", ref_offset(ref)));=0A-=09ret =3D jf=
fs2_flash_read(c, ref_offset(ref), sizeof(n), &retlen, (char *)&n);=0A+=09re=
t =3D jffs2_flash_read(c, ref_offset(ref), sizeof(n), &retlen, (unsigned cha=
r *)&n);=0A =09if (ret) {=0A =09=09printk(KERN_WARNING "Read error reading f=
rom obsoleted node at 0x%08x: %d\n", ref_offset(ref), ret);=0A =09=09goto ou=
t_erase_sem;=0A =09}=0A =09if (retlen !=3D sizeof(n)) {=0A@@ -558,11 +558,11=
 @@=0A =09=09D1(printk(KERN_DEBUG "Node at 0x%08x was already marked obsolet=
e (nodetype 0x%04x)\n", ref_offset(ref), je16_to_cpu(n.nodetype)));=0A =09=
=09goto out_erase_sem;=0A =09}=0A =09/* XXX FIXME: This is ugly now */=0A=20=
=09n.nodetype =3D cpu_to_je16(je16_to_cpu(n.nodetype) & ~JFFS2_NODE_ACCURATE=
);=0A-=09ret =3D jffs2_flash_write(c, ref_offset(ref), sizeof(n), &retlen, (=
char *)&n);=0A+=09ret =3D jffs2_flash_write(c, ref_offset(ref), sizeof(n), &=
retlen, (unsigned char *)&n);=0A =09if (ret) {=0A =09=09printk(KERN_WARNING=20=
"Write error in obliterating obsoleted node at 0x%08x: %d\n", ref_offset(ref=
), ret);=0A =09=09goto out_erase_sem;=0A =09}=0A =09if (retlen !=3D sizeof(n=
)) {=0Adiff -r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/checkout-ecoscentri=
c/ecos/packages/fs/jffs2/current/src/pushpull.h /cvs-tempo/checkout-ecoscent=
ric-devoted/ecos/packages/fs/jffs2/current/src/pushpull.h=0A--- /cvs-tempo/c=
heckout-ecoscentric/ecos/packages/fs/jffs2/current/src/pushpull.h=092005-01-=
22 18:14:49.000000000 +0100=0A+++ /cvs-tempo/checkout-ecoscentric-devoted/ec=
os/packages/fs/jffs2/current/src/pushpull.h=092005-09-02 11:15:02.000000000=20=
+0200=0A@@ -24,11 +24,11 @@=0A };=0A =0A =0A static inline void init_pushpul=
l(struct pushpull *pp, char *buf, unsigned buflen, unsigned ofs, unsigned re=
serve)=0A {=0A-=09pp->buf =3D buf;=0A+=09pp->buf =3D (unsigned char*)buf;=
=0A =09pp->buflen =3D buflen;=0A =09pp->ofs =3D ofs;=0A =09pp->reserve =3D r=
eserve;=0A }=0A =0Adiff -r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/checkou=
t-ecoscentric/ecos/packages/fs/jffs2/current/src/read.c /cvs-tempo/checkout-=
ecoscentric-devoted/ecos/packages/fs/jffs2/current/src/read.c=0A--- /cvs-tem=
po/checkout-ecoscentric/ecos/packages/fs/jffs2/current/src/read.c=092005-07-=
30 17:30:42.000000000 +0200=0A+++ /cvs-tempo/checkout-ecoscentric-devoted/ec=
os/packages/fs/jffs2/current/src/read.c=092005-09-02 10:50:04.000000000 +020=
0=0A@@ -33,11 +33,11 @@=0A =0A =09ri =3D jffs2_alloc_raw_inode();=0A =09if (=
!ri)=0A =09=09return -ENOMEM;=0A =0A-=09ret =3D jffs2_flash_read(c, ref_offs=
et(fd->raw), sizeof(*ri), &readlen, (char *)ri);=0A+=09ret =3D jffs2_flash_r=
ead(c, ref_offset(fd->raw), sizeof(*ri), &readlen, (unsigned char *)ri);=0A=20=
=09if (ret) {=0A =09=09jffs2_free_raw_inode(ri);=0A =09=09printk(KERN_WARNIN=
G "Error reading node from 0x%08x: %d\n", ref_offset(fd->raw), ret);=0A =09=
=09return ret;=0A =09}=0Adiff -r -u5 -N -x CVS -x '*~' -x '.#*' /cvs-tempo/c=
heckout-ecoscentric/ecos/packages/fs/jffs2/current/src/readinode.c /cvs-temp=
o/checkout-ecoscentric-devoted/ecos/packages/fs/jffs2/current/src/readinode.=
c=0A--- /cvs-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/current/src/r=
eadinode.c=092005-07-30 17:30:42.000000000 +0200=0A+++ /cvs-tempo/checkout-e=
coscentric-devoted/ecos/packages/fs/jffs2/current/src/readinode.c=092005-09-=
02 10:49:24.000000000 +0200=0A@@ -475,11 +475,11 @@=0A =09=09=09=09JFFS2_ERR=
OR("short read dirent at %#08x\n", ref_offset(ref));=0A =09=09=09=09err =3D=20=
-EIO;=0A =09=09=09=09goto free_out;=0A =09=09=09}=0A =0A-=09=09=09err =3D re=
ad_direntry(c, ref, &node.d, retlen, &ret_fd, latest_mctime, mctime_ver);=
=0A+=09=09=09err =3D read_direntry(c, ref, &node.d, retlen, &ret_fd, (int32_=
t*)latest_mctime, mctime_ver);=0A =09=09=09if (err =3D=3D 1) {=0A =09=09=09=
=09jffs2_mark_node_obsolete(c, ref);=0A =09=09=09=09break;=0A =09=09=09} els=
e if (unlikely(err))=0A =09=09=09=09goto free_out;=0A@@ -496,11 +496,11 @@=
=0A =09=09=09=09JFFS2_ERROR("short read dnode at %#08x\n", ref_offset(ref));=
=0A =09=09=09=09err =3D -EIO;=0A =09=09=09=09goto free_out;=0A =09=09=09}=
=0A =0A-=09=09=09err =3D read_dnode(c, ref, &node.i, retlen, &ret_tn, latest=
_mctime, mctime_ver);=0A+=09=09=09err =3D read_dnode(c, ref, &node.i, retlen=
, &ret_tn,(int32_t*)latest_mctime, mctime_ver);=0A =09=09=09if (err =3D=3D 1=
) {=0A =09=09=09=09jffs2_mark_node_obsolete(c, ref);=0A =09=09=09=09break;=
=0A =09=09=09} else if (unlikely(err))=0A =09=09=09=09goto free_out;=0A@@ -5=
48,11 +548,11 @@=0A =09=09=09=09=09struct jffs2_raw_inode *latest_node)=0A {=
=0A =09struct jffs2_tmp_dnode_info *tn =3D NULL;=0A =09struct rb_root tn_lis=
t;=0A =09struct rb_node *rb, *repl_rb;=0A-=09struct jffs2_full_dirent *fd_li=
st;=0A+=09struct jffs2_full_dirent *fd_list=3DNULL;=0A =09struct jffs2_full_=
dnode *fn =3D NULL;=0A =09uint32_t crc;=0A =09uint32_t latest_mctime, mctime=
_ver;=0A =09uint32_t mdata_ver =3D 0;=0A =09size_t retlen;=0A@@ -708,11 +708=
,11 @@=0A =09=09=09=09jffs2_do_clear_inode(c, f);=0A =09=09=09=09return -ENO=
MEM;=0A =09=09=09}=0A =09=09=09=0A =09=09=09ret =3D jffs2_flash_read(c, ref_=
offset(fn->raw) + sizeof(*latest_node),=0A-=09=09=09=09=09=09je32_to_cpu(lat=
est_node->csize), &retlen, (char *)f->target);=0A+=09=09=09=09=09=09je32_to_=
cpu(latest_node->csize), &retlen, (unsigned char *)f->target);=0A =09=09=09=
=0A =09=09=09if (ret  || retlen !=3D je32_to_cpu(latest_node->csize)) {=0A=20=
=09=09=09=09if (retlen !=3D je32_to_cpu(latest_node->csize))=0A =09=09=09=
=09=09ret =3D -EIO;=0A =09=09=09=09kfree(f->target);=0Adiff -r -u5 -N -x CVS=
 -x '*~' -x '.#*' /cvs-tempo/checkout-ecoscentric/ecos/packages/fs/jffs2/cur=
rent/src/write.c /cvs-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/jf=
fs2/current/src/write.c=0A--- /cvs-tempo/checkout-ecoscentric/ecos/packages/=
fs/jffs2/current/src/write.c=092005-07-30 17:30:42.000000000 +0200=0A+++ /cv=
s-tempo/checkout-ecoscentric-devoted/ecos/packages/fs/jffs2/current/src/writ=
e.c=092005-09-02 11:05:43.000000000 +0200=0A@@ -247,11 +247,11 @@=0A =09=09r=
eturn ERR_PTR(-ENOMEM);=0A =09}=0A =0A =09fd->version =3D je32_to_cpu(rd->ve=
rsion);=0A =09fd->ino =3D je32_to_cpu(rd->ino);=0A-=09fd->nhash =3D full_nam=
e_hash(name, strlen(name));=0A+=09fd->nhash =3D full_name_hash(name, strlen(=
(char*)name));=0A =09fd->type =3D rd->type;=0A =09memcpy(fd->name, name, nam=
elen);=0A =09fd->name[namelen]=3D0;=0A =0A  retry:=0A@@ -507,11 +507,11 @@=
=0A =09rd->nsize =3D namelen;=0A =09rd->type =3D DT_REG;=0A =09rd->node_crc=20=
=3D cpu_to_je32(crc32(0, rd, sizeof(*rd)-8));=0A =09rd->name_crc =3D cpu_to_=
je32(crc32(0, name, namelen));=0A =0A-=09fd =3D jffs2_write_dirent(c, dir_f,=
 rd, name, namelen, phys_ofs, ALLOC_NORMAL);=0A+=09fd =3D jffs2_write_dirent=
(c, dir_f, rd,(unsigned char*) name, namelen, phys_ofs, ALLOC_NORMAL);=0A=20=
=0A =09jffs2_free_raw_dirent(rd);=0A =09=0A =09if (IS_ERR(fd)) {=0A =09=09/*=
 dirent failed to write. Delete the inode normally =0A@@ -569,11 +569,11 @@=
=0A =09=09rd->nsize =3D namelen;=0A =09=09rd->type =3D DT_UNKNOWN;=0A =09=
=09rd->node_crc =3D cpu_to_je32(crc32(0, rd, sizeof(*rd)-8));=0A =09=09rd->n=
ame_crc =3D cpu_to_je32(crc32(0, name, namelen));=0A =0A-=09=09fd =3D jffs2_=
write_dirent(c, dir_f, rd, name, namelen, phys_ofs, ALLOC_DELETION);=0A+=09=
=09fd =3D jffs2_write_dirent(c, dir_f, rd, (unsigned char*)name, namelen, ph=
ys_ofs, ALLOC_DELETION);=0A =09=09=0A =09=09jffs2_free_raw_dirent(rd);=0A=20=
=0A =09=09if (IS_ERR(fd)) {=0A =09=09=09jffs2_complete_reservation(c);=0A@@=20=
-584,11 +584,11 @@=0A =09=09/* File it. This will mark the old one obsolete.=
 */=0A =09=09jffs2_add_fd_to_list(c, fd, &dir_f->dents);=0A =09=09up(&dir_f-=
>sem);=0A =09} else {=0A =09=09struct jffs2_full_dirent **prev =3D &dir_f->d=
ents;=0A-=09=09uint32_t nhash =3D full_name_hash(name, namelen);=0A+=09=09ui=
nt32_t nhash =3D full_name_hash((unsigned char *)name, namelen);=0A =0A =09=
=09down(&dir_f->sem);=0A =0A =09=09while ((*prev) && (*prev)->nhash <=3D nha=
sh) {=0A =09=09=09if ((*prev)->nhash =3D=3D nhash && =0A@@ -680,11 +680,11 @=
@=0A =09rd->type =3D type;=0A =0A =09rd->node_crc =3D cpu_to_je32(crc32(0, r=
d, sizeof(*rd)-8));=0A =09rd->name_crc =3D cpu_to_je32(crc32(0, name, namele=
n));=0A =0A-=09fd =3D jffs2_write_dirent(c, dir_f, rd, name, namelen, phys_o=
fs, ALLOC_NORMAL);=0A+=09fd =3D jffs2_write_dirent(c, dir_f, rd,(unsigned ch=
ar*) name, namelen, phys_ofs, ALLOC_NORMAL);=0A =09=0A =09jffs2_free_raw_dir=
ent(rd);=0A =0A =09if (IS_ERR(fd)) {=0A =09=09jffs2_complete_reservation(c);=
=0A
------=_NextPart_000_0059_01C5B893.57A658F0--
