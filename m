Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MF6cV-0006eQ-1T
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 13:16:43 +0000
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL4006SYNJKWB@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 22:16:32 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL4004J7NJIAD@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 22:16:32 +0900 (KST)
Date: Fri, 12 Jun 2009 18:46:41 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: dedekind@infradead.org
Message-id: <5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> >> +#ifdef MODULE
>> >> + flexonenand_setup(flex_bdry_info);
>> >> +#endif
>> >
>> > Why do you need this ifdef? What is the fundamental difference between
>> > onenand.ko as a module and onenand compiled-in?
>> >
>>
>> flexonenand_setup( ) need not be called, when OneNAND is built-in.
>> This function-call will cause overhead unwantedly on every boot, during OneNAND scan.
>>
>> flexonenand_setup( ) call is needed only when it has been built as a module.
>
> Why?
>

When Flex-OneNAND is built-in, the SLC boundary can be set by kernel command line.
During the boot up time, flexonenand_setup() gets invoked by kernel, on parsing the kernel
command line.

But when Flex-OneNAND is built as a module, SLC boundary information is passed as module
parameter.
So in this case flexonenand_setup() has to be called explicitly during insomd time
(module_init),  to set the desired boundary.
So without a compilation macro (#ifdef MODULE) flexonenand_setup() is invoked in onenand_scan,
even when it is built-in which is not needed.

I am not getting your point, could you please clarify?

Regards,
Amul Kumar Saha 
