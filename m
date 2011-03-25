Received: from smtprelay01.ispgateway.de ([80.67.31.28])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q31p6-0006vj-CD
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 07:52:45 +0000
Received: from [89.246.71.91] (helo=mail6.tqsc.de)
	by smtprelay01.ispgateway.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1Q31p3-0007gH-IS
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 08:52:41 +0100
Received: from sc0810201.tqsc.de ([192.168.80.70] helo=[127.0.0.1])
	by mail6.tqsc.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1Q31p4-0008JA-1z
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 08:52:42 +0100
Message-ID: <4D8C49C7.5090700@tqsc.de>
Date: Fri, 25 Mar 2011 08:52:39 +0100
From: Markus Niebel <list-09_linux_mtd@tqsc.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2.6.34 1/2] cfi_cmdset_0002.c: Read max timeouts from cfi
	query data
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: list-09_linux_mtd@tqsc.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The max timeouts are coded in the electronic flash data sheet (CFI query
data). Read the timeouts and store them in the chips structure table.

Signed-off-by: Markus Niebel <markus.niebel@tqs.de>
---

  drivers/mtd/chips/cfi_cmdset_0002.c |   21 +++++++++++++++++++++
  1 files changed, 21 insertions(+), 0 deletions(-)


diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 38c47b0..1eb8bfa 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -429,6 +429,27 @@ struct mtd_info *cfi_cmdset_0002(struct map_info 
*map, int primary)
  		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
  		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
  		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+
+		/* FIXME: use also max times, verify if valid */
+		cfi->chips[i].word_write_time_max =
+				(1<<(cfi->cfiq->WordWriteTimeoutTyp)) *
+				(1<<(cfi->cfiq->WordWriteTimeoutMax));
+		cfi->chips[i].buffer_write_time_max =
+				(1<<(cfi->cfiq->BufWriteTimeoutTyp)) *
+				(1<<(cfi->cfiq->BufWriteTimeoutMax));
+		cfi->chips[i].erase_time_max =
+				(1<<(cfi->cfiq->BlockEraseTimeoutTyp)) *
+				(1<<(cfi->cfiq->BlockEraseTimeoutMax));
+
+		printk(KERN_INFO "MTD: %s erase time %u / %u ms\n", __func__,
+			cfi->chips[i].erase_time, cfi->chips[i].erase_time_max);
+		printk(KERN_INFO "MTD: %s word time %u / %u us\n", __func__,
+			cfi->chips[i].word_write_time,
+			cfi->chips[i].word_write_time_max);
+		printk(KERN_INFO "MTD: %s buffer time %u / %u us\n", __func__,
+			cfi->chips[i].buffer_write_time,
+			cfi->chips[i].buffer_write_time_max);
+
  		cfi->chips[i].ref_point_counter = 0;
  		init_waitqueue_head(&(cfi->chips[i].wq));
  	}
