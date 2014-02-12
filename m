Received: from moutng.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDX1C-00054s-Gd
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 10:26:15 +0000
Message-ID: <52FB4C28.8020300@corscience.de>
Date: Wed, 12 Feb 2014 11:25:44 +0100
From: =?UTF-8?B?QW5kcmVhcyBCaWXDn21hbm4=?=
 <andreas.biessmann@corscience.de>
MIME-Version: 1.0
To: star@gmx.li
Subject: Re: Aw: Re: Linux MTD: Per Partition ECC
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>,
 <52FA1B39.2070904@corscience.de>
 <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
In-Reply-To: <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="57qDF2evvC8gw3uqtDG1poUcx7tp1XM1p"
Cc: peter.barada@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--57qDF2evvC8gw3uqtDG1poUcx7tp1XM1p
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Steffen,

On 02/11/2014 04:43 PM, star@gmx.li wrote:
> It is clear to me, that I can't mix ECC at same time.
> I would like to switch at a certain point of time.
>=20
> In uboot there is a command (nandecc) which does this for me.

Ok, understand. This command however is only available in omap3 devices
and exactly for that purpose. It was refused to implement a generic way
to switch ECC scheme for other SoC. The way to go seems to use the very
same ECC scheme as the ROM code uses (that is the case for at least Ti
devices like AM3xx family). Unfortunately this won't scale with changes
in NAND technology. So, yes, there might be the need for more
flexibility in NAND partitioning and ECC schemes.

> But howto do this in linux?

There is no builtin mechanism, you need to build one for your needs.

> The idea is to boot in a normal way (1 bit SW ECC).
> I need to copy all needed tools from flash to RAM (flash_eraseall, nand=
write, busybox)
> After that all partitions (uboot, kernel, root)  will be erased, writte=
n with new ECC scheme and rebooted.

That is the right way out.

> Thinking about this - once I read that it is possible to boot a new ker=
nel out of linux.
> Not remember the preconditions, but this is probably the more complex w=
ay.

In my opinion this is the clean way. The 'copying required files to
ramfs' approach described above is widespread (at least in my feelings,
we used this approach in former devices too). The problem with this
approach is that you can't adopt the tools you need. The kexec approach
is more flexible here. Just my 2=C2=A2 and of course it is off topic here=
=2E

> Did I get it right: You managed it to boot your system (using flash con=
tent ?) and than unload the mtd module,
> reload it with a differen parameter and you are able to flash xloader?

Right, with a freshly booted linux out of the running linux. We switched
our update procedure to the kexec approach exactly for that reason. We
have a clean, controllable environment and can do just everything from
that running update system, including change of ecc scheme or even
change of mtd partitioning.

> Of course you cannot access all other partitions of flash during that.
>=20
> In general that seems simular to my challenge - with the difference tha=
t I have to flash complete chain ...
> (at least uboot, environment, kernel, root).

We do exactly that, we do it sequentially and switch ecc scheme where
needed.

> You mentioned it is not possible to stick a /dev/mtdx to a certain ECC =
scheme.=20

Well, it seems there is some work done regarding 'Per Partition ECC',
Boris Brezillon sent an RFC [1].

> My kernel is also rather old, (2.6.33) - so no hope that there is inclu=
ded this already.

That would be your job to get it working then. I can't say anything
about architectural changes in mtd framework since then.

> In kernel source it seems that each partition uses the copy of a so cal=
led master. Is more than one master possible?
> I didn't understand the precedure until now-
>
> If your are right, it is useless to double my partition scheme. Idea wa=
s to boot uboot from /dev/mtd1 but rewrite it with other ECC scheme at /d=
ev/mtd6 as every partition is available with 2 names.

Regardless the meaningfulness of your approach, you need to flash a
kernel which is capable to do so and boot it again. So this would be a
two step approach to update your device. Why not just boot another linux
out of the running one which is capable to access your NAND with
different ECC schemes (however it is implemented) and do your update
procedure.

Best regards

Andreas Bie=C3=9Fmann

[1] http://article.gmane.org/gmane.linux.drivers.mtd/51605



--57qDF2evvC8gw3uqtDG1poUcx7tp1XM1p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJS+0woAAoJEHPlkEBPIQBjpVYP/i4ouAkQOMD4MQo5yR/eMHNl
9B2m+96gkk763LinJzRa6Dwtw9IjSGoprzxDZPSVc/6GK/lB0p9tVqwOlcvTeMLg
5TNmNaj/8H9a/RgzVKYhkDqowSFvMfDAPUf80jHYH/1IUpUb1R7z6JV4kBNq0lMB
7jm8YPas+H+UIct87LuACGdAeOZp2vM9RaftbRMHcUeCtbS8ViB015z5qha+IMF9
j6hxlZU3ug47gqL6uFhgmxO2AKD4uka+7l1Z8E+Kjg39S0k0/N33mEUuXMc10RH7
UkF8ywFkvOulZ0qgsubDWWWPsBjwMHNR21OqF3ibqrufZaJJxbunldf/2ywu/8a2
2BWwXPRNhFnxO970YDoxzb7SHyqGDY29KHR8MHOkoCUihJ9HGT6gnm/VTiBrtvc0
yOv5QoFimDYUlHt4RxMWyR/zDMwdV6esQidNuojQw/JYls4pl5YRY5/3PLESsixr
FhPu68hlJOB3Y6ZvPb4TEF4dsWVexd/tCN0Dev/WzkTgdIrWXTZfrkb/H5oW2ze2
fBnreIRBCHfgPTHJHIen+sOPX8dbdjdufXiE35MOKcJLhZFhEQMlKJwXYlJD359w
rfPTEwNFvxBrCqjeGNUDqYJIVS6w/zOagiVnfaLDMA7w1YupA2/ErnnPhuoRMrl2
WSPSw4n+bVKba7g4FwtT
=dvex
-----END PGP SIGNATURE-----

--57qDF2evvC8gw3uqtDG1poUcx7tp1XM1p--
