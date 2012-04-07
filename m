Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SGQm4-0004BO-1u
 for linux-mtd@lists.infradead.org; Sat, 07 Apr 2012 08:13:32 +0000
Received: by iaky10 with SMTP id y10so4906151iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 07 Apr 2012 01:13:28 -0700 (PDT)
Date: Sat, 7 Apr 2012 16:14:03 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mxs-dma : assign the dma cookie before we enable the dma
 channel
Message-ID: <20120407081359.GT7264@S2101-09.ap.freescale.net>
References: <1333776575-3462-1-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333776575-3462-1-git-send-email-shijie8@gmail.com>
Cc: vinod.koul@linux.intel.com, linux@arm.linux.org.uk, samgandhi9@gmail.com,
 w.sang@pengutronix.de, linux-mtd@lists.infradead.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 07, 2012 at 01:29:35AM -0400, Huang Shijie wrote:
> The dma chain may finished very fast, so an interrupt may arises before
> we assign the dma cookie. In this case, the mxs_dma_int_handler() may
> hit the BUG_ON() in dma_cookie_complete().
> 
> So assign the dma cookie before we enable the dma channel.
> 
> Acked-by: Sam Gandhi <samgandhi9@gmail.com>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Acked-by: Shawn Guo <shawn.guo@linaor.org>

The mxs mmc and audio still works with the change.

-- 
Regards,
Shawn
