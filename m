Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGTuC-0000RU-JB
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 12:06:25 +0000
Message-ID: <1348574785.20474.15.camel@sauron.fi.intel.com>
Subject: Re: Problem with verify-ing patch (error: arch/m68k/Kconfig.cpu:
 patch does not apply)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 25 Sep 2012 15:06:25 +0300
In-Reply-To: <CACna6ryu06qsgX99kdkeDaB+XJv4XwC0-O+5ysNFa1iOMEgNow@mail.gmail.com>
References: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
 <1348499094.4880.65.camel@sauron.fi.intel.com>
 <CACna6ryu06qsgX99kdkeDaB+XJv4XwC0-O+5ysNFa1iOMEgNow@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+y6MIZhCw69BjMlJ8m/b"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+y6MIZhCw69BjMlJ8m/b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-25 at 11:33 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/9/24 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2012-09-24 at 13:14 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> I wanted to verify my patch before sending it.
> >>
> >> TRY[0]:
> >> > ./verify ../wireless-testing/ mips-bcm47xx_defconfig < ../nand4/0001=
-mtd-prepare-place-for-BCMA-NAND-flash-driver-s.patch
> >> error: patch failed: arch/m68k/Kconfig.cpu:28
> >> error: arch/m68k/Kconfig.cpu: patch does not apply
> >>
> >> Weird. My patch doesn't touch m68k and applies cleanly to the
> >> ../wireless-testing tree:
> >>
> >> > cd ../wireless-testing/
> >> > git am ../nand4/0001-mtd-prepare-place-for-BCMA-NAND-flash-driver-s.=
patch
> >> Applying: mtd: prepare place for BCMA NAND flash driver(s)
> >>
> >> Help? :|
> >
> > It tries to apply quick fixes - I carry them because the kernel gets
> > broken in various places all the time. So you need to fix the quick
> > fixes patch - probably a fix was applied in upstream already.
> >
> > Obviously, quick fixes are in maintaining.git, not in the generic aiaia=
i
> > tools. They are in 'quick_fixes.mbox'.
> >
> > In this case it easy - the m68k patch get merged upstream and just can
> > be dropped from quick_fixes.mbox. Just done that and pushed out.
>=20
> Thanks. Unfortunately I'm still having problems with verify/aiaiai :|
>=20
> After your change I started verify again and it took 3 minutes to let
> me know it needs mips-linux-gcc. I had to install it (OpenWRT is using
> it's own toolchain).
>=20
> Then I started again and after 3 minutes: lacking sparse
>=20
> 3 minutes later: lacking smatch
>=20
> 3 minutes later: lacking cppcheck
>=20
> 3 minutes later: lacking spatch
>=20
> I'm not sure what's going to be next. I'm sure that things are obvious
> for you, but beginner can really get irritated before he manages to
> setup everything... ;/

Rafal, your complaints are fair, thanks. This needs some more work. I'll
add checks for all the required tools in the scripts so that they will
fail right away with a user-friendly messages.

But one thing is obvious for me - you did not read the docs in aiaiai
projects. Well, fair enough, typical users do not read docs :-) The docs
tell where to get tools, how to compile, etc. I think they also tell
where to download pre-build compilers even, but I should check this
part :-)

I'll do the fixes as soon as I have some time, please, keep bugging me
and thanks for your feed-back!

--=20
Best Regards,
Artem Bityutskiy

--=-+y6MIZhCw69BjMlJ8m/b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYZ5BAAoJECmIfjd9wqK0jWEP/0egvZ7S59J27W659PLpEorS
HxzABiy+dpl3q7Kv7BUNLpDtVYKUJkBeS+9jVKMnCHCsqYkBa5WsEsENVXprYr0B
NdvDi+g8QbhQBtFg7bY+vtgMqSCKkoczzhqFwesa9x2ZH1RfGRRdnl2z+3gTEsri
XvCWRi9DAaO8ugs5t0srRn6ZiwfRX0oz9absIgiOC7pq6x8VjLNN5zhNX8HjoL5Q
1Tm+3EOCe2WCADSTdgv7L8PHQySZJXhhwgSpiy4XBJ2/eTWniTejuy9+X4xepXjH
/EXSCCCQeDFiILArl7mrNkLZUbWHRTsvYnmn3hU9YfmGFv+IT/Ykp/O2kBA6cM3b
LxQVEZQK9g7VGwfQkoEJ77d9+VI9qTbE3/veRn1XeMsE/FwPVfvj61ntILfrtHvQ
KxNxDu3c5s7MS52nBEoZCSX+n+J/bNPkSjvRPaH9f/2nTrG1ZHpx5ZDyxrxiFwaD
M7jNiJ7N5RqgMX8ULyXaLhrjkcy/YUcPPlhqUljU09y9pqno+BkAYq1EPkF7JbbS
mieMIGtuIpgdtOqZscIp8V2ZOiZ5RhZy4FXWkXYW0wrXEbsq1R2OV/AFHRNmctT2
p3AHVIUDuqwbwtpdk/ykRk6CvaJ/tvVXQzHbzp765l02fq+cfLvoR+I6RwSyiPFI
/G3fwwIvfNvlQnNfs9uv
=dT1w
-----END PGP SIGNATURE-----

--=-+y6MIZhCw69BjMlJ8m/b--
