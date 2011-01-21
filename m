Subject: Re: [PATCH] MTD: atmel_nand: Add DMA support to access Nandflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>
In-Reply-To: <1295332565-25610-2-git-send-email-hong.xu@atmel.com>
References: <hong.xu@atmel.com>
	<1295332565-25610-2-git-send-email-hong.xu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 21 Jan 2011 13:23:18 +0200
Message-ID: <1295608998.3186.3.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org,
	ryan@bluewatersys.com, linux-mtd@lists.infradead.org,
	jamie@jamieiles.com, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-18 at 14:36 +0800, Hong Xu wrote:
> Some SAM9 chips have the ability to perform DMA between CPU and SMC controller.
> This patch adds DMA support for SAM9RL, SAM9G45, SSAM9G46,AM9M10, SAM9M11.
> 
> Signed-off-by: Hong Xu <hong.xu@atmel.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
