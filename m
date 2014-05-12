Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjwjU-00069R-CY
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 20:21:57 +0000
Received: by mail-ig0-f177.google.com with SMTP id l13so4333689iga.4
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 13:21:34 -0700 (PDT)
Date: Mon, 12 May 2014 13:21:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] mtd: m25p80: Revive dual read support
Message-ID: <20140512202131.GQ28907@ld-irv-0074>
References: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 22, 2014 at 02:45:31PM +0200, Geert Uytterhoeven wrote:
> Commit 03e296f613affcc2671c1e86d8c25ecad867204e ("mtd: m25p80: use the SPI
> nor framework") accidentally removed support for Dual SPI read transfers.
> Add it back.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Pushed to l2-mtd.git. Thanks!

Brian
