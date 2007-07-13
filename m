Subject: Re: [Resend][Patch] drivers/mtd/maps/tqm8xxl.c: Do some cleanups
From: David Woodhouse <dwmw2@infradead.org>
To: WANG Cong <xiyou.wangcong@gmail.com>
In-Reply-To: <20070713131458.GA1997@localhost.localdomain>
References: <20070712150135.GA4102@localhost.localdomain>
	<1184256718.32199.111.camel@weaponx.rchland.ibm.com>
	<20070713034822.GA2370@localhost.localdomain>
	<1184320602.2785.18.camel@shinybook.infradead.org>
	<20070713131458.GA1997@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 13 Jul 2007 14:38:03 +0100
Message-Id: <1184333884.8809.5.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@osdl.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org,
	kirk@hpc.ee.ntu.edu.tw, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-13 at 21:14 +0800, WANG Cong wrote:
> On Fri, Jul 13, 2007 at 10:56:42AM +0100, David Woodhouse wrote:
> >On Fri, 2007-07-13 at 11:48 +0800, WANG Cong wrote:
> >>                 if(map_banks[idx] == NULL) {
> >>                         ret = -ENOMEM;
> >> -                       /* FIXME: What if some MTD devices were probed already? */
> >> +                       /* FIXME: What if some MTD devices were probed
> >> +                       already? */
> >>                         goto error_mem;
> >>                 } 
> >
> >
> >That's just horrid. Leave it as it was.
> >
> 
> Sorry, I can't fully understand you. You mean only the above change is horrid or
> the entire patch?

Just the above change. See Linus' comments about strict limits on 80
columns being a Nazi dream.

> I have some questions about mtd/maps drivers. Even when I use `make allyesconfig`,
> I still can't compile some drivers. I should add the corresponding CONFIGs manually.
> Why this? And I still got some errors and warnings, such as:
> 
> drivers/mtd/maps/pmcmsp-flash.c:40:22: error: msp_prom.h: No such file or directory
> drivers/mtd/maps/pmcmsp-flash.c:41:22: error: msp_regs.h: No such file or directory
> drivers/mtd/maps/pmcmsp-flash.c: In function 'init_msp_flash':
> drivers/mtd/maps/pmcmsp-flash.c:62: error: 'DEV_ID_REG' undeclared (first use in this function)
> drivers/mtd/maps/pmcmsp-flash.c:62: error: (Each undeclared identifier is reported only once
> drivers/mtd/maps/pmcmsp-flash.c:62: error: for each function it appears in.)
> drivers/mtd/maps/pmcmsp-flash.c:62: error: 'DEV_ID_SINGLE_PC' undeclared (first use in this function)
> drivers/mtd/maps/pmcmsp-flash.c:63: error: 'ELB_1PC_EN_REG' undeclared (first use in this function)
> drivers/mtd/maps/pmcmsp-flash.c:63: error: 'SINGLE_PCCARD' undeclared (first use in this function)
> 
> Did I miss something?

I think that map driver should probably depend on CONFIG_PMC_MSP. Ralf?

-- 
dwmw2
