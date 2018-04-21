Received: from smtp13.smtpout.orange.fr ([80.12.242.135]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9yIM-0005vM-Jx
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2018 19:35:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 29/61] mtd: devices: simplify getting .drvdata
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
Date: Sat, 21 Apr 2018 21:35:21 +0200
In-Reply-To: <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
 (Wolfram Sang's message of "Thu, 19 Apr 2018 16:05:59 +0200")
Message-ID: <87o9icxshy.fsf@belgarion.home>
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

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
