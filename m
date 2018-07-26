Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fipCt-00055U-F9
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 22:58:05 +0000
Subject: Re: [PATCH mtd-utils] ubi-utils: ubimkvol: Initialize req to zero to
 make sure no flags are set by default
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Quentin Schulz <quentin.schulz@bootlin.com>
References: <20180726140529.6261-1-boris.brezillon@bootlin.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <b416b0bb-394f-d8fa-f375-70c43b9e8c75@sigma-star.at>
Date: Fri, 27 Jul 2018 00:57:40 +0200
MIME-Version: 1.0
In-Reply-To: <20180726140529.6261-1-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Applied to mtd-utils.git master.

Thanks,

David
