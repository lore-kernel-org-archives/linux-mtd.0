Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I5cIl-0000ez-AU
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 02:55:58 -0400
Subject: Re: What is subpage_sft??
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707022335h35d4d5ddpd8bdf9b7031bfa21@mail.gmail.com>
References: <9b52d64c0707022228u1d47fa1awfef79a9f6574b0f@mail.gmail.com>
	<000f01c7bd33$d71f6850$e1ac580a@swcenter.sec.samsung.co.kr>
	<1183441583.3531.8.camel@sauron>
	<9b52d64c0707022254r36a69cega523eb0dfb8a05df@mail.gmail.com>
	<9b52d64c0707022335h35d4d5ddpd8bdf9b7031bfa21@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 03 Jul 2007 09:55:25 +0300
Message-Id: <1183445725.3531.23.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-03 at 12:05 +0530, Vinit Agnihotri wrote:
> I am little bit confused with following UBI code.
>=20
> My initial understandings are as follows, please correct me if I am wrong=
.
> 1. A flash device has "n" no. of eraseblocks.
> 2. A eraseblock contains "m" no. of pages.
> 3. A page contains "l" no. of  subpages.
> 4. Subpage support is dependent on underlying NAND, so every NAND cant
> have subpage access.
> 5. Concept of subpages only exists in NAND flash not NOR.
Right.

> UBI code:
>  ubi->min_io_size =3D ubi->mtd->writesize;
NAND page size.
>  ubi->hdrs_min_io_size =3Dubi->mtd->writesize >> ubi->mtd->subpage_sft;
Sub-page size.
>  ubi->ec_hdr_alsize =3D ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
EC header size aligned to sub-page size.
>  ubi->vid_hdr_alsize =3D ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size);
VID header size aligned to sub-page size

> 6. min_io_size: is minimal i/o that can be performed on flash.
Yes, NAND page in case of NAND
> 7. writesize: is indeed a page size.
Right.
> 8. If subpages are not supported then hdrs_min_io_size =3D=3D writesize
Right,
> 9. So if writesize is 2048 bytes & if subpage_sft is 0, then ec & vid
> headers will be of 1 NAND page. So here in this case: min_io_size =3D=3D
> writesize =3D=3D hdrs_min_io_size.
Right.
> 10. Now if subpages are supported, then min_io_size !=3D
> hdrs_min_io_size. Now if we can write in alignment of hdrs_min_io_size
> which is less that min_io_size , then what is significance of
> min_io_size.
We use sub-page only for EC and VID headers. For UBI users we report
min_io_size, i.e. they do not know about sub-pages. Users have to submit
only min_io_size-aligned writes. Sub-page is used _only_ as an internal
optimization.

> i.e.
> If writesize =3D 2048
>   subpage_sft =3D 2
>   min_io_size =3D writesize =3D 2048
>   hdrs_min_io_size =3D writesize >> subpage_sft =3D 512
>   hdrs_min_io_size < min_io_size
>=20
> Now if we can write hdrs_min_io_size of data to flash then what is
> notion of min_io_size???

See above.

The main reason why we do not make min_io_size =3D sub-page, but still
expose whole NAND page size as the minimal Input/Output unit is because
sub-page stuff is kinda tricky and hacky.

If you glance to nand_base.c how sub-page write is implemented, you'll
notice that if you wanna write a sub-page, it still writes whole NAND
page, but data in the sub-pages other then the one you are writing to
are set to 0xFF. IOW, sub-page write takes as much time as whole page
write.

If we'd expose sub-page as minimal I/O unit (which we actually used to
do!), JFFS2'd become slower (when it is used on top of UBI). Indeed,
compare 512bytes which is flushed as slow as 2KiB write-buffer - 4x I/O
speed regression.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
