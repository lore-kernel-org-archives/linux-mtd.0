Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuiTI-0008W9-N7
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 07:26:55 +0000
Subject: Re: [PATCH]fix a warning on drivers/mtd/nand/cafe_nand.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Zhenwen Xu <helight.xu@gmail.com>
In-Reply-To: <20090410124243.GA9852@helight>
References: <20090410124243.GA9852@helight>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2009 10:26:40 +0300
Message-Id: <1239953200.3390.241.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-04-10 at 20:42 +0800, Zhenwen Xu wrote:
> fix this warning:
> 
> drivers/mtd/nand/cafe_nand.c: In function ‘cafe_nand_probe’:
> drivers/mtd/nand/cafe_nand.c:730: warning: passing argument 2 of ‘request_irq’ from incompatible pointer type
> 
> 
> From 8f877dd15fedd434e2f5d95a1bc5f4e528dc4528 Mon Sep 17 00:00:00 2001
> From: Zhenwen Xu <Helight.Xu@gmail.com>
> Date: Fri, 10 Apr 2009 20:35:30 +0800
> Subject: [PATCH] fix a warning on drivers/mtd/nand/cafe_nand.c
> 
> Signed-off-by: Zhenwen Xu <helight.xu@gmail.com>
> ---
>  drivers/mtd/nand/cafe_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Pushed, to l2-mtd-2.6.git. This does not guarantee anything,
it just mean I'll ping dwmw2 to pull from that tree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
