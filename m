Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj1K-00081g-2P
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:52:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 bbanghj.park@gmail.com
Subject: Re: [v3] mtd: spi-nor: cast to u64 to avoid uint overflows
Date: Mon,  3 Dec 2018 08:51:54 +0100
Message-Id: <20181203075154.28637-1-boris.brezillon@bootlin.com>
In-Reply-To: <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2018-11-28 at 08:02:14 UTC, Huijin Park wrote:
> From: "huijin.park" <huijin.park@samsung.com>
> 
> The "params->size" is defined as "u64".
> And "info->sector_size" and "info->n_sectors" are defined as
> unsigned int and u16.
> Thus, u64 data might have strange data(loss data) if the result
> overflows an unsigned int.
> This patch casts "info->sector_size" to an u64.
> 
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
