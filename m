Received: from moutng.kundenserver.de ([212.227.17.8])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDCi8-0001LU-Nb
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 12:45:14 +0000
Message-ID: <52FA1B39.2070904@corscience.de>
Date: Tue, 11 Feb 2014 13:44:41 +0100
From: =?UTF-8?B?QW5kcmVhcyBCaWXDn21hbm4=?=
 <andreas.biessmann@corscience.de>
MIME-Version: 1.0
To: star@gmx.li, biessmann@corscience.de, peter.barada@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: Linux MTD: Per Partition ECC
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>
In-Reply-To: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ONqn8FE3kbsrmJ20TD6xxs0bODOBLPr3r"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ONqn8FE3kbsrmJ20TD6xxs0bODOBLPr3r
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear star@gmx.li,

cc linux-mtd, one may have more information on that topic there.

On 02/11/2014 12:58 PM, star@gmx.li wrote:
> Dear Peter, dear Andreas,
>=20
> I just found this during my research:
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2012-September/044120.ht=
ml=20
>
> I  have simular Problem, to update a device which runs on 1 bit SW-ECC =
out of linux to 'on-die-ECC'
>=20
> I duplicated the board partition table (Linux 2.6.33) in a first step. =
Now each partition can be access  with 2 names
> /dev/mtd4 or /dev/mtd8 as example.

D'oh why the hell should one do that? I dunno if this is sane with
synchronisation between different access layers (e.g. two different
instances of filesystem).

> But how can I addict a ECC scheme to a certain partition? Do you think =
this is a possible way?
> So access /dev/mtd4 with software ECC and /dev/mtd8 with on-die-ecc?

AFAIK there is no way to do per partition ecc currently. So there is no
way to support this without changing the whole mtd framework.
But maybe there was some movement since my last check. Maybe one of the
mtd developers could comment on that.

Nevertheless the ECC scheme of Linux 1Bit hamming SW ECC is likely to be
different than the Micron (or whatever manufacturer you use)
'on-die-ECC', therefore there is no chance to support 'partition A' and
'partition B' working on the very same hardware with these different ECC
schemes. You can only support scheme A _or_ scheme B at a time. I mean
for the whole process of storing the data and reading it out of the
device. Is the data physically written with scheme A it would fail to
read with scheme B and vice versa.

> Andreas can you provide the complete patch for you version?=20

You just found the complete patch [2] if you red the link mentioned above=
=2E

> Problem for me is, I am always running on a mtd partition.

Well, my patch provides a solution for a very special case. Doing system
update of embedded devices in the field and switching the ECC scheme of
one partition (the first one, which boot ROM is reading) to OMAP3 1 bit
hamming HW ECC scheme while the rest of the device is 8 bit BCH SW ECC
scheme (it is 'HW-assisted', cause of missing ELM in OMAP3; I know there
were some patches cleaning this up, dunno the current state).
I can do that cause we kexec the update firmware which brings the
omap-nand mtd driver as a module. That module then can be configured to
switch the ECC scheme when probing. The trick is to load it twice,
sequential with different setup.
As discussed in [1] this solution is only useful when doing such very
special update strategies. So sorry, I think it won't help you.

> As a workaround I do have 2 root partitions which can be boot alternati=
vely.

Sorry, I fail to understand how that would help here. The point is you
need to patch your SPL, bootlaoder and kernel to support the newer ECC
scheme and update all of them at once. If the procedure fail then your
device is likely to be bricked ...

Best regards

Andreas Bie=C3=9Fmann

[1] http://thread.gmane.org/gmane.linux.drivers.mtd/50364
[2] http://article.gmane.org/gmane.linux.drivers.mtd/43804


--ONqn8FE3kbsrmJ20TD6xxs0bODOBLPr3r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJS+hs5AAoJEHPlkEBPIQBjrV0QAJtYc31JObDQrsIQEIUUQ5rL
rT36z/FX+ltTlY11VInmVnrPHgVdfxPD1eBJVms9tjHPR56GDK9i/suTBNao4RR8
daJzwKZUb1hcaEN/FOQy2remdD5GD4t0zwlMBGpdFTwBTHlF5QQz2ZXnG4t3oNlb
hNo2Fs8dmx0qgQ78TdT+xtbFuZja07ikfmUKBlVDWPFtsw1dnIxpGEEYrMEjghX7
P6q1hsDEMS5CIEaCXiatjGIYgyNRXvzO6bVecm2VCDtIaoqxOsQXXVnPwbbZEPP8
foQ/da8E+YwTzOyaHzqbS6inCZ0MXMwUIasdvG+MN/ilVEHsNxtUD1nitYMcy9JS
VpeLjvxT2qnLz0AhcAsUD4Ff3ukDKpOihF/+tYZWKcg857xrtlnYXZ903/M8GIvc
X48bfiEeAgglkxCuzFev6Wfjx1P1zaD7+Tng6HvJE27TpG5IvB2sq+3nWNHIHgMY
GcFlQTn4f5+lTLjuPak6vneYPU62zbOVktKU33MrsVsrBQpovZZ+k/kRLAHSTNEF
vw4s1BXjGebJrTJG4j0EXSvu0O116xOcRA3Sy0k1za2X8tu6jgTovfujkXsENc8S
XsXmtfMi8rVPD3EvFDvYXTHtJemXQLDLVTZyzAZUXLuY8tw7KYoyaXAbOqCkKhHY
Qjocv5QJfa5ZgJ0r/55Q
=PM44
-----END PGP SIGNATURE-----

--ONqn8FE3kbsrmJ20TD6xxs0bODOBLPr3r--
