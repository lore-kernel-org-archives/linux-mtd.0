Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwfEm-0003DZ-4D
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 23:55:36 +0000
Received: by pasz6 with SMTP id z6so46540200pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 15:55:15 -0800 (PST)
Date: Wed, 11 Nov 2015 15:55:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Han Xu <han.xu@freescale.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/11] mtd: nand: convert to nand_get_flash_node()
Message-ID: <20151111235512.GC96199@google.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446419018-31435-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446419018-31435-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 12:03:38AM +0100, Boris Brezillon wrote:
> Used semantic patch with 'make coccicheck MODE=patch COCCI=script.cocci':
> 
> ---8<----
> virtual patch
> 
> @@
> struct nand_chip c;
> struct nand_chip *cp;
> @@
> (
> -(cp)->flash_node
> +nand_get_flash_node(cp)
> |
> -(c).flash_node
> +nand_get_flash_node(&c)
> )
> ---8<----
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Hi Brian,
> 
> I think this patch could be part of your series too.
> 
> Best Regards,
> 
> Boris

Thanks! Pushed to l2-mtd.git/next
