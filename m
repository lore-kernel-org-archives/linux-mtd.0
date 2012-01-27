Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqnIc-00047S-Au
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 15:01:10 +0000
Received: by pbdx9 with SMTP id x9so2083394pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 07:01:09 -0800 (PST)
Message-ID: <1327676594.29385.9.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_spi_driver()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Date: Fri, 27 Jan 2012 17:03:14 +0200
In-Reply-To: <1327650320.3758.5.camel@phoenix>
References: <1327650320.3758.5.camel@phoenix>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3rELNBPj9h7MNcpCGSrD"
Mime-Version: 1.0
Cc: Ryan Mallon <rmallon@gmail.com>, Andre Renaud <andre@bluewatersys.com>,
 linux-mtd@lists.infradead.org, Mike Lavender <mike@steroidmicros.com>,
 David Woodhouse <dwmw2@infradead.org>, Andrew Victor <linux@maxim.org.za>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3rELNBPj9h7MNcpCGSrD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-27 at 15:45 +0800, Axel Lin wrote:
> This patch converts the drivers in drivers/mtd/* to use the
> module_spi_driver() macro which makes the code smaller and a bit simpler.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-3rELNBPj9h7MNcpCGSrD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIryyAAoJECmIfjd9wqK0j4IP/RIM72gGMqdHPj40yY3QqI0i
S6Z3Swa12SfVvCJnuZHvod1i4hBZSDSt3XkCvw9DA4xehgvQKegzI/NtjGOHaOwb
9Rym9JUHAamrJkaIbi5+XM1FnHpn+kbXImczc3wuzhsoOZ0IEKvT/slxmssqhCt3
MHSNZWfCFzXAMk5QTpxeN7EUoKbso3kM/mARU0Cmt7DbSLu94AdbQj6w+lTT259V
3nhe2m87WuWMZAEKYr+f7XwWN3EIkACDp4CcQWI/Tv1/BjrdkkeLhbGvdpyoTx1n
kimMSteisoUn4uY5j3YkirduKL4qNFPo5g65nua2i5FlQyfX1hFwJS1ElGG47ie8
hHyVC/x0DwXR04mI4+wkUpSQfi1rN2viGQ/70sPIURycudjx7ma/qfuWhjIlAFMy
huHaphtOhEtsQ0TZCTCIWT1/RrOXQVZVh660nfgFeWuHSZ8sZb9tKye72Y1q9K8l
VcLdwRs5BNobsz+1uZhQjzCUwZMzjhVT7bckzv93KBZMeFuM48f+R6V2tbA79sw7
UZdqoXJTrySBPgkuQXNCSU4l5Ti0il5RpcQ9dK8Yfkcx/umiXPt0OrSkpO193T0m
zrw+NjJ+4n3lH73ILp5XD7+KgHi5TQZHj27gTSIMgC08MhOVQvjEJcJOqJ9vBrPj
OpvWQBH5QmBGQ7P5nAOC
=p8nf
-----END PGP SIGNATURE-----

--=-3rELNBPj9h7MNcpCGSrD--
