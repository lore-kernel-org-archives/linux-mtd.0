Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkHQH-0007uR-0Z
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 16:18:25 +0000
Message-ID: <1340900549.3070.130.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 28 Jun 2012 19:22:29 +0300
In-Reply-To: <CACQ1gAjLdR-ZRUS6gxMrJzVpRdvdMK2JRceyiFmeSq-FQkZbZg@mail.gmail.com>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <1340894351.3070.121.camel@sauron.fi.intel.com>
 <CACQ1gAjLdR-ZRUS6gxMrJzVpRdvdMK2JRceyiFmeSq-FQkZbZg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DQjyhYpN6CLAu9oaDX5r"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DQjyhYpN6CLAu9oaDX5r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-28 at 18:07 +0200, Richard Genoud wrote:
> Agreed, it seems that 2% of the whole flash (at least for SLC device)
> is more realistic.

Agree, feel free to send a separate patch for this.

> > Frankly, I do not understand this logic :-) And your patch looks wrong =
-
> > it touches the "auto-format" code which you may consider more like a
> > "debugging" feature and should not rely on this in production.
> Sorry, but I don't understand what you mean by the "auto-format" code.

Yeah, right, this comment was incorrect, sorry.

--=20
Best Regards,
Artem Bityutskiy

--=-DQjyhYpN6CLAu9oaDX5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7ITFAAoJECmIfjd9wqK0O74QAMKiMT5YSAQeoZKrwzPWbr67
nyoCK41vCeKlR3/hIOjPJXVNBr3Gj50GXLf4xayOuiVf0R2FvSFJEvs3AWGGr2QV
l1zqxfBlsIyayGlPQHqGMmvzP2HQ8rYYu3Lp6N2rTP8zWqyPQc/nQkpoxTanG+p7
rvjtCzVaM6gs3OfG02LoToRnu9GB6Pcil/dfm4BLvHyd26rqxCPmYQag8B+mrBy3
8kVKUtQD1ic6Sh6K5hi9kkiz4OI/4MS1Vkv42yhD7SBKt7NsNDCi4zfqkRkZ8M6z
+lSr0QOZK6j1+Z/A9qSRNo2RN7FkxvmlczXrnOUwkqj/5hVH5sWdvv6/GXiErrPG
B+0JAcwHz5w9s9x9sogvdGwOueOx/d/x+KXKVXw7CpwQ0EyuTYCKf+CavyCbytLv
R8RUMdbBXc1m5cbiLs1UNSnLndkM8n7nmMGjqAg2dHFK2FdKggGU8qpvzyMd+sMI
CHyrvy36QLZX/7cLMTfl/xRi2ePdpabhSielnnucOzdPP0VayvvMOXCRar57RiH6
9CuvcFer2ORtypUWvd6seZPZ+QmDMOJsLl1glDPaF7CuqNRT6bYeqigbaTUtpYsG
4dIreunC73LepLfR9n81hXjMWmZo1W0+/u3qrJWO6v+gIk/Q15SlZQf+ubK4Kgy8
Pn/quQrJuarHS4f8SlIS
=yYGH
-----END PGP SIGNATURE-----

--=-DQjyhYpN6CLAu9oaDX5r--
