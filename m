Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPQlp-0006FL-FZ
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 04:02:30 +0000
Received: by lbbgg6 with SMTP id gg6so164293lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 21:02:25 -0700 (PDT)
Message-ID: <1335931159.10877.4.camel@brekeke>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips;
 mtd_read() returns -EUCLEAN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 02 May 2012 06:59:19 +0300
In-Reply-To: <4FA01CF2.4030907@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
 <871unbis55.fsf@free.fr> <4F984CC9.9060701@newsguy.com>
 <1335727480.1942.18.camel@koala> <4F9EEE26.9040806@newsguy.com>
 <1335874805.2095.11.camel@koala> <4FA01CF2.4030907@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-U8RS5GAbbJLFxwyvmFvV"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Scott Wood <scottwood@freescale.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-U8RS5GAbbJLFxwyvmFvV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-01 at 10:27 -0700, Mike Dunn wrote:
> On 05/01/2012 05:20 AM, Artem Bityutskiy wrote:
> > On Mon, 2012-04-30 at 12:55 -0700, Mike Dunn wrote:
> >>
> >> Yeah, sorry Artem, I neglected to add the Acked-by's in the patches yo=
u just merged.
> >=20
> > If you know that an Acked-by or Reviewed-by was missed, let me know and
> > I'll add the tag(s) to the patch(es). I think it is important to be
> > careful about the tags because people spent their time helping to
> > improve the patches.
>=20
>=20
> Well, I owe a debt to several reviewers, among them Brian Norris (caught =
the bug
> that would cause all non-ecc devices to return -EUCLEAN), Shmulik Ladkani=
, Ivan
> Djelic (reviews and tests), Scott Wood, Robert Jarzmik, yourself, ...
>=20
> As far as formal tags... maybe these, if they don't object:

How it usually goes - if the person sends a "formal" acked-by or some
other tag which can be copy-pasted, then he cares and wants the tag to
go in with the patch. But if the person just comments on the patch,
reviews, but does not send a "formal" tag, he does not care. In this
case you may give the person a credit in free form in the commit message
optionally, if you feel very grateful.

IOW, if we missed someone's "formal" tag - let's add it - I shamelessly
rebase my tree anyway, under excuse of "I am not the maintainer" :-)

> mtd: driver _read() returns max_bitflips; mtd_read() returns -EUCLEAN
> 5568eb3c3bb2816281b6a7c04db92434b72b1495
> Tested-by: Ivan Djelic <ivan.djelic@parrot.com>
>=20
> mtd: nand: read_page() returns max_bitflips
> 6bf87bf989bfdfc78fb2c5cd55de4bab9b572992
> Acked-by (freescale changes): Scott Wood <scottwood@freescale.com>

OK, thanks.

--=20
Best Regards,
Artem Bityutskiy

--=-U8RS5GAbbJLFxwyvmFvV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoLEXAAoJECmIfjd9wqK0JbMP/RfWvYl4Ppz840nR1m04W9+Y
6cur1ZiH91mL4A1W7TFuHqi/yikhjHFopWfdScMScNY2R0Hk1w91GNK7eGVId6Ob
4j/9JcEgJbO0DqNSCPxJ8Ko85gCAQJuCWxcSLxj4IhJ7M8hPPKJ1K7GwP9DovqR1
ujc40/V4O22TUMGAgrGDz7poEADYfbrxLbiQCL6NkUjfENriu2/v6Jtkc0XVdD4u
+sJnQZRvFmnGaRmyJZkzPnjSTgmipz9i2QKgLVtv+deJc0oYEc+7k9itF/Qvz8xZ
o1VMUnV73lV1IuCmAxBbOYAFZaqZ2uuEMrrWEMaeYDn0FMarKrPpVOzYT5hbl4ht
poYhtcqUupch9doN3KT8vARLpavoZrVlmyHLsFCTu5FceCYaLgGGcTn1SeJJw3Fq
bhekvVKgsUXjM3krrqfJHc+SYG3EnJumsg2o6DFQNDjWikk+xLEIKSDgtQiRivIC
XOj7cc/TLYCaouIHSIxv1L4EI4Ka9Ncuf8/TAa7Du9Ul4TyNrL2FoL4SjJ7mIacX
Td3x8Ms/R/LtQuimV7W2YTupT2w2swy2exe+KFdteMIrgszkx/SAfd/BQ6Titqdd
8MxkigeLxPreH2UnSCCoCHk85IWU3UUVbOmQ3Ly+v4/nzSk1qQMeRzpcJe41SHjH
O19bu4XEvf1Vj/5H490C
=Yjck
-----END PGP SIGNATURE-----

--=-U8RS5GAbbJLFxwyvmFvV--
