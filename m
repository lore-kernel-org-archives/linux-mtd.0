Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8WxI-00018F-Ps
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 17:30:40 +0000
Received: by pabur14 with SMTP id ur14so107345045pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 09:30:15 -0800 (PST)
Date: Mon, 14 Dec 2015 09:30:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-wireless@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: nand: bcm47xxnflash: fix bcm47xxnflash_remove()
Message-ID: <20151214173011.GA15605@localhost>
References: <1450113250-12036-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1450113250-12036-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2015 at 06:14:10PM +0100, Boris Brezillon wrote:
> bcm47xxnflash_remove() is supposed to unregister the NAND device previously
> registered in bcm47xxnflash_probe(), but the current implementation just
> test for the always NULL ->mtd platform data field (and does not call the
> right function to unregister it).
> 
> Kill the useless ->mtd field in struct bcma_nflash, and release the real
> NAND device in bcm47xxnflash_remove().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: a5401370c520 ("mtd: prepare place for BCMA NAND flash driver(s)")
> Cc: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/bcm47xxnflash/main.c       | 7 ++++---
>  include/linux/bcma/bcma_driver_chipcommon.h | 4 ----
>  2 files changed, 4 insertions(+), 7 deletions(-)

Hmm, looks awfully similar...

http://patchwork.ozlabs.org/patch/554164/
