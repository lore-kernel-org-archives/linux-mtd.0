Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWAdd-0007ES-UJ
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 13:23:30 +0000
Date: Mon, 3 Mar 2008 14:22:46 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Darius <augulis.darius@gmail.com>
Subject: Re: [PATCH] Boot XIP kernel for IMX
Message-ID: <20080303132245.GA17061@lazybastard.org>
References: <fq5nlh$h6g$2@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fq5nlh$h6g$2@ger.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 February 2008 09:24:26 +0200, Darius wrote:
> +
> +/*
> +#define xip_irqpending()        ( IMX_NIPNDH || IMX_NIPNDL )
> +#define xip_currtime()          (IMX_TCN(IMX_TIM1_BASE))
> +#define xip_elapsed_since(x)    (signed)((IMX_TCN(IMX_TIM1_BASE) -(x)) * 31)
> +*/
> +
> +//#define xip_cpu_idle()  asm volatile ("mcr p14, 0, %0, c7, c0, 0" :: "r" (1))

Is there a reason to leave these bits in the patch?

Jörn

-- 
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein
