Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqmvL-0005hH-MW
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 15:09:24 +0000
Received: by lbbgg6 with SMTP id gg6so7906948lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 08:09:17 -0700 (PDT)
Message-ID: <1342451031.7270.6.camel@brekeke>
Subject: Re: [PATCH] mtd: physmap_of: Add "map-indirect" DT property
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Mon, 16 Jul 2012 18:03:51 +0300
In-Reply-To: <1341303991-6219-1-git-send-email-sr@denx.de>
References: <1341303991-6219-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xx/i4+I23gJpLdyk2SA7"
Mime-Version: 1.0
Cc: Albrecht Dress <albrecht.dress@arcor.de>,
 Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
 Stephan Gatzka <Stephan.Gatzka@hbm.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xx/i4+I23gJpLdyk2SA7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-03 at 10:26 +0200, Stefan Roese wrote:
> On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause
> problems with JFFS2 usage, as the local bus (LPB) doesn't support
> unaligned accesses as implemented in the JFFS2 code via memcpy().
> By defining "map-indirect", the flash will not be exposed directly
> to the MTD users (e.g. JFFS2) any more.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-xx/i4+I23gJpLdyk2SA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBC1XAAoJECmIfjd9wqK0P6kQAIdPNX64cDR+jIeMRkjqY9f+
Ae0Wk22I0mSVhiT0kPEfttbM9ruW2dDSKhG69rIpBTK766mxuCiRl7dcn4bDeuxM
72a8PeT1o+N9pgOCwZb02BiOCM57Kmn98UsfGGFiB9yDyQfviCfd9zosoyVztGl7
EWwmPHjYYmwLx4cqSH3viSEYSr/TVk/rCXMlZnP7fq7DisR9E3uETfqFcHg6N7fg
/ssvPHashTDdo1qM4WoYKB/4C02tQ4h++8A65Cv5yTrGe2f0rONV9ZAxnYMFVIdY
jZiyqccZfBYLlQjl3nnkdu0xevWcWq6HNi8veroZS7WFZlBhkXaAvJ51EqvwrjU0
oCLfa/bSmsgjoU0i+hCl8pbaV/6OFXuMecueMkAtqktRi3fZAieB31dk9G2Hb7S6
Qa/Z6/w2HvNny7Yy9GTf0ODiZV+wtvmvdWD4nXDgU/XQTnGj1UC3mMW/6/npcZOV
0UfP5CtshNI5qFyGIFVeEF1GJQsLhDQfvxqwQSr/VK/FnWmX9vSQZ5u4kPhBGf47
KSM+Skea0du1gA6ytD3ALQB48PGh2Mcap0fdt/HcI6n2CFnSw06uzXOpdqxQ7Gkt
qKWdM9BngDtuMbvb89MR+HOuJ/hWpiLosEIPCMhYV5HaXidUe7e6yp+rvlB2rc4U
7r7b0pUT1Aztbhk4EWw+
=KfmY
-----END PGP SIGNATURE-----

--=-xx/i4+I23gJpLdyk2SA7--
