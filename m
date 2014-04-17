Received: from mail-pa0-f44.google.com ([209.85.220.44])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaeSV-0006z2-SO
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 05:02:00 +0000
Received: by mail-pa0-f44.google.com with SMTP id bj1so11760497pad.31
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 22:01:34 -0700 (PDT)
Date: Wed, 16 Apr 2014 22:01:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mtd: st_spi_fsm: correct type issues
Message-ID: <20140417050131.GH5512@norris-Latitude-E6410>
References: <1397637782-26843-1-git-send-email-computersforpeace@gmail.com>
 <20140416104611.GP4754@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140416104611.GP4754@lee--X1>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 16, 2014 at 11:46:11AM +0100, Lee Jones wrote:
> > Compile-testing for a 64-bit arch uncovers several bad casts:
> > 
> >     In file included from include/linux/linkage.h:4:0,
> >                      from include/linux/kernel.h:6,
> >                      from drivers/mtd/devices/st_spi_fsm.c:15:
> >     drivers/mtd/devices/st_spi_fsm.c: In function ‘stfsm_read_fifo’:
> >     drivers/mtd/devices/st_spi_fsm.c:758:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >       BUG_ON((((uint32_t)buf) & 0x3) || (size & 0x3));
> >     ...
> > 
> > Use uintptr_t instead of uint32_t, since it's guaranteed to be
> > pointer-sized.
> > 
> > We also see this warning, if size_t is not 32 bits wide:
> > 
> >     In file included from drivers/mtd/devices/st_spi_fsm.c:15:0:
> >     drivers/mtd/devices/st_spi_fsm.c: In function ‘stfsm_mtd_write’:
> >     include/linux/kernel.h:712:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
> >       (void) (&_min1 == &_min2);  \
> >                      ^
> >     drivers/mtd/devices/st_spi_fsm.c:1704:11: note: in expansion of macro ‘min’
> >        bytes = min(FLASH_PAGESIZE - page_offs, len);
> >                ^
> > 
> > Just use min_t() to force the type conversion, since we don't really
> > want to upgrade 'page_offs' and 'bytes' to size_t; they only should be
> > handling <= 256 byte offsets.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/mtd/devices/st_spi_fsm.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Thanks for fixing Brian. Fixes look good.
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>

Pushed both to l2-mtd.git/spinor.

Brian
