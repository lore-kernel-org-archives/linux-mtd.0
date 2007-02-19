Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJH5F-00006c-RO
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 17:34:12 -0500
Date: Mon, 19 Feb 2007 22:30:24 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Felix Fietkau <nbd@openwrt.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070219223023.GF7813@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070219222041.GE7813@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 February 2007 22:20:41 +0000, Jörn Engel wrote:
> 
> The proper fix would be to remove the cast instead of adding yet
> another.  I wonder when those got added.

On December 21st 2004 by none other than me.  How embarrassing!
http://lists.infradead.org/pipermail/linux-mtd/2004-December/011236.html

Can you test this patch?

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index f9f2ce7..6a9fb80 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -111,8 +111,8 @@ static int _block2mtd_erase(struct block
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		max = (u_long*)page_address(page) + PAGE_SIZE;
-		for (p=(u_long*)page_address(page); p<max; p++)
+		max = page_address(page) + PAGE_SIZE;
+		for (p=page_address(page); p<max; p++)
 			if (*p != -1UL) {
 				lock_page(page);
 				memset(page_address(page), 0xff, PAGE_SIZE);

Jörn

-- 
"[One] doesn't need to know [...] how to cause a headache in order
to take an aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
