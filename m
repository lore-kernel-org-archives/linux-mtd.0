Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLH8I-0005e7-Mu
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 20:42:23 +0000
Received: by pacan13 with SMTP id an13so46941577pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 13:42:02 -0700 (PDT)
Date: Fri, 31 Jul 2015 13:41:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com
Subject: Re: [PATCH v3 3/8] mtd: spi-nor: fsl-quadspi: add imx7d support
Message-ID: <20150731204157.GC10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-4-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-4-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 25, 2015 at 02:06:23AM +0800, Frank.Li@freescale.com wrote:
> From: Frank Li <Frank.Li@freescale.com>
> 
> Support i.mx7d.
> quadspi in i.mx7d increase rxfifo.
> require fill at least 16byte to trigger data transfer.
> 
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> Signed-off-by: Han Xu <b45815@freescale.com>

Looks good. I can take it when you resend the fixed-up series:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
