Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFOeo-00069I-H9
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 14:27:07 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/8] mtd: spi-nor: handle timeout errors in spi_nor_write()
Date: Thu, 7 Aug 2014 16:23:33 +0200
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201408071623.33590.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 07, 2014 at 03:16:56 AM, Brian Norris wrote:
> The error label was unused here. It looks like we're missing at least
> one case that should be doing 'goto write_err'.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
