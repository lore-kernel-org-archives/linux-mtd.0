Received: from khitomer.mortis.eu ([185.27.175.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7uDU-0006hc-A2
 for linux-mtd@lists.infradead.org; Sun, 04 Jan 2015 23:04:12 +0000
Date: Mon, 5 Jan 2015 00:03:48 +0100
From: Giel van Schijndel <me@mortis.eu>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix error-code overwrite bug
Message-ID: <20150104230348.GG4806@salidar.dom.custoft.eu>
References: <1420394662-20011-1-git-send-email-me@mortis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Content-Disposition: inline
In-Reply-To: <1420394662-20011-1-git-send-email-me@mortis.eu>
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 04, 2015 at 19:04:22 +0100, Giel van Schijndel wrote:
> Don't overwrite the returned error code with the boolean test used by
> the if-statement (otherwise it'd be 1 or 0 always, 1 in the if-block).
> ---

Forgot to:
Signed-off-by: Giel van Schijndel <me@mortis.eu>

--=20
Met vriendelijke groet,
With kind regards,
Giel van Schijndel
--
"If debugging is the process of removing software bugs, then programming
 must be the process of putting them in."
  -- Edsger Dijkstra

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlSpxtQACgkQZBYm/87l50JiwgCeJi8kTE/RgtKtdfghcRjFXwqn
I/MAn2aLKqQNbYK6B3zcj04xDxXR1zM8
=Xi+e
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--
