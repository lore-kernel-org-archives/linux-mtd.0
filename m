Message-ID: <1337342063.2483.37.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Fri, 18 May 2012 14:54:23 +0300
In-Reply-To: <20120517125544.GJ9571@n2100.arm.linux.org.uk>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
 <1337160353.24809.26.camel@sauron.fi.intel.com>
 <20403.29677.517067.528042@ipc1.ka-ro>
 <1337161217.24809.38.camel@sauron.fi.intel.com>
 <4FB49C60.5030002@atmel.com> <1337255011.2564.2.camel@koala>
 <20120517125544.GJ9571@n2100.arm.linux.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4PZr6jz0rdn9qk5I6ieg"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org,
 Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4PZr6jz0rdn9qk5I6ieg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 13:55 +0100, Russell King - ARM Linux wrote:
> > You can just remove the backslashes. I think your lines splitting is
> > fine otherwise.
>=20
> It's also preferred _not_ to wrap error messages as that makes them
> harder to grep for.  Linus has mentioned this several times on LKML
> and has corrected error messages that he encounters that he can't
> find via grep.

OK, thanks for the info.

One could argue that it probably only makes sense to avoid splitting up
to the first %d or another printk placeholder. Beyond the placeholder
grepping is not more difficult.

Well, anyway, I would not like to force people to split or not split
strings. I'd also say that it is more important to follow the style of
the driver/subsystem and be consistent.

--=20
Best Regards,
Artem Bityutskiy

--=-4PZr6jz0rdn9qk5I6ieg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtjhvAAoJECmIfjd9wqK07DIP/ixH3cFmnPpwyYKWFRpHSb7R
OuTlImT1fcFpeWterFt1Ea83+iAuD7LDL3p9r5O+fRMjAEwkP8oPqK2u2aswgNRg
Eqs5Dd+uefeOvVEc19F2pazo8vP/OAmQ1+uVX6oHAq0bXz9775zzg32RlS775JJU
CmuA3p6K5gUILAzEmxvCGXehqBEA/P2DIyKTh1XevmT9g/oifV2ToJ3IHk576wco
uYD2tSw9zXJKZbV6Drth6cX+U2yFxemtf0ZtnMvNnGnWkQM3LGgEKuC9mdkfiPxD
ND3GuxQLo7jAIq63P1rw7LSc5ViM0xXwKghYOCqVEn8SE5UE1FWglwWJ3+FdR4P4
FJt2R723Lj2LHzIBOa6ixTR0Yck6Yi9/7ZNUhlcncjx+Swq9sXiDimWg3Kh8QsgL
R9AZKZ0t03KhrZOtXqmxjYaqC3kJNiGCdM95br57JHuVbP1Rcy/Lum/GuR14oVMQ
/DeXYKao8U4Yg4ESAOfHJpMYoU4yhwaQIBVJEEf9wdmrXGpNcV7y86Q0FD7wgMjx
smJq2W8FTT49CKXA41NqeSBPua8zsVE9q651RBQwqXQGl8LJDsj5mWyksvSBfIDZ
RSgp3LbIvpJaVx8BAebRc/XChYvMS3iM2YKkNFTIh+jBmYQIkmy0qOp6tCtiwedp
2VkUZFprYD6qyO+DvoX+
=M7Wd
-----END PGP SIGNATURE-----

--=-4PZr6jz0rdn9qk5I6ieg--
