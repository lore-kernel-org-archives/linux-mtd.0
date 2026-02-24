Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85994F4BB73
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Feb 2026 18:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws7wWPuxktmiNRAoPoRcYGDHmipaNzBsD/RKNZt8Ei8=; b=A/wB31GYJ6Lzcq
	5s7I33ptoXO2C06IQKvB1eAU/pn1UFG7bmTi/JkWevRP8XoHcMreu9bPbaZG+6zQa2XDHfJTHxtnx
	1JuppsTN4Tv9sJDF+g6rsdK+2PqOZtq1g8irWPZHDf0yJKQ4bpBuoHNJ/gaevbEWtXgF+3FczxoGe
	vv560qfhA6+MTnVCqvve8d9h/XbibBfYm4Kea8MwVJg3eNdQHB8zxuBDTHgkvjXYdMTuEMR9vDV4H
	C6knsZJ6ervbKiG0s/D89nQJAdY/n/XCTIxpsjbg5nZeAsPMeOaB6x6JOwFGDx+6ioUC13U7fBDmZ
	An17xPyOYSqcPQRAqqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuxR7-00000002ekW-0Yyp;
	Tue, 24 Feb 2026 18:47:09 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuxR5-00000002ekK-0GHY;
	Tue, 24 Feb 2026 18:47:07 +0000
Message-ID: <710526b9-8a5e-4c6d-8f5b-1ed51f015f5f@infradead.org>
Date: Tue, 24 Feb 2026 10:47:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mtd: physmap: physmap-bt1-rom: Remove
 not-going-to-be-supported code for Baikal SoC
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20260224153927.3627867-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260224153927.3627867-1-andriy.shevchenko@linux.intel.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Andy,

On 2/24/26 7:39 AM, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.
> 
> Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mtd/maps/Kconfig           |  11 ---
>  drivers/mtd/maps/Makefile          |   1 -
>  drivers/mtd/maps/physmap-bt1-rom.c | 125 -----------------------------
>  drivers/mtd/maps/physmap-bt1-rom.h |  17 ----
>  4 files changed, 154 deletions(-)
>  delete mode 100644 drivers/mtd/maps/physmap-bt1-rom.c
>  delete mode 100644 drivers/mtd/maps/physmap-bt1-rom.h

There is also a small change in drivers/mtd/maps/physmap-core.c
that is needed:

-#include "physmap-bt1-rom.h"

and then
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
