Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFmjm-0001IS-PA
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 14:00:47 +0000
Received: by bkwj4 with SMTP id j4so159734bkw.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 07:00:45 -0700 (PDT)
Message-ID: <1348408841.1889.14.camel@kyv>
Subject: Re: [PATCH] mtd: sh_flctl: Switch from tick-based to time-based
 timeout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Sun, 23 Sep 2012 17:00:41 +0300
In-Reply-To: <CABYn4syVz46ChwYkhP=5TMb4N+Q0sTnuMu+C_d4LPuxrQ=WM-g@mail.gmail.com>
References: <1341410726-10562-1-git-send-email-hechtb@gmail.com>
 <CABYn4syMFh4smteHS-zCAy3ygKsyxoD2+FfaBeQxKvK_FA+5mA@mail.gmail.com>
 <1345454375.2848.21.camel@sauron.fi.intel.com>
 <CABYn4syVz46ChwYkhP=5TMb4N+Q0sTnuMu+C_d4LPuxrQ=WM-g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xhKiF3ULjQUHwqEl0IGE"
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


--=-xhKiF3ULjQUHwqEl0IGE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-23 at 12:49 +0200, Bastian Hecht wrote:
> Hi Artem,
>=20
> commit 19f5f7364a1cc770b14692f609bb9b802fc334d5
> is still in l2-mtd. Please drop it, so it doesn't get merged and I can
> base my new patches on the clean code.

I've dropped your patch now for real.

--=20
Best Regards,
Artem Bityutskiy

--=-xhKiF3ULjQUHwqEl0IGE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXxYJAAoJECmIfjd9wqK0O6gQAK2BpG7qAEorP0EzteS2KzQx
FIU4nH5oonYId6y4QAJFrGe+1kJ5/uPz4DhcEpbSJDT8Q5yGpx+OzV24uCM+go4i
HbfPlMZuwGTECvFfsIVJf6h7z4pOEsnP9Id42fSLqZH6wEOI5gYED5VwcCNvoDhS
FMR0Lw+ZqVnRQ+SbagTUG1nQ3Tdv4GGaiTDE2PjRJEdetaQflVT1l0nNOGaSXsQA
AeX+yR4xRLNAY/nx+q9chnU/7yOH5SB8VyancpFmj4f3pLQ1Uo2ujLksyHHpp5C+
uU6IjerEnWD3i4jceQlUwOnjCPujF/NL1jTyhsjJVAOmFKv5p4heBplJKwwmVQ9C
q3awp4AEIteWftqJAa3gZydi8Em+dZCPCUFtbNn85R/jchr0q3UWINjpSFVc1qsl
jm1SsC5yFa4QUtQ5zk0X+J4CX5Rj63HZBF/Zh0n675zzcKSZQDHhrcxxGR19IAPl
wcTQCvml4w/bfntAe7Vmh1UWj6+83koM57rO5DoK46XmSgDHxdyr1WNGL4JEdyS7
xzqDxNdRc4HnWRcqDZY6O5/6RvIpSp3FCSLgFKWdANAukVSL0px2k7E6YM+7UiLy
txumIe5W881ilioK/7S+gqb8WYfknG3GJQMGCtDiTbh7GfOME1F5yexZXDDhImvU
+jblr3D4AMmib/JZH8nh
=VAje
-----END PGP SIGNATURE-----

--=-xhKiF3ULjQUHwqEl0IGE--
