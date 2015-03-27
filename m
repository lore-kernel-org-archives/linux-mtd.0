Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbW8W-0003Z3-6x
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 15:25:29 +0000
Message-ID: <55157648.9020907@rempel-privat.de>
Date: Fri, 27 Mar 2015 16:24:56 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Nicholas Krause <xerofoify@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Help Out
References: <CAPDOMVgj0qaqfEdZRNHKRqwCbuUZTRu3GcSuAqknhUYa4u9crg@mail.gmail.com>
 <551560BB.3050607@rempel-privat.de>
 <3BA9F386-DDC1-4C9E-855A-5D28B45BDD0B@gmail.com>
In-Reply-To: <3BA9F386-DDC1-4C9E-855A-5D28B45BDD0B@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HBFFQX97awWxH6mXmbqKBWNip8IEf2wFq"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HBFFQX97awWxH6mXmbqKBWNip8IEf2wFq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 27.03.2015 um 15:20 schrieb Nicholas Krause:
>=20
>=20
> On March 27, 2015 9:52:59 AM EDT, Oleksij Rempel <linux@rempel-privat.d=
e> wrote:
>> Am 27.03.2015 um 14:22 schrieb Nick Krause:
>>> Greetings All,
>>> I have been reading this list for the last few weeks and was
>> wondering
>>> how I can start contributing.
>>> Further more I have some understanding of kernel internals and file
>>> systems related to Linux so
>>> helping out would be no problem, if there are any requests for where
>> I
>>> should start please let me
>>> known.
>>> Thanks,
>>> Nick
>>
>> Just get some hardware and start play with it. Try to brake it or writ=
e
>> a new driver. After some work you will see how match work is needed :)=

> Olaf,=20
> That's the issue,  I don't know where to
> purchase a board with mtd flash on it.=20
> If you can point to where I can purchase a rather inexpensive board for=
 this that would be great. Furthermore I was interested in how we are doi=
ng with fixing the issue relating to handling data concisely if there is =
a  power failure when writing to the flash on the system.=20
> Nick=20

Not sure if i can suggest you exact board. Probably i can give you some
direction. Since you wish to play with file system, then you probably
need some think bigger then 8MB of storage. In this case NAND will be
better choice.
You will need a SOC/Board with:
- NAND controller
- as match open as possible - you will need to work with latest vanilla
kernel source.

- MIPS Creator CI20
- ASM9260t eval board (i work on upstreaming. if you wish to work on
this, we can talk about it)

Other options with nand on board? Or other suggestions?

--=20
Regards,
Oleksij


--HBFFQX97awWxH6mXmbqKBWNip8IEf2wFq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlUVdk4ACgkQHwImuRkmbWlChQD/aDyuROos23XJlTR2BcUigXaC
zwNZRDDwgfjlI2zOETIA/230ocFyd+ZiwvVK96cq1OWzhZY2CQge1D3xK78AWah0
=B+fl
-----END PGP SIGNATURE-----

--HBFFQX97awWxH6mXmbqKBWNip8IEf2wFq--
