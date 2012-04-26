Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNHYc-0001IP-1q
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2012 05:47:58 +0000
Received: by lboj14 with SMTP id j14so805648lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 22:47:55 -0700 (PDT)
Subject: Re: UBI use subpage and verify fail when write on nandflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b w <wdjjwb@gmail.com>
Date: Thu, 26 Apr 2012 08:47:53 +0300
In-Reply-To: <CAHvCehVVPoORvmV=WZESDkb_9es1B7W9ojFv9P3W1ANpQyQ1xA@mail.gmail.com>
References: <CAHvCehVVPoORvmV=WZESDkb_9es1B7W9ojFv9P3W1ANpQyQ1xA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BYktVZOE1+vHs98b/3YM"
Message-ID: <1335419274.2290.9.camel@koala>
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


--=-BYktVZOE1+vHs98b/3YM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-17 at 22:19 +0800, b w wrote:
> Hello,
>     Use linux 2.6.32,ARM,nandflash(support subpage),config
> CONFIG_MTD_NAND_VERIFY_WRITE. UBI attach fail on empty flash.I found
> when UBI write VID header to the second subpage of eraseblock,will
> call function "nand_write_page",this function write a whole page(i
> think the page size is 2048),the unset bit of the buf is filled with
> 0xff,after write,

Yeah, known issue, it just waits for a fix from someone who cares
enough.

--=20
Best Regards,
Artem Bityutskiy

--=-BYktVZOE1+vHs98b/3YM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmOGJAAoJEJtuLFy+q7feNYYIAJWmt9yImGtreQqQxuY2PFzi
PRpt3FMft1/hhwv28R0H88w3Kv1HTM3gPczrruiNUflUngSZKOvdgTQk6Nx3B9OX
9F8X/kUyOLfnMXv0FvCqMwKX2cjtUf2lDDAYZX0mblH0v0xo/QX6XYb+XYTKjETB
K5p6oQBMKPnLfOEVQ/W8fUXIXU7yffO6FnY+jXgrAEdS/EFO4T+nDicoG7i/VSsj
eurCOSqlmKB4g087u1C6De3Q5ZgghPQMAE0pLddFFomPNqcgwdU1rUhoCRXh/+2j
cW2WNJm5bE0CKEDPeo1KLizgXeKshniJHpUscGtHZL5I/2yhjMvtjxxDcmcCs+0=
=Q4je
-----END PGP SIGNATURE-----

--=-BYktVZOE1+vHs98b/3YM--
