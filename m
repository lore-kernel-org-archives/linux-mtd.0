Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGoID-000661-Ns
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:52:34 +0000
Message-ID: <1348653158.24309.54.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: nandsim: BUG: Fail if overridesize is too big
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 26 Sep 2012 12:52:38 +0300
In-Reply-To: <CACQ1gAg7Kb7v1HZVdF1N2CtmUSGEYJwB+Un2GUJFDX+==6yO8g@mail.gmail.com>
References: <1347452786-10208-1-git-send-email-richard.genoud@gmail.com>
 <CACQ1gAg7Kb7v1HZVdF1N2CtmUSGEYJwB+Un2GUJFDX+==6yO8g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2fRQS657P+dAEeYjX3UO"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2fRQS657P+dAEeYjX3UO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-18 at 10:27 +0200, Richard Genoud wrote:
> As this is a bug fix, it should be pushed to 3.6-rc7, shouldn't it ?

Well, it is a fix for an ancient bug, so it is enough to CC the stable
tree and merge this patch normally, I think.

--=20
Best Regards,
Artem Bityutskiy

--=-2fRQS657P+dAEeYjX3UO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYtBmAAoJECmIfjd9wqK0S2UP/0tC4LMPyFLJDWRr8tl1xhsM
4UGZwAaar62DoB2k8BxtA/Q3bpKjcKIIQ9ttoIe3oQE0gkPmkJ5tYupNkQVqUI5G
Hc+jCv6Cex4KPnO0lWsAyRveKldK3xL5WfyDJ9l0osECCPzqqQNXwbyQY6ntdNGm
Hyg/nABmXZuHX8ucAf9Pg4NzKOPRHSEm4NqsHCGv/JDzMcUhy7LHgRlzNhv7/U0P
+LI/4ByvyUHtpeMYMrlhkE4GXEN/x6yNP6sFw/8jsmPjz++53eMpAO2oRYoHPDPf
yainbF3AgCszdp0JOpGidX5EJtN2viZUtWHYOFMpL1QXb+KJXWW2PwYZdVG/s4y8
wpOnF9iW0LQRklYM+8dwqMY0NDiRylC9QMW1XTkwvS3CvQNNEZDgCGiC1e+JweeL
5bqKG10S45KGawcwsVw1XKgd5vIkAGqjXeyxWvyJ/Kji4HQiOc2i8BMrACLwp/ms
3Y2BSOVeFSUMzCTma1BFDYppqwCAyYRvkn/ydL4fA27i1ChQvmFYnQ6OlJduIRve
aiMqaku6UKjFQzsHSybxuwtx6X0yfV+t18ArhNOCJysdQnWSBlXh2YRs+jTUR7F1
RuUQNCgBLj5HSpWowFLRZfun4XUiyDAA1BaUp5rYj5UaY3xuxQKvmsZWR5SYYq4e
I+BIr2i+YqNZxi/q/e+o
=Eqnd
-----END PGP SIGNATURE-----

--=-2fRQS657P+dAEeYjX3UO--
