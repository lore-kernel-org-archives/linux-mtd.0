Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ht7ar-0003lp-N9
	for linux-mtd@lists.infradead.org; Tue, 29 May 2007 15:43:01 -0400
Subject: Re: Some issues with the AT91 dataflash driver...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ivan Kuten <ivan.kuten@promwad.com>
In-Reply-To: <20070528212513.5086bfac@newbox>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron>  <20070528212513.5086bfac@newbox>
Content-Type: text/plain; charset=utf-8
Date: Tue, 29 May 2007 22:42:43 +0300
Message-Id: <1180467763.3642.125.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-05-28 at 21:25 +0300, Ivan Kuten wrote:
> On Mon, 28 May 2007 20:44:40 +0300
> Artem Bityutskiy wrote:
>=20
> > On Sun, 2007-05-27 at 21:12 +0200, Haavard Skinnemoen wrote:
> > > On Sun, 27 May 2007 20:08:53 +0200
> > > Haavard Skinnemoen <hskinnemoen@atmel.com> wrote:
> > >=20
> > > > Now that I've got the CRC errors sorted out, I'll try bisecting it.
> > >=20
> > > Done. git-bisect blames this commit:
> >=20
> > Hi,
> >=20
> > whats mtd->writesize of the flash? Do you have the debugging output log=
?
> >=20
>=20
> MTD_DEBUG=3D3 enabled:

Sorry for long delay. I is not quite what I asked, but anyway, may you
pleas apply the below patch, reproduce the problem and send me the
result.

Please, do this faster if you can because I will need to disappear for
about 2 weeks in a day. I will try to figure out what is going wrong,
thanks.


diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 4884d5e..c629c54 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -761,7 +761,7 @@ static inline int read_dnode(struct jffs2_sb_info *c, s=
truct jffs2_raw_node_ref
 			len =3D min_t(uint32_t, rdlen - sizeof(*rd), csize);
 			tn->partial_crc =3D crc32(0, buf, len);
=20
-			dbg_readinode("Calculates CRC (%#08x) for %d bytes, csize %d\n", tn->pa=
rtial_crc, len, csize);
+printk("Calculates CRC (%#08x) for %d bytes, csize %d\n", tn->partial_crc,=
 len, csize);
=20
 			/* If we actually calculated the whole data CRC
 			 * and it is wrong, drop the node. */
@@ -780,7 +780,7 @@ static inline int read_dnode(struct jffs2_sb_info *c, s=
truct jffs2_raw_node_ref
 			 */
 			struct jffs2_eraseblock *jeb;
=20
-			dbg_readinode("the node has no data.\n");
+printk("the node has no data.\n");
 			jeb =3D &c->blocks[ref->flash_offset / c->sector_size];
 			len =3D ref_totlen(c, jeb, ref);
=20
@@ -919,7 +919,7 @@ static int read_more(struct jffs2_sb_info *c, struct jf=
fs2_raw_node_ref *ref,
 	/* We need to read more data */
 	offs =3D ref_offset(ref) + *rdlen;
=20
-	dbg_readinode("read more %d bytes\n", to_read);
+printk("read more %d bytes, needed_len %d\n", to_read, needed_len);
=20
 	err =3D jffs2_flash_read(c, offs, to_read, &retlen, buf + *rdlen);
 	if (err) {
@@ -1004,7 +1004,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info=
 *c, struct jffs2_inode_inf
 			len =3D end - ref_offset(ref);
 		}
=20
-		dbg_readinode("read %d bytes at %#08x(%d).\n", len, ref_offset(ref), ref=
_flags(ref));
+printk("read %d bytes at %#08x(%d), wbuf sz %d\n", len, ref_offset(ref), r=
ef_flags(ref), c->wbuf_pagesize);
=20
 		/* FIXME: point() */
 		err =3D jffs2_flash_read(c, ref_offset(ref), len, &retlen, buf);


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
