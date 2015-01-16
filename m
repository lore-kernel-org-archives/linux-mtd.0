Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBxd8-0004Lx-5L
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 03:31:26 +0000
Received: by mail-pa0-f49.google.com with SMTP id eu11so21521055pac.8
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 19:31:04 -0800 (PST)
Date: Thu, 15 Jan 2015 19:31:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Subject: Re: [PATCH 1/1 v2] mtd: spi-nor: fsl-qspi: support deep sleep mode
 for imx6 sx chip
Message-ID: <20150116033100.GD9759@ld-irv-0074>
References: <1421096200-28174-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421096200-28174-1-git-send-email-Frank.Li@freescale.com>
Cc: lznuaa@gmail.com, linux-mtd@lists.infradead.org,
 Allen Xu <b45815@freescale.com>, shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 04:56:40AM +0800, Frank.Li@freescale.com wrote:
> From: Allen Xu <b45815@freescale.com>
> 
> i.mx6 sx support turn off fastmix and megamix power.
> qpsi controller can be turned off and all status lost when suspend/resume.
> add suspend/resume functions and reset qspi controller when resume.
> 
> Signed-off-by: Allen Xu <b45815@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>

Pushed to l2-mtd.git. Thanks.

Brian
