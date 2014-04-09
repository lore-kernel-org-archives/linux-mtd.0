Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpPt-0004DT-VN
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 10:07:39 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by
 module drivers
Date: Wed, 9 Apr 2014 10:43:38 +0200
References: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404091043.38198.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 at 08:09:41 AM, Brian Norris wrote:
> Fix errors like this:
> 
>     ERROR: "spi_nor_ids" [drivers/mtd/devices/m25p80.ko] undefined!
>     ERROR: "spi_nor_scan" [drivers/mtd/devices/m25p80.ko] undefined!
>     make[1]: *** [__modpost] Error 1
>     make: *** [modules] Error 2

Why not EXPORT_SYMBOL_GPL ?

Best regards,
Marek Vasut
