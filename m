Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqKET-0002hB-3e
 for linux-mtd@lists.infradead.org; Sun, 15 Jul 2012 08:31:15 +0000
Received: by lbbgg6 with SMTP id gg6so6575316lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jul 2012 01:31:04 -0700 (PDT)
Message-ID: <1342340730.25457.3.camel@brekeke>
Subject: RE: UBIFS fails to mount on second boot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Sun, 15 Jul 2012 11:25:30 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
 ,<1340806219.3070.23.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
 ,<1340977577.3070.207.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nF9qqomStIQ/I4tuoUJN"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nF9qqomStIQ/I4tuoUJN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-02 at 17:49 +1000, Iwo Mergler wrote:
> It's similar to a BeagleBone, but with NAND FLASH, I'm using the
> omap2 ECC driver.
>=20
> So, if I set NAND_NO_SUBPAGE_WRITE in chip.options, UBI will
> leave the subpages alone?

I think so, but it is better to dig and find out why sub-pages to not
work - this sounds like a bug. With sub-pages support you'll waste less
flash space because UBI overhead will be smaller.

> So I had to make two debug runs, one each for ubi and ubifs debugging
> enabled.

I've reproduced this bug using nandsim and fixed it. I've sent you the
fix few minutes ago. Could you please test it? After I've got a
"Tested-by:", I'll send it to Linus and it will also go to -stable.
Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-nF9qqomStIQ/I4tuoUJN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQAn56AAoJECmIfjd9wqK0EWEQAMjnarRiJ1heIfseH9SZFRJ5
qzOHyoAIVehzKSkCKVhnZxp3dB5Hb95i+ln83COb8KSYu+RSNmdgDyOBneS9GGPw
2BJoOk52Rg35UnRGmF2u2CQDJ3XPspoCkNCLmvwuuud4NXAAPKZHHF4NS0XRHPDu
S65VihgAQ5RbcHhy2fU6xr2AIfKjdO7X8WfXQtowjlcUEQIgx204a2qLkDCsG+tY
hhjUMhrzuoMLUQizbMFYLwnhepH+/ad5R7LeDUtfh8dVkmKyQG5khxnHK++8Rj/s
FMw+2Dhx0acpLEWRHYSLapOpR3Tvh5/6GpRA1vfkR1JvkqtkO5FDfgIws6vSWFuq
aDEvjJENmL1+82pLneUvP3OJeESpqZ1uDBJPV6WavM3uDFHWyoL23irvTYM5qilH
86UHvWRAFPkqnv6pxS1V7NbkWd6apynLn3vwf+t/eCLcP+1ZKSajKxicvuXSOF4D
jry+i5UMX8FoDJR62Gbh2z7YEXwsMAbXPIIeO7iS8N8GLGoLXKOghlvNLNoDHViG
vveIYoQ1Ahi+SurLosKMoWTZZjMPvjxYp2MkgFtnstDhlcIUkzJmVG2vvbh7HWNZ
CBZ6z5z65x6UvnN+ovU2VvEaDIzP7Z/kVIeSOs0kO7tZ6/2GQelSYHHRMLk8cMhB
xVz+mKACAvtr4/GhfEl9
=0ukw
-----END PGP SIGNATURE-----

--=-nF9qqomStIQ/I4tuoUJN--
