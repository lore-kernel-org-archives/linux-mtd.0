Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY9rz-00058a-AD
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 07:58:00 +0000
Received: by mail-we0-f177.google.com with SMTP id u57so3421560wes.8
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 00:57:35 -0700 (PDT)
Date: Thu, 10 Apr 2014 08:57:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/9] mtd: st_spi_fsm: fixup Kconfig dependency
Message-ID: <20140410075731.GJ4214@lee--X1>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-6-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397064774-31784-6-git-send-email-computersforpeace@gmail.com>
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

> I hear that this driver should depend on ARCH_STI, and that "SH" is not
> actually a real symbol. At the same time, let's allow compile-testing on
> other ARCH'es.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/devices/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
