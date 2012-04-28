Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SO68b-0001uq-5H
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 11:48:29 +0000
Received: by lagy4 with SMTP id y4so1267524lag.36
 for <linux-mtd@lists.infradead.org>; Sat, 28 Apr 2012 04:48:25 -0700 (PDT)
Message-ID: <1335613694.1937.6.camel@koala>
Subject: Re: UBIFS mount error: No space left on device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matteo Mattei <matteo.mattei@gmail.com>
Date: Sat, 28 Apr 2012 14:48:14 +0300
In-Reply-To: <CAHea38QAtH52kLu29dztxLhfBBdPFdpSPUV3pyUxMCruBpPweg@mail.gmail.com>
References: <CAHea38QAtH52kLu29dztxLhfBBdPFdpSPUV3pyUxMCruBpPweg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mazxAX3uOACaI2a5BWxs"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mazxAX3uOACaI2a5BWxs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 14:34 +0200, Matteo Mattei wrote:
> Hi guys,
>=20
> After about 2 weeks with continuous read/write stress operation (w/o
> powercycles) I moved a board to the power-cycles reliability lab to
> perform also some other tests.
> After a while I had an error during mounting the filesystem.
>=20
> After a further analysis seems that there is not enough space to mount
> the device (I don't know who is the responsible for this because there
> is a quite big empty space in the device).

Yeah, I fixed several issues with this symptom in the past, probably not
all of them.

> Can you clarify why this strange behavior happened?

Probably a bug.

> Maybe there is not enough space in the journal?!

May be. I'd need your image to take a look - did you save it?

> Is there a way to avoid this or a workaround to let me to recover the boa=
rd?

Well, you can re-size the UBI volume a bit and add a couple more LEBs to
work this around.

> I have also one other question but not strictly related to this issue
> (maybe there are already some other threads on this, but I didn't find
> the answer): Do the UBI and UBIFS handle the erased space?
> If so, how do they handle it?

I do not understand the question.

--=20
Best Regards,
Artem Bityutskiy

--=-mazxAX3uOACaI2a5BWxs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPm9j+AAoJECmIfjd9wqK0/jUQAKWcFxY1UvuEXqJYtD8bpqy/
6KTPLA99I4rHz4CpVfD07GNRPoPR8ttbTeDaQjVGFTKvikdzWdRiHYyNlsNTBw5C
LIddDwbwkI2TBQ7Da2mflGLQpiLpAuWsXqdY/c5y1M5tjm+5RnneHChloqeHXg8c
0rUVrHPI3em1Do5/6m9IPJ5sQY8znUxU7WNZ/bIR73GvsOiDMY3UJlc9XUy6dcqf
xgQBzKhqI/UGsEQyFl6HmLaL3wF0VQSnMv3GFYarkch6d+A0WqSVtQt2Dgssix5v
BCxrS8uz3GZeJawkHTnlIGQLKnlYM89h9SKCsL81TJEsuxNf2Jiyl6b/yOb+jJVm
5hSM2XqHgIa8EC+roxeZ10npxTIyvZdVvQVPKZbeZsXFK4SD6TvukO3kWbRvnjZs
x4KvcmphCFEQ+utqi8yN3x1CoUwsBnq0vnEoZwc5GBhT2FGYtZP8+yHuatmg9oQi
KNQUrt/Y4uNSC+xJ/MjB92H2ArAywg81Y9Bby/T1j3XrMNZ3mdTZOuMsiI26dhgK
6fiQnc52OYNYC+y0uaSGEuEPJm8LAUz5JSM/XAPf7STAdo49j7DIfy5ay2/EpEcT
JhaPtrVs/ZtRGAqm+x/DGtXgRO3HRd/nDAHg8pufJbD4AfaSWT1kQcrJR9un14+u
m6i94hGlZ2xcH+lbRN3C
=oTkJ
-----END PGP SIGNATURE-----

--=-mazxAX3uOACaI2a5BWxs--
