Received: from mail-wg0-f44.google.com ([74.125.82.44])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaNMX-0005R3-5q
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 10:46:41 +0000
Received: by mail-wg0-f44.google.com with SMTP id m15so10830237wgh.27
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 03:46:15 -0700 (PDT)
Date: Wed, 16 Apr 2014 11:46:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: st_spi_fsm: correct type issues
Message-ID: <20140416104611.GP4754@lee--X1>
References: <1397637782-26843-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397637782-26843-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Compile-testing for a 64-bit arch uncovers several bad casts:
> 
>     In file included from include/linux/linkage.h:4:0,
>                      from include/linux/kernel.h:6,
>                      from drivers/mtd/devices/st_spi_fsm.c:15:
>     drivers/mtd/devices/st_spi_fsm.c: In function ‘stfsm_read_fifo’:
>     drivers/mtd/devices/st_spi_fsm.c:758:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>       BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
>     ...
> 
> Use uintptr_t instead of uint32_t, since it's guaranteed to be
> pointer-sized.
> 
> We also see this warning, if size_t is not 32 bits wide:
> 
>     In file included from drivers/mtd/devices/st_spi_fsm.c:15:0:
>     drivers/mtd/devices/st_spi_fsm.c: In function ‘stfsm_mtd_write’:
>     include/linux/kernel.h:712:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
>       (void) (&_min1 == &_min2);  \
>                      ^
>     drivers/mtd/devices/st_spi_fsm.c:1704:11: note: in expansion of macro ‘min’
>        bytes = min(FLASH_PAGESIZE - page_offs, len);
>                ^
> 
> Just use min_t() to force the type conversion, since we don't really
> want to upgrade 'page_offs' and 'bytes' to size_t; they only should be
> handling <= 256 byte offsets.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/devices/st_spi_fsm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Thanks for fixing Brian. Fixes look good.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
