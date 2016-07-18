Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPF21-0007U4-F3
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 20:20:49 +0000
Received: by mail-pf0-x242.google.com with SMTP id i6so12271000pfe.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 13:20:29 -0700 (PDT)
Date: Mon, 18 Jul 2016 13:20:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [mtd-next:master 30/33]
 drivers/mtd/spi-nor/cadence-quadspi.c:529:4: error: implicit declaration of
 function 'readsl'
Message-ID: <20160718202026.GB137880@google.com>
References: <201607190315.0nkQuD2W%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201607190315.0nkQuD2W%fengguang.wu@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 03:43:17AM +0800, kbuild test robot wrote:
> tree:   git://git.infradead.org/linux-mtd-next.git master
> head:   f78921b9020c510ed222a6c2402e2aa126432415
> commit: 140623410536905fa6ab737b625decfde6c64a72 [30/33] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
> reproduce:
>         git checkout 140623410536905fa6ab737b625decfde6c64a72
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/mtd/spi-nor/cadence-quadspi.c: In function 'cqspi_indirect_read_execute':
> >> drivers/mtd/spi-nor/cadence-quadspi.c:529:4: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
>        readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
>        ^~~~~~
>    drivers/mtd/spi-nor/cadence-quadspi.c: In function 'cqspi_indirect_write_execute':
> >> drivers/mtd/spi-nor/cadence-quadspi.c:613:3: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
>       writesl(cqspi->ahb_base, txbuf, DIV_ROUND_UP(write_bytes, 4));
>       ^~~~~~~
>    cc1: some warnings being treated as errors

Hmm, does x86 not define readsl()/writesl()? I can never tell what
accessors are supposed to be "standard" across architectures.

Either we need to drop the COMPILE_TEST or maybe make it (!X86 &&
COMPILE_TEST).

Brian
