Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MF7Dl-0007Q0-BZ
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 13:55:12 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL400A1WPBPCM@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 22:55:02 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL400KXYPBNLX@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 22:55:01 +0900 (KST)
Date: Fri, 12 Jun 2009 19:19:33 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <6C48EFA0EB294A23A1CFBCCDA403BB7E@sisodomain.com>
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
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
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

Hi David,

>
> You can remove flexonenand_setup() and the __setup("onenand_brdy=")
> completely, and use _only_ "module_param_array()". That will work both
> for modules and for the built-in case.
>

OK , Got your point.
Working towards it, will come up with the updated patch.

Regards
Amul Kumar Saha 
