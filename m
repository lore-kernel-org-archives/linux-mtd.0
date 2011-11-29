Received: from mail.free-electrons.com ([88.190.12.23])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVNvm-0003Ao-Ct
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 13:41:07 +0000
Date: Tue, 29 Nov 2011 14:40:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 1/5] mtd api changed to return bitflips on read operations
Message-ID: <20111129144042.1979a587@skate>
In-Reply-To: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
References: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jamie Iles <jamie@jamieiles.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Andres Salomon <dilinger@queued.net>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, Olof Johansson <olof@lixom.net>,
 Vimal Singh <vimal.newwork@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Mon, 28 Nov 2011 17:01:17 -0800,
Mike Dunn <mikedunn@newsguy.com> a =C3=A9crit :

> +	/*
> +	 * max_bitflips returns to caller the greatest number of bit errors
> +	 * corrected on any one minimum i/o unit (e.g., nand page)
> +	 */
> +	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
> +		     size_t *retlen, u_char *buf, unsigned int *max_bitflips);
> =20
> -	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *ret=
len, u_char *buf);

Making this change in patch 1 will break the build if someone bisects
kernel changes between patch 1 and your other patches.

Also, seeing the large number of users that don't use/need the new
max_bitflips argument, wouldn't it be better to add a new, separate
->readext() operation (or another better name) ? This would probably
reduce the patch size quite a bit.

Also, another option is to allow max_bitflips to be NULL, which would
simplify things such as :

+	unsigned int max_bitflips;
=20
-	ret =3D mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
+	ret =3D mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs,
+			&max_bitflips);


to

-	ret =3D mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs);
+	ret =3D mtd->read(mtd, ptr, sizeof(fs), &sz, (u_char *) &fs,
+			NULL);

and would therefore avoid the need for defining an useless variable.

Another question: is the max_bitflips information sufficient (i.e on a
large read with multiple pages, you will only get the value for the
worst page) ? Don't you need the bitflip count on a per-page basis ?

Regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
