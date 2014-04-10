Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY9nP-000504-R0
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 07:53:16 +0000
Received: by mail-wi0-f176.google.com with SMTP id r20so10203939wiv.9
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 00:52:54 -0700 (PDT)
Date: Thu, 10 Apr 2014 08:52:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 8/9] mtd: st_spi_fsm: replace FLACH_CMD_* with SPINOR_OP_*
Message-ID: <20140410075250.GH4214@lee--X1>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-8-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397064774-31784-8-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Begin to unify the differences between serial_flash_cmds.h and
> spi-nor.h.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/devices/serial_flash_cmds.h |  62 +++++++++---------
>  drivers/mtd/devices/st_spi_fsm.c        | 112 ++++++++++++++++----------------
>  2 files changed, 87 insertions(+), 87 deletions(-)

Nice.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
