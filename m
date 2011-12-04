Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXCkS-0002xo-J5
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:08:58 +0000
Received: by iaby26 with SMTP id y26so4022iab.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:08:55 -0800 (PST)
Subject: Re: [PATCH] [MTD:UBI] Missing scrub when there is a bit-flip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bparekh@nvidia.com>
Date: Sun, 04 Dec 2011 16:09:57 +0200
In-Reply-To: <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
References: <1322655222-28348-1-git-send-email-bparekh@nvidia.com>
 <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QRIImN5Jxbf3JyfNMbH4"
Message-ID: <1323007803.9400.56.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QRIImN5Jxbf3JyfNMbH4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-11-30 at 17:43 +0530, Bhavesh Parekh wrote:
> Under some cases, when scrubbing the PEB if we didnot get the lock on
> the PEB it fails to scrub. Add that PEB again to the scrub list
>=20
> Signed-off-by: Bhavesh Parekh <bparekh@nvidia.com>

Pushed to ubi-2.6.git with minor amendments, but please, do confirm that
you verify that this patch fixes the issue you described.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QRIImN5Jxbf3JyfNMbH4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO2381AAoJECmIfjd9wqK0Mj8P/2byjFPrCbFwJDa+wHh/qOr6
avv8iBxNba5NXlsXYa/EkCprBKwdiBs1hNOjn4G4ZDNAic1JhL03Gu/ujkDIJSRw
MkvCM4ah9A8G3CiVY04ad1n9Xlv+iPwqF9+GE3lxHsuAu8rD6u7xjPH9rVFoNYdD
iSwX8oXTIKjY00wFa/yyZEz/KyrZ/QVQMkeY46isAI1/hNwNNSoK8KQ/gkhgHfx5
nstk9Bn8d6thA6e3ygQcx0JtRP3NVBBDPjTpc75XtVf4dyYU7LjTLoTKUTFqrq3P
HZcT8AtHcdrMYW4D+P79kN7fqhMPVqu77ZcYakAdTnhQIEioeRiLkt3dTxIFj1wc
u3VeeJAj2F+mBPeTW1QhTnoqT67Fd49ZGHgt1lAONnbHMjZpIcRT6UYR8nlmp/yk
T3bsH8lEsEG8QDeOPEMNjlX8G0vZgjDycS93Cwx5QS/wBqK4AnMLW1kWFGwF5C60
dZ9w2iKjBFOk5IlFXyiyQR+PiQ6hfPpMWsrjc0p9Yu5DQv1I+ByxyE0WjN4d2nEu
x+YQtyCgl6hgupNa78rDUkbHkzD4wcKtGo09djB7v+wfXyaCFYJ1irLVrBNCGSd0
p1cKQ+1VaNeQATyBqW/QNg7yCRgXdf49/8b1/RQQF3njWPOLMIV+JsMzxiO5BnOm
ByiFUXsFxe6/WP/zif7D
=tt6T
-----END PGP SIGNATURE-----

--=-QRIImN5Jxbf3JyfNMbH4--
