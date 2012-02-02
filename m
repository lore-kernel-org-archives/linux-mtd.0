Content-Type: multipart/mixed; boundary="===============1922810669=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v3] mtd/gpmi : add BBT support to gpmi nand driver
Date: Thu, 2 Feb 2012 11:51:25 +0000
Message-ID: <1328183611.28171.170.camel@sauron.fi.intel.com>
References: <1328008316-27258-1-git-send-email-b32955@freescale.com>
 <20120131121007.GO2471@pengutronix.de>
In-Reply-To: <20120131121007.GO2471@pengutronix.de>
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============1922810669==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-d+1VLgiwXS4SZFda1Wbk"

--=-d+1VLgiwXS4SZFda1Wbk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 13:10 +0100, Wolfram Sang wrote:
> On Tue, Jan 31, 2012 at 07:11:56PM +0800, Huang Shijie wrote:
> > Add a new field to gpmi_nand_platform_data{}.
> > Make the BBT support to board specific.
> >=20
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
>=20
> Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>
>=20
> I'd think you won't be able to mark blocks bad, though. Will send a
> patch in a minute. Please test.

Sorry, I have not read this and the previous related long threads, but
from the few first e-mails I got the impression that you are not aware
of the patch from Brian Norris where he modifies MTD BBT code so that it
will by default write bad block markers _both_ to the BBT and to OOB. It
sounds like you should hold on with this patch and wait when Brian's
patch gets in. Then you probably may just use the first version of this
patch.

The patch I referred to:
http://patchwork.ozlabs.org/patch/137154/

HTH.

--=20
Best Regards,
Artem Bityutskiy

--=-d+1VLgiwXS4SZFda1Wbk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKnk7AAoJECmIfjd9wqK04vsQAMwT3ogPfVrB73hUZCFpKfrO
MlPyUCOm133uSsscKaXP5dE0ZyhVSaMfvxQAu1L8Go4dPS6sfynnojVPFfTIWu/g
Y3JpNtbnNHvSlgqNKG4wH7bstapGM1kXgdmcalZgGAK5nbgvDTh/bjR9zQXkW43f
Ig8MgTpukN0F6ojDsLGR6zVyAxBlPPuyYnDNjnV/gRm/PjX5iMY0UQXxWdtnxNB6
3ULcE0pT+g9bsVb98zynpLJ37aqB+bE3J6/7GPCs/HzSaTIzKsNv/JpaDaFmXth1
EcwEjz/NRNk/46v2JD89CVak+hIKdBjWjrHscC6ZZEaxBQG4rZ5LmjAGWQmm1FCr
Kbp/hebUQljqFsC657eTT/PxwfpPGHtPvAZw31ObWmgAoi15YWh9g68w+Nnszpgw
pG7hM3gd/yIBnmX/WGXwHQGf/kBAwahW/vOOQuAX/B+2zD1L6F70sOr7i1LgUWdL
gnBSENszrmUSXg8uAQ+0PM4p9nMhvLOOX6z0zmg5fydlyQkmvqe0SQvXIky7YDqK
A1BXjv+F66NpKS3ILKjayEFPVD4QZtNnhrn7CNXpI9VQig8kGZ7kbL+PASgq6/5G
ZstWoT5Y+Bo1XwVMunmJDmKf5YYNIJk+PLekDJpkyj4KYEND0VtHP4mL8gDrdt9H
eIHYIv8vwdCU4Cs3ME5U
=lwko
-----END PGP SIGNATURE-----

--=-d+1VLgiwXS4SZFda1Wbk--

--===============1922810669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============1922810669==--
