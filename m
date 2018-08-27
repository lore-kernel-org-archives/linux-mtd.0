Received: from mta-01.yadro.com ([89.207.88.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuFdi-00056m-ER
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 11:25:00 +0000
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <leroi.lists@gmail.com>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
Date: Mon, 27 Aug 2018 14:24:40 +0300
MIME-Version: 1.0
In-Reply-To: <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF
Content-Type: multipart/mixed; boundary="HSBXjiqBBus0kIzxMr1C0NN819z277bvv";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
Message-ID: <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
In-Reply-To: <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>

--HSBXjiqBBus0kIzxMr1C0NN819z277bvv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

27.08.2018 13:33, Marek Vasut wrote:
> On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
>> Currently in spi-nor driver there is a line for mx66l51235l.
>> According to Macronix site, there is no such part number. The chip
>> detected as such is actually mx66l51235f. Hence, this commit renames
>> the chip.
> I wonder if this could pose a problem, since this might interfere with
> the DT being an ABI. But I guess fixing the name is OK.
Well, as far as I understand, in the DT you'll only have "compatible=3Dje=
dec,spi-nor" for most cases.
Anyway, I did `grep -r mx66l41235 arch/*/boot/dts` and found nothing, so =
I guess it's safe to rename.

>> According to the datasheet for mx66l51235f, "The device default is in
>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
>> makes the code act as if the device was already in 4B mode and didn't
>> need the EN4B command. That prevents this chip from functioning on
>> systems where the boot loader left the chip in 3B mode (e.g. if the
>> chip wasn't used during the boot process).
>>
>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>> mx66l51235f (added previously by commit d342b6a973af).
> Could it be there are two variants of the chip, one which supports the
> 4B opcodes and one which does not ? Wouldn't be the first time I saw
> this. If this chip supports the SFDP tables, you can check those.
I was unable to find another variant of the chip. There is only one speci=
fied in the datasheet:
http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203=
V,%20512Mb,%20v1.1.pdf
and it says that the device supports both 3B and 4B modes, but defaults t=
o 3B (24-bit) mode.

Most probably, Roman Yeryomin, the author of commit d342b6a973af, was fig=
hting post-effects of u-boot or some other boot loader that set his chip =
to 4B mode before jumping to Linux kernel.
It is hard to say for sure, though, as neither his patch itself, nor his =
post to the mailing list contained any rationale for the change.

It is for sure though that for OpenPOWER systems using this chip as PNOR =
(BIOS flash in x86 terms), commit d342b6a973af broke host booting.

With best regards,
Alexander.


--HSBXjiqBBus0kIzxMr1C0NN819z277bvv--

--6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbg994AAoJEOiTWHtbdBeN/eQP/05rQ7tuh+vZj7UvNYVs8jFu
x0zfiOmtR/aKM/yiv45jyIYK1TpoPhgThuf8LC1weeR3tYWT9x7ZTHGqhABxhpQ8
pl/s/dObpb8W+YvMcBBDx/e9oU9iaqRBbtIwv5X5y+OxlLI74egYEspNvZW+NqnB
6WCzXdip31ouDZt/t0cDLxLcY1yTbHOGmTymDbsAHsT3dpiR5SLRJqZtToppwGnD
y5xnZbCkiNs+wDlG0nKsliBsGmA05byLZ59Vkf/HDk38kt13j30WZIHU75AFffOx
JbDjBwtwdGb0mp1RYvI4KnHV5Ab0laVs+VTC4A08d8jfddlMGPU9IV8oSoT05vB4
uji1Pz79iN6xRteDxw91fwqwJoekCEnzZgRWJuiwDCdnIll1QA1UDHhWo04GxxLN
cye3eteUUACktTdBMr6fZLjg4Th/xN5JCKjIQd4P+R6OwifdJbGJUIUZB8WQrz3w
XiVKxXAgkElB+C7K75oVZW8/DpTJ5jw0pmFxhnZZVOuLI2LXnb7afckseurRJiCs
yRaYiZ4oWCK1gxejG4n3O80iILQgayCXkhwzl0tbHGX4e6Gpcw/bHlf/uNMtmnjd
SLaeQPKLoop9SlUtg48k6jqbpemVhxRk0WltJVW/6As+g6hyXz4s6Nv8esbWvHRp
98Lj2gBXfHcchh/OV9pq
=ACFt
-----END PGP SIGNATURE-----

--6PqKl0EyjgNvEyZjAIH6H7O97WKK9DSyF--
