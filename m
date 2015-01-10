Received: from khitomer.mortis.eu ([185.27.175.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YA2Ns-0002rQ-Pp
 for linux-mtd@lists.infradead.org; Sat, 10 Jan 2015 20:11:46 +0000
Date: Sat, 10 Jan 2015 21:11:13 +0100
From: Giel van Schijndel <me@mortis.eu>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] mtd: nftl: reorganize operations in condition check
Message-ID: <20150110201113.GA7918@salidar.dom.custoft.eu>
References: <1420663040-3857-1-git-send-email-andy.shevchenko@gmail.com>
 <20150109232900.GB9759@ld-irv-0074>
 <CAHp75VdBuqdFYTuQuSPY7QUpL0p7Ku1n7=t7aT+QP=d17ndwHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <CAHp75VdBuqdFYTuQuSPY7QUpL0p7Ku1n7=t7aT+QP=d17ndwHw@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2015 at 14:56:32 +0200, Andy Shevchenko wrote:
> On Sat, Jan 10, 2015 at 1:29 AM, Brian Norris <computersforpeace@gmail.co=
m> wrote:
>> On Wed, Jan 07, 2015 at 10:37:20PM +0200, Andy Shevchenko wrote:
>>> We need to compare ret variable for negative value. The current code
>>> assigns the boolean to the ret and prints it wrongly in the warning
>>> message.
>>>
>>> Reported-by: Andrey Karpov <karpov@viva64.com>
>>> Cc: Giel van Schijndel <me@mortis.eu>
>>> Cc: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
>>> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>
>> To be clear, this touches some commented out code (yuck). I think you
>> noted this previously.
>=20
> It had been proposed by Giel.

Yes, and I suspect (and hope) Brian's referring to the existence of
commented-out code as "yuck", not the removal of bugs from it.

>> For my reference, are you actually testing this driver?
>=20
> Not a real testing. Only compilation on x86_32.

Combined with review I think that's enough given the nature of this
change.

--=20
Met vriendelijke groet,
With kind regards,
Giel van Schijndel

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlSxh18ACgkQZBYm/87l50K8CwCfTI25llHhEyICgfZZDgkeHo9X
2XAAoIzKPkoF8INzf0UiZYT2kK9q/Qzt
=Qs4Z
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
