Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEyu6-0006MB-Ix
	for linux-mtd@lists.infradead.org; Fri, 12 Jun 2009 05:02:21 +0000
Subject: Re: [PATCH] MTD: OneNAND OMAP2/3: Fix incorrect bufferram offset
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mika Korhonen <mika.j.korhonen@gmail.com>
In-Reply-To: <7948530906110415u3cc3cd62je650881b6385c8f5@mail.gmail.com>
References: <7948530906110415u3cc3cd62je650881b6385c8f5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Jun 2009 08:01:18 +0300
Message-Id: <1244782878.5847.416.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-06-11 at 14:15 +0300, Mika Korhonen wrote:
> Hi, I was testing 2-plane programming and noticed that when writing
> and doing a verify read straight after I kept getting 00 00 00 00 ...
> instead of the written data. I found out that OMAP2/3 version of
> onenand_bufferram_offset() uses the faked page size instead of the
> real one. The generic version in onenand_base.c is ok.
> 
> The patch to fix this is attached.

Looks good to me, Kyungmin?

>From 4ad479f5238560286999c07c30fec3a6a5551dd5 Mon Sep 17 00:00:00 2001
From: Mika Korhonen <mika.j.korhonen@gmail.com>
Date: Thu, 11 Jun 2009 14:05:07 +0300
Subject: [PATCH] MTD: OneNAND OMAP2/3: Fix incorrect bufferram offset

Fixes the case where CONFIG_MTD_ONENAND_2X_PROGRAM is set and
the real page size differs from mtd_info.writesize.

Signed-off-by: Mika Korhonen <mika.j.korhonen@gmail.com>
---
 drivers/mtd/onenand/omap2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index df26db8..32de634 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -267,7 +267,7 @@ static inline int omap2_onenand_bufferram_offset(struct mtd_info *mtd, int area)
 
        if (ONENAND_CURRENT_BUFFERRAM(this)) {
                if (area == ONENAND_DATARAM)
-                       return mtd->writesize;
+                       return this->writesize;
                if (area == ONENAND_SPARERAM)
                        return mtd->oobsize;
        }
-- 
1.5.6.5

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
