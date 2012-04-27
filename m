Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNluQ-0003K4-0u
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 14:12:31 +0000
Received: by lagy4 with SMTP id y4so613974lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 07:12:28 -0700 (PDT)
Message-ID: <1335535945.1910.11.camel@koala>
Subject: RE: Exposing NAND chip information
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tom Isaacson <Tom.Isaacson@navico.com>
Date: Fri, 27 Apr 2012 17:12:25 +0300
In-Reply-To: <B36E81988B048A4FA3600EDE585F756BD123D1@EXCH02-AKLNZ.MARINE.NET.INT>
References: <B36E81988B048A4FA3600EDE585F756BD0EBD2@EXCH02-AKLNZ.MARINE.NET.INT>
 , <1335105890.28267.27.camel@brekeke>
 <B36E81988B048A4FA3600EDE585F756BD123D1@EXCH02-AKLNZ.MARINE.NET.INT>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-37gGKxWbXGxOvEPc4939"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-37gGKxWbXGxOvEPc4939
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-22 at 23:40 +0000, Tom Isaacson wrote:
> The documentation for sysfs (http://lxr.linux.no/linux
> +v3.3.2/Documentation/filesystems/sysfs.txt) says:
> "Attributes should be ASCII text files, preferably with only one value
> per file. It is noted that it may not be efficient to contain only one
> value per file, so it is socially acceptable to express an array of
> values of the same type."
> So if we want to combine we should do it the first way - both IDs in
> one file, both strings in another:
>   id - Manufacturer and Chip ID (tab separated)
>   name - Manufacturer and Chip name (tab separated)

I think that would not make sense to combine ids and names. I think that
is a general recommendation which should be go through the common sense
filter. E.g., there are many "dev" attributes in "major:minor" format.
Or look at the 'uevent' attributes contents. Or "resource" pci
subsystems' files.

--=20
Best Regards,
Artem Bityutskiy

--=-37gGKxWbXGxOvEPc4939
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPmqlJAAoJECmIfjd9wqK0xPsQAM6dc+8GMRzMa4AuCNkPVWUI
qUN7NhYjFqj/AyqaJwNdk2kTnlY14Q04ud9b69PphCWknzyp7YM/zvF8jGGtCBK+
7TTdlwgcfokHDbRIsFcLZYMR0WSXh1iaaxsnhq8O9O0ZJKfOi8+Prsjvb1wbmUWw
OGp8lLVKivKj6OS8Cqp6gSmKAm8466LR16NOKgvGDU3vHa6c048mm/xtU6ErDd4Q
LE/lDEk/eiADtIFx9GpUeFtFRWT5t73WX8HXLX1N6vGZAnLQqT9C220BIWAZpdiT
ANWAsNGW+ve4oGtbzNOKqD8d6fGIh+aQlfA79CUDsaeEOMe1XWu7QpSwcEfDI53Z
n3Yy+utOeHR97qkQ3rqhJgZ12AiragfrymsyDGMklO7qNzsnu1yew9OUGDPXmMYe
eVr5ZMT+u6x393UzFcK7bVmIhdzK6H4Fv13xL2ZKKBtmOuPnzxzQouuDzLHzqQzk
gahw6QCkmyzslqf5WaFSiLjHoetmAVXpfC8yVi9N34hVengMkAGAwnqub6X9HxWv
vQa6pJ+RKaQbfre88o8cxfKBezmQIVdbN6YCwyAedApUdsTZgX+7XW9OQgev1YxC
3ViUnOK4+8sUT+HDqrbswf0QbiCwl4QlndTs3CHBxNUnxFgiH91G1eaSPpMEsHaC
awVdTCX9qitt9tEZfHQa
=W/r9
-----END PGP SIGNATURE-----

--=-37gGKxWbXGxOvEPc4939--
