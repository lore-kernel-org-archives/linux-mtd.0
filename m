Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgAsj-0003DF-0A
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 15:30:18 +0000
Date: Thu, 19 Jul 2018 17:30:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Make Kconfig formatting consistent
Message-ID: <20180719173003.40eaa9ad@xps13>
In-Reply-To: <20180718150952.3497-1-boris.brezillon@bootlin.com>
References: <20180718150952.3497-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 18 Jul 2018
17:09:52 +0200:

> Fix indentation and replace '---help---' by 'help' to make things
> consistent.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/Kconfig         | 24 ++++++++++++------------
>  drivers/mtd/chips/Kconfig   |  2 +-
>  drivers/mtd/devices/Kconfig |  4 ++--
>  drivers/mtd/lpddr/Kconfig   |  8 ++++----
>  drivers/mtd/maps/Kconfig    | 24 ++++++++++++------------
>  5 files changed, 31 insertions(+), 31 deletions(-)
> 

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
