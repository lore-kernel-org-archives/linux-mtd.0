Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UapDI-0000f5-AG
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 15:26:28 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH [mtd-utils] 3/3] mkfs.ubifs: allow reformatting of devices
Date: Fri, 10 May 2013 11:26:00 -0400
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <1368030446-343-3-git-send-email-vapier@gentoo.org>
 <alpine.DEB.2.00.1305100902410.22700@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1305100902410.22700@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1818806.2qGU82Hvvs";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201305101126.01644.vapier@gentoo.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1818806.2qGU82Hvvs
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Friday 10 May 2013 03:07:53 Ricard Wanderlof wrote:
> On Wed, 8 May 2013, Mike Frysinger wrote:
> > Sometimes I want to re-initialize an existing ubifs, but the tool
> > currently bails out if the volume is already formatted.  Prompt the
> > user instead so they can decide.
> >=20
> > 	{"max-leb-cnt",        1, NULL, 'c'},
> > 	{"output",             1, NULL, 'o'},
> > 	{"devtable",           1, NULL, 'D'},
> > +	{"yes",                0, NULL, 'y'},
> > 	{"help",               0, NULL, 'h'},
> > 	{"verbose",            0, NULL, 'v'},
> > 	{"version",            0, NULL, 'V'},
> >=20
> > @@ -191,6 +193,7 @@ static const char *helptext =3D
> > "-U, --squash-uids        squash owners making all files owned by root\=
n"
> > "-l, --log-lebs=3DCOUNT     count of erase blocks for the log (used only
> > for\n" "                         debugging)\n"
> > +"-y, --yes                assume the answer is \"yes\" for all
> > questions\n" ...
>=20
> Wouldn't it be better to have a specific option for this specific case,
> rather than a general yes-to-everything option?

this is the standard that the various mtd tools (including a bunch of UBI=20
ones) follow

> The latter makes sense
> with programs such as fsck where the only prompt basically is 'I found a
> fault, shall I fix it?', but in this is case it can be difficult to
> predict the outcome should the option start to cover more potential
> questions in the future.

if you want to compare to standard tools, then the check would be dropped=20
entirely.  when i run `mke2fs /dev/sda1`, it doesn't prompt me.
=2Dmike

--nextPart1818806.2qGU82Hvvs
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRjRGJAAoJEEFjO5/oN/WBpNkP/0KRAVLCfSqGOFBOSRWXEcDN
6I9ONKr9qhij9VrfFnLrw12JdJECTdsSTJm0bYLglZLAuDkvhqM1C+M7U7a850PG
TeQTz8/gJGSB1lw+T2vIhEcRqxzZAtWkudJlq6bycTfZzAGRFfLgKzoBY0nfQD4i
zcNAWvbISD+/hjQcEiqhPJFxTNo9LxPntGgK5InJ6b1GB6unjWUNVcjTNPZ57Loz
F3Ag1iyCVFPDOHojzLG8zUUwOerTsYjJP722rn4fGHjuaNM0ijqGSwC1UH6KNrW6
KBMTyvgFLzj5Y4ugQT8Kz6h4qlrcTzgeFIbykRkfJSOgO1pWYQCgF6u28SD3AmdJ
uVH0Z2lp99mdfo1H5+9QATkrO9iiXisUHf1Nzx5v2lwGGJYDseB7Cl3FLbGu0Vm0
iNxYC2uxfvxtgdNrrTwT2IBN1ynP958HkA0WEbZ6bJKkZGH59fBS7lfZGqJxy7Xu
rMZu8Lo0HfCN2tE91EyyDDJwOvvEFjzNoE6OAsZO598guj0en3tgO/LHbGzJiNwM
R5bw4VO+HaemvEnUbnQRBTXZ13Kn4FUhuRvznorsxkpq/K9BoVqo+sv7RJAyjO9P
4joZT+FH/VUD72nai58NusCDsytA/L3bYRxVLQEaQDDU8si/j/Srd1aonXUc677H
uCNtXA/OEnGdBbIo7ieV
=JNBv
-----END PGP SIGNATURE-----

--nextPart1818806.2qGU82Hvvs--
