Received: from zproxy.gmail.com ([64.233.162.203])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EkBE2-0006Q9-8m
	for linux-mtd@lists.infradead.org; Wed, 07 Dec 2005 21:09:46 -0500
Received: by zproxy.gmail.com with SMTP id i11so513106nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Dec 2005 18:09:37 -0800 (PST)
Message-ID: <782515bb0512071809h1bb2ed83pe7ffab7ce074bd12@mail.gmail.com>
Date: Wed, 7 Dec 2005 20:09:37 -0600
From: nishanth menon <menon.nishanth@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: EBH Changes in Jffs2 broke Sibley Nor flash support in CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
Looks like my mail client seems to have some issues.. :(

After plodding through a bit of code for sometime, the culprit seems
to be the ebh changes done to CVS sometime in Nov 4th (Ref:
http://lists.infradead.org/pipermail/linux-mtd/2005-November/014232.html)
Here is a dirty little patch for the same. I am not very happy with
the kmalloc/kfree method I have done, but something on the lines is
worth it. I suspect it breaking NOR ECC/Dataflash too.. since I don't
see any dependency on c->cleanmarker_size or c->ebh_size anymore!!

Regards,
Nishanth Menon

--- mtd-latest-20051206/fs/jffs2/erase.c=092005-12-06 17:01:33.000000000 -0=
600
+++ 2.6_kernel/fs/jffs2/erase.c=092005-12-07 12:09:29.000000000 -0600
@@ -360,6 +360,7 @@
 static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb)  {
 =09struct jffs2_raw_node_ref *ebh_ref =3D NULL;
+=09unsigned char * cln_mrker=3DNULL;
 =09size_t retlen;
 =09int ret;
 =09uint32_t bad_offset;
@@ -391,7 +392,7 @@
 =09=09struct jffs2_raw_ebh ebh =3D {
 =09=09=09.magic =3D        cpu_to_je16(JFFS2_MAGIC_BITMASK),
 =09=09=09.nodetype =3D     cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
-=09=09=09.totlen =3D       cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
+=09=09=09.totlen =3D       cpu_to_je32(c->ebh_size),
 =09=09=09.reserved =3D     0,
 =09=09=09.compat_fset =3D  JFFS2_EBH_COMPAT_FSET,
 =09=09=09.incompat_fset =3D JFFS2_EBH_INCOMPAT_FSET, @@ -408,11 +409,20 @@
 =09=09ebh.node_crc =3D cpu_to_je32(crc32(0, (unsigned char *)&ebh +
sizeof(struct jffs2_unknown_node) + 4,
 =09=09=09=09=09 sizeof(struct jffs2_raw_ebh) - sizeof(struct jffs2_unknown=
_node) - 4));

-=09=09vecs[0].iov_base =3D (unsigned char *) &ebh;
-=09=09vecs[0].iov_len =3D sizeof(ebh);
+=09=09cln_mrker=3Dkmalloc(c->ebh_size,GFP_KERNEL);
+=09=09if (!cln_mrker) {
+=09=09=09printk(KERN_WARNING "Failed to allocate clean marker\n");
+=09=09=09goto refile;
+=09=09}
+=09=09memset(cln_mrker,0xde,c->ebh_size);
+=09=09memcpy(cln_mrker,&ebh,sizeof(ebh));
+
+=09=09vecs[0].iov_base =3D cln_mrker;
+=09=09vecs[0].iov_len =3D c->ebh_size;
 =09=09ret =3D jffs2_flash_direct_writev(c, vecs, 1, jeb->offset, &retlen);
+=09=09kfree(cln_mrker);

-=09=09if (ret || retlen !=3D sizeof(ebh)) {
+=09=09if (ret || retlen !=3D c->ebh_size ) {
 =09=09=09if (ret)
 =09=09=09=09printk(KERN_WARNING "Write eraseblock header to block at 0x%08=
x
failed: %d\n",
 =09=09=09=09       jeb->offset, ret);
