Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEO09-0002r4-FM
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 23:18:52 +0000
Date: Tue, 14 Nov 2017 00:18:14 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [NAND] Question regarding -EIO error
Message-ID: <20171114001814.4aedd8ad@jawa>
In-Reply-To: <20171113221907.3f20c931@bbrezillon>
References: <20171113212701.01de0c47@jawa> <20171113221907.3f20c931@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wvoPpkXgXZPriJK2jCvwPbB"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/wvoPpkXgXZPriJK2jCvwPbB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boris,

Thanks for your reply.

> +Miquel who is working a lot on NAND stuff lately and might have faced
> the same kind of problems while working on ->exec_op().
>=20
> Hi Lukasz,
>=20
> On Mon, 13 Nov 2017 21:27:01 +0100
> Lukasz Majewski <lukma@denx.de> wrote:
>=20
> > Dear All,
> >=20
> > I was investigating the -EIO issue for page write from 2.6.26
> > kernel up till 4.14-rc7.
> >=20
> > A foreword:
> > -----------
> >=20
> > Before the commit (v4.4):
> > mtd: nand: increase ready wait timeout and report timeouts [1]
> > b70af9bef49bd9a5f4e7a2327d9074e29653e665
> >=20
> > The timeout for nand memory write (nand_page_write()) was ignored
> > (as mentioned in [1]).
> > The nand_write_page() (@nand_base.c) only checks for
> > NAND_STATUS_FAIL (and returns -EIO).
> >=20
> > In the old days it also used CONFIG_MTD_NAND_VERIFY_WRITE to check
> > if correct data is written (if not -EIO was returned immediately).
> > This was removed with [2]:
> > "mtd: kill MTD_NAND_VERIFY_WRITE"
> > 657f28f8811c92724db10d18bbbec70d540147d6
> >=20
> > The commit:
> > "mtd: nand_wait: warn if the nand is busy on exit"
> > f251b8dfdd0721255ea11751cdc282834e43b74e
> >=20
> > added WARN_ON() on timeout.
> >=20
> > Setup:
> > -----
> >=20
> > I've run mtd_*.ko tests on several kernels and two memories.
> >=20
> > With mtd_torture tests (and timeout set to 20ms):
> > modprobe mtd_torturetest dev=3D${device} check=3D1 cycles_count=3D100
> > gran=3D10
> >=20
> > forces both memories to timeout (at random execution place) with
> > -EIO error returned.
> >=20
> > Please correct me if I'm wrong:
> > -------------------------------
> >=20
> > With the new kernel (v4.14-rc7) we rely on:
> >=20
> > 1. Page write timeout increased from 20ms -> 400 ms (as in [1])
> >=20
> > 2. The WARN_ON() is displayed when we leave nand_wait() with ongoing
> > NAND controller operation.
> >=20
> > 3. As written in [2] the correctness of written data is check in
> > upper layers (fs) -> when memory return no fails, but internal
> > controller still writes data.
> >  =20
>=20
> Unless I miss something, I think you're correct.
>=20
> >=20
> > Problem:
> > --------
> >=20
> > Normally to exit nand_wait loop I do read RnB GPIO pin
> > (chip->dev_ready).=20
> >=20
> > When we got a timeout passed status from one memory is 0x81.
> > Second one returns no errors (0x80) - but the write data check
> > fails. According to spec bits 5 and 6 (of status register) are 0 ->
> > Internal data operation Busy and overall Busy. =20
>=20
> Yep, the NAND is not ready and all other bits in the STATUS reg can't
> be trusted (which might explain why bit0 changes from 1 to 0 between
> the 2 status read operations).

Indeed the memory is not ready.

Those two values 0x81 and 0x80 are from two different memories (when
the same test code is run).

>=20
> Quoting the ONFI spec:
>=20
> "
> RDY:
> If set to one, then the LUN or plane address is ready for another
> command and all other bits in the status value are valid. If cleared
> to zero, then the last command issued is not yet complete and SR bits
> 5:0 are invalid and shall be ignored by the host.
> "

Ok. I see. This means that RnB if present has higher priority than
reading status register (via 0x70 command).

>=20
>=20
> >=20
> > The problem here is that we exit nand_wait with NAND memory
> > controller still being busy. Timeout change[1] from 20ms -> 400ms
> > just 'masked' this issue. =20
>=20
> Theoretically yes, but in practice 400ms should be more than enough to
> complete a PROGRAM operation (actually is should even be enough to
> complete an ERASE operation).
>=20
> Did you experience any failures with the timeout set 400ms?

With changing timeout to 400 ms I do not see any issues (I do run
mtd_*.ko tests for +10h)

>=20
> >=20
> >=20
> > Question:
> > ---------
> >=20
> > Shall not we wait more (@nand_wait) for internal operations to be
> > finished? =20
>=20
> Well, we need a boundary, we definitely don't want to wait
> indefinitely, especially since the bug can be caused by a bad
> controller. This being said, if the PROGRAM operation timeouts, we
> should issue a RESET operation to hopefully end up in a well-known
> state.
>=20
> >=20
> >=20
> > To reproduce:
> > -------------
> >=20
> > Change back the timeout value from 400ms to 20m and run mtd_*.ko
> > tests. =20
>=20
> The problem you report was possible with a 20ms (especially for modern
> NANDs with big pages) but becomes unlikely with a 400ms timeout,

Yes. I can confirm that - up till now no issues observed with 400ms
timeout.

> simply because, even if the PROGRAM operation fails, it shouldn't take
> more than 100ms for the NAND chip to report it (put the R/B back to
> ready state and set the FAIL bit to 1 in the STATUS reg).

Ok.

>=20
> Just to be sure I understood correctly, is it something you managed to
> reproduce with a 400ms timeout or are you worried that it could happen
> because you've experienced it with an older kernel which had a 20ms
> timeout.

Up till now I was not able to reproduce this issue with 400ms timeout.

I was curious if changing timeout to 400 ms is the "correct" solution.
It seems like it is - since we give NAND memory enough time to finish
any page program operation.

>=20
> Note that I'm not against making the code more robust, I'm just trying
> to figure how urgent this is because we're in the middle of a huge
> rework (the ->exec_op() thing I was mentioning at the beginning of
> this reply) that could possibly help us with this kind of problems.

As I said above - no issues with 400 ms. I've backported the change [1]
and it works.

I'm mostly curious about the rationale.

>=20
> Regards,
>=20
> Boris
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/wvoPpkXgXZPriJK2jCvwPbB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloKKDYACgkQAR8vZIA0
zr06xQf+Ms0JJMkW3GYiChj9mt56MJ6NqNbicpEAPubFRJFRo2gqoprQy+dwXi0q
Ee//5bLxV+rlTmBbHNM2kYtG77KDCrrIMzMxJvNXrdMC5KoAWBLPpR4E4vDARHuO
ely7eoZV+vF4xrCWV3foklozvTd+TggtPFdUWul/RrjcqkgIz1OVSVEMXvAptUig
R7AybarLgGM1vdPcfhlqS9Yw5Y8Snge+kFVsGz+DBpx+CzctjkHoUT5SEkEqPq6a
wEscmOfo667Hb5d1c9oGJ/77zrXtbUwaGBWk47zaG1qlcgEHKQcbBFTAoBmjHRiV
0ijdeAl5zhFlegKCI+5Vau2TfKpHng==
=Y+Jf
-----END PGP SIGNATURE-----

--Sig_/wvoPpkXgXZPriJK2jCvwPbB--
