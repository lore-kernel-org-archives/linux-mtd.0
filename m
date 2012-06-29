Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkbSc-0005PE-Rg
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 13:42:11 +0000
Message-ID: <1340977577.3070.207.camel@sauron.fi.intel.com>
Subject: RE: UBIFS fails to mount on second boot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Fri, 29 Jun 2012 16:46:17 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
 ,<1340806219.3070.23.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-j1ynzSlCb6ECcDwSk6Uf"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-j1ynzSlCb6ECcDwSk6Uf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 16:05 +1000, Iwo Mergler wrote:
> > > It is possible to avoid the failure by performing a large number of
> > > filesystem operations (i.e. file system benchmark) during the first
> > > session.
> >
> > Hmm, sounds strange.
>=20
> While trying to reproduce the problem, I have come across another
> way to avoid it. If the boot scripts in the rootfs perform an
> ubiformat, attach, mkvol & mount on an unrelated empty mtd
> partition, the problem goes away.
>=20
> Is there any global state shared between separate UBI/UBIFS
> partitions?

No. Do you MTD partitions overlap? What is in /proc/mtd ?

> > This means the driver is buggy: it does not support sub-pages but
> > still reports that it does. Just fix it instead.
>=20
> I was under the impression that the subpage capability is extracted
> from the ONFI information. So I take it there is a flag for the
> driver to override that?

I do not know your system, but if your flash chip supports subpages, but
the ECC you use does not allow them, the driver should report that
sub-pages are not supported..

> > Did you try to mount an empty volume and let UBIFS auto-format it, and
> > then reproduce the issue?
>=20
> No, UBIFS created from an empty partition work OK. In fact, doing that
> also stops the rootfs mount failure on the second boot.

Sounds like this is not UBIFS fault but rather like a side-effect of
something strange happening elsewhere. Probably it is related to how you
flash it.

We had the following issue in the past.

1. You have some UBI on your flash. Then you want to flash an new image.
2. The flasher for some reason did not erase some PEBs of the partition.
Probably because Linux view of the partition and flashers did not 100%
match. Anyway, on or few PEBs were not erased in the end of the
partition. Lets call them "ghost PEBs".
3. We flashed new image.
4. UBI attached the partition, the ghost PEBs were scanned and treated
as valid PEBs and their data appeared in one of the volumes, because
their generation numbers were higher than in PEBs from the new image
(the generation number is in the UBI headers). The ghost data, instead
of valid data, was read by UBIFS. And we had strange corruptions.

We introduced so-called "image sequence number" to catch such issues. It
is stored in the EC header. All EC headers on the MTD device have to
have the same. Every time we generate an image - we pick random one. So
if there are ghost PEBs, we notice this because they have a different
image sequence number.

See 'image_seq' in drivers/mtd/ubi/ubi-media.h.

Can this problem affect you as well?

If you use 'ubiformat' for flashing your images, it will generate a
random image sequence number every time it flashes. So it won't use the
one in the image.

Do you use ubiformat for flashing? If not, try to re-generate your image
- ubinize will put a different number there, and flash it and see what
happens. You'd get an error like this:

UBI error: process_eb: bad image sequence number 3726164569 in PEB 47,
expected 642536469

Additional thoughts...

I think what could be more interesting if you could enable debugging for
real. The docs on the web-site are out of date and we switched to
dynamic debugging, so you need to enable the debugging messages
differently. I need to write a howto, and I do not know how to do this
via kernel cmdline so far, need to find out. I know how to do this via
debugfs. But check Documentation/dynamic-debug-howto.txt.

The image is not very helpful. UBI or UBIFS messages would probably
allow to track what UBI/UBIFS is doing to the "faulty" LEB and
corresponding PEB and verify that it is ok. But I really have a strong
feeling it is not UBI/UBIFS fault, so may be we'd spend time to just
prove this.

--=20
Best Regards,
Artem Bityutskiy

--=-j1ynzSlCb6ECcDwSk6Uf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7bGpAAoJECmIfjd9wqK0XHUQAJlBRpAYz+4IRnccXdxzqdBs
ENd2cSqwThGvqybmjQx8G3xk5+OjBQSdM409WByNcQVhYWuTq2vw7uKwclCPFhSp
s8fzw86TpkxO0dvqksaE9rHkCKygmRWo0ZVXs4HKWW058MH4EJ5TXc+92nBWnFrv
+nsWJ12J8zHGuf5mHIYkF3IKsGWNxqLjO1DqMWEbeAy0j0xU7+ZkXmfPGGo5CN+F
aa0eglylq71ZyySZVLoDpgGbHPFqrb3DgpfsLeHMNpZvfIVvJA9WBSQV52YkciFa
2t7B2GzsW+1EEewq7l2br+TAzDDXXeyhwlZGQETeNEMR7/WdEQk+bz01N8UkYJlh
4GCn8nE85eaqNforU9xyCPq+I/AqhFmLrmVKCE0dUOIKxk9qDzXNW7MO3wGmvIAI
anSqf84N1WgtKD9dsdZHxgrAUM1jiBE5FsJXIpaOdU22cfqvu0Og5fUwxrzsjF76
OJP8T5QRTLQwSaNx5pzWD8yLiwNVzi+H9g+Bezl9hLbmp+8+GWpXQQxQ3/bXxryw
iqptP/hm5q2/J+fyH65J8Ph0NZ5EDNaxXi9CwSJwG2rXR2JUKkbEXkZMJ2UUS8b4
gxVeGzjYHdackpDTqcnHyZDYoJB/hGsgQikKmx/U9o0Y24GojK90BennBErAcwGu
ymqShV94O+rYN/qsu5q5
=4e6C
-----END PGP SIGNATURE-----

--=-j1ynzSlCb6ECcDwSk6Uf--
