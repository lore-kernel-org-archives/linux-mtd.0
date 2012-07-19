Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrhcT-00027J-Oe
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2012 03:41:43 +0000
Received: by lbbgg6 with SMTP id gg6so3126817lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 20:41:38 -0700 (PDT)
Message-ID: <1342668949.16745.0.camel@brekeke>
Subject: Re: [PATCH 2/5] ubi: Limit amount of reserved eraseblocks for bad
 PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 19 Jul 2012 06:35:49 +0300
In-Reply-To: <20120718225537.38ddbb60@halley>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
 <1342607317.7530.9.camel@brekeke> <20120718225537.38ddbb60@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CUBNkJ6ZnSDhiF3VUZgm"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CUBNkJ6ZnSDhiF3VUZgm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-18 at 22:55 +0300, Shmulik Ladkani wrote:
> However, if you DO NOT mark it bad, but instead go into RO mode, you
> should be able to later re-attach because the good_peb_count would fit
> (no shortage of PEBs).=20

Yeah, you are right, I'll return to the original patch.

--=20
Best Regards,
Artem Bityutskiy

--=-CUBNkJ6ZnSDhiF3VUZgm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQB4CVAAoJECmIfjd9wqK0+8sQAM4yQMGpLP0Zbj7tRy1wwZKq
W5fk5zGDYDdCVJiWtDy80C4RPoKW4WfPIzrJAYTszeDK3BAkkAI+8cW7go0wgJFF
f+uy7nPLFYTSP07LzPSufk7ODGGMdiFWjcLT6BKDRLbv9uUd0cyLWu/z9dw+mgdl
f1Xu/APekLn/5Ydy+9yHQIEmCRVkrEbEKi/NF22K+A3xE/6U0HTSkZcsoR8Osnlc
4gKdib1gL38AJldasd9UMTUJt+C9YgNZzJHmgfL3W2bhdAnRvez7xhAVGE+9xarT
watcSgsvmXdbKk45rWhGYZH4hQVtXUC3dD05O4P5AhSZzJgq276gu7HeZSw7uir2
z6hgbJvIx5jx/HhkmQeisGM26QpvgvVl68IPAN26puTda5FU+fK8HFS54J3QrSxz
vRtuZW9Kx/uhG7KU+sJhJ800xNatl7vaRMQfhzXadbruXxAtxEJPV0xE6yBPON3N
44+dG9QAcFaTuQqFoOzI6kwv8vHDl0qnkfvggbZ4cOME8Y5u9YdkMoLx5IMKhY2P
gQImafXtYkdRltg/0JYJcbCurm0+eSdQeH1Ohl3dPAV5fxZyCkQWdbEDbnyVRD26
UqGRbTA1Ly8q2NncLZh0nMVwzlgMXM9ohF9HK8zhGYvECUOpbFtDx2nJTNB1uGSS
Yfav6Rmv3tdGpXByCECq
=qFMP
-----END PGP SIGNATURE-----

--=-CUBNkJ6ZnSDhiF3VUZgm--
