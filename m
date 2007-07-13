Received: from ftp.linux-mips.org ([194.74.144.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9M4h-0001Ja-So
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 10:24:53 -0400
Received: from localhost.localdomain ([127.0.0.1]:42179 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20023687AbXGMOYs (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Fri, 13 Jul 2007 15:24:48 +0100
Date: Fri, 13 Jul 2007 15:24:43 +0100
From: Ralf Baechle <ralf@linux-mips.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
Message-ID: <20070713142442.GA8190@linux-mips.org>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
	<1184320602.2785.18.camel@shinybook.infradead.org>
	<20070713131458.GA1997@localhost.localdomain>
	<1184333884.8809.5.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1184333884.8809.5.camel@hades.cambridge.redhat.com>
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

On Fri, Jul 13, 2007 at 02:38:03PM +0100, David Woodhouse wrote:

> > drivers/mtd/maps/pmcmsp-flash.c:63: error: 'ELB_1PC_EN_REG' undeclared (first use in this function)
> > drivers/mtd/maps/pmcmsp-flash.c:63: error: 'SINGLE_PCCARD' undeclared (first use in this function)
> > 
> > Did I miss something?
> 
> I think that map driver should probably depend on CONFIG_PMC_MSP. Ralf?

*confused*

68aa0fa87f6d4b2f5e8ad39ecaec8bba9137bb3d did add:

+config MTD_PMC_MSP_EVM
+       tristate "CFI Flash device mapped on PMC-Sierra MSP"
+       depends on PMC_MSP && MTD_CFI
+       select MTD_PARTITIONS

drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o

Is he trying to build something else than very recent kernel.org tree?

  Ralf
