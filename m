Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19dXA6-0002nw-6A
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 16:28:46 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: =?UTF-8?Q?=E5=B8=AD=E8=82=B2?= =?UTF-8?Q?=E5=AD=9D?=
	<xiyuxiao@harbournetworks.com>
In-Reply-To: <E19dNHB-0001PU-Vv@pentafluge.infradead.org>
References: <E19dNHB-0001PU-Vv@pentafluge.infradead.org>
Message-Id: <1058541954.23754.30.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 18 Jul 2003 09:25:54 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-D3zFOsRgN5uji/G1ZBBh"
cc: linux-mtd@lists.infradead.org
Subject: Re: AM29LV160DB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-D3zFOsRgN5uji/G1ZBBh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-07-17 at 22:57, =E5=B8=AD=E8=82=B2=E5=AD=9D wrote:
> I am now working with NEC VR4131 and flash AM29LV160DB.
> I use Harhat Linux.
> I have a trouble now.Can anyone help me?
> I configure MTD subsystem as below:
>     MTD support
>     Direct char devices access to MTD devices
>     Caching block device access to MTD devices
>     Detect flash chips by CFI
>     Older drivers for non-CFI chips

You shouldn't need non-CFI drivers - the AM29LV160DB is a CFI chip.

>     JEDEC device support

Does this mean CONFIG_MTD_JEDECPROBE, CONFIG_MTD_JEDEC or both?=20
JEDECPROBE shouldn't be necessary for the CFI part.

>     Mapping drivers for chip access

Which mapping drivers?  Do the mapping drivers match the hardware?

> But when I boot my target,the AM29LV160DB can not be detected!!!:(
> Did I make some mistakes?Please help me.

You should select CONFIG_MTD_DEBUG and set CONFIG_MTD_DEBUG_VERBOSE to
3.  The dmesg output (or "echo 9 >/proc/sys/kernel/printk" for console
output) might provide more hints as to what is going on.

--=20
Thayne Harbaugh
Linux Networx

--=-D3zFOsRgN5uji/G1ZBBh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/GBGCfsBPTKE6HMkRArX7AJsGXj6brBmFeJzfPrpUKim/5xTF9gCfRF4H
9lMv4jlTN4YM1Pxjsa2XH2M=
=sTot
-----END PGP SIGNATURE-----

--=-D3zFOsRgN5uji/G1ZBBh--
