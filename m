Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuGqw-0008Ao-5z
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 08:24:34 +0000
Received: by mail-ie0-f175.google.com with SMTP id x19so557319ier.6
 for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2014 00:24:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
Date: Fri, 28 Nov 2014 09:24:12 +0100
Message-ID: <CACna6ryoa5XpKmAxEkYTY=BTXnsDdeBLrHvkUZ8G2yEuCKcRwg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: allow NULL as chip name and try to auto
 detect it
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 October 2014 at 18:05, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wro=
te:
> This will allow spi-nor users to plainly use JEDEC to detect flash chip.

Ping? Can we get this pushed?

It's the first step to allow using spi-nor drivers with auto probing
(rdid), without forcing the chip name.
