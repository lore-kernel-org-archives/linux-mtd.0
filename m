Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmkW8-0004vO-JH
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 11:14:25 +0000
Received: by iakl21 with SMTP id l21so10221186iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 03:14:23 -0800 (PST)
Message-ID: <1326712567.14299.49.camel@sauron.fi.intel.com>
Subject: Re: ubifs mount fails due to corrupt empty space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Mon, 16 Jan 2012 13:16:07 +0200
In-Reply-To: <4F10003D.2010809@parrot.com>
References: <CALuiOdd6vgDogxf9+RFWhb-uUoDLji2CawB3Gvisg2iW4C7PiA@mail.gmail.com>
 <4F10003D.2010809@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3MyDH1/b0I1sMwrD5w1h"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gabriel Matni <gabriel.matni@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3MyDH1/b0I1sMwrD5w1h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-13 at 10:58 +0100, Matthieu CASTET wrote:
> > My main questions are:
> > 1) What should be the expected behavior of ubifs in this case?
> > 2) Is there a systematic way to recover from a situation like that?
> ubifs expect empty space to be protected by ecc. But if empty page ecc is=
 not
> ff, this need hack in the nand driver.

I guess one could also teach UBI/UBIFS to do this. I do not have time,
but if someone with clue had it - I could help by suggesting and
reviewing.

--=20
Best Regards,
Artem Bityutskiy

--=-3MyDH1/b0I1sMwrD5w1h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFAb3AAoJECmIfjd9wqK0/WAP/2YcjpBd4xoJhYxGUORHCRTb
pP2vyK8/FA/39zUoBEtDRBA0+7FgM2YIL0HzFZUsMOFfwW6KKfU0pq++DkmsWlHV
/pLWvgNPoj52h2W+CHFNQjaaNM7g5civ5mNz/iiQrV8I5i1Zorq//1EKvt2exxlz
oljakBJB8lpYERrLTlRqrFxNsdO9NfeeZkjflx4OJRoqj5RHXrCjviSKKWaP+KRl
lf50h4kKGrndkKmS/G2SFL/ocgEXBBsG2hMiQ7VSWCagEeZ6JYPetWCWeYFrGRPm
zH6FsahHP+wbCIKGR8K+IK7uXd2AqSplOIIsQlarU9nR6gKoXG2MD7EMrqIXAPeJ
pF+ls5AtOd4c26G53Xa3kUbI6yQEjYSZGb3nE6FIOi9bxLLmE5yzNteLOzoPOvAy
9meUrbFgPOzyMqYBT5Vk4LoGBvuCnNeCF6MVf+TRUsQ4HpjFYKe0uvef2uZKMlrU
t+CZNQgWFPbpWXQ/o0Bcdji57auQjiPGd6HVSwbz74gde237YmKG4Nrbq+BQAG+k
TrHOtDKuUgONsLmY0glXnLT2QpiYKVALDvvnkhh3haF1pmiRrYYHIPKFoF1tiM8S
Tbh5zOP9CXXfAlRqI8XWYx2Dwbje4WBzLv4B25zF02WnQrzDKW03Hat30MkX7EWp
Ps4DJasP6h/dbqMNH8FA
=3kob
-----END PGP SIGNATURE-----

--=-3MyDH1/b0I1sMwrD5w1h--
