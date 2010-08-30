Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3qk-0004eO-Gs
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:52:34 +0000
Received: by vws11 with SMTP id 11so5528845vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:52:33 -0700 (PDT)
Subject: Re: [PATCH 0/3] MTD: OneNAND: Fix OneNAND DMA error handling and
	2KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100827025523.GA10688@july>
References: <20100827025523.GA10688@july>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:52:29 +0300
Message-ID: <1283172749.12995.70.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
> Kyungmin Park (3):
>       MTD: OneNAND: Remove unused cmd_map at s5pc110
>       MTD: OneNAND: Fix loop hang when DMA error at Samsung SoCs
>       MTD: OneNAND: Fix 2KiB pagesize handling at Samsung SoCs
> 
>  drivers/mtd/onenand/samsung.c |   17 +++++++----------
>  1 files changed, 7 insertions(+), 10 deletions(-)

Taken patches 1 and 3, requested a change for patch 2. Pushed patches 1
and 3 to l2-mtd-2.6.git / dunno, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
