Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E920DC43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 13:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACFC206E0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 13:48:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yn7DPftP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BACFC206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yB9OW9HKyfA99/h+JHFOgKpF1ZcjeHm/hExetyjYcWc=; b=Yn7
	DPftPPP4y4hAWsTb5Hsvlog5Dq3B8WqqD5c2ess17FISlAklSjeCKU/fNpahATsWv6Rb5fCXCz8MB
	juuZHLjNbD5wD8bV/TTfuzCjPYrSdlaAKC+WWJV2RgCNCl8kpso0VKqbRRNeboIAz60iYelxelqe0
	hNpwsUz9bwXHtG89/4QxyaI0D+MUWPKugQbifF8/HLzOzbfsOvK0GC0AXhUzDUIYJ1Zx1uIcozgzm
	gT94oLEviHjqo7RY+M6zXdbDCk5PxSUGPCg0vvf+wbU1j2x4WYfkmvmhA6xqaBjY1P1hfR89B9q1j
	OFSaZqvXlEHEWTW+KmUwKeVi/j0XVjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieJP2-00062C-JX; Mon, 09 Dec 2019 13:48:44 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieJOz-000613-08
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 13:48:43 +0000
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id bpoa2100U5USYZQ01poakF; Mon, 09 Dec 2019 14:48:35 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1ieJOs-0006Sj-CA; Mon, 09 Dec 2019 14:48:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1ieJOs-0003Tk-9p; Mon, 09 Dec 2019 14:48:34 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: maps: physmap: Add minimal Runtime PM support
Date: Mon,  9 Dec 2019 14:48:23 +0100
Message-Id: <20191209134823.13330-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_054841_200590_B2E32815 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add minimal runtime PM support (enable on probe, disable on remove), to
ensure proper operation with a parent device that uses runtime PM.

This is needed on systems where the FLASH is connected to a bus
controller that is contained in a PM domain and/or has a gateable
functional clock.  In such cases, before accessing any device connected
to the external bus, the PM domain must be powered up, and/or the
functional clock must be enabled, which is typically handled through
runtime PM by the bus controller driver.

An example of this is the Renesas APE6-EVM development board, which has
an Ethernet controller and a CFI FLASH connected to the Bus State
Controller (BSC) of an R-Mobile APE6 SoC.
As long as the Ethernet driver, which had Runtime PM support since
commit 3a611e26e958b037 ("net/smsc911x: Add minimal runtime PM
support"), keeps the BSC powered, accessing the FLASH works.
When the ethernet node in r8a73a4-ape6evm.dts is disabled, the BSC is
never powered up, and the kernel crashes when trying to access the
FLASH:

    Unhandled fault: imprecise external abort (0x1406) at 0x00000000
    pgd = (ptrval)
    [00000000] *pgd=7fef2835
    Internal error: : 1406 [#1] SMP ARM
    CPU: 0 PID: 122 Comm: hd Tainted: G        W         5.5.0-rc1-ape6evm-00814-g38ca966db25b9dbd-dirty #136
    Hardware name: Generic R8A73A4 (Flattened Device Tree)
    PC is at chip_ready+0x12c/0x380
    LR is at chip_ready+0x10c/0x380

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Probably the device should be powered down after probing, and powered
up/down on-demand in the various {get,put}_chip() functions.  However,
that is an optimization which touches more intimidate details of the
internal MTD API, and can be done later.
---
 drivers/mtd/maps/physmap-core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index a9f7964e2edb6668..8f7f966fa9a7ee8a 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -38,6 +38,7 @@
 #include <linux/mtd/cfi_endian.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 
 #include "physmap-gemini.h"
@@ -64,16 +65,16 @@ static int physmap_flash_remove(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
 	struct physmap_flash_data *physmap_data;
-	int i, err;
+	int i, err = 0;
 
 	info = platform_get_drvdata(dev);
 	if (!info)
-		return 0;
+		goto out;
 
 	if (info->cmtd) {
 		err = mtd_device_unregister(info->cmtd);
 		if (err)
-			return err;
+			goto out;
 
 		if (info->cmtd != info->mtds[0])
 			mtd_concat_destroy(info->cmtd);
@@ -88,7 +89,10 @@ static int physmap_flash_remove(struct platform_device *dev)
 	if (physmap_data && physmap_data->exit)
 		physmap_data->exit(dev);
 
-	return 0;
+out:
+	pm_runtime_put(&dev->dev);
+	pm_runtime_disable(&dev->dev);
+	return err;
 }
 
 static void physmap_set_vpp(struct map_info *map, int state)
@@ -484,13 +488,19 @@ static int physmap_flash_probe(struct platform_device *dev)
 		return -EINVAL;
 	}
 
+	pm_runtime_enable(&dev->dev);
+	pm_runtime_get_sync(&dev->dev);
+
 	if (dev->dev.of_node)
 		err = physmap_flash_of_init(dev);
 	else
 		err = physmap_flash_pdata_init(dev);
 
-	if (err)
+	if (err) {
+		pm_runtime_put(&dev->dev);
+		pm_runtime_disable(&dev->dev);
 		return err;
+	}
 
 	for (i = 0; i < info->nmaps; i++) {
 		struct resource *res;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
