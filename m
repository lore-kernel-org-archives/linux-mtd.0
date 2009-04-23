Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v5)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vladimir Barinov <vova.barinov@gmail.com>
In-Reply-To: <1240487242-20864-1-git-send-email-vbarinov@embeddedalley.com>
References: <1240487242-20864-1-git-send-email-vbarinov@embeddedalley.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Apr 2009 15:46:32 +0300
Message-Id: <1240490792.19218.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-23 at 15:47 +0400, Vladimir Barinov wrote:
> The following patch fixes:
>  - re-initialization of host->col_addr which is used as byte index
>    between the successive READID flash commands.
>  - compile error when CONFIG_PM is enabled
>  - pass on the error code from clk_get()
>  - return -ENOMEM in case of failed ioremap()
>  - pass on the return value of platform_driver_probe() directly
>  - remove excessive printk
>  - let command line partition table parsing with mxc_nand name.
>    The cmd_line parsing is done via <mtd-id> name that differs
>    from mxc_nand by default and looks like "NAND 256MiB 1,8V 8-bit"
> 
> Signed-off-by: Vladimir Barinov <vbarinov@embeddedalley.com>
> Signed-off-by: Lothar Wassmann <LW@KARO-electronics.de>
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Take to l2-mtd-2.6.git, thanks! No guarantees, though.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
