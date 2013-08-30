Received: from if03-mail-sr07-mia.mta.terra.com ([208.84.243.44])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFNt8-0005GV-5f
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 12:33:20 +0000
Received: from 1bq.tpn.terra.com (unknown [10.235.200.59])
 by mail-sr07-mia.tpn.terra.com (Postfix) with ESMTP id DA85E40101EF
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 12:32:53 +0000 (UTC)
Received: from THOR (unknown [186.214.15.246]) (authenticated user fggs)
 by 1bq.tpn.terra.com (Postfix) with ESMTPA id 3EB4C80172564
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 12:32:52 +0000 (UTC)
Message-ID: <43F2ECB6644A4F64904E563CC1F0EF3B@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC][PATCH] Add ESMT F25L32PA Flashchip Support
Date: Fri, 30 Aug 2013 09:32:36 -0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
 reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add ESMT F25L32PA support.

Datasheet: http://www.esmt.com.tw/DB/manager/upload/F25L32PA.pdf

I hope this patch is in proper format and my mail client didn't mess it.

Signed-off-by: Flavio Silveira <fggs@terra.com.br>
---
 drivers/mtd/devices/m25p80.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..3a3cf2d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -731,6 +731,9 @@ static const struct spi_device_id m25p_ids[] = {
  { "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
  { "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
 
+ /* ESMT */
+ { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
+
  /* Everspin */
  { "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
 
-- 
1.7.10.4
