Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUY4p-00065L-CF
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 06:51:17 +0000
Message-ID: <1337151273.24809.2.camel@sauron.fi.intel.com>
Subject: Fastmap - please, review and test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 16 May 2012 09:54:33 +0300
In-Reply-To: <20120515224645.3af023c3@halley>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <20120515224645.3af023c3@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-E3V4qMSLNpij7KSIyWJw"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-E3V4qMSLNpij7KSIyWJw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 22:46 +0300, Shmulik Ladkani wrote:
> On Tue, 15 May 2012 19:11:04 +0200 Richard Weinberger <richard@nod.at> wr=
ote:
> > TODO:
> >         - Artem is fully happy with the current on-flash layout,
> >           maybe I can merge the erase counters into the EBA table
> >         - Get a full review :)
>=20
> I'd be glad to take a deep look of the code.
>=20
> Hopefully I'll get into it in the following days.

Thanks Shmulik - I appreciate any help as much as Richard. I am busy and
my job now has nothing to do with MTD/UBI/UBIFS, and I have limited time
for review.

There were many people who wanted faster UBI, and I'd ask them to
participate now - review, test, etc.

--=20
Best Regards,
Artem Bityutskiy

--=-E3V4qMSLNpij7KSIyWJw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs08pAAoJECmIfjd9wqK0L8cQAJlzXKNMgA5zNFJAYk9iggQb
MxSW2f6WoCMWPt17ByuTruoVlh/KTWJqeFMDkzV38f+pSxySQcoGpGpcyGfpsSlF
WtGjddOBbjWYiboDwW4RDgT4pCdcZoICkRPpUBmwv6nBhHE3M5YFlijcJLr7uu0f
UypCAkH8VGir9xVWNnkW/BRgvm1GgzH1ixEYtjuuJ/BFhgba09l8j5xIeBGB5FCg
vNaFinBIWlMABltL1DjIndUpZiFPBonQVcdEjBWxm9z+ZSPs2fNuQERQj+XtBS8N
DvX14HFZjGiM3H4o7eR88tUlp8qfYLvymJb76g+04f3ImLcJ0D7GsxwZCGPbiOtb
zImqaQhELM1ryXYoLj/Tx3bcVfBYlS6Pa8FbOVZ/3bxjjGj57Xm6N6TOd7VU6rdi
UZxXJXJRujlNFxbqw/zSJXrK2FjmCcHaEQcUe6BB1f9bDWI7etW+oRt7RJNLVKSV
w4/c2gkSVY6Vwi3W92TrzTdOpmXxcrdr7/2pGUViQD9cngvr2kGkCyMUNTZwEfGp
R4rBGdSquZ6UrFMg4bF9tIQakoEX54dv/tCVSHv8U+vk+wrkhyKxEtoncXMpvIIt
0LlIFRSBXCsccGHiWAksRDVV63fADWuLtcAAUwZMYUMakIopcb7LtEBL0epJdTVZ
9nEg9VOvHHWaZfjIzywg
=ORvS
-----END PGP SIGNATURE-----

--=-E3V4qMSLNpij7KSIyWJw--
