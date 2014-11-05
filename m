Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7eo-0000nw-Vx
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 20:58:23 +0000
Received: by mail-pa0-f46.google.com with SMTP id lf10so1524085pab.19
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 12:58:02 -0800 (PST)
Date: Wed, 5 Nov 2014 12:57:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] mtd: dataflash: Remove use of tx_dma
Message-ID: <20141105205759.GQ23619@ld-irv-0074>
References: <1414585652-31543-1-git-send-email-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414585652-31543-1-git-send-email-broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2014 at 12:27:32PM +0000, Mark Brown wrote:
> We are trying to remove the legacy tx_dma and rx_dma fields from the
> spi_transfer structure. Currently dataflash uses tx_dma but only to make
> sure that it's set to 0 so we can remove this use by replacing with a
> zero initialisation of the entire spi_transfer struct.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Applied to l2-mtd.git. Thanks!

Brian
