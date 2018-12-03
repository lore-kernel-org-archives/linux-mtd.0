Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTlZQ-0002jK-Sp
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 10:35:22 +0000
Date: Mon, 3 Dec 2018 11:34:59 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 bbanghj.park@gmail.com
Subject: Re: [v3] mtd: spi-nor: cast to u64 to avoid uint overflows
Message-ID: <20181203113459.05f29284@bbrezillon>
In-Reply-To: <20181203075154.28637-1-boris.brezillon@bootlin.com>
References: <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
 <20181203075154.28637-1-boris.brezillon@bootlin.com>
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

On Mon,  3 Dec 2018 08:51:54 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Wed, 2018-11-28 at 08:02:14 UTC, Huijin Park wrote:
> > From: "huijin.park" <huijin.park@samsung.com>
> > 
> > The "params->size" is defined as "u64".
> > And "info->sector_size" and "info->n_sectors" are defined as
> > unsigned int and u16.
> > Thus, u64 data might have strange data(loss data) if the result
> > overflows an unsigned int.
> > This patch casts "info->sector_size" to an u64.
> > 
> > Signed-off-by: huijin.park <huijin.park@samsung.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> 
> Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Oops, should I been queued to spi-nor/next. I dropped the patch and
will soon push it to spi-nor/next.
