Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj1K-000810-2N
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:52:00 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 bbanghj.park@gmail.com
Subject: Re: [v3] mtd: change len type from signed to unsigned type
Date: Mon,  3 Dec 2018 08:51:50 +0100
Message-Id: <20181203075150.28570-1-boris.brezillon@bootlin.com>
In-Reply-To: <1543465191-2100-1-git-send-email-huijin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-11-29 at 04:19:51 UTC, Huijin Park wrote:
> From: "huijin.park" <huijin.park@samsung.com>
> 
> Callers of erase_write() always pass an unsigned int.
> So this patch avoids a cast to an int.
> 
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
