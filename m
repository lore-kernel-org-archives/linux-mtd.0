Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqnOS-0007Pt-9B
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 15:39:30 +0000
Received: by bkcji2 with SMTP id ji2so4626095bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 08:39:24 -0700 (PDT)
Message-ID: <1342452837.7270.15.camel@brekeke>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 16 Jul 2012 18:33:57 +0300
In-Reply-To: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Dhl9Pvi76eINPu6LcG+i"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
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


--=-Dhl9Pvi76eINPu6LcG+i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 11:05 +0300, Shmulik Ladkani wrote:
> The existing mechanism of reserving PEBs for bad PEB handling has two
> flaws:
> - It is calculated as a percentage of good PEBs instead of total PEBs.
> - There's no limit on the amount of PEBs UBI reserves for future bad
>   eraseblock handling.

Thanks Shmulik - I did not have time to look at the patches, but the
overall description looks good. I will review the patches as soon as I
can. Thanks for making sense of this mess.

But one more think is the mtd web-site. I've grepped for '1%' and there
are plenty of them. I've changed them all to 2% more or less
mechanically - only cleaned up one section by removing out-of-date
information. Would you please grep for '2%' and review if the
information there is reasonable? Also, would you please add some more
info to this FAQ entry:

http://linux-mtd.infradead.org/faq/ubi.html#L_bad_blocks_exceeded

Or even better if you could write a separate section for this stuff in
the documentation, then you could remove that FAQ entry completely.

Thanks a lot!

--=20
Best Regards,
Artem Bityutskiy

--=-Dhl9Pvi76eINPu6LcG+i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBDRlAAoJECmIfjd9wqK0JSMP/R+BDZ/b8wnvd0LbSZEG7UZv
iMjCowxtL9l2dhKaKjl+beqa9rfrHcPY/osZPvOdx528o1RN3MnE/Zl2dwzvtxOB
jaZs4fkpDSRYJipfz6vweYUR7TjwuTHk2hjtONtS6iLb0WuO0+3VaaVho+6oowSz
QUKR+icU9tP5h69jxqW+BJf3fWdFZcqx/MgEoeQhFN7TGNBTV5aiYsAmQHWZGxYG
sb6l9cdweDPDSbWBihUhphSDVej+kEm8G+mtLpxWgkld0HhnOerYdAZb/Lmobrn9
urqCg+cJ0vy5oLA6/g0TeK6AZjogoDhSMRPMeicmKOi/R4qnp4pr+Imqp+JiyA4a
X5Km9PZau3lzFrYDCnBbIPlZwFT2a3G1PvalxDcU9EecxRIM4Gw2cUs+RRII54Rd
DDOOKVSELMls+oOxXs/y7btEd+lZGBsae4PgfaIh2HfFgjrH4itCf+PZWPIe8lH/
P5UccLZltIqTkd/jEPKXTvgn73IYj9IzFhEWTjUvgsp/ACIm3+4fF0+haQ7uQgW/
inVzMGcfOr+w/UY5ltH1bhQMAAOR6iiG4EAcMAIoWehx5xooDpz2K2Yc+KZ9X6oS
wMgDqz+r4PQYwRw1O7IZvbbAbKryNoKASrezh6QHTJK0F92DkSf4JlntdA70amZa
x9CG2iRpekIwA0MZpe6Q
=O+3d
-----END PGP SIGNATURE-----

--=-Dhl9Pvi76eINPu6LcG+i--
