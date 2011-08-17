Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtZjG-0006Zg-Bj
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 06:35:55 +0000
Received: by bke17 with SMTP id 17so569899bke.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 23:35:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303284633.2700.3.camel@localhost>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
	<1302873423.3220.45.camel@localhost>
	<BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
	<1303031774.2308.13.camel@koala>
	<BANLkTi=We=H92+DHuJF7TPVUagePgqF48g@mail.gmail.com>
	<1303115951.2815.35.camel@localhost>
	<BANLkTim2aXQY5YzJkadHWT_NQ2XNupTHBA@mail.gmail.com>
	<1303284633.2700.3.camel@localhost>
Date: Wed, 17 Aug 2011 14:35:49 +0800
Message-ID: <CA+DaZUmMu5bCVCx=Ekj1QA9jQGu8t80CecQj-tAw_CKtymHoXA@mail.gmail.com>
Subject: Re: UBI memory usage on large page nand
From: Nicholas <ciliwung36@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem,

1. drivers/mtd/ubi/build.c

attach_by_scanning(struct ubi_device *ubi)

        ubi->min_io_size =3D ubi->mtd->writesize;
        ubi->hdrs_min_io_size =3D ubi->mtd->writesize >> ubi->mtd->subpage_=
sft;
+       ubi->max_write_size =3D ubi->mtd->writesize;

-      ubi->peb_buf1 =3D vmalloc(ubi->peb_size);
+      ubi->peb_buf1 =3D vmalloc(ubi->max_write_size);
        if (!ubi->peb_buf1)
                goto out_free;

-       ubi->peb_buf2 =3D vmalloc(ubi->peb_size);
+      ubi->peb_buf2 =3D vmalloc(ubi->max_write_size);
        if (!ubi->peb_buf2)
                goto out_free;

2. drivers/mtd/ubi/kapi.c

ubi_do_get_device_info(struct ubi_device *ubi, struct ubi_device_info *di)

        di->min_io_size =3D ubi->min_io_size;
+      di->max_write_size =3D ubi->max_write_size;
        di->ro_mode =3D ubi->ro_mode;

3. drivers/mtd/ubi/ubi.h

    * @dbg_buf_mutex: protects @dbg_peb_buf
+  * @max_write_size : maximum write buffer size

struct ubi_device {

        unsigned int bad_allowed:1;
        unsigned int nor_flash:1;
+      int max_write_size;

4. fs/ubifs/ubifs.h
     * @min_io_shift: number of bits in @min_io_size minus one
+   * @max_write_size: maximum amount of bytes the underlying flash
can write at a
+   *                  time (MTD write buffer size)

        int min_io_shift;
+     int max_write_size;

5. fs/ubifs/super.c

int init_constants_early(struct ubifs_info *c)

        c->min_io_shift =3D fls(c->min_io_size) - 1;
+      c->max_write_size =3D c->di.max_write_size;

int mount_ubifs(struct ubifs_info *c)

	dbg_msg("min. I/O unit size:  %d bytes", c->min_io_size);
+	dbg_msg("max. write size:     %d bytes", c->max_write_size);

-        if (!mounted_read_only) {
-                c->ileb_buf =3D vmalloc(c->leb_size);
-                //c->ileb_buf =3D vmalloc(c->max_write_size);
-                if (!c->ileb_buf)
-                        goto out_free;
-        }

    out_free:
	kfree(c->bu.buf);
-	vfree(c->ileb_buf);
	vfree(c->sbuf);

ubifs_umount(struct ubifs_info *c)

	kfree(c->bu.buf);
-	vfree(c->ileb_buf);
	vfree(c->sbuf);

6. fs/ubifs/tnc_commit.c

fill_gap(struct ubifs_info *c, int lnum, int gap_start, int gap_end, int *d=
irt)

			ubifs_assert(alen <=3D gap_remains);
-			err =3D make_idx_node(c, c->ileb_buf + gap_pos, znode,
-					    lnum, gap_pos, len);
+			err =3D make_idx_node(c, c->sbuf + gap_pos, znode,
+					    lnum, gap_pos, len);

-  ubifs_pad(c, c->ileb_buf + gap_pos, pad_len);
+ ubifs_pad(c, c->sbuf + gap_pos, pad_len);

layout_leb_in_gaps(struct ubifs_info *c, int *p)

/*
	 * Scan the index LEB.  We use the generic scan for this even though
	 * it is more comprehensive and less efficient than is needed for this
	 * purpose.
	 */
-	sleb =3D ubifs_scan(c, lnum, 0, c->ileb_buf, 0);
+	sleb =3D ubifs_scan(c, lnum, 0, c->sbuf, 0);

        if (err)
		return err;
-	err =3D ubifs_leb_change(c, lnum, c->ileb_buf, c->ileb_len,
-			       UBI_SHORTTERM);
+	err =3D ubifs_leb_change(c, lnum, c->sbuf, c->ileb_len,
+			       UBI_SHORTTERM);

7. fs/ubifs/orphan.c

ubifs_mount_orphans(struct ubifs_inf *c, int unclean, int read_only)

        if (!read_only) {
-               c->orph_buf =3D vmalloc(c->leb_size);
+              c->orph_buf =3D vmalloc(c->max_write_size);
                if (!c->orph_buf)
                        return -ENOMEM;
        }

8. fs/ubifs/lpt.c

lpt_init_wr(struct ubifs_info *c)

-	c->lpt_buf =3D vmalloc(c->leb_size);
-	if (!c->lpt_buf)
-		return -ENOMEM;

9. fs/ubifs/lpt_commit.c

int write_cnodes(struct ubifs_info *c)

	struct ubifs_cnode *cnode;
-	void *buf =3D c->lpt_buf;
+	void *buf =3D c->sbuf;

int lpt_gc_lnum(struct ubifs_info *c, int lnum)

	int err, len =3D c->leb_size, node_type, node_num, node_len, offs;
-	void *buf =3D c->lpt_buf;
+	void *buf =3D c->sbuf;

ubifs_lpt_free(struct ubifs_info *c, int wr_only)

-	vfree(c->lpt_buf);
-	c->lpt_buf =3D NULL;
+	vfree(c->sbuf);
+	c->sbuf =3D NULL;

Since lpt & orphan's buffer is only used while doing commit, i think
there's a chance to use sbuf for commit activity.
Is there any chance to shrink the "c->sbuf" from fs/ubifs/super.c ?
>From this modification, the memory is shorten to 2~3MB for 8KB page
size of NAND.

Please have a correction or any idea will be highly recommended.

Thanks,
Alex

On Wed, Apr 20, 2011 at 3:30 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> Hi,
>
> On Wed, 2011-04-20 at 11:19 +0800, Nicholas wrote:
>> Dear Artem,
>>
>> Sorry for my late reply .
>
> Please, send proper Linux kernel patches. Hints:
>
> 1. Make a separate patch pere change, so that on modification is done by
> one patch. In your case, one buffer improvement pere patch.
> 2. Write good commit message.
> 3. Use git format-patch to create patches.
>
>>
>> #define MTD_SMALL_SIZE_PAGE_BLOCK_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A00x4000=
0 // block size for 2KB
>
> No, please just make buffer size to be ubi->max_write_size. Kill this
> constant.
>
>> orphan.c
>> In ubifs_mount_orphans()
>> c->orph_buf =3D vmalloc((c->leb_size)/4); // for temporary
>
> Similarly, just use ubi->max_write_size instead.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
