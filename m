Received: from [2a00:f10:121:400:4ec:bcff:fe00:497] (helo=khitomer.mortis.eu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Y8wfK-00071c-K0
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 19:53:15 +0000
Date: Wed, 7 Jan 2015 20:52:44 +0100
From: Giel van Schijndel <me@mortis.eu>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Fix error-code overwrite bug
Message-ID: <20150107195244.GB18978@salidar.dom.custoft.eu>
References: <1420394662-20011-1-git-send-email-me@mortis.eu>
 <CAHp75VeZnmsRLV6_gg9Wci03ZEJCk=dRDEkp7DsEubypVvCi3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <CAHp75VeZnmsRLV6_gg9Wci03ZEJCk=dRDEkp7DsEubypVvCi3A@mail.gmail.com>
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 20:37:29 +0200, Andy Shevchenko wrote:
> On Sun, Jan 4, 2015 at 8:04 PM, Giel van Schijndel <me@mortis.eu> wrote:
>> Don't overwrite the returned error code with the boolean test used by
>> the if-statement (otherwise it'd be 1 or 0 always, 1 in the if-block).
>> ---
>>  drivers/mtd/nftlmount.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
>> index 51b9d6a..1cbeb6b 100644
>> --- a/drivers/mtd/nftlmount.c
>> +++ b/drivers/mtd/nftlmount.c
>> @@ -91,7 +91,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
>>                 /* To be safer with BIOS, also use erase mark as discrim=
inant */
>>                 if ((ret =3D nftl_read_oob(mtd, block * nftl->EraseSize +
>>                                          SECTORSIZE + 8, 8, &retlen,
>> -                                        (char *)&h1) < 0)) {
>> +                                        (char *)&h1)) < 0) {
>=20
> Better to move ret =3D x(); outside of condition. See here:
> http://permalink.gmane.org/gmane.linux.drivers.mtd/56922

In the sense that this bug wouldn't have occurred when using separate
assignment and condition checking you're right. It's a style issue
though, but a relevant one.

So your approach is probably better, though incomplete (like mine), just
look for the exact same (ret =3D x() < 0) pattern about 20 lines further
down the same file. (Yes that's disabled code, but I still believe the
bug should be fixed considering it's exactly the same class of bug).

So I suggest you resend that ^^ patch you link to with a fix for the
other instance of the bug fixed as well.

--=20
Met vriendelijke groet,
With kind regards,
Giel van Schijndel
--
"If debugging is the process of removing software bugs, then programming
 must be the process of putting them in."
  -- Edsger Dijkstra

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlStjooACgkQZBYm/87l50J74ACfUQ0/RtYPgvYmRcv/0B4GO20K
+1EAnRNMWv1pnANYLj61MC1UE/oe5LTL
=ISzU
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
