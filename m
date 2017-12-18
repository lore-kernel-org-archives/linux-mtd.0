Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eQzLw-0002Qm-El
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 17:37:26 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com> (by way of Boris
 Brezillon <boris.brezillon@free-electrons.com>)
Cc: Richard Weinberger <richard@nod.at>,  linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,  Brian Norris
 <computersforpeace@gmail.com>,  Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,  Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Sean =?utf-8?Q?Nyekj=C3=A6r?=
 <sean.nyekjaer@prevas.dk>,  Greg Cook <greg@morpheus.ws>,  Miquel RAYNAL
 <miquel.raynal@free-electrons.com>,  stable@kernel.vger.org
Subject: Re: [PATCH] mtd: nand: pxa3xx: Fix READOOB implementation
References: <20171218103245.22516-1-boris.brezillon@free-electrons.com>
Date: Mon, 18 Dec 2017 18:37:08 +0100
In-Reply-To: <20171218103245.22516-1-boris.brezillon@free-electrons.com>
 (Boris Brezillon's message of "Mon, 18 Dec 2017 11:32:45 +0100")
Message-ID: <873748djjv.fsf@belgarion.home>
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

Boris Brezillon <boris.brezillon@free-electrons.com> (by way of Boris Brezillon
<boris.brezillon@free-electrons.com>) writes:

> In the current driver, OOB bytes are accessed in raw mode, and when a
> page access is done with NDCR_SPARE_EN set and NDCR_ECC_EN cleared, the
> driver must read the whole spare area (64 bytes in case of a 2k page,
> 16 bytes for a 512 page). The driver was only reading the free OOB
> bytes, which was leaving some unread data in the FIFO and was somehow
> leading to a timeout.

That's a very good catch.
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
