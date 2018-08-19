Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frTXM-0004Td-0s
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2018 19:38:57 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [PATCH v2 2/4] ARM: pxa: palmtreo: Drop docg4 specific init
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
 <20180804205923.25298-2-boris.brezillon@bootlin.com>
Date: Sun, 19 Aug 2018 21:38:30 +0200
In-Reply-To: <20180804205923.25298-2-boris.brezillon@bootlin.com> (Boris
 Brezillon's message of "Sat, 4 Aug 2018 22:59:21 +0200")
Message-ID: <87d0ue9mfd.fsf@belgarion.home>
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

> The docg4 driver has been removed. Remove the code that was registering
> a docg4 device.
>
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
No answer for several weeks from the maintainers, so let's say they lost
interest.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
