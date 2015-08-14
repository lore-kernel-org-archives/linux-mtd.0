Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ3NJ-00052b-Ge
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 01:01:38 +0000
Received: by pacrr5 with SMTP id rr5so48423227pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 18:01:16 -0700 (PDT)
Date: Thu, 13 Aug 2015 18:01:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Cc: linux-mtd@lists.infradead.org, han.xu@freescale.com, shijie8@gmail.com,
 Frank.Li@freescale.com
Subject: Re: [PATCH v2] spi-nor: Kconfig: Improve help text for SPI_FSL_QUADSPI
Message-ID: <20150814010113.GK60523@google.com>
References: <1439485325-22977-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439485325-22977-1-git-send-email-fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 13, 2015 at 02:02:05PM -0300, Fabio Estevam wrote:
> The current "We only connect the NOR to this controller now." text
> is not very clear, so explain it better by saying that generic SPI
> is not supported by SPI_FSL_QUADSPI and only SPI NOR is.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - Explain that generic SPI is not supported and only SPI NOR is as
> suggested by Frank Li

Applied to l2-mtd.git
