Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCWuO-0001md-K9
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 03:03:07 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l1180nlx019748
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 10:00:52 +0200
Message-ID: <45C19E7B.9060006@nokia.com>
Date: Thu, 01 Feb 2007 10:02:03 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] OneNAND: Add
	support	for	auto-placementofout-of-banddata
References: <45BA1A9D.60301@nokia.com>
	<45BA21E6.60301@nokia.com>	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>	<45BDACBA.2080503@nokia.com>
	<45BE1480.1060506@nokia.com>	<003701c74435$0b1f61f0$c7a3580a@swcenter.sec.samsung.co.kr>	<45C0B8D4.2000807@nokia.com>	<005601c745a8$55787b50$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C19A1F.4020201@nokia.com>
In-Reply-To: <45C19A1F.4020201@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Adrian Hunter wrote:
> ext Kyungmin Park wrote:
>>> +	writeend = mtd->oobsize;
>> We don't re-assign the 'writeend'. It cause the block is not clean. Since
>> JFFS2 send only 12 bytes but onenand writes until oobsize, actually 20
>> bytes with zero.
>> So this statement will be removed.
> 
> Yes, that was a typo.  The line should have been deleted when the previous
> line was deleted.

The statement still seems to be in the onenand tree.  Here is a patch to remove it.


>From 397419987d744ed971c74cfabae2eeac705f2fe0 Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Thu, 1 Feb 2007 09:59:41 +0200
Subject: [MTD] OneNAND: Remove line of code that was meant to be deleted

Iterations of the patch to add oob auto-placement support to
OneNAND left a line of code that was meant to have been deleted.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 67efbc7..9ec28bb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1143,7 +1143,6 @@ static int onenand_fill_auto_oob(struct 
 			writeend += free->offset - lastgap;
 		lastgap = free->offset + free->length;
 	}
-	writeend = mtd->oobsize;
 	for (free = this->ecclayout->oobfree; free->length; ++free) {
 		int free_end = free->offset + free->length;
 		if (free->offset < writeend && free_end > writecol) {
-- 
1.4.3
