Received: from [212.59.42.147] (helo=eurobird.dt.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AeUiI-0007ub-OQ
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 07:36:18 +0000
Message-ID: <3FFD07E1.2040305@keymile.com>
Date: Thu, 08 Jan 2004 08:33:53 +0100
From: Axel Ludszuweit <alu@keymile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: cfi_amdstd_resume vs. cfi_intelext_resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,


I have compared both function, mentioned in the subject.
I think, there is an error in
  static void cfi_intelext_resume(struct mtd_info *mtd),
which can be fixed with the following patch.


--- ./drivers/mtd/chips/cfi_cmdset_0001.c.orig  2004-01-08 08:28:23.000000000 +0100
+++ ./drivers/mtd/chips/cfi_cmdset_0001.c       2004-01-08 08:29:29.000000000 +0100
@@ -1676,7 +1676,7 @@
 
                /* Go to known state. Chip may have been power cycled */
                if (chip->state == FL_PM_SUSPENDED) {
-                       cfi_write(map, CMD(0xFF), 0);
+                       cfi_write(map, CMD(0xFF), chip->start);
                        chip->state = FL_READY;
                        wake_up(&chip->wq);
                }

Is this correct, or have I misunderstanding something?




-- 

--------------------------------------------

Axel Ludszuweit

Keymile GmbH
Wohlenbergstr. 3, D-30179 Hannover 

Tel.: +49 511 / 978197-630
Fax : +49 511 / 978197-670
http://www.keymile.com
mailto:axel.ludszuweit@keymile.com

>> Be the FIRST on the LAST MILE <<
