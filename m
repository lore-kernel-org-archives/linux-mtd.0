Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6rFm-0001hR-Qs
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 02:46:47 +0000
Received: by pfnn128 with SMTP id n128so39892555pfn.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 18:46:25 -0800 (PST)
Date: Wed, 9 Dec 2015 18:46:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Karl Zhang <shuangshuo@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 peterpandong@micron.com, beanhuo@micron.com, zszubbocsev@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: add new device MT35X
Message-ID: <20151210024623.GB29459@google.com>
References: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 10, 2015 at 01:58:58AM +0000, Karl Zhang wrote:
> Micron has announced a new SPI NOR device MT35X (XTRMFlash).

Announced? Do you have a flash sample? Did you test?

Brian

> This device's manufacturer ID is using 2Ch which arranged by
> JEDEC. The 20h is also Micron's ID due to the history.
> 
> This new device support high speed I/O interface. The clock
> frequency could up to 200 MHz (MAX) in DDR (400 MB/s) with
> DQS. The device bus width could be 1 or 8, and it's default
> width is configurable.
> 
> Karl Zhang (2):
>   mtd: spi-nor: add Manufacturer ID for Micron
>   mtd: spi-nor: add new device MT35X
> 
>  drivers/mtd/devices/m25p80.c  | 1 +
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  include/linux/mtd/cfi.h       | 1 +
>  include/linux/mtd/spi-nor.h   | 2 ++
>  4 files changed, 6 insertions(+)
> 
> -- 
> 1.9.1
> 
