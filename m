Subject: Re: [PATCH] MTD: Fix Orion NAND driver compilation with ARM OABI
From: David Woodhouse <dwmw2@infradead.org>
To: Paulius Zaleckas <paulius.zaleckas@gmail.com>
In-Reply-To: <20100320085507.4038.96426.stgit@pauliusz>
References: <20100320085507.4038.96426.stgit@pauliusz>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 20 Mar 2010 09:41:23 +0000
Message-ID: <1269078083.4028.5586.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nico@fluxnic.net, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	simon.kagstrom@netinsight.net, akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-03-20 at 10:55 +0200, Paulius Zaleckas wrote:
> We must tell GCC to use even register for variable passed
> to ldrd instruction. Without this patch GCC 4.2.1 puts this
> variable to r2/r3 on EABI and r3/r4 on OABI, so force it to
> r2/r3. This does not change anything when EABI and OABI
> compilation works OK.
> 
> Without this patch and with OABI I get:
> /tmp/ccMkwOCs.s:63: Error: first destination register must be even -- `ldrd r3,[ip]'
> make[5]: *** [drivers/mtd/nand/orion_nand.o] Error 1

 ...
> -		uint64_t x;
> +		/*
> +		 * force x variable to r2/r3 registers since ldrd instruction
> +		 * requires first register to be even.
> +		 */
> +		register uint64_t x asm ("r2");
> +
>  		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));

Hm, isn't there an asm constraint which will force it into an
appropriate register pair? Failing that, "=&2,4,6,8" ought to work.
(Um, and why the earlyclobber? Why can't io_base be passed in in one of
the same registers?)

We should try to avoid making our constraints more restrictive than they
need to be.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
