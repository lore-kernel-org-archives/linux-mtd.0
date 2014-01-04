Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzGK4-0003X2-Ph
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 01:46:47 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYU00J9SSX5UW10@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 10:46:17 +0900 (KST)
From: kgene@kernel.org
Sender: Kukjin Kim <kgene.kim@samsung.com>
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-mtd@lists.infradead.org
References: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
In-reply-to: <1388638630-1353-1-git-send-email-sachin.kamat@linaro.org>
Subject: RE: [PATCH 1/1] mtd: s3c2410: Merge plat/regs-nand.h into s3c2410.c
Date: Sat, 04 Jan 2014 10:46:18 +0900
Message-id: <22ed01cf08ee$c2ea08f0$48be1ad0$@kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: computersforpeace@gmail.com, linux-samsung-soc@vger.kernel.org,
 patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sachin Kamat wrote:
> 
> plat/regs-nand.h is used only by S3C2410 nand driver. Since there
> are no other users, merge this file into the driver code to remove
> platform dependency.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> The earlier version of this patch was titled
> "mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd".
> Please ignore that.
> ---
> 
>  arch/arm/plat-samsung/include/plat/regs-nand.h |  123 -------------------
> -----
>  drivers/mtd/nand/s3c2410.c                     |  104
+++++++++++++++++++-
>  2 files changed, 103 insertions(+), 124 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-nand.h
> 
Moving looks good, but if some of them are not used, we don't need to keep
them while moving.

Thanks,
Kukjin
