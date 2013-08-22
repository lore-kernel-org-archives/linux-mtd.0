Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCU9I-0006x1-Q6
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 12:38:01 +0000
Date: Thu, 22 Aug 2013 13:37:35 +0100
From: Mark Brown <broonie@kernel.org>
To: wangyuhang <wangyuhang2014@gmail.com>
Message-ID: <20130822123735.GA9902@sirena.org.uk>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
Subject: Re: [PATCH v3 1/2]spi: DUAL and QUAD support
Cc: spi-devel-general@lists.sourceforge.net, sourav.poddar@ti.com,
 tpiepho@gmail.com, linux-mtd@lists.infradead.org, pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 11, 2013 at 06:15:17PM +0800, wangyuhang wrote:
> fix the previous patch some mistake below:

One other thing: this wasn't sent against current code, it seems to have
been generated against an old kernel version.  Please make sure when you
submit that you submit against either Linus' tree or ideally the latest
development code for the subsystem.

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFgYMAAoJELSic+t+oim9U9oP/2qOfnQ4SIMeRcGdD7Ee2yap
ylbbdECwA/duEyv5+lSfyh3/QrYsLDCFCjHM+dNhUkp7n4/33grh7lXe/p3YlFcH
krSd2PcvW7r/9QF0pqY8oOsJFlmjzKfDBX1C01GLNrwK/0y/+Bl6quDHnyq+9dJC
hg72m3DaHL+g0Ebt/uPc6SwzVeu2MdMX1XOgY/bso+XsZIp4aO3s7ikpS8v9VIBc
aHFdoPfe/zMWBMjlzPkgLklIqGbABpW23HqLygNbuifTbhs2CFQjkP5KlaJxtPy1
kihvBEogpxx/p7FjUm70I1Im/kxuhAZxXe66Rb15yu3fgr5ZXwPUIdfZp/lJrZ92
SxBitsp7pkIV+0rPcw0pXy0pq9DHTBeEkjCjgA/gmbghMTk6aotjTN04S6WjzXS2
WdLjimuqKfqd1rWTkozMTJ3FtpVBPxnGnQLH9WITh9ba23TLXfrq+c9oixCy6mPK
T5ENCJR94ffqH0SZ47t9wjbXTjaQBKkUd1eFP1qMURNM881TyHru0p1DejqeorhP
BwgWLqazRR2G4jfxq+86uYBkdCxWTwoJRLQATef6G5eRAEUHcfZYBhhc+onj8LDY
gFLWPCl84HhNb9mViQn0xWJCO/BhEttfISqY8SnKjGneWtifvH8baO6XGIKuBjsQ
SS88i8fyHRZrJkTqPpgj
=aVw4
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
