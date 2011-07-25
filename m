Received: from na3sys009aog122.obsmtp.com ([74.125.149.147])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QlKz6-000681-3Y
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2011 13:14:12 +0000
Received: by eyg7 with SMTP id 7so4248767eyg.13
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Jul 2011 06:14:08 -0700 (PDT)
Date: Mon, 25 Jul 2011 16:14:06 +0300
From: Felipe Balbi <balbi@ti.com>
To: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
Subject: Re: [PATCH] OMAP3: Beagle: NAND: Specifying partition offsets
	directly.
Message-ID: <20110725131406.GY18062@legolas.emea.dhcp.ti.com>
References: <1311599243-875-1-git-send-email-hrishikesh.b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="562f9N4fbIs+fPrJ"
Content-Disposition: inline
In-Reply-To: <1311599243-875-1-git-send-email-hrishikesh.b@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--562f9N4fbIs+fPrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2011 at 06:37:23PM +0530, Hrishikesh Bhandiwad wrote:
> In the nand partition table specifying the offset addresses
> directly instead of using the macro MTDPART_OFS_APPEND to gain
> runtime efficiency while nand initialization.
> MTDPART_OFS_APPEND has the value (-1) ,if assigned to offset,
> a runtime calculation of actual offset happens each time nand is
> initialized [ Refer: drivers/mtd/mtdpart.c: allocate_partition()].
> To avoid this , specify actual offset.
>=20
> Signed-off-by: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>

did you measure any significant gains when doing this ? Also, why only
beagle ? why not all boards already ? Measurment data of how long it
takes for the runtime calculation of the offset to complete would be
nice to see.

--=20
balbi

--562f9N4fbIs+fPrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOLWweAAoJEAv8Txj19kN1M18IAIxw7KsWqxQuM0SnccWthLCB
hAUEe1rFSLdctC9rEkssdNoIhJOZfjUgxuJ9BYWuUxHxwstnZFJ6qiZ/LQAEuohc
6PCxUsjriwuxIu8SrJ3aKDGNf6950TveupjshcanoQ1i2pEHYMJmu2xmqVAcrqiv
1eGYG7arlcMzV1twoxIoxq0lNvTMBLdRDDx6QN1WWchm7BHkhbQlJp4aVnY8hMF7
nHNdEO3GH1cMtTfBYhr21wiuCReDJwoYbj9XNbL8eY048Gr/1ghsgmXARcg7eFB8
NB/F62fe0eqLn448LZiFqJFsKVTOVTcToVn9spBlGuZLXM8eHt0acpv+irRd4Sc=
=iXpg
-----END PGP SIGNATURE-----

--562f9N4fbIs+fPrJ--
