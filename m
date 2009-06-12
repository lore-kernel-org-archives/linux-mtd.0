Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MF3vd-0001xk-C2
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 10:24:16 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL400BMUFK1GQ@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 19:24:01 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL400JZ8FJYI2@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 19:24:01 +0900 (KST)
Date: Fri, 12 Jun 2009 15:52:12 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: dedekind@infradead.org
Message-id: <781B7B90EB6641B1A412BF05415E59FE@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
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

>> +#ifndef MODULE
>>  __setup("onenand.bdry=", flexonenand_setup);
>> +#endif
>
> Why you still need this? Module parameters still work if your stuff
> is compiled in - you just pass the "onenand.flex_bdry_info=" kernel
> parameter.
>
OK.
Sending across the updated patch.

Regards,
Amul Kumar Saha 
