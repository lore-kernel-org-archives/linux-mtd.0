Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqwho-0007sA-Rk
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 23:27:01 +0000
Received: by qyk35 with SMTP id 35so1348337qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 16:26:59 -0700 (PDT)
Subject: Re: [PATCH] m25p80: Add support for two new Spansion SPI devices
	(S25FL-K)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gernot Hoyler <Gernot.Hoyler@spansion.com>
In-Reply-To: <4C7E3578.20608@spansion.com>
References: <4C7E3578.20608@spansion.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 02:26:57 +0300
Message-ID: <1283383617.2209.68.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 13:14 +0200, Gernot Hoyler wrote:
> This patch adds support for Spansion S25FL016K and S25FL064K SPI flash.
> It has been tested with physical devices. Note that both parts exhibit
> a Winbond manufacturer ID so they might also be added to that section.
> 
> 
> Signed-off-by: Gernot Hoyler <gernot.hoyler@spansion.com>
> ---
>   drivers/mtd/devices/m25p80.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)

Would you please, send a patch which is applicable to the current mtd
tree: http://git.infradead.org/mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
