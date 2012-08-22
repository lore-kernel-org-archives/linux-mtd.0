Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T49oB-0005lx-9I
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 12:13:15 +0000
Message-ID: <1345637813.2848.169.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 4/6] UBI: replace MTD_UBI_BEB_LIMIT with module
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 15:16:53 +0300
In-Reply-To: <CACQ1gAhFrd87dSQFQ=YnMg-WfgNKq8jx9B1i9JNDuFZQ3+=TCA@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
 <1345557295.2848.112.camel@sauron.fi.intel.com>
 <CACQ1gAiEBmUMWXr=FWmXqJUZ=ZwyLTCqKmUAMYpfJZBNJTPYSA@mail.gmail.com>
 <1345625343.2848.129.camel@sauron.fi.intel.com>
 <CACQ1gAhFrd87dSQFQ=YnMg-WfgNKq8jx9B1i9JNDuFZQ3+=TCA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QQ85Nr2ocPy2RB1A4ktV"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QQ85Nr2ocPy2RB1A4ktV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 14:09 +0200, Richard Genoud wrote:
> 2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> > Well, now I am talking about consistency within UBI only, withing the
> > project. I think that function is the only one which uses plain printk
> > in UBI. I do not remember the details, but there were some issues using
> > the UBI wrappers like 'ubi_msg' in this function because it is called
> > very early during boot time (when UBI is compiled-in). And I just did
> > not know about pr_err() that time, or pr_err() did not exist. So you ca=
n
> > just amend this single function if you wish.
>=20
> (for the record, pr_err didn't exists at the time UBI got into the kernel=
)
> I tested this function with pr_err and ubi_err, and both are working.
> (by using  ubi.mtd=3D ubi.mtd=3D2,0,toto ubi.mtd=3D1,2,3,4)
> It should be better to use ubi_err don't you think ?
> (or I missed a corner case ?)

I guess it is safe to change than, thank you!

--=20
Best Regards,
Artem Bityutskiy

--=-QQ85Nr2ocPy2RB1A4ktV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNM21AAoJECmIfjd9wqK0rKMQAIG+tnA+dlETjqk5rMeoPLGX
TJc4jb9RZTtAF9lM0Up1bQXJU3NNZXElEZzRnBaR2KcQNj51h1JheXn3G/xFTqh6
IoNtRLAi/XAwPE0covoKTajimc2kRV11TRjRQp6Ss26cgRYKOKzWRobnKzHYAYB2
Tq4pHwQ6PaZfEqp8v3xLNAIxv4usut4PVQNhII57q3v1pA5HZRxXLDgcUTR4u1VV
SCFzoHiJWHtdP11R26g9mpvxrOtWlQmTC0CJ1J5m/1bS3fVqoUYEpsCDUYjxiFRf
Jruy+8qcrpXJ3GT4gZ4PFLzsuEAVyRuRf33e2Bgr/SxWLFlmXLJnE33XbklgoxTC
gAOTGteVxbh6of0HFOVwur17XCCiV3IkYWreq1rdLRaGGeW2rV9qeuXTmTuI54QC
rxyx5bolwGNuR5mr26oISKsbYP7/6eZYMKq6xR9pRdhapQck9+sJg3cdY71zi1l/
b3pVLp6SNXKL6UExOKEHmAwcYjBISyuw7aRs7JNSDXtJHmH43SyLk+l6b9LMyaWo
DUO+5uzdUO4erYO7fjOUwx3pTEwv5S3DU/QkPrznqXOg0EcRMWXnO1VHCp9SAhKz
6yPp8SPKtKCuuireuBYUcQmeqT8AroGeejIvrnuIOWsNFY3hJqPFZbCuldyFpRvE
50bd/kbZ9YyX6r/nZgsu
=UV94
-----END PGP SIGNATURE-----

--=-QQ85Nr2ocPy2RB1A4ktV--
