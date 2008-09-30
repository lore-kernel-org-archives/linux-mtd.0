Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkXuM-0007s0-Er
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 05:36:27 +0000
Subject: Re: just wondering about write_leb() in ubi/upd.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Monte Copeland <catboatmonte@gmail.com>
In-Reply-To: <1fc50b580809291135s3dbf8269ga12917d1b0b65e9e@mail.gmail.com>
References: <1fc50b580809291135s3dbf8269ga12917d1b0b65e9e@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Sep 2008 08:35:56 +0300
Message-Id: <1222752956.8051.1.camel@sauron>
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

Hi,

On Mon, 2008-09-29 at 13:35 -0500, Monte Copeland wrote:
> I just fixed a bug in our older UBI version and decided to check the
> upstream.  Looking at the latest from kernel.org,
> I see in the write_leb() function in ubi/upd.c:
>=20
>         if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
>                 len =3D ALIGN(len, ubi->min_io_size);
>                 memset(buf + len, 0xFF, len - len);   <---- memset zero b=
ytes?
>=20
>                 len =3D ubi_calc_data_len(ubi, buf, len);
>                 if (len =3D=3D 0) {
>                         dbg_msg("all %d bytes contain 0xFF - skip", len);
>                         return 0;
>                 }
>=20
>                 err =3D ubi_eba_write_leb(ubi, vol, lnum, buf, 0, len,
> UBI_UNKNOWN);
>         } else {

Monte,

thanks for the report, but we fixed this already and the fix will show
up in 2.6.28. See

commit a0fd1efd488092951f310fdb777b8a540cf84dcb
Author: Kyungmin Park <kmpark@infradead.org>
Date:   Wed May 21 14:34:56 2008 +0300

    UBI: fix buffer padding

    Instead of correctly pad the buffer wich we are writing to the
    eraseblock during update, we used weird construct:

    memset(buf + len, 0xFF, len - len);

    Fix this.

    Signed-off-by: Kyungmin Park <kmpark@infradead.org>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
