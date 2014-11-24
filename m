Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsw8T-0006s0-Qn
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 16:05:10 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: UBI: Add support for scatter gather and blk-mq
Date: Mon, 24 Nov 2014 17:04:38 +0100
Message-Id: <1416845080-16663-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This two patches implement blk-mq support for the UBI block driver.
As the scatter gather part is rather generic I've moved it directl
into UBI such that it can be reused later.
So far only reading data into a scatter gather list is possible.
After implementing  ubi_eba_read_leb_sg() we could slowly start
removing a bunch of vmalloc() from the UBI core code and use scatter gather.
This should lower the memory footprint of UBI.

[PATCH 1/2] UBI: Add initial support for scatter gather
[PATCH 2/2] UBI: Block: Add blk-mq support

Thanks,
//richard
