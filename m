Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsXxc-0002zv-GK
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 15:20:53 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 04/11] mtd: nand: convert to nand_set_flash_node()
Date: Sat, 31 Oct 2015 16:17:03 +0100
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446262410-45754-5-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201510311617.03849.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, October 31, 2015 at 04:33:23 AM, Brian Norris wrote:
> Used semantic patch with 'make coccicheck MODE=patch COCCI=script.cocci':
> 
> ---8<----
> virtual patch
> 
> @@
> struct nand_chip *c;
> struct device_node *d;
> @@
> -(c)->flash_node = (d)
> +nand_set_flash_node(c, d)
> ---8<----
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Thanks for the educational commit message!

Patch is
Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
