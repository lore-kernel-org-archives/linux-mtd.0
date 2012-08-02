Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Swy1V-0004Zf-OE
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 16:13:18 +0000
Message-ID: <1343924267.25013.156.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 02 Aug 2012 19:17:47 +0300
In-Reply-To: <20120802165132.1bf1e5d7@spider.haslach.nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343916747.25013.112.camel@sauron.fi.intel.com>
 <20120802161512.5ac7a303@spider.haslach.nod.at>
 <1343917741.25013.114.camel@sauron.fi.intel.com>
 <20120802165132.1bf1e5d7@spider.haslach.nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-r3APHlI1W52wjr76ZZHo"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-r3APHlI1W52wjr76ZZHo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-02 at 16:51 +0200, Richard Weinberger wrote:
> Every time fastmap writes a new fastmap to the flash it tries to get a
> new PEB and returns the old one (used for the old fastmap) back to the
> WL sub-system.

OK.

> If no free PEBs are available (E.g Volume is full or the erase worker
> is too slow) ubi_wl_get_fm_peb() returns NULL and fastmap reuses the
> currently used PEB.

This should not happen. Fastmap should _reserve_ enough of PEBs for it
to operate. It should always find the PEB to write.

Just like if you create a volume maximum possible size, we guarantee
that you can fill it with data, and UBI will find enough PEBs for that.

Just like we always have enough PEBs for the volume table.

The above things are UBI's liabilities.

In the situation when a lot of PEBs became bad, UBI will switch to R/O
mode with a scary message if it notices that it does not have enough
PEBs to satisfy all the liabilities.

And this is why we reserve 2% of PEBs for bad PEBs handling.

> In this situation ubi_wl_get_fm_peb() may trigger such an error message.
> If think we should get rid of the message as this is not an error
> condition. It's a well known execution path.

Unless I am confused, this should lead to switching to R/O mode instead,
just like we do when we write to an LEB and do not find a PEB to map to.

--=20
Best Regards,
Artem Bityutskiy

--=-r3APHlI1W52wjr76ZZHo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQGqgrAAoJECmIfjd9wqK07h4P+wcZxuQO1HnPNOwX3S9ncuGl
s7YniZNcjifHfnQcvnB7gBqUU2dD2tkOp57dshAOH58rTq1cm4tLxgUv9Y3SsE8r
FZqAjx3By4Ut4vHVW23O9QMhRoi2gzDdjHfHpCBE4XG3hxmUNDRN7Ave/ynT/+HH
Q7/F3rJdFavH5EHbzoDDayouR0Q4bfedoBhKzdEa4wqya7tUlhaprlPQRisPHeji
6goXL4XvZobEYHwZRSgTkbQSJgQp6Gx3a35BFv6QsOxwFhWTIFZCNa/ak+NVhJSW
LgqpPJ8YYLnqSYaho7LRyUwv1GX2u474otMus88xChT/7YwKIUQ3dZpWWXjSCtAt
6regcFX6JltcL9pLR6KoEUAlomdnKH0kvHNkkH8REyf9LbiJStzqQdsxaitMcmra
4x2jQIqwJ7FzDcQNqbfnWmyy3PCxohu7qMxQSJJnfoZZj8acFuVFhQbFNovQOEye
a7SiZm4v2yUYmh3jTRtmeOcry6PAyF2a/RmS/jGRt4y4tzNe/3FPPeq3VBl8k5Ld
Q4WIO/9RqqOfX9p1Br9F9lc8aEbzOkgJcCZolawP8AsCjoSR07x0Xb4NtE4rH+J7
fmhfI3p6TkA6hwvr4hAtA1yjHym6vxqbzpG50MPEUCwl4S5OgvXOKdQrUYJ/Zz/P
t+2M7g+KWAqjEniMeVys
=axHX
-----END PGP SIGNATURE-----

--=-r3APHlI1W52wjr76ZZHo--
