Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dzarz-0002yF-SN
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2005 10:02:31 -0400
Message-ID: <42EE2B78.70500@inf.u-szeged.hu>
Date: Mon, 01 Aug 2005 16:02:32 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru> <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
In-Reply-To: <20050801104343.GB32464@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:

>>diff -Narup Mtd-orig/fs/jffs2/build.c mtd/fs/jffs2/build.c
>>--- Mtd-orig/fs/jffs2/build.c	2005-07-22 12:32:07.000000000 +0200
>>+++ mtd/fs/jffs2/build.c	2005-07-29 18:43:16.000000000 +0200
>>@@ -334,6 +334,9 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>> 		c->blocks[i].first_node =3D NULL;
>> 		c->blocks[i].last_node =3D NULL;
>> 		c->blocks[i].bad_count =3D 0;
>>+#ifdef CONFIG_JFFS2_SUMMARY
>>+		c->blocks[i].sum_collected =3D NULL;
>>+#endif
>>   =20
>>
>
>I guess we can start removing some of the #ifdef ugliness already.
>The extra field per eraseblock can be added unconditionally, as can
>this line.
>
> =20
>
OK, we will eliminate all of these kind of #endifs.

>> 	D1(printk(KERN_DEBUG "Going to GC REF_PRISTINE node at 0x%08x\n", ref=
_offset(raw)));
>>=20
>>@@ -513,8 +514,9 @@ static int jffs2_garbage_collect_pristin
>> 	/* Ask for a small amount of space (or the totlen if smaller) because=
 we
>> 	   don't want to force wastage of the end of a block if splitting wou=
ld
>> 	   work. */
>>-	ret =3D jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2=
_raw_inode) + JFFS2_MIN_DATA_LEN,=20
>>-					      rawlen), &phys_ofs, &alloclen);
>>+	ret =3D jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2=
_raw_inode) +
>>+				JFFS2_MIN_DATA_LEN, rawlen), &phys_ofs, &alloclen, rawlen);
>>+				/* this is not optimal yet */
>>   =20
>>
>
>Can you add some more explanation to the comment?
> =20
>
OK, we will.

The reason of "this is not optimal" is the following: for
jffs2_reserve_space_gc() we have to specify an argument called sumsize.
It is the summary size of the requested node. It needs it, because it is
necessary to fit not only the node but also its summary representation
into the erase block. In all other cases we know exactly the summary
size of all nodes except in this case, so we made an upper-estimation her=
e.

>> 	if (ret)
>> 		return ret;
>>=20
>>@@ -594,7 +596,10 @@ static int jffs2_garbage_collect_pristin
>> 	nraw->__totlen =3D rawlen;
>> 	nraw->next_phys =3D NULL;
>>=20
>>-	ret =3D jffs2_flash_write(c, phys_ofs, rawlen, &retlen, (char *)node)=
;
>>+	vecs[0].iov_base =3D (unsigned char *) node;
>>+	vecs[0].iov_len =3D rawlen;
>>+
>>+	ret =3D jffs2_flash_writev(c, vecs, 1, phys_ofs, &retlen, 0);
>>   =20
>>
>
>Why this change?  If it's required, it might make sense to split it
>out into a preparatory patch.  But my gut feeling is that dropping
>this part would be better.
> =20
>
Jffs2_flash_write() simply write directly the data onto the flash, and
does not collect the summary information. Jffs2_flash_writev() does.

>>+#ifdef CONFIG_JFFS2_SUMMARY
>>+
>>+/* Called with alloc sem _and_ erase_completion_lock */
>>+static int jffs2_do_reserve_space_sum(struct jffs2_sb_info *c,  uint32=
_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
>>+{
>>   =20
>>
>[...]
> =20
>
>>+#else
>>+
>>+/* Called with alloc sem _and_ erase_completion_lock */
>>+static int jffs2_do_reserve_space_normal(struct jffs2_sb_info *c,  uin=
t32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
>>+{
>>   =20
>>
>
>It doesn't take too much creativity to combine this and the above
>#ifdef into a single one.  That will still be ugly, but it's a step in
>the right direction.
> =20
>
In the previous version it was combined, but we afraid of that it is
hard to see what exectly happen. But we can tranform it back.

Ferenc
