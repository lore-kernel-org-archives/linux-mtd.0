Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8xnW-0001iW-QI
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 08:30:27 -0400
Subject: Re: UBI: io_write_path
From: Artem Bityutskiy <dedekind@infradead.org>
To: brijesh.singh@calsoftinc.com
In-Reply-To: <33922.172.16.0.34.1184236297.squirrel@webmail.calsoftinc.com>
References: <33922.172.16.0.34.1184236297.squirrel@webmail.calsoftinc.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 12 Jul 2007 15:28:58 +0300
Message-Id: <1184243338.3531.116.camel@sauron>
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

On Thu, 2007-07-12 at 16:01 +0530, brijesh.singh@calsoftinc.com wrote:
> Hi,
>    I walked through eba_write path.I found that,if EBUSY or EAGAIN is
> returned as err code from ubi_io_write_vid_hdr or ubi_io_write_data
> ,still the PEB is put back to wear-levelling.This is
> unnecessary.Shouldn't it retry on same PEB again?

AFAICS if any error except -EIO is returned, we just return it up (see
below)

Probably you are right, -EBUSY and -EAGAIN could be treated differently.
We could put this LEB and try a new one. But we cannot try the same one
I guess, at least it does not sound safe. Who knows, may be something
was written? It is safer to take a new PEB. But yes, it is not
necessarily to torture this LEB in case of -EBUSY and -EAGAIN.

Feel free to send a patch. It would be also nice if you pointed when MTD
could return these errors, because I doubt it is possible in current
implementation. But anyways, handling those gracefully is good.


> Code Snip:
> -------------------------------------------------------------------------=
---
> retry:
> 	pnum =3D ubi_wl_get_peb(ubi, dtype);
> 	if (pnum < 0) {
> 		ubi_free_vid_hdr(ubi, vid_hdr);
> 		leb_write_unlock(ubi, vol_id, lnum);
> 		return pnum;
> 	}
>=20
> 	err =3D ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
> 	if (err) {
> 		ubi_warn("failed to write VID header to LEB %d:%d, PEB %d",
> 			 vol_id, lnum, pnum);
> 		goto write_error;
> 	}
>=20
> 	err =3D ubi_io_write_data(ubi, buf, pnum, offset, len);
> 	if (err) {
> 		ubi_warn("failed to write %d bytes at offset %d of LEB %d:%d, " "PEB
> %d", len, offset, vol_id, lnum, pnum);
> 		goto write_error;
> 	}
> ...
>=20
> write_error:
> 	if (err !=3D -EIO || !ubi->bad_allowed) {
> 		ubi_ro_mode(ubi);
> 		leb_write_unlock(ubi, vol_id, lnum);
> 		ubi_free_vid_hdr(ubi, vid_hdr);
> 		return err;
> 	}

So here we switch to RO mode and return the error up. We could do
better. Like -ENOMEM should not cause switching to RO mode. -EAGAIN and
-EBUSY - similarly.

I bet there are other places where error handling could be smarter. Feel
free to send patches.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
