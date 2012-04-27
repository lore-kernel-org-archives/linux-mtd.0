Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNe8p-00083m-KZ
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 05:54:52 +0000
Received: by lboj14 with SMTP id j14so304051lbo.36
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2012 22:54:49 -0700 (PDT)
Message-ID: <1335506087.1767.4.camel@koala>
Subject: Re: [RFC] mtd: nand: Add a STATUS CMD after write verification
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Fri, 27 Apr 2012 08:54:47 +0300
In-Reply-To: <CABYn4sxYynuD3WN_9+fmieMfjjGeG+P3EAY+HoXmFtgn8x0PiQ@mail.gmail.com>
References: <1334744404-721-1-git-send-email-hechtb@gmail.com>
 <CABYn4sxYynuD3WN_9+fmieMfjjGeG+P3EAY+HoXmFtgn8x0PiQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-p8RTC0Gco5yca8T5UDH0"
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


--=-p8RTC0Gco5yca8T5UDH0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-18 at 12:25 +0200, Bastian Hecht wrote:
> 2012/4/18 Bastian Hecht <hechtb@googlemail.com>:
> > When using CONFIG_MTD_NAND_VERIFY_WRITE=3Dy an extra read command is se=
nt
> > to the NAND chip after writing a page. We need an extra status command
> > to avoid hick-ups that lead to page write failures.
> > ---
> >
> > Hello all,
> >
> > I'm experiencing problems with my current setup and
> > CONFIG_MTD_NAND_VERIFY_WRITE=3Dy. Usually the command sequence is like
> > 0x70            Status read
> > 0x80 0x10       Page prog
> > 0x70
> > 0x80 0x10       Page prog
> > 0x70
> > ...
> >
> > When activating write verification there is a read command before the
> > page prog.
>=20
> I've written this unclearly. I mean if we issue multiple page writes,
> the page writes are not preceeded by a status read, but by a page read
> command from the last verification.

Looks good to me. Could you send the final patch with final commit
message. Probably a small comment in the code is also a good idea.

--=20
Best Regards,
Artem Bityutskiy

--=-p8RTC0Gco5yca8T5UDH0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPmjSnAAoJECmIfjd9wqK0NUAP/iXdZd4eYbrjbB21phSuTxqP
wfGg7y+iPfd/3pchsrG87RpSns2APOrRg87Igo0UtjE4OFlwntuJtG/AELX71Ap4
5JaDIOKAwfQSWaduXnFS8ua/o5B5vquHBiVgRT4v74lg+OcBsy0tbKtNwcHP/8XK
63cSOqsp3YkMqhldIQWSSNDG8BGJvAiFRDA4b75pBFVhXl/xLMgkuBmNuu1fMJAg
LLV1I9nwbadwizkoETRuZKNCDAPkeGUvsByaHVtBkjjDWW06wMAJc2oG5hhVHkFU
OCYRW7/w8eBno6HNBINcJ3gvhAv7kgAD81uyyAbyt2JCmDSdHSU7DzeClwM3Sgpb
WAhjDBv74Wym0nvuY+BcDuRRAG2rFmEX6LsOel/gGYvso00bnnkWmvGa7aq6DLk/
DgpjRGQ+AK+wFDhPY8Ae5f8AlN6A5AG82jyNqPTD+GVwNP7cbH3yoOvxWcMkGP7l
9Ol0LFalm0/lCLhPrYmOoARmcPRIpC/iJ4duboZUs5X590HS0/klQ9plXezy5R5k
CjisaFwJRAJf/1GtcPdjLumkgnA9lgAM2R4JEwQp/qyzGo7bRhkPON4yGnGOlTB3
f/45OvGAU1c7BxE2wclQSnDWZfqwhgtnQwu9H3tBHbdnEM0gcRI1jkNMajqlCtLn
SNqDXdSIsPkkiyezHYVE
=Tbpx
-----END PGP SIGNATURE-----

--=-p8RTC0Gco5yca8T5UDH0--
