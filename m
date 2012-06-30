Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skv9I-0005x7-GB
 for linux-mtd@lists.infradead.org; Sat, 30 Jun 2012 10:43:33 +0000
Received: by werc12 with SMTP id c12so2985441wer.36
 for <linux-mtd@lists.infradead.org>; Sat, 30 Jun 2012 03:43:30 -0700 (PDT)
Message-ID: <1341052998.2115.3.camel@koala>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 30 Jun 2012 13:43:18 +0300
In-Reply-To: <1340982869-77042-1-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tMePQ8Cd3G8uV1DnPKdF"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tMePQ8Cd3G8uV1DnPKdF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 17:14 +0200, Richard Weinberger wrote:
> This is the next round of UBI fastmap updates.
>=20
> Fastmap is now disabled by default.
> If you attach an image it will not automatically convert it
> to the fastmap format.
> UBI has a new module parameter "fm_auto".
> If set to 1 UBI will create a fastmap automatically on your
> flash device.
> Please see commit "Add a module parameter to enable fastmap"
> for more details.

One thing I've noticed is that you use vmalloc for some of the buffers
you do I/O on (fm_raw). This is a problem for many ARM platforms because
they cannot do DMA on such buffers. The drivers have to implement
various workarouns for this: either fall back to memcopies or do an
extra copy to a DMA-able buffers.

UBI and UBIFS already to I/O on vmalloc'ed buffers, an I am planning to
fix this, which is not easy. Would be great to not add more of these.

--=20
Best Regards,
Artem Bityutskiy

--=-tMePQ8Cd3G8uV1DnPKdF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7thGAAoJECmIfjd9wqK0fIkP/2PjNbJFA0hCh3dc1+UIUm9A
L8xHw4QEtinTbe1ISnv3djnF6QjXGRBmi13+vMnB3br0rxltmMlaRlaGaY640lyK
PUSXrD/mNiMpRyuOv0vrlyXiq4tjcYkPEqKFqo7Z5C2pgqMeXAKD7dkTKQYwRzbf
np9ulcpkCDQA4/AmXkI1KnxD3urXwZ7GrxSJlFNOdIMGOCa0tU5VrMtp0jay9Gzh
SeE3rHUacypOEnEmELt+/PIsnyxGpu5quP1WeIJni2ltVoSjMjKUDCXIy4DtXHf+
UrgUjB/RkxDfvTwKjutO2i6lMCSt0ZGB7g+FhE9mOidsGwsdvPvKbl3owE57F085
iRRGbWK+NSaxbzV6aDQneAlJJvARHCg4kCpPm7dfttc2h/IscSmq/xD3ZF4UHViu
KZFzJXcCV7I8BOf0wwtjjzEHvlFf9YL5oDHhxvJo54XUhzrMy/W2GzRjf83aNVSF
ADn+8VJygrQhGoWW92SsG6XDKqdR6Ar+sEjjKkTK3ai/2+jDgrA++9XUKSYn20Uo
KC14L2ahK37VLroyUC7dLyoAmYAvsleoQXiT6IrY8LrT/njQpMbJzzvqJ317H7Jz
bdeoknqnLXJnHPrxeufMgEADSWar7n+x1VgLqqXXCuao+cvu0MVtkmCFMaZwAnNL
FUXGhZp0MTq0UcF7ZILx
=X9m9
-----END PGP SIGNATURE-----

--=-tMePQ8Cd3G8uV1DnPKdF--
