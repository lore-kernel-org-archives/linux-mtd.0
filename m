Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmlJd-00011B-Nv
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:05:34 +0000
Received: by iakl21 with SMTP id l21so10290962iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 04:05:32 -0800 (PST)
Message-ID: <1326715636.14299.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: nand: erase block before marking bad
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 16 Jan 2012 14:07:16 +0200
In-Reply-To: <1326507110-10893-1-git-send-email-computersforpeace@gmail.com>
References: <1326507110-10893-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hcNL0QtSN7ZwRcUkW8Vx"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hcNL0QtSN7ZwRcUkW8Vx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-13 at 18:11 -0800, Brian Norris wrote:
> Many NAND flash systems (especially those with MLC NAND) cannot be
> reliably written twice in a row. For instance, when marking a bad block,
> the block may already have data written to it, and so we should attempt
> to erase the block before writing a bad block marker to its OOB region.
>=20
> We can ignore erase failures, since the block may be bad such that it
> cannot be erased properly; we still attempt to write zeros to its spare
> area.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

All four look good, pushed to l2-mtd.git, thanks.

What are your plans WRT marking blocks as bad both in the OOB and the
table?

--=20
Best Regards,
Artem Bityutskiy

--=-hcNL0QtSN7ZwRcUkW8Vx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFBL0AAoJECmIfjd9wqK0fQMQAMyymvaBnswy6N7f1VWGBz8l
c/ru+X47NFS4DEqF6tRf0EbxT5bKgMhHfnbAumljymbqDl6//EMD3sVIYsvuwNEf
/kIbG9fLlF4tcarIRDJknlv51OkokVpKhWcotDkn6B9M3YJmAE9nmndZueKnnUMG
DRzTjihkaMgJmbXMjbb1IGn6qVqwGDAnSOW27xLwpFVTsIk4kB+4WuKMZNROp0Cq
ShYm+lNOpXO8yt1G1rYBjEZ+//OIx1MSka0jqNtXOdmttE0LWJJ+Sb3CGhV76/wm
7gmeOI0JDhbO+1dKjjSSvp4P4ERhwoB/kTD0vZSI8c5bc48ohFY8cSelW2CKD2S8
G14LLcOmuPcILlnqXmIt6Inj/Ai2URF2GT9JQH+IWRHm5eFEmTLetq3cpyqABBNe
b31qnIUcGRxjpEF1wnQQpD0wF6vCoU8ylxh9nfjJGE3EXREMlaepSr5d8orpdiJ3
pwn8jAVe7rRRi1u4N5Br7iIw2EnlPUsuDcdcwBgjnTdtBdtO0a6ysWR17dzn5/Oo
H+4UkOBam3gQzXUHY59S8vSrbJ2q4JHj0b7rnDB6xAgKYkAGLWNMiJIBVA8iRodi
tuO1tiQXyaL8id07smAfQWCpIOEGaPjIwTBkni4ziSt46as/wmqYyzGcl74rqdYr
c/aPiRTSENeJE39g2vY+
=Zz/Z
-----END PGP SIGNATURE-----

--=-hcNL0QtSN7ZwRcUkW8Vx--
