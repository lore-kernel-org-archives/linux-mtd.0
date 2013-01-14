Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TupI7-0001M7-Vl
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2013 19:01:54 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 14 (mtd)
References: <20130114154649.cb077b499876da60463fb304@canb.auug.org.au>
 <50F43197.6010308@infradead.org>
Date: Mon, 14 Jan 2013 20:01:37 +0100
In-Reply-To: <50F43197.6010308@infradead.org> (Randy Dunlap's message of "Mon,
 14 Jan 2013 08:25:59 -0800")
Message-ID: <874nija8ry.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Randy Dunlap <rdunlap@infradead.org> writes:
> ERROR: "byte_rev_table" [drivers/mtd/devices/docg3.ko] undefined!

Thanks for the report. I have a trivial patch attached. Should it go through
Artem's tree or do you want to take it directly ?

Cheers.

--
Robert

---8>---

>From 771d13b0094421b98310171d8794f2a793ec5d4d Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 9 Apr 2012 13:19:08 +0200
Subject: [PATCH] mtd: docg3 fix missing bitreverse lib

Fix missing dependency which can cause a build error such
as: ERROR: "byte_rev_table" [drivers/mtd/devices/docg3.ko]
undefined!

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 27f80cd..46dcb54 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -272,6 +272,7 @@ config MTD_DOCG3
 	tristate "M-Systems Disk-On-Chip G3"
 	select BCH
 	select BCH_CONST_PARAMS
+	select BITREVERSE
 	---help---
 	  This provides an MTD device driver for the M-Systems DiskOnChip
 	  G3 devices.
-- 
1.7.10.4
