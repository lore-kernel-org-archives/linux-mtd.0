Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXn1p-00009l-RD
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 07:34:39 +0000
Received: by mail-pa0-f47.google.com with SMTP id lj1so2141614pab.6
 for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2014 00:34:15 -0700 (PDT)
Date: Wed, 9 Apr 2014 00:34:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by
 module drivers
Message-ID: <20140409073410.GG3131@norris-Latitude-E6410>
References: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 08, 2014 at 11:09:41PM -0700, Brian Norris wrote:
> Fix errors like this:
> 
>     ERROR: "spi_nor_ids" [drivers/mtd/devices/m25p80.ko] undefined!
>     ERROR: "spi_nor_scan" [drivers/mtd/devices/m25p80.ko] undefined!
>     make[1]: *** [__modpost] Error 1
>     make: *** [modules] Error 2
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Based on l2-mtd.git:spinor

Applied to l2-mtd.git/spinor, to fix the build errors.

Brian
