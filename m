Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: David Woodhouse <dwmw2@infradead.org>
To: Amul Saha <amul.saha@samsung.com>
In-Reply-To: <5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
Content-Type: text/plain
Date: Fri, 12 Jun 2009 14:32:37 +0100
Message-Id: <1244813557.3511.1272.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-12 at 18:46 +0530, Amul Saha wrote:
> >> >> +#ifdef MODULE
> >> >> + flexonenand_setup(flex_bdry_info);
> >> >> +#endif
> >> >
> >> > Why do you need this ifdef? What is the fundamental difference between
> >> > onenand.ko as a module and onenand compiled-in?
> >> >
> >>
> >> flexonenand_setup( ) need not be called, when OneNAND is built-in.
> >> This function-call will cause overhead unwantedly on every boot, during OneNAND scan.
> >>
> >> flexonenand_setup( ) call is needed only when it has been built as a module.
> >
> > Why?
> >
> 
> When Flex-OneNAND is built-in, the SLC boundary can be set by kernel command line.
> During the boot up time, flexonenand_setup() gets invoked by kernel, on parsing the kernel
> command line.
> 
> But when Flex-OneNAND is built as a module, SLC boundary information is passed as module
> parameter.
> So in this case flexonenand_setup() has to be called explicitly during insomd time
> (module_init),  to set the desired boundary.
> So without a compilation macro (#ifdef MODULE) flexonenand_setup() is invoked in onenand_scan,
> even when it is built-in which is not needed.
> 
> I am not getting your point, could you please clarify?

You can remove flexonenand_setup() and the __setup("onenand_brdy=")
completely, and use _only_ "module_param_array()". That will work both
for modules and for the built-in case.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
