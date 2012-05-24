Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXTBV-0000Tc-50
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 08:14:13 +0000
Message-ID: <1337847472.15137.81.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 24 May 2012 11:17:52 +0300
In-Reply-To: <4FBBC4EE.4040802@nod.at>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-p2HPywNjchkueQDc4we+"
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-p2HPywNjchkueQDc4we+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 18:55 +0200, Richard Weinberger wrote:
> >> +    e =3D find_early_wl_entry(&ubi->free, max_pnum);
> >
> > This picks the eb with the lowest pnum within 'ubi->free'.
> >
> > When called with INT_MAX (for the FM_DATA), why do you need to pick
> a
> > free eb with the minimal pnum? The FM_DATA EBs may reside everywhere
> (as
> > the FM_SB holds their location).
> > So why not pick the eb with a medium EC value (as done for standard
> > get_peb calls)? That might be better wear-leveling wise.
>=20
> Fair point.
> I'll fix that.
> Artem, any comments on that?

The 'find_early_wl_entry()' function is used (currently) only at early
stages. At these stages the we do not have the PEBs sorted by EC. We
have just a list. This function should not be use after the WL subsystem
is initialized.
>=20
--=20
Best Regards,
Artem Bityutskiy

--=-p2HPywNjchkueQDc4we+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPve6wAAoJECmIfjd9wqK08bsQALMJrcYQVWfSKXDcT2IPDIF/
1qZKMG9Pi7bgesUEXQIC/N9uvUDUlYCmTpZg0CzqWJKh36hKF6v/9qkMkVbk/MSa
Q0vR+HTe51ilNzAXBr6XNMo5FIL5Kx85Z1f1xbvjZlvl63yDkwVSGycY1CVM69sE
lV2VZGNVjovi4GcIhzx0H3PNtJgJzndn4QseWbKn/5Zdv7enaojDdiwIS6PSoBYH
FHufYl18bBuxZZSsRtXH9W7PV57lptV6PdPq4eu/mVeeQgMLu8mJuMdkfiOBUmns
V3cyN6HDnT8uQGUXRcgjxEoYwdfPQANOEw0jrHo6+MJnaDBgVvU8GVT2ynoOGHnq
P7TLkNHGF8Sh3lbyiRB+djtUkHbKqpe+tMCArCOHSKUTNgQgFpH5bYSMcZgmnWPA
rsCH4EzN+a3CnyMbv2hHNFd+4xbOHfaEOgE9aKgAP9Qp9pYjo6oNNmwIZnKQ0W1+
4WxoAa98CypRox+6X3OrijjCe/5M7BVebLE4RGrC68jjDnDwGxbgChFIx4vBl/Jr
qh4KWKG8H/zrpof0cQXnrk0ONz8m09rjnwBtLqhTlSOvdld/G1mA3MoUX9M/4U5t
WpEgdsxPydU0okQE2f4g46EzZkgojU8GPwG953Z31n6dtriI7Js6cD0HxZrndSj7
v7hCDMsyhR5QwHVSUSmz
=qvHp
-----END PGP SIGNATURE-----

--=-p2HPywNjchkueQDc4we+--
