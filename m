Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ03w-0005yV-CW
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 07:05:07 +0000
Received: by fxm8 with SMTP id 8so4255764fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jun 2009 00:04:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A3FFE02.8020001@bluewatersys.com>
References: <4A3F017B.2010409@bluewatersys.com>
	<63386a3d0906220122x31d0b23fk7bd86145b719d9b5@mail.gmail.com>
	<4A3FFE02.8020001@bluewatersys.com>
Date: Tue, 23 Jun 2009 09:04:57 +0200
Message-ID: <63386a3d0906230004m66360f4fhbdc80c8e552a01d0@mail.gmail.com>
Subject: Re: [PATCH] SST25L (non JEDEC) SPI Flash driver
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Ryan Mallon <ryan@bluewatersys.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
	mike@steroidmicros.com, spi-devel-general@lists.sourceforge.net,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/6/22 Ryan Mallon <ryan@bluewatersys.com>:

> Out of curiosity: I'm not too clear on what makes a particular chip
> hot-pluggable. I think technically the sst25l chip could be put onto a
> hot-pluggable board or power domain. Can't most devices be made
> hot-pluggable? Is the general rule to make devices non hot-pluggable if
> most/all boards in the mainline do not allow it to be hot-plugged?

I haven't seen any rule about it, but nominally the drivers support the
configurations found in the kernel tree, so if some board physically
existing and soon-to-run linux hotplugs chips like this, then have it
__dev{init|exit} else __{init|exit} IMHO.

Of course you can design for all plausible use cases but it will pile up
indefinitely. Personally I try to not design software for a hardware until it
exists, and I like the IETF catch-phrase "rough consensus and running
code" and this sort of fits that :-)

Yours,
Linus Walleij
