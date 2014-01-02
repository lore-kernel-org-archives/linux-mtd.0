Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vyacd-00054R-1k
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 05:15:08 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYR0019MD8ILLA0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 14:14:42 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Sachin Kamat' <sachin.kamat@linaro.org>,
 'Brian Norris' <computersforpeace@gmail.com>
References: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
In-reply-to: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Merge plat/regs-nand.h into s3c2410.c
Date: Thu, 02 Jan 2014 14:14:41 +0900
Message-id: <002701cf0779$8af6c8a0$a0e459e0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, January 02, 2014 1:57 PM, Sachin Kamat wrote:
> 
> plat/regs-nand.h is used only by S3C2410 nand driver. Since there
> are no other users, merge this file into the driver code to remove
> platform dependency.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
> The earlier version of this patch was titled
> "mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd".
> Please ignore that.
> ---
> 
>  arch/arm/plat-samsung/include/plat/regs-nand.h |  123 ------------------------
>  drivers/mtd/nand/s3c2410.c                     |  104 +++++++++++++++++++-
>  2 files changed, 103 insertions(+), 124 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-nand.h
