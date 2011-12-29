Received: from mail.free-electrons.com ([88.190.12.23])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgNZJ-0003ZD-Dx
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 21:31:22 +0000
Received: from skate (humanoidz.org [82.247.183.72])
 by mail.free-electrons.com (Postfix) with ESMTPA id ED031143
 for <linux-mtd@lists.infradead.org>; Thu, 29 Dec 2011 22:28:43 +0100 (CET)
Date: Thu, 29 Dec 2011 22:31:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: docprobe: use kzalloc instead
Message-ID: <20111229223105.34c7163a@skate>
In-Reply-To: <1325173626-6739-1-git-send-email-dedekind1@gmail.com>
References: <1325173626-6739-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Thu, 29 Dec 2011 17:47:05 +0200,
Artem Bityutskiy <dedekind1@gmail.com> a =C3=A9crit :

> +		mtd =3D kzmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), =
GFP_KERNEL);

I guess you mean kzalloc() and not kzmalloc().

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
