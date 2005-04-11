Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL67i-0006Jx-3p
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 17:07:11 -0400
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>,
	Rusty Russell <rusty@rustcorp.com.au>
Message-ID: <20050411210507.GC5863@stusta.de>
References: <20050411012532.58593bc1.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050411012532.58593bc1.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Subject: 2.6.12-rc2-mm3: CONFIG_MODULES=n MTD compile error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 11 Apr 2005 21:07:11 -0000

On Mon, Apr 11, 2005 at 01:25:32AM -0700, Andrew Morton wrote:
>...
> Changes since 2.6.12-rc2-mm2:
>...
> +remove-inter-module-mtd.patch
> 
>  Remove intermodule_foo() usage from mtd.
>...

This breaks the compilation with CONFIG_MODULES=n:

<--  snip  -->

...
  CC      drivers/mtd/devices/docprobe.o
drivers/mtd/devices/docprobe.c: In function `DoC_Probe':
drivers/mtd/devices/docprobe.c:311: warning: implicit declaration of 
function `__symbol_get'
drivers/mtd/devices/docprobe.c:311: warning: assignment makes pointer 
from integer without a cast
drivers/mtd/devices/docprobe.c:315: warning: implicit declaration of function `__symbol_put'
...
  LD      .tmp_vmlinux1
drivers/built-in.o(.init.text+0x60f20): In function `DoC_Probe':
: undefined reference to `__symbol_get'
drivers/built-in.o(.init.text+0x60f3b): In function `DoC_Probe':
: undefined reference to `__symbol_put'
drivers/built-in.o(.init.text+0x610a4): In function `DoC_Probe':
: undefined reference to `__symbol_get'
make: *** [.tmp_vmlinux1] Error 1

<--  snip  -->


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
