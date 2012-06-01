Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaHTM-0008Bx-VP
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 02:20:17 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] mtd/uclinux: Use generic __bss_stop instead of _ebss
Date: Thu, 31 May 2012 22:20:15 -0400
References: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1710037.biqSLoH4iV";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201205312220.16732.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Paul Mundt <lethal@linux-sh.org>, David Woodhouse <dwmw2@infradead.org>,
 uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1710037.biqSLoH4iV
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 31 May 2012 16:55:39 Geert Uytterhoeven wrote:
> The standard (see BSS_SECTION() in <asm-generic/vmlinux.lds.h> and
> <asm-generic/sections.h>) symbol for the end of BSS is __bss_stop.
> This allows to remove all local declarations that have been added to
> several architectures just to please CONFIG_MTD_UCLINUX.

Blackfin moves the memory & manually sets .phys, so the exact symbol used t=
o=20
initialize it doesn't matter to us

Acked-by: Mike Frysinger <vapier@gentoo.org>
=2Dmike

--nextPart1710037.biqSLoH4iV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPyCbgAAoJEEFjO5/oN/WBOkMP/A/dn0lKc4u9xo5C1fssBufh
WKm+gX90VDDElHGcdbPl8Q00AJF30KQO/le/6mkM4Fdqnz9CvBe62DpZuZ5CiE6C
ICqJP7fLBpHlrt8vZRPZzizRhMtzpGXJFBtIbSDwJ8jMwHkD8xY7KwRb1A8Pj0yj
h5qE99zdkHtd0k14xKA2MOtM1llKF51WnrYHXfk3I/r6GkjmorgN8JIH62Ox9Qkm
sxkYdKdojFjQiok/sAUk986+bvnz40yok55S2cW0+ByWv9Zajf16F1U1z8iLVGu0
2pnqNOZSOcgGg33c3ScNA69T5A0z3Lhb6QArx2Jy8Ii4K9H7kEwMOHupUV1Tn4B7
tuf+fvjvXMJe8i6/D7sWcsyqHdPu53TtCz4sGjvYaZeSrnzVymUC1McZmWJbt+LX
YtgMp4OErKOBqO9r29g2T0HG/J4dQOO2QjrxRbbNDjnHaXnyKe2ifvl3G4bPRtTI
VayJGsgyp74ewD8pzWVPHJkOKYuWFjDDXhdeHmVnSnySAtRurPm0Jv0XlSNFMNQ+
FFBSNTYb0IKPCyA58GKZ0CQ6l6OTeklQMii6mJqDDpmkfYv7hij9FZi4v8KWBR19
EXZnGzFK4ihQcZDLoahVeiCgkIwJmYiMiAIBO03FZyvhGJXDd06AiB49GnBw0Jtg
0PsskCPzFXWPiaNTiOGA
=xD3J
-----END PGP SIGNATURE-----

--nextPart1710037.biqSLoH4iV--
