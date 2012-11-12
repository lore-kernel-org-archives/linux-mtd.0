Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXwMH-0002nS-VW
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:55:34 +0000
Message-ID: <1352735767.2262.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Date: Mon, 12 Nov 2012 17:56:07 +0200
In-Reply-To: <507DD09C.6050600@gmail.com>
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
 <1349954577.12014.13.camel@sauron.fi.intel.com>
 <507DD09C.6050600@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2SRyKrCxmZ1DB24zUsIn"
Mime-Version: 1.0
Cc: arnd@arndb.de, dmanna@micron.com, lporzio@micron.com,
 linux-mtd@lists.infradead.org, valibert@micron.com, svenkatr@ti.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2SRyKrCxmZ1DB24zUsIn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-16 at 23:24 +0200, Vincenzo Aliberti wrote:
> Considering the number of changes you can find here-below the whole patch=
: I have=20
> successfully compiled it with 3.7-rc1

I cannot apply this patch - it is line-wrapped. Please, re-send properly
and send it as a separate e-mail, include nice commit message. Do not do
it like in this e-mail, because the above stuff will go to the commit
message when I use 'git am'.

Generally, you should be able to save your own e-mail from the mailing
list, then feed it to 'git am' and it should apply cleanly, and the
resulting commit message should be sensible.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-2SRyKrCxmZ1DB24zUsIn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRwXAAoJECmIfjd9wqK0WAsP/A9qVJfqowM9jDxiP8b9IWm9
F5zMX2OP8AL6ruUeQSmL10RVjBblcVuaRLtFQ83N+gVWrM+/n2E0yEkUiqI8TCnb
0uY+bKlGfIGhjBCbLzouMadd/AigsXDO6lX3kB+yQ21t1sg/PmY9LCPF0v3bqGBM
TEnnlzwXJzMgUZD8jhkrWbADRSqm/EbzF8WQ+jcz3rjHdwvb33V7jlM1XmFGIi5o
cBfCKGrVZHIkm3YwkOIfieMrC/Qhqmp8qExcD0jjoKtCMBa+klCzgGfWXwUYbRHp
x3x2b0NT4OHxTxhOgX1uKnlh+rndqB/Zu1vZLfFVON4Ke5S5bD3bOr5r+cDew4Q4
qxmBOz+D60scrbECr5ypMstNo401wMQQXWmicM5VYENsAUlCyQ8m6H6GLX2KTOMn
mWvF2O+CfyZGy+qKd1gWUKRwbfEyQmKahyoXEIS+oxsLLGUq6V3zn9DysWGoS9af
IaDqKqRYFcQa7iehcrqCBm2+QvheXAAYlAAC8vfW/PNBZ9E/nClCqo7aIWkLMpjJ
bnXy8IKdY6/9kQsFkI2HnYO5+NnzggIlMOVvwL+3lfXHWmlWTfHadInOsyERQfQ3
RXgcPaoz2usb0M4XKWAhjOJNlzSwN+YhHMTrJFBJ+8rDSkN6J+rpzsgnHy9IV/Hz
OVn8XrBXLIF7qDbZlK5x
=m0u8
-----END PGP SIGNATURE-----

--=-2SRyKrCxmZ1DB24zUsIn--
