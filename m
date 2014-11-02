Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xl36d-0008ME-Ok
 for linux-mtd@lists.infradead.org; Sun, 02 Nov 2014 21:54:40 +0000
Message-ID: <5456A787.5060104@free-electrons.com>
Date: Sun, 02 Nov 2014 18:52:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, hch@infradead.org, axboe@fb.com,
 dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Block: Add blk-mq support
References: <1414933255-3795-1-git-send-email-richard@nod.at>
In-Reply-To: <1414933255-3795-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="JbNBtS9S9bNoD2S98o8jad5tsCg30eLSx"
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JbNBtS9S9bNoD2S98o8jad5tsCg30eLSx
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On 11/02/2014 10:00 AM, Richard Weinberger wrote:
> Convert the driver to blk-mq.
>=20

Maybe you can explain a bit better what's this all about?

Both the commit that introduces blk-mq and the paper on it talk about
high IOPS devices, multi-core, NUMA systems. I'm not sure this is the
case for UBI-based devices.

Probably some numbers would help us decide. Does the patch increases the
dynamic memory footprint? Is there any performance benefit?

I kind of like the negative diffstat, but the code doesn't look cleaner
or simpler.

In other words, we need a good reason before we agree on making this
"zen style" driver more complex.
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com


--JbNBtS9S9bNoD2S98o8jad5tsCg30eLSx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUVqeOAAoJEIOKbhOEIHKi1igQAJznHIkPRH1fsybcBBfJLZpf
DYmtCyD9ur4RwlCPaJG56hy8gj00/SDqiF+oGeda6RgWpPHTgqcaNABcd10h/goE
WcW893jRnKu7+pUQSuHAx+b1nx/4j2UYGhp7KeiamDFTvwGHVX6pi5nUdHuhIdcr
BKYlmdXZjkdvDYt+ZCVuIP1iLW4WIxmAZTLOLR7t/S7iP/mhmThF0oZTryMt9gDR
U22rAuzA4g/JlFmOLu4b9Ma2IWsII1WhOl+Qje3yDQMm206XCbNoWCkDxS/N47tY
qZcvjt3fiNezku7WlbUyN0XV4G/IcgDWY8waQM6drUChINQeyuxi4uxWewh90i1F
kPwW/qpxYe+5oZl1pbrqBUn8Y9qVs5RoDsOwe6rowifftBtCmgr71PYmD3PmZ1xW
82j13W/GT3RbKXWB8J0URt18yDaHBTjyqQLXn5tM89m7UPVricjbGcAWzCjac7ef
mZ1QYxEzL95QerJsPI1ZdQAGlAjSnk2EavYtAIsNza+R7D2RCHv5cF5QroRdFPc+
oRO5OSDusCWwCKQY8xz1JxALneLPrJInii3braG+SkRYtaUj7aCwVVsq67VSr4Ua
ydG463E7SWBjTVsK3svyUvF2aM4kZczQ4M1ljozeVHD6eu9MP+T/MlnnfDdizTk+
ppowmli3bUwcJOnQvtN2
=ipWR
-----END PGP SIGNATURE-----

--JbNBtS9S9bNoD2S98o8jad5tsCg30eLSx--
