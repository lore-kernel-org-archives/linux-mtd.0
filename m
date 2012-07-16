Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqmOB-0004OJ-Ff
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 14:35:09 +0000
Received: by lbbgg6 with SMTP id gg6so7867026lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 07:34:57 -0700 (PDT)
Message-ID: <1342448961.7270.0.camel@brekeke>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Micron M29EW bugfixes as per
 TN-13-07
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Date: Mon, 16 Jul 2012 17:29:21 +0300
In-Reply-To: <1341299387-6303-1-git-send-email-gerlando.falauto@keymile.com>
References: <1340792855.29342.39.camel@sauron.fi.intel.com>
 <1341299387-6303-1-git-send-email-gerlando.falauto@keymile.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GSi5zkgb/AaQAYy1RLrd"
Mime-Version: 1.0
Cc: Stefan Bigler <stefan.bigler@keymile.com>,
 Holger Brunck <holger.brunck@keymile.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GSi5zkgb/AaQAYy1RLrd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-03 at 09:09 +0200, Gerlando Falauto wrote:
> Fix the following issues with Micron's (formerly Numonyx)
> M29EW NOR flash chips, as documented on TN-13-07:
> - Correcting Erase Suspend Hang Ups (page 20)
> - Resolving the Delay After Resume Issue (page 22)

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-GSi5zkgb/AaQAYy1RLrd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBCVBAAoJECmIfjd9wqK0v1MQAIvJTGjiV+tQ7ktXSEcG8D8Z
zmLFoqSQk8C1fxx/S9yy21inlRRdFdMaZgiKNauryDWfOKLME12Pk2rI2Mai7IbF
RIC+HpxAiMmzUf7ql4LUn8eBtLlsMvqNRGoONOhYHMJ5a+5+dLUW0+PjOEk9yRmh
+JN00PAD5zhgxjrODh2KjAmDhw69Mln62y1JkrIzgunG7F9kYHwWPeXIUSVj0QI4
VBNqhzTw80ivrbrRMBsCYcQMWFLMSU5zH8bqDCo5TZFcei+IHYwIuAc90bjpl9/U
2QgfapK5/xTfw9LomikFpGtwggmpcRoPniiPijMOumJSGj+X7vY7Dqe8559ZKyYx
oBtB8kkNW4HTDDFQBd9KC+S/CTH+5Q79rbA1sEJo2wceVIUXamjAMcQBDRW5eBs2
VwdTnfagyIZg2s0NMShb73D+4tQhD3EIk62soJOfE5kpDrmoVv1jj0tj+NCbaobx
t+3XVG0FIkyHg7TVLxgCMfD4Ue2VxVmPzNS0gS/Bixdgp+P6pCyEYzwVYCNiNNWH
0jZeLAd2gxUQFp49DSWJW6MKkRglzbeDL+BHr7hyIvd7Ju612k7kEc9Pw2CCqUZE
Te3SXHUXe+EZV5u61y2Z/83e1vm456L++km1Wd1L6rIv7JVV0PTiuFoInFGRP0Hf
xwduBTjphuFPdKNl3GBH
=dkhK
-----END PGP SIGNATURE-----

--=-GSi5zkgb/AaQAYy1RLrd--
