Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjwkh-0006k8-47
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 20:23:11 +0000
Received: by mail-ie0-f177.google.com with SMTP id rp18so7483812iec.22
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 13:22:48 -0700 (PDT)
Date: Mon, 12 May 2014 13:22:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Enable Dual and Quad SPI read
 transfers for s25sl032p
Message-ID: <20140512202245.GR28907@ld-irv-0074>
References: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
 <1398170732-19773-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398170732-19773-2-git-send-email-geert+renesas@glider.be>
Cc: David Jander <david@protonic.nl>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 22, 2014 at 02:45:32PM +0200, Geert Uytterhoeven wrote:
> Spansion s25sl032p supports Dual and Quad SPI transfers, hence set the
> SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ flags.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Updated for m25p80 -> spi-nor

Pushed to l2-mtd.git. Thanks!

Brian
