Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb9zm-0000nK-9Z
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 19:32:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] mtd: rawnand: plat_nand: Kill pdata->ctrl.{hwcontrol,
 read_byte}()
References: <20180705102733.29673-1-boris.brezillon@bootlin.com>
 <20180705102733.29673-9-boris.brezillon@bootlin.com>
Date: Thu, 05 Jul 2018 21:32:31 +0200
In-Reply-To: <20180705102733.29673-9-boris.brezillon@bootlin.com> (Boris
 Brezillon's message of "Thu, 5 Jul 2018 12:27:33 +0200")
Message-ID: <878t6ph41c.fsf@belgarion.home>
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

> None of the board files are overloading those hooks, so let's drop them
> from struct platform_nand_ctrl.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
For mach-pxa :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
