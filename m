Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2dpk-000329-Ei
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 07:20:21 +0000
Received: by iaky10 with SMTP id y10so8089861iak.36
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2012 23:20:17 -0800 (PST)
Message-ID: <1330500162.3545.75.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] libmtd: fix mtd_write() issues for large data-only writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 29 Feb 2012 09:22:42 +0200
In-Reply-To: <CAN8TOE9AsPc-GyEC7o9ZzDjWTj-JNy3f-VzOoFW0QjsC8duNxA@mail.gmail.com>
References: <1328934905-27007-1-git-send-email-computersforpeace@gmail.com>
 <1329210112.22240.217.camel@sauron.fi.intel.com>
 <CAN8TOE9AsPc-GyEC7o9ZzDjWTj-JNy3f-VzOoFW0QjsC8duNxA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QKQ71wtyCeVdBA/R241O"
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


--=-QKQ71wtyCeVdBA/R241O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-02-14 at 11:53 -0800, Brian Norris wrote:
> On Tue, Feb 14, 2012 at 1:01 AM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> > Pushed this one and the other 3 patches to mtd-utils.git, thanks a lot!
>=20
> Thanks for the push! Please note that there are still two patches
> outstanding, that you said you pushed earlier but are not in the
> repository AFAICT. They were in another thread, with subjects:
>=20
> [PATCH 1/3] libmtd: perform device checking first
> [PATCH 2/3] libmtd_legacy: don't open device in R/W

Pushed those 2, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QKQ71wtyCeVdBA/R241O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPTdJCAAoJECmIfjd9wqK0z8cP/jo4hSBbu8apsv+vzwSegPjf
Q6T7DQ/L0Umjo7k7hdO23X6VBWL6/vNtVjHZ0Y3wJBKw2c0hy4QQZBK50CUN/5vR
LFJzlPTPYlCz+gNqSUWXn/KNqCcooYRZ+3KJbNmLbOrxrJAyB1MFY8ZWZFD9HbQu
9IFg+56ecAo0Q91G5ttMQc11K5DuD2Z0qQn3STQu/9xMriClwB4qZxr8TN+P0kPD
7o0K53O7OLW+T3TJWmF+UToI/QqJefS+42FRnhB282j2YE3tXS1VKNj5k6zf18Zl
Vs5ihtbQy3FNOJxf37n0JmrRqs9dt9AvIWzDvF5CYWUjyo0UqEQPNA+70Gtk4qLA
W30y0m9gxZeVH8HM5oCxrshPqN2IT1YqOInkRcEPnBI6Q/L9KsiSsXnZQVztiMmf
yYJeBLO1wvcAGG2qvGdZMoRwLUZ1CMwyorhbVLxM96vaAayiUcs4GKI/BIWWBU01
wN1+IjORcUFW1X1SxCXc5xNLMcz4jFRyABQusMUYKLMRpwS5Ce4xVM544EXwf81x
legv29VjfGg9o6vVR9qJn9N6wwouyPrvjPuT5dbw/ZIetTgQ0JEr6cf3Fkcq/iqb
6A5N6vKZtlcwC4pWeOIyDlkiPjRW7/FPQ4UkK9sPuShi3K6eR6/YlvbeTkSJ9zGp
zETX9mwXV7L+hNTTCsGi
=TGPF
-----END PGP SIGNATURE-----

--=-QKQ71wtyCeVdBA/R241O--
