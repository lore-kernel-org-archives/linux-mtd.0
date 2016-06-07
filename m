Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bADd2-0002Dm-OE
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 09:48:58 +0000
Date: Tue, 7 Jun 2016 11:48:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, john@phrozen.org
Subject: Re: [PATCH 0/6] MTD: xway: updates from OpenWrt/LEDE
Message-ID: <20160607114824.5f96228a@bbrezillon>
In-Reply-To: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
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

On Sun,  5 Jun 2016 23:20:03 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> These patches are in OpenWrt for years now and should go upstream. They 
> are fixing some problems in the NAND driver.

Just had a closer look at the xway NAND controller driver, and it's
just a big pile of hacks :-(. I'll take those patches if nobody is
willing to maintain this driver, but honestly, I'd prefer a complete
rework of the driver.

> 
> Hauke Mehrtens (1):
>   MTD: xway: add some more documentation
> 
> John Crispin (5):
>   MTD: xway: fix invalid operator
>   MTD: xway: the latched command should be persistent
>   MTD: xway: remove endless loop
>   MTD: xway: add missing write_buf and read_buf to nand driver
>   MTD: xway: fix nand locking
> 
>  drivers/mtd/nand/xway_nand.c | 67 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 51 insertions(+), 16 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
