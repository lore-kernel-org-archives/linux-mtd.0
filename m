Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v4)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vladimir Barinov <vova.barinov@gmail.com>
In-Reply-To: <1240414310-9245-1-git-send-email-vbarinov@embeddedalley.com>
References: <1240414310-9245-1-git-send-email-vbarinov@embeddedalley.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Apr 2009 09:46:03 +0300
Message-Id: <1240469163.19218.16.camel@localhost.localdomain>
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

On Wed, 2009-04-22 at 19:31 +0400, Vladimir Barinov wrote:
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
> ---
>  drivers/mtd/nand/mxc_nand.c |   43 +++++++++++++++++++++++--------------------
>  1 files changed, 23 insertions(+), 20 deletions(-)

Your patch does not apply to the latest mtd-2.6.git

[dedekind@eru l2-mtd-2.6.git]$ git-am vova                                                                                                                                             
Applying: MXC NAND driver fixes (v4)                                                                                                                                                   
error: patch failed: drivers/mtd/nand/mxc_nand.c:866                                                                                                                                   
error: drivers/mtd/nand/mxc_nand.c: patch does not apply                                                                                                                               
Patch failed at 0001.                                                                                                                                                                  
When you have resolved this problem run "git am --resolved".                                                                                                                           
If you would prefer to skip this patch, instead run "git am --skip".                                                                                                                   
To restore the original branch and stop patching run "git am --abort".                                                                                                                 
                                                                                                                                                     
[dedekind@eru l2-mtd-2.6.git]$ patch -p1 < vova                                                                                                                                        
patching file drivers/mtd/nand/mxc_nand.c                                                                                                                                              
Hunk #2 FAILED at 867.                                                                                                                                                                 
Hunk #3 succeeded at 884 (offset 1 line).                                                                                                                                              
Hunk #5 succeeded at 1015 (offset 1 line).                                                                                                                                             
1 out of 6 hunks FAILED -- saving rejects to file drivers/mtd/nand/mxc_nand.c.rej                                                                                                      

[dedekind@eru l2-mtd-2.6.git]$ cat drivers/mtd/nand/mxc_nand.c.rej
***************
*** 866,871 ****
        mtd = &host->mtd;
        mtd->priv = this;
        mtd->owner = THIS_MODULE;

        /* 50 us command delay time */
        this->chip_delay = 5;
--- 867,873 ----
        mtd = &host->mtd;
        mtd->priv = this;
        mtd->owner = THIS_MODULE;
+       mtd->name = "mxc_nand";

        /* 50 us command delay time */
        this->chip_delay = 5;

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
