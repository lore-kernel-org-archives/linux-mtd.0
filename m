Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MF5U9-0004Nl-Nk
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 12:04:05 +0000
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Amul Saha <amul.saha@samsung.com>
In-Reply-To: <3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Jun 2009 15:03:29 +0300
Message-Id: <1244808209.5847.447.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-12 at 17:27 +0530, Amul Saha wrote:
> Hi Artem,
> 
> >> +#ifdef MODULE
> >> + flexonenand_setup(flex_bdry_info);
> >> +#endif
> >
> > Why do you need this ifdef? What is the fundamental difference between
> > onenand.ko as a module and onenand compiled-in?
> >
> 
> flexonenand_setup( ) need not be called, when OneNAND is built-in.
> This function-call will cause overhead unwantedly on every boot, during OneNAND scan.
> 
> flexonenand_setup( ) call is needed only when it has been built as a module.

Why?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
