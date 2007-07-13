Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
From: David Woodhouse <dwmw2@infradead.org>
To: Ralf Baechle <ralf@linux-mips.org>
In-Reply-To: <20070713142442.GA8190@linux-mips.org>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
	<1184320602.2785.18.camel@shinybook.infradead.org>
	<20070713131458.GA1997@localhost.localdomain>
	<1184333884.8809.5.camel@hades.cambridge.redhat.com>
	<20070713142442.GA8190@linux-mips.org>
Content-Type: text/plain
Date: Fri, 13 Jul 2007 15:31:29 +0100
Message-Id: <1184337089.8809.11.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@osdl.org, LKML <linux-kernel@vger.kernel.org>, kirk@hpc.ee.ntu.edu.tw,
	linux-mtd@lists.infradead.org, WANG Cong <xiyou.wangcong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-13 at 15:24 +0100, Ralf Baechle wrote:
> +config MTD_PMC_MSP_EVM
> +       tristate "CFI Flash device mapped on PMC-Sierra MSP"
> +       depends on PMC_MSP && MTD_CFI
> +       select MTD_PARTITIONS
> 
> drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PMC_MSP_EVM)   +=
> pmcmsp-flash.o
> 
> Is he trying to build something else than very recent kernel.org
> tree? 

Hm. His mail did say "Even when I use `make allyesconfig`, I still can't
compile some drivers. I should add the corresponding CONFIGs manually."
          
I wonder if he disabled the correct conditions and then tried building
it in an i386 kernel?

-- 
dwmw2
