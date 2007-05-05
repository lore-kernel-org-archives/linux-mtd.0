Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkKcj-0004OF-4b
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 09:48:49 -0400
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705050632y6ffa11a3qeb89f5e6e92da681@mail.gmail.com>
References: <463A04A5.5030103@gmail.com>
	<a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
	<463BC019.40305@gmail.com>
	<a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
	<1178366959.3659.95.camel@sauron>
	<a781481a0705050632y6ffa11a3qeb89f5e6e92da681@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 16:48:21 +0300
Message-Id: <1178372901.3659.132.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Florin Malita <fmalita@gmail.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-05-05 at 19:02 +0530, Satyam Sharma wrote:
> > write_error:
> > 	if (err =3D=3D -EIO && ++tries <=3D 5) {
> > 		/*
> > 		 * Probably this physical eraseblock went bad, try to pick
> > 		 * another one.
> > 		 */
> > 		list_add_tail(&new_seb->u.list, &si->corr);
> > 		goto retry;
> > 	}
> > 	kfree(new_seb);
> > out_free:
> > 	ubi_free_vid_hdr(ubi, vid_hdr);
> > 	return err;
>=20
> Ummm ...
>=20
> 1. "if (err =3D=3D -EIO)" applies to adding new_seb to the corrupted list=
,
> and not to retrying. We wouldn't want _not_ to retry if there's some
> other error, or would we?

In case of other error - no, we do not want to retry. Only in case of
-EIO because we just might have hit a new badblock, which is unlikely,
but possible.

If it is anything else then -EIO, then we just return an error and
_refuse_ to attach this MTD device. In this case it does not matter
where we add new_seb. We just drop it. We free all allocated data
structures.

> 2. "if (++tries <=3D 5)" applies to "goto retry" and not to adding
> new_seb to the corrupted list. If we hit write failure for the 5th
> time and err =3D=3D -EIO, we should still be adding it to corrupted list,
> but not retry, of course. Otherwise we would add the first 4 write
> failure (with -EIO) eraseblocks to si->corr, but the 5th _similar_
> case is ... just freed?

If we hit -EIO more then five times, there is probably something _really
bad_ with this MTD device and we _refuse_ attaching it. We return error,
and every data structure is freed. It does not matter if we add new_seb
anywhere or not. It is anyway just freed.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
