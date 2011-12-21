Received: from mail.free-electrons.com ([88.190.12.23])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RdHG6-0005kh-TD
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2011 08:10:43 +0000
Date: Wed, 21 Dec 2011 09:10:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 0/2] always use partition wrappers; drivers return bitflips
Message-ID: <20111221091023.6dbd4fe5@skate>
In-Reply-To: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jamie Iles <jamie@jamieiles.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
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

Hello,

Le Tue, 20 Dec 2011 10:42:14 -0800,
Mike Dunn <mikedunn@newsguy.com> a =C3=A9crit :

> This bifurcation of the driver <-> mtd and mtd <-> higher layer is admite=
dly a
> little kludgy and potentially confusing for driver writers, but has the
> advantage of touching few files.

The advantage of touching few files is only a short-term advantage,
while the drawback of being a "little kludgy and confusing for driver
writers" is a long-term, major, drawback. I think it's much better to
spend a bit of time now to touch more files, but get a nice and clean
interface, rather than leaving the kludge of stacking a MTD partition
on top of another.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
