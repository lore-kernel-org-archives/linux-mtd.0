Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmigI-0006Tp-CB
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 06:03:28 +0000
Subject: Re: ubifs version 1 compatibility
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20090326051508.GA4760@cloud.net.au>
References: <20090326051508.GA4760@cloud.net.au>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2009 08:02:05 +0200
Message-Id: <1238047325.3321.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-26 at 16:15 +1100, Hamish Moffatt wrote:
> Hi Artem and all,
> 
> I'm upgrading my embedded system which uses UBIFS from 2.6.24 (with a
> slightly updated ubifs) to 2.6.29.
> 
> I notice that the new kernel won't read my existing file systems as it
> says they are too old - version 1. The code checks for version 3 or 4 I
> see.

Hmm, you use version 1 which has been there _before_ UBIFS went to
mainline. We really did not expect this.

> My application firmware is generated with mkfs.ubifs and programmed via
> ubiupdatevol, but the boot loader on my devices is based on the older
> kernel and won't be able to read it. And I have read-write file systems
> that will be formatted with the old version too.

I need to take a closer look and realize what were the changes between
v1 and v3 and if it is possible to make current UBIFS support it. Then
we could teach mkfs.ubifs generate version 1 FSes, and you could keep
using v1. But we need some time to investigate how feasible is this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
