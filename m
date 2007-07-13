Received: from py-out-1112.google.com ([64.233.166.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9Mkz-0002EX-47
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 11:08:34 -0400
Received: by py-out-1112.google.com with SMTP id a25so871219pyi
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jul 2007 08:08:31 -0700 (PDT)
Date: Fri, 13 Jul 2007 23:11:06 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
Message-ID: <20070713151106.GB4023@localhost.localdomain>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
	<1184320602.2785.18.camel@shinybook.infradead.org>
	<20070713131458.GA1997@localhost.localdomain>
	<1184333884.8809.5.camel@hades.cambridge.redhat.com>
	<20070713142442.GA8190@linux-mips.org>
	<1184337089.8809.11.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1184337089.8809.11.camel@hades.cambridge.redhat.com>
Cc: akpm@osdl.org, LKML <linux-kernel@vger.kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>, kirk@hpc.ee.ntu.edu.tw,
	linux-mtd@lists.infradead.org
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 13, 2007 at 03:31:29PM +0100, David Woodhouse wrote:
>On Fri, 2007-07-13 at 15:24 +0100, Ralf Baechle wrote:
>> +config MTD_PMC_MSP_EVM
>> +       tristate "CFI Flash device mapped on PMC-Sierra MSP"
>> +       depends on PMC_MSP && MTD_CFI
>> +       select MTD_PARTITIONS
>> 
>> drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PMC_MSP_EVM)   +=
>> pmcmsp-flash.o
>> 
>> Is he trying to build something else than very recent kernel.org
>> tree? 
>
>Hm. His mail did say "Even when I use `make allyesconfig`, I still can't
>compile some drivers. I should add the corresponding CONFIGs manually."
>          
>I wonder if he disabled the correct conditions and then tried building
>it in an i386 kernel?
>

Er, I first used 'make allyesconfig', then added CONFIG_MTD_PMC_MSP_EVM=y
manually. And yes, I am on i386.

-- 

If loving computers is wrong, I don't want to be right.
