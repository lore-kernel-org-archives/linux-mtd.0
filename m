Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrE3k-0005L5-7C
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 17:58:52 +0000
Received: by wwb24 with SMTP id 24so954116wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 10:58:46 -0700 (PDT)
Subject: Re: Re: [PATCH] m25p80: Add support for two new Spansion SPI
	devices 	(S25FL-K)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gernot Hoyler <Gernot.Hoyler@spansion.com>
In-Reply-To: <201009021727.20453.Gernot.Hoyler@spansion.com>
References: <201009021727.20453.Gernot.Hoyler@spansion.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 20:58:41 +0300
Message-ID: <1283450321.1694.11.camel@brekeke>
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

On Thu, 2010-09-02 at 17:27 +0200, Gernot Hoyler wrote:
> This patch adds support for Spansion S25FL016K and S25FL064K SPI flash.
> It has been tested with physical devices. Note that both parts exhibit
> a Winbond manufacturer ID so they might also be added to that section.
> 
> Signed-off-by: Gernot Hoyler <Gernot.Hoyler@spansion.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
