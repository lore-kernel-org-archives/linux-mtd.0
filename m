Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I89iq-00013B-SI
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 03:01:23 -0400
Subject: Re: overflows while calculating volume->used_bytes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707092237x48c149cdy24b6eaf1d0baa184@mail.gmail.com>
References: <9b52d64c0707092237x48c149cdy24b6eaf1d0baa184@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 10 Jul 2007 10:01:08 +0300
Message-Id: <1184050868.3531.67.camel@sauron>
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

Vinit,

On Tue, 2007-07-10 at 11:07 +0530, Vinit Agnihotri wrote:
> I was experiencing overflows in multiplications for
> volume->used_bytes in vmt.c & vtbl.c, while creating & resizing large vol=
umes.
>=20
> vol->used_bytes is long long however its 2 operands vol->used_ebs &
> vol->usable_leb_size
> are int. So their multiplication for larger values causes integer overflo=
ws.
> Typecasting them solves the problem.
>=20
> My machine & flash details:
>=20
> 64Bit dual-core AMD opteron, 1 GB RAM, linux 2.6.18.3.
> mtd size =3D 6GB, volume size=3D 5GB, peb_size =3D 4MB.
>=20
> heres patch which does the fix.

Thanks for the patch. Just one note:

you can add only one (long long) prefix before the first operand, no
need to add it to the second one and make the line too long so that
you need to split it.

> +		vol->used_bytes =3D (long long)vol->used_ebs *
> +							(long long)vol->usable_leb_size;

Like here it could be
 +		vol->used_bytes =3D (long long)vol->used_ebs * vol->usable_leb_size;

Otherwise the patch looks good. Will you resend it or you are fine if I
amend it myself?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
