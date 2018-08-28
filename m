Received: from mta-01.yadro.com ([89.207.88.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fucBi-0000T5-Cw
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 11:29:36 +0000
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <leroi.lists@gmail.com>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
Date: Tue, 28 Aug 2018 14:29:13 +0300
MIME-Version: 1.0
In-Reply-To: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL
Content-Type: multipart/mixed; boundary="jQOfru3eRU35r0q2jiiT6lgs3M430vKeZ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
Message-ID: <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
In-Reply-To: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>

--jQOfru3eRU35r0q2jiiT6lgs3M430vKeZ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

27.08.2018 14:34, Marek Vasut wrote:
>
>>>> According to the datasheet for mx66l51235f, "The device default is i=
n
>>>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODE=
S
>>>> makes the code act as if the device was already in 4B mode and didn'=
t
>>>> need the EN4B command. That prevents this chip from functioning on
>>>> systems where the boot loader left the chip in 3B mode (e.g. if the
>>>> chip wasn't used during the boot process).
>>>>
>>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>>>> mx66l51235f (added previously by commit d342b6a973af).
>>> Could it be there are two variants of the chip, one which supports th=
e
>>> 4B opcodes and one which does not ? Wouldn't be the first time I saw
>>> this. If this chip supports the SFDP tables, you can check those.
>> I was unable to find another variant of the chip. There is only one sp=
ecified in the datasheet:
>> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%=
203V,%20512Mb,%20v1.1.pdf
>> and it says that the device supports both 3B and 4B modes, but default=
s to 3B (24-bit) mode.
> So keep the 4B part in. Linux will just not reconfigure the device to 4=
B
> mode using register write, but will instead issue the 4B opcode
> directly, without any stateful change.
Marek, thank you for asking all these questions. They made me conduct a d=
eeper investigation than just finding the commit that broke it and revert=
ing it. It appears that OpenPOWER P8's SBE code (the thing that P8 CPU ru=
ns first from its built-in memory) expects the PNOR flash chip to be in E=
N4B mode. It reads the rest of OpenPOWER Firmware using a usual READ (0x0=
3) command with 4 bytes of address. Always. That's why, I believe, Roman'=
s commit broke host booting for us.

Probably it would be best not to merge this patch into Linux kernel. I'll=
 discuss it with colleagues from OpenPOWER community and we'll probably f=
ix it on SBE side.

As for renaming the chip, I can provide a patch just for that. Or we can =
leave it as is.

Thanks.
Alexander.


--jQOfru3eRU35r0q2jiiT6lgs3M430vKeZ--

--edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbhTIJAAoJEOiTWHtbdBeNS5AP/jdCr+dd5cCcaeXOsL1iO5vQ
VogAcesACMlFUD7EqBS1SoBLRFGsFXcWR+lUfi7PzN8VKv7QY97H4JR1dPQD8MH5
wrPi993Lbe2kfNo88Q2uHod/gSqamZQsBhVQeK5guo4iCOpF6E7Q8wlYQ6FdA13o
2rwh8wxx8RC21LJEgYeNgyY1iUskvh/Wk5ltH3KTzjfouviP3ZnRAoxwqEph3ZYw
C9GHjBxnF/eB1lozyVejI4BTDs18TUvVmOS/YNAK2p+nBPl0JvKkDXJzfh4wrybQ
XDI6Q5l1VewBDFB3rQQEnjGEydRivKMLCxaxUh+gf59gtpDbDWfb3T1cR4xVjCwy
KuanKJPIFn/02xWMzC7vZj5ibpFiJj58Z+6P0+ThcQihrGcLkcn3IGfBNJpmBVq+
fPzmAGTCQ1yEOCiH/2IRXSFZzLZcLakImIXI+D2MhNOabw+G0EyExdNgJIUS0dEF
INtx/hMtQ0d/pQDFK/ANjYZWBRSNstQvqy2y7oFujIzfga/hPJKxqjbBVf9n17ui
AyhjrYYygwYhCyXBM6+nNwo/WANYF60sLgTFtZa0VYWr6KxaBZGLqt4oP6/mpsUK
5qYbcIO+g4r39Uds+LtMjio3Uzv/nSf9gh04EsR1XkSHaYK3D3Fufl4I8ECXT0b5
NEjEv2YxsZvJ1eu9NUto
=bI+O
-----END PGP SIGNATURE-----

--edwsZEWiItwOrGIwvy7UIgGroPCrTKWvL--
