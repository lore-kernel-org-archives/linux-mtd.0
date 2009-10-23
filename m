Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N1QLU-0006Mr-9w
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 20:02:49 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KRZ00APJH0IGAB0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 16:02:42 -0400 (EDT)
Date: Fri, 23 Oct 2009 16:02:42 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH] MTD: add missing put_chip() in cfi_intelext_reset()
In-reply-to: <20091023000533.57893593.ospite@studenti.unina.it>
Message-id: <alpine.LFD.2.00.0910231559320.21460@xanadu.home>
References: <20091023000533.57893593.ospite@studenti.unina.it>
Cc: openezx-devel@lists.openezx.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

---

On Fri, 23 Oct 2009, Antonio Ospite wrote:

> Hi,
> 
> I am attaching a trace of a possible recursive locking in
> cfi_cmdset_0001.c

This patch should fix it.

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e7563a9..d923a2d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2564,6 +2564,7 @@ static int cfi_intelext_reset(struct mtd_info *mtd)
 		if (!ret) {
 			map_write(map, CMD(0xff), chip->start);
 			chip->state = FL_SHUTDOWN;
+			put_chip(map, chip, chip->start);
 		}
 		spin_unlock(chip->mutex);
 	}
