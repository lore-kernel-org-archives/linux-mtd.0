Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9eOK-0007oN-SR
	for linux-mtd@lists.infradead.org; Sat, 23 Oct 2010 13:44:13 +0000
Received: by wyf22 with SMTP id 22so1948459wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 23 Oct 2010 06:44:10 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	kyungmin.park@samsung.com, dwmw2@infradead.org, Artem.Bityutskiy@nokia.com,
	adrian.hunter@nokia.com, m.szyprowski@samsung.com
Subject: [PATCH 0/1] mtd: OneNAND: fix bufferram management. 
Date: Sat, 23 Oct 2010 15:43:53 +0200
Message-Id: <1287841434-3349-1-git-send-email-eballetbo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

Have a look at this patch, I've some problems with latest kernel from mainline
and a JFFS2 filesystem, the kernel reports various errors like

Header CRC failed on REF_PRISTINE node at 0x1e81315c: Read 0x000000e0, calculated 0x564fc9e8

Applying this patch solves the issue, but I  only have tested on IGEP v2 board with
a OneNAND from Numonyx. Please test with other OneNAND devices and point me if I'm
in the correct way to solve this issue. Thanks.

Cheers,
  Enric

$ git diff --stat origin/master
 drivers/mtd/onenand/onenand_base.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
