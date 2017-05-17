Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAwuB-0004py-PH
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 11:14:13 +0000
From: Felipe Balbi <balbi@kernel.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 51/53] usb: fix the comment with regards to DocBook
In-Reply-To: <ce4a23cca5f809a588bd53c3289e6b953bb7ccc3.1494935649.git.mchehab@s-opensource.com>
References: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
 <ce4a23cca5f809a588bd53c3289e6b953bb7ccc3.1494935649.git.mchehab@s-opensource.com>
Date: Wed, 17 May 2017 14:13:29 +0300
Message-ID: <8737c3wxba.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab@s-opensource.com> writes:

> The USB gadget documentation is not at DocBook anymore.
> The main file was converted to ReST, and stored at
> Documentation/driver-api/usb/gadget.rst, but there are
> still several plain text files related to gadget under
> Documentation/usb.
>
> So, be generic and just mention documentation
> without specifying where it is.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

I'm adding this to my queue. If this is part of a larger series, let me
know and I'll drop it :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlkcMFkACgkQzL64meEa
mQYRphAAzKKNhjnz5VtgoO1q2MD7zdSL0X3iVZTHxXHYd1iSql/TyfJ8aalTLwzz
4VwjFQJgDHmIR1JBmoFXWeKtSOKCBW0bOC61XMI90yVsIsqFCRf5E/4NVCiu16Q8
EVRVoK3knXMG7hf/8OIA8+gp0k2b/8YbXPrIxyV8BXh/l82AaBhP4L8hTjDpbtt/
cZXmwyTYnLcXOg9msQIWoPYT7ML2JvzQyhTZtCfccKB9S3tZ3KKyrwRxvY5dn48N
Zby/nDDMeBi8iLu1U6oUam0k0krz1GDDHA8n+YiMCjUgw/baHBzWidAHG4qu4xg1
KXJQZZuBpU09MycAYWvbf2MTSMI4H3H4XU9aQNu48mYK6Yf43SmF278kzByt9cWa
iPBu5tyP5sl8FD7JVNyV5Y6P5J3l8EiuKxuHbgQQwBMO5lH0OWc7nb62CT7BAAP2
LW+PbrWieEpkLKKiNW44tpdzcR37njxxtPzvl38/lQS1KYEOVXiJUDWHhcy49Nq+
M53sMDF3vibCnmY8NW3jYUuA0O99fCPUUS2ttZSsKfntEQRAex/jVHI8qBE05bZ7
jTpTRo7gihwIhCX7r7tUm4nNj0zLTBe3itq7WlfPoyn1iGXP10Q2CZiSYiMZ2dnn
obhTuh3BfA6mFY7wawDLkYR4cKbCURRGNyJM1xLsWx9+xo5adu8=
=Zbim
-----END PGP SIGNATURE-----
--=-=-=--
