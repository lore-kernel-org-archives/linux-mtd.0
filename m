Received: from wa-out-1112.google.com ([209.85.146.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9Mey-0001zC-W9
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 11:02:23 -0400
Received: by wa-out-1112.google.com with SMTP id v33so587922wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jul 2007 08:02:17 -0700 (PDT)
Date: Fri, 13 Jul 2007 23:05:03 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
Message-ID: <20070713150503.GA4023@localhost.localdomain>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
	<1184320602.2785.18.camel@shinybook.infradead.org>
	<20070713131458.GA1997@localhost.localdomain>
	<1184333884.8809.5.camel@hades.cambridge.redhat.com>
	<20070713142442.GA8190@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070713142442.GA8190@linux-mips.org>
Cc: akpm@osdl.org, LKML <linux-kernel@vger.kernel.org>, kirk@hpc.ee.ntu.edu.tw,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 13, 2007 at 03:24:43PM +0100, Ralf Baechle wrote:
>On Fri, Jul 13, 2007 at 02:38:03PM +0100, David Woodhouse wrote:
>
>> > drivers/mtd/maps/pmcmsp-flash.c:63: error: 'ELB_1PC_EN_REG' undeclared (first use in this function)
>> > drivers/mtd/maps/pmcmsp-flash.c:63: error: 'SINGLE_PCCARD' undeclared (first use in this function)
>> > 
>> > Did I miss something?
>> 
>> I think that map driver should probably depend on CONFIG_PMC_MSP. Ralf?
>
>*confused*
>
>68aa0fa87f6d4b2f5e8ad39ecaec8bba9137bb3d did add:
>
>+config MTD_PMC_MSP_EVM
>+       tristate "CFI Flash device mapped on PMC-Sierra MSP"
>+       depends on PMC_MSP && MTD_CFI
>+       select MTD_PARTITIONS
>
>drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
>
>Is he trying to build something else than very recent kernel.org tree?
>

Yes. very recent, 2.6.22.1.


-- 

If loving computers is wrong, I don't want to be right.
