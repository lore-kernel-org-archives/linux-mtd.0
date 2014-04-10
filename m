Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY9kx-0004vp-Pj
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 07:50:44 +0000
Received: by mail-wi0-f175.google.com with SMTP id cc10so10200603wib.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 00:50:20 -0700 (PDT)
Date: Thu, 10 Apr 2014 08:50:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 9/9] mtd: st_spi_fsm: begin using spi-nor.h opcodes
Message-ID: <20140410075017.GG4214@lee--X1>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-9-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397064774-31784-9-git-send-email-computersforpeace@gmail.com>
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

On Wed, 09 Apr 2014, Brian Norris wrote:

> Many of the serial_flash_cmds.h opcodes are duplicated with spi-nor.h.
> Let's begin to unify them.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/devices/serial_flash_cmds.h | 20 --------------------
>  drivers/mtd/devices/st_spi_fsm.c        |  9 +++++----
>  2 files changed, 5 insertions(+), 24 deletions(-)

So long as the underlying Op Codes havent changed:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
