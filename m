Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmlb5-0002qi-1Q
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:23:35 +0000
Received: by iakl21 with SMTP id l21so10316001iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 04:23:33 -0800 (PST)
Message-ID: <1326716717.14299.71.camel@sauron.fi.intel.com>
Subject: Re: linux/mtd/gpmi-nand.h: No such file or directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shawn Guo <shawn.guo@freescale.com>
Date: Mon, 16 Jan 2012 14:25:17 +0200
In-Reply-To: <20120116123245.GA19835@S2100-06.ap.freescale.net>
References: <4F1013DC.8040902@prolan.hu>
 <1326712888.14299.55.camel@sauron.fi.intel.com>
 <4F14097D.9060601@freescale.com>
 <20120116123245.GA19835@S2100-06.ap.freescale.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9sJnxNsCEKHYQU4qVJK3"
Mime-Version: 1.0
Cc: Vinod Koul <vinod.koul@intel.com>, Huang Shijie <b32955@freescale.com>,
 Peter Rusko <rusko.peter@prolan.hu>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9sJnxNsCEKHYQU4qVJK3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 20:32 +0800, Shawn Guo wrote:
> No, it's not on my tree.  I folded the patch that fixes this error in
> the series[1] of mxs-dma dma_transfer_direction migration as patch #3.
> The series has been picked up by Vinod.  I suppose Vinod should send
> the series to Linus for 3.3, but I have not seen them on Linus' tree.
> Vinod?

Well, since this is a build fix, I suggest to merge it right away.

--=20
Best Regards,
Artem Bityutskiy

--=-9sJnxNsCEKHYQU4qVJK3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFBctAAoJECmIfjd9wqK0zhQQAJm4BEZ8XsTUo0MVSNqm/VFq
g3JY32eOMpIuY8mFTDn4cGIBoB7L8o7mklOVnZ8uIKY+FKwYfSCxjeRuMv4cvPv2
2uUdyNIhFrCsygV7WFgEzO1DSO4MRBKEYxF1PzNf9AunqHeUfLLyihJIGfRMlOkM
dfiqnlwEY504gbskaRr4CeZyju1pYXcFUWlZoCSCcMwG5oGKZIW9Dj3EhjF/qDCq
b7Ix8laDrByFQztwNQXR6GOeWljjHmmF0irLd17y28csP/U1nUT7VEekcW1PwL+6
KNwomKvul094R2cCzL4/BVBsj1qZnEcqBUITXumayh43mE4R+RQqrV3af20UM8yB
OM+7sdXyx+9NLa0EC1kPWjzrj+K86qx75PHBx9P+sqx8ZfHcNLrukUKvKEcY/IoU
4fXABHuJeEpWjK178g4hmws4mENOwU5cY2IVC2LeJczuX9pYadry6KCCYYqRHHfs
gnmwALKfTvh5xhFUbiHdyVfjDi+WUeZhud95YRjogR1r5WrRidf0BThv1uPZBRiH
4mk1qGnOXYOmvjV1cO4ZHXSO4r5Zwxm31++m3sWUFxvCiWaKBydDVsV7k4GMA7iW
7jcFexmLPRVAKYlX2imqKFL9KV8Stp0SVJkMg6IV2DGoLIAuYYIGJiHlnkE3YZze
6iWdA7lt+uh0gg/Wn4UY
=+8Ti
-----END PGP SIGNATURE-----

--=-9sJnxNsCEKHYQU4qVJK3--
