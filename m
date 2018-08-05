Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmOS1-0002YQ-Fs
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2018 19:12:27 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Mike Dunn <mikedunn@newsguy.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Remove docg4
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
Date: Sun, 05 Aug 2018 21:12:11 +0200
In-Reply-To: <20180804205923.25298-1-boris.brezillon@bootlin.com> (Boris
 Brezillon's message of "Sat, 4 Aug 2018 22:59:20 +0200")
Message-ID: <87effc1vck.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> The diskonchip G4 driver does not fit very well in the raw/parallel
> NAND framework simply because such chips have an internal controller
> translating DoC-specific commands into NAND ones.
>
> Keeping such a driver in the raw NAND framework is a real burden for
> NAND maintainers.
Hi Boris,

I understand the "burden" part, yet we all have our burdens as old code
maintainers. But still, you're going to remove a working driver from one of my
platforms. This is not something I'm really happy about.

At least, I'd like to hear from Mike that he doesn't use this anymore.

Cheers.

--
Robert
