Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv4yg-0004Sm-QV
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 11:46:51 +0000
Message-ID: <1358250495.2731.126.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/2] mtd: cmdlinepart: minor fixes handling zero sized
 partitions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Christopher Cordahi <christophercordahi@nanometrics.ca>
Date: Tue, 15 Jan 2013 13:48:15 +0200
In-Reply-To: <cover.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-G7+S9RW9QJ8Po0Vgf5vQ"
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-G7+S9RW9QJ8Po0Vgf5vQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-12-16 at 19:59 -0500, Christopher Cordahi wrote:
> Removing zero sized partitions was introduced in commit
> 7baf04261062826ea225ab23e07c541e279143fa.
> http://permalink.gmane.org/gmane.linux.drivers.mtd/43507
> These changes fix a minor error and make the handling more consistent.

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-G7+S9RW9QJ8Po0Vgf5vQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9UH/AAoJECmIfjd9wqK0tLoQAJgSRSelrxPLOdsd/b1J2DC8
4P4TmAYE00c+fQnv68A1+jb73+qBZpN67FPn8dQIqxLVjs61kofyyet6QG781T01
J7JGWfQW3FyEHU2N371uSP5A8YMYoU4wVzkGinuIw5Hpp9Y41M+e2KBxWl4mynNe
POYCUx9XalYeiGCo6WzYFjwY/Vy/JOXpq8hJoKFE99Xl510CvfNJ/v2pVE6X8SqG
dKl1Ujjkoyr3xae1cD8AtGgEwKHsybChHsz9caVmZL+cfyKjWcz5Ah8o69gXH5Ac
e2uiC6O9fR9H0ka6l4kDqSEWQEFosTPtUqb0dyuqdjzxd2DoeJemlzGZ21MzJnzQ
S9hE2bj+I7iy5CwkCeQhtPrs+93miEbrPA+47T0cTE15VHmM6uqmrlfrdMm3v2Me
/QmQz7XziS8m+HWHZ7wwYbY1m5IyP19WQS+Y+CdcJ2GVkJo1fOEF/nZI93WepjWH
4pbRh994//1kYRjjk4zubah6T3/LYq4DEZT4MQNNL6aWipgefpZ9sgTyaThAFJPy
V9/8j8pAIROCTWjN+l1HtjK9lsr4WmA3UH7J6Zv8H4Y2PAbU4gGeE4DrSNitto+V
Ko/LgZhbmNrhsJ7M7NtDYoHfEQwBzdRQcBoAgd1xjKRieqrNv1VuL9YWpiMs+2vf
1Z+H8wMYzqfBtm6NU15q
=RsHY
-----END PGP SIGNATURE-----

--=-G7+S9RW9QJ8Po0Vgf5vQ--
