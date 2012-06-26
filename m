Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjXpn-0004vf-I0
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 15:37:44 +0000
Message-ID: <1340725301.3119.146.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 26 Jun 2012 18:41:41 +0300
In-Reply-To: <87y5nczgo6.fsf@free.fr>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
 <1340017963.2420.29.camel@sauron.fi.intel.com> <87ehpc1oyb.fsf@free.fr>
 <1340051296.1971.5.camel@koala> <87y5nczgo6.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cSCSa4ewgrn/ZKuT47IE"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-cSCSa4ewgrn/ZKuT47IE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-06-24 at 20:52 +0200, Robert Jarzmik wrote:
> > UBI does not do anything about storing the bad block table. UBI relies
> > on the MTD layer - it may mark a block as bad and MTD should take care
> > of storing this information either in the OOB or in the BBT on in both
> > places.
> Urg ... I was under the impression UBI stored that information in its con=
trol
> data, too bad for me ...

No, UBI calls 'mtd_block_markbad()' and relies on MTD marking the block
as bad - either by writing to OOB or using a bad block table.

> > There is no DoC maintainer, you can consider yourself to be the
> > maintainer, because you and Mike are the only people who care about thi=
s
> > AFAICS.
> Same as Mike, I don't have the hardware. If somebody has some spare hardw=
are to
> provide, I'd gladly take over the maintenership.

I do not have any HW with those, unfortunately.

--=20
Best Regards,
Artem Bityutskiy

--=-cSCSa4ewgrn/ZKuT47IE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6dg1AAoJECmIfjd9wqK0qAMP/RmdixNeLkUuldiW4cbUFDtx
X8H+jgtGzSWlZOLUFneUIwLK1Tt+9NjMCm8DlRH/ar329j2+QwYJ02F/CnG2vYai
IJ9csDtpUssV/NZW3mpX/xWO+VK5mPFIyKrYMDQjI/huNkgkFxh5Ejn2I3nFTKHD
Ts22UlGA0RqFO6QmEfw1T84Dv86tEaSqvnLgONAPariPMNRolSkJz2GpBLakJJlY
L8rr3QOdM8JbkjV2guxk3Icvq6wEjNVCzZC3/w2n+6TAjxjCK+KmfGvoOr/7D7Ez
RiZc7+Bm9OyUPZyZGXdlq9VtrPsuZNskJ8ImoIDEeVMgh95nVI9s+qtFZ4UDMw6s
2CLJgYwDtLX7ENVUPJF8+DNgF1pepzZz+nlQSCizK4ZqbwLLTifof5BI/6/w7YQg
qehl8ssLICAbNeUJ+MT45rHdC60z72Ux1gKSH9cr6jmGYo0QibEKugAmMOhV+Wpi
8MZbZo+Ben0dH/ot0D7y4w8uQuiuWx+E2ftVQibH8iG5qnhaln7BZdl2hETK8/ct
SXkOm4UntPQBeNvML+2gmiCF4DQGR8fW1dv4NLavbuvxhlYm9kgcMcCUwF7oxtJe
BdODSqps3BPHwt0jHkLz4BMpvfut9Cua/SSs05IPy5c4CK9ieJ5Y/uktnboN43Jj
N4r00dnMzP1ty0dsG4K7
=9Ytj
-----END PGP SIGNATURE-----

--=-cSCSa4ewgrn/ZKuT47IE--
