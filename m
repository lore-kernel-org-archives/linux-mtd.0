Received: from wa-out-1112.google.com ([209.85.146.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9Kwc-00005d-0z
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 09:12:27 -0400
Received: by wa-out-1112.google.com with SMTP id v33so552776wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jul 2007 06:12:24 -0700 (PDT)
Date: Fri, 13 Jul 2007 21:14:58 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
Message-ID: <20070713131458.GA1997@localhost.localdomain>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
	<1184320602.2785.18.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1184320602.2785.18.camel@shinybook.infradead.org>
Cc: kirk@hpc.ee.ntu.edu.tw, akpm@osdl.org, LKML <linux-kernel@vger.kernel.org>,
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

On Fri, Jul 13, 2007 at 10:56:42AM +0100, David Woodhouse wrote:
>On Fri, 2007-07-13 at 11:48 +0800, WANG Cong wrote:
>>                 if(map_banks[idx] == NULL) {
>>                         ret = -ENOMEM;
>> -                       /* FIXME: What if some MTD devices were probed already? */
>> +                       /* FIXME: What if some MTD devices were probed
>> +                       already? */
>>                         goto error_mem;
>>                 } 
>
>
>That's just horrid. Leave it as it was.
>

Sorry, I can't fully understand you. You mean only the above change is horrid or
the entire patch?

I have some questions about mtd/maps drivers. Even when I use `make allyesconfig`,
I still can't compile some drivers. I should add the corresponding CONFIGs manually.
Why this? And I still got some errors and warnings, such as:

drivers/mtd/maps/pmcmsp-flash.c:40:22: error: msp_prom.h: No such file or directory
drivers/mtd/maps/pmcmsp-flash.c:41:22: error: msp_regs.h: No such file or directory
drivers/mtd/maps/pmcmsp-flash.c: In function 'init_msp_flash':
drivers/mtd/maps/pmcmsp-flash.c:62: error: 'DEV_ID_REG' undeclared (first use in this function)
drivers/mtd/maps/pmcmsp-flash.c:62: error: (Each undeclared identifier is reported only once
drivers/mtd/maps/pmcmsp-flash.c:62: error: for each function it appears in.)
drivers/mtd/maps/pmcmsp-flash.c:62: error: 'DEV_ID_SINGLE_PC' undeclared (first use in this function)
drivers/mtd/maps/pmcmsp-flash.c:63: error: 'ELB_1PC_EN_REG' undeclared (first use in this function)
drivers/mtd/maps/pmcmsp-flash.c:63: error: 'SINGLE_PCCARD' undeclared (first use in this function)

Did I miss something?


Thanks!

-- 

If loving computers is wrong, I don't want to be right.
