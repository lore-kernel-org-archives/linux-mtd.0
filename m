Received: from admingilde.org ([213.95.32.146] helo=mail.admingilde.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EEqCi-0002Yh-9w
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 11:26:48 -0400
Date: Mon, 12 Sep 2005 17:24:36 +0200
From: Martin Waitz <tali@admingilde.org>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-ID: <20050912152436.GR12535@admingilde.org>
References: <20050912151244.3e512086.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFMLoheMaWcIEZAi"
Content-Disposition: inline
In-Reply-To: <20050912151244.3e512086.vwool@ru.mvista.com>
Sender: "Martin Waitz, Lachnerstrasse 65, +49 179 8230 463, +49 9131 6878391,
	91058 Erlangen" <martin@mail.admingilde.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] power management for NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--UFMLoheMaWcIEZAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hoi :)

On Mon, Sep 12, 2005 at 03:12:44PM +0400, Vitaly Wool wrote:
> the patch inlined below allows to suspend/resume NAND flash.

shouldn't we call the board driver while suspending,
to allow to actually power down the NAND flash?

--=20
Martin Waitz

--UFMLoheMaWcIEZAi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDJZ20j/Eaxd/oD7IRAmh0AJ4+HePsiq0ASVdOVI7zfeCBM92IAgCdHMbr
FxmP/pEHhU1F3X8sK1Ylsdg=
=xYL3
-----END PGP SIGNATURE-----

--UFMLoheMaWcIEZAi--
