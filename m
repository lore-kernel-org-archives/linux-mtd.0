Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFOeo-00069O-Ge
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 14:27:07 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/8] mtd: spi-nor: eliminate duplicate spi_nor_wait_till_{,
 fsr}_ready() code
Date: Thu, 7 Aug 2014 16:23:14 +0200
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201408071623.14668.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org, Graham Moore <grmoore@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 07, 2014 at 03:16:55 AM, Brian Norris wrote:
> These functions were near-carbon-copies due to a small per-flash quirk.
> Let's add a new spi_nor::flags bitfield to support these types of
> quirks.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Graham Moore <grmoore@altera.com>
> Cc: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Thanks for the cleanup,

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
