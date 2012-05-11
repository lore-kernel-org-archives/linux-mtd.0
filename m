Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSqNi-0005Dh-Qc
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 13:59:43 +0000
Message-ID: <1336744984.2625.79.camel@sauron.fi.intel.com>
Subject: Re: UBIFS error: replay_log_leb: first log node at LEB 3:0 is not
 CS node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: James Nute <newten82@gmail.com>
Date: Fri, 11 May 2012 17:03:04 +0300
In-Reply-To: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
References: <CAEg8X7XO4xgHravjYtswWZ0xh_o2ZvPcsT=iH=-bYoV57+ZE7w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Uvyfj6Eg4wN5nVMfQV89"
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


--=-Uvyfj6Eg4wN5nVMfQV89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 09:45 -0400, James Nute wrote:
> Hello
>=20
> I'm getting a UBIFS Corruption during a power failure with a fail
> signature that I believe is different from what has been seen in the
> past.
> When I flash a new UBI image onto my device and boot it for the first
> time everything comes up as expected. However if I force a power
> failure before any major file writes occur the device will crash when
> UBIFS attempts to recover during the next reboot. If I force a sync
> command before the power failure I am able to successfully avert the
> recovery failure. I worry that this indicates something ugly is going
> on that I can't detect.

Unfortunately you did not really enable the debugging messages or you
forgot to type "dmesg". Anyway, they are absent.

>=20
> To get more debug messages I have enabled UBIFS debugging and enabled
> the recovery and mount messages by booting with
> ""ubifs.debug_msgs=3D6144 ignore_loglevel" kernel parameters

Can you actually enable them and share the log? Or may be you can dump
the image and share it - I should be able to put it to nandsim and try
to mount and see.

Looks like old master node was for some reason selected for some reason
- I'd first looked to the master area. But most probably it was already
cleaned-up when you tried to mounted for the very first time after the
power cut. Do you have kernel logs of that ? Are there messages about
corrupted master node?

Is this problem reproducible?

--=20
Best Regards,
Artem Bityutskiy

--=-Uvyfj6Eg4wN5nVMfQV89
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrRwZAAoJECmIfjd9wqK0QssP/3UTEtnZO4nehPdn1Sxto85B
Vc7jTgRcqFJD84sJk0q72HxfCfuiHE/TH/axhP7xfZ+jukuC37pzLQTm02h3oWG5
AtIMaDDns3lKoa7PiNuGoPlENNZ9Z7eAcV15zh3NG+/4Sdjyfpti0Aq7RIzpmaPL
y5OUzu48yiXzn0RcUjnEUbeO/X3Z0dLuoskJWCDMqisuz55q4qCTNnWvf3DpQJyh
pzfxdBSRzU6BzpfPCfri4wf7q2JihLnA+Epat+7c5P/q43IMx43uyUC6UG+6omOB
t7ibIqIMaa9cEY+9NEFlTd++vvAVG+q0GK1ZdRuNpzZorkP/ThqjO0+8VsBXAYaL
PnpxLfZ6bN6TC7X6VJqg3DytusRnuFM5jjku02Bv5R5FpoCPsi/T/Zo/fh8pnGjl
5/lFHpn0Ua/qxh2KGUIrjYsFbi9Hm6tOvG90M/dTu9zvi3mhgbj87nVyn9mX1lF2
bq7onsA2jXGcMNRmhIoVbzO3V0hiO5WFJ/hz3ROJ1/VlCZ9QkwXauQLkTlFQdWQG
LGZe0+QX5AwVKr1twajd+vOR5Jcwz0IWZZCuv8Z05Iy/kmYHDPRzKsW2CpOT32Wj
hML31wTfYcNDMFhWUzasTtAi8P2MrKxdxSi9AwU2DZrRL9+7SmxA6Px+DY5MpDU5
yQGOKyyFJiIpMZFColuQ
=giuF
-----END PGP SIGNATURE-----

--=-Uvyfj6Eg4wN5nVMfQV89--
