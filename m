Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wplx7-0002WD-27
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 22:04:05 +0000
Received: by mail-pb0-f41.google.com with SMTP id uo5so11839160pbc.14
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 15:03:41 -0700 (PDT)
Date: Wed, 28 May 2014 15:03:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd: pxa3xx_nand: make the driver work on big-endian
 systems
Message-ID: <20140528220338.GD3599@ld-irv-0074>
References: <1400763412-10393-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400763412-10393-1-git-send-email-thomas.petazzoni@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 22, 2014 at 02:56:52PM +0200, Thomas Petazzoni wrote:
> The pxa3xx_nand driver currently uses __raw_writel() and __raw_readl()
> to access I/O registers. However, those functions do not do any
> endianness swapping, which means that they won't work when the CPU
> runs in big-endian but the I/O registers are little endian, which is
> the common situation for ARM systems running big endian.
> 
> Since __raw_writel() and __raw_readl() do not include any memory
> barriers and the pxa3xx_nand driver can only be compiled for ARM
> platforms, the closest I/o accessors functions that do endianess
> swapping are writel_relaxed() and readl_relaxed().

With any luck, the *_relaxed() accessors will be implemented uniformly
on all architectures soon. I believe there's an outstanding patch series
for this out on LKML.

> This patch has been verified to work on Armada XP GP: without the
> patch, the NAND is not detected when the kernel runs big endian while
> it is properly detected when the kernel runs little endian. With the
> patch applied, the NAND is properly detected in both situations
> (little and big endian).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: <stable@vger.kernel.org> # v3.13+
> ---
> This patch does not fix a regression introduced by a previous commit,
> but is still necessary for stable to allow NAND to work properly on
> ARM big endian platforms. The 3.13 starting point was chosen because
> the support for big endian on modern ARM systems was added in this
> kernel release.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Two sign-offs for the price of one! ;)

Pushed to l2-mtd.git. Thanks!

Brian

> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 7588fe2..3003611 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -127,10 +127,10 @@
>  
>  /* macros for registers read/write */
>  #define nand_writel(info, off, val)	\
> -	__raw_writel((val), (info)->mmio_base + (off))
> +	writel_relaxed((val), (info)->mmio_base + (off))
>  
>  #define nand_readl(info, off)		\
> -	__raw_readl((info)->mmio_base + (off))
> +	readl_relaxed((info)->mmio_base + (off))
>  
>  /* error code and state */
>  enum {
