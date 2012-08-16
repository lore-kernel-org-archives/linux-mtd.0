Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1xQb-0004Rb-Td
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 10:35:55 +0000
Message-ID: <1345113602.3393.196.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 16 Aug 2012 13:40:02 +0300
In-Reply-To: <20120815173116.51de197a@pixies.home.jungo.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <1345032317.3393.135.camel@sauron.fi.intel.com>
 <20120815173116.51de197a@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-71cbcmvdBZ/tEwrewKBJ"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>, linux-mtd@lists.infradead.org,
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


--=-71cbcmvdBZ/tEwrewKBJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shmulik,

On Wed, 2012-08-15 at 17:31 +0300, Shmulik Ladkani wrote:
> > Amended the commit message to satisfy Smulik's request, and pushed to
> > l2-mtd.git, thanks Brian!
>=20
> I had some second thoughts WRT the move from MTD_OPS_RAW to
> MTD_OPS_PLACE_OOB.
>=20
> When reading BBT content, MTD_OPS_PLACE_OOB is preferred.
>=20
> But when scanning the OOBs for BBMs (when creating the table), I guess
> MTD_OPS_RAW should be used - since manufacturer bad blocks are not
> protected by ECC (as Matthieu noted in [1], and I elaborated in [2]).
>=20
> Can you please review and comment regarding the ideas discussed there?
>=20
> Thanks,
> Shmulik
>=20
> [1]
> http://thread.gmane.org/gmane.linux.drivers.mtd/42243/focus=3D42365
> [2]
> http://thread.gmane.org/gmane.linux.drivers.mtd/42243/focus=3D42669

I cannot spend much time reading the threads carefully, so I went
through the discussion only very briefly. Apologies. But I took the
patches because:

1. They do not break existing (in-tree) systems which do not have OOB
protected with ECC. This means the patches are harmless and while useful
because they clean up the code.

2. For systems like Brian has where OOB is protected with ECC, the BBM
should just not be covered by the OOB ECC. And the OOB scanning code
should not read non-BBM bytes, and we are done. This seems to be the
only logical setup for me.

If it is not the case, I just consider it is Brian's problem, he'll deal
with it and send us another set of patches.

Or to put it differently: he sent a good clean-up, which does not seem t
break anything, why would we not take it?

If you object merging these patches, I'd appreciate if you could
elaborate why they would be _harmful_ to have.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-71cbcmvdBZ/tEwrewKBJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLM4CAAoJECmIfjd9wqK0makP/io2y8lCqz/q5L8xibusNNra
kmVrDkScDRnSaEhKta/F7wehTcipyh4JtEovrfsTroU6yCNeAk3msSE3aOxMSNfM
9cQ0VfHgD+D0ZmOBTuJUbNwmIQ7T8eV88Kk+B8FWPyP5yerY9eqCnwEh3cql3e38
bWF9ESForDgTq3YwP3UHEwiRlT8pwoblGSBMHpKFApGqMHtCX9vnWoIhDmejto9k
t/z/OjsaADyJrYfJoUdrh7FMICY8kdZsTV85YLjW+RCJiZBw/kAln/nTsZE1PTBc
cqszAvHfaFfbx+gn+msRJwKWkwAjueJv6F83WtNXyslQ50Dwn6lu4dui/xAwgoGd
S5VD1DLOTClVmonqjSFhWIrLmf1HM130JyE1AMWN1Sg2QcU0/EwbXuU8IMvu+4bD
KHb77z3GMH33gogKlUOzLJdBl9nkmMgP1mm1B+32m14ZRyd2c18uMLKUoINGg5oI
TNKSeqEbcVxrRo/J6l6Mq3HKeu8Pw7sMiZtAC9SwrV0bni02SdV7UtC1S3dDo/w3
VTentA2samDY2jnjaFrL+IB0bUHVw8z/LBKdtq8XMi0K9dvBZRRyMb9228qdq5vM
6+XmFh59CZnHNWfHGYOGgOws2qB3WwOGc7wv/Xdxnrsv6kzeOfANdSNpcTgaaEv3
En+5mhNyaQgTz/32JtSn
=9TtT
-----END PGP SIGNATURE-----

--=-71cbcmvdBZ/tEwrewKBJ--
