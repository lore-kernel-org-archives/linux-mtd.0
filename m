Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtBn1-0005eP-PI
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 05:34:28 +0000
Received: by pbdx9 with SMTP id x9so3139843pbd.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 21:34:26 -0800 (PST)
Message-ID: <1328247387.6750.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] jffs2: update to new MTD interface (missed a few)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 03 Feb 2012 07:36:27 +0200
In-Reply-To: <1328228469-10539-1-git-send-email-computersforpeace@gmail.com>
References: <1328228469-10539-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cKbzJXqHnQdEBHk0rkNv"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Randy Dunlap <rdunlap@xenotime.net>,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-cKbzJXqHnQdEBHk0rkNv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-02 at 16:21 -0800, Brian Norris wrote:
> There were a few instances of the old MTD interface remaining for JFFS2. =
We
> fix one error that shows up (only when CONFIG_JFFS2_FS_WRITEBUFFER is not
> defined) like this:

Pushed to l2-mtd.git, thank you!

--=20
Best Regards,
Artem Bityutskiy

--=-cKbzJXqHnQdEBHk0rkNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK3JbAAoJECmIfjd9wqK0agcQANJ+tR8fOcs2399i+NShneVH
zp+mhyy9OBwVwy8BE9fC5az88sGWdK/DWB55rgw9qpQ4oTydClD0pdwumY6r7Twc
PH8tO8iwLrefYxh+6IE01wwtJ3ltSz1FjCbI2vIOY6ZvyjaRlgX4yuhOCwuuA6S0
FQ1CP/hfi0/4hIJ5YzCDtYve2ZKOZzgkqEgQW6b4PakZFiawMiSrqt7VxpfkuBsB
CqpBWnAqOkUhrlUytvOFlgABacHsD7jMjpF5y+ADjba5sZSJbR3ytMAYXy3BKAVB
XTSHjGr8X2esOGp/i7+4ynJMlD81JeY3cVAed0+InMiPnzTPtFqNKK8G8HMMOy2Y
uB+4JAZBvEKOZ8AAE+1fzsxLkhiyUfaScugOW3FU4vqfz2rfpcxOlFbWhpR4aJUE
+YZWGQ8Pyq92hhjl26diIM++xf22EbIxmSxBCXA0loBYY05hQXZAHhMC2jOtnvNM
5oKPBRPCddAkEMGCO9xcvs9AxlonhKo7ErghjysvlWD6pc3Wyxa9VubH/fuJST9U
dvXFKL32TSmqSWgEISqZByzlPmCjS6UbsYE7D2hNggY/908kh2cdr/VNTX2VTk4R
eCwOawC2RUA99Va+TKfHw3lqg9+hIjC2hbktb8DmEO1RlnuaK8aYJkpo3V2fhEKu
CN4emcEJ8h2ODkkH6vkw
=TBWE
-----END PGP SIGNATURE-----

--=-cKbzJXqHnQdEBHk0rkNv--
