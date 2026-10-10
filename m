Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B99CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xZyvXauw1TBuyDpLRf3PX3rADf9Gp0JGKGrijOjIJY=; b=itvT1mTi4eIAdX
	KY+Bk6rlw1JW3t2BFjlY09nKcixKKebuSQi4VuWVKjBTzgjK0hIbTpBnFCky0UXUaxq8Rz2Zk0vV2
	jYC9PMo+ErKtNal7/EyL/K2o0/GT2byFfbu4enRmVrFUrlLH2qUPwr9LCAP8wWA68gGVRduKapZRQ
	pUuhAISyC18t/R31BbyApOFHiQ30NWZvTUzK+ySlD+dO9f+0rDLjJwcyOIJ6DKCNuDVm1rlEb3Gdf
	rbIqONhVSj+HEzy0M44TynYCFtwM3Ui0GEfy5O7pVSrRCO/W5waNJqPhYd1EVBP0pQzGV9lWA9Y1V
	t3GCbNSxE1XtsjrxoJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFalf-00000008K8S-1M3I;
	Sat, 10 Oct 2026 17:21:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFala-00000008K6Z-1RK1
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 17:21:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so5959855e9.0
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652908; x=1792257708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFjLqjpz1OV1iGjbq0FG1a5x3VLRDXIY9kkC816eew=;
        b=gFFOYRfsct96J/bs/gG1huHXPXj2rn+w7hkl+yq1jGOhgQXPABNKIQrRTJ0Ty5Bdqm
         G7xh8kI9W6/ChO+OQKMO7PNTLvqT1nOJPm7mAUmnFHLvqSCcuTkxPO7QfjILCT8OZqsD
         Nu1dg0zS9JUH4gwGcxTRM6JCmXyW2V7dQEt+eD3wGAUHAQF1W1GPMjY7uSHBz8KL1STW
         v/t8e5uk9GzMcqQt81uyj+lJRrPTczd/KqCdvLilLT/m4iBOM5eJEyJnYK2y1/95Fhdw
         +zi/BmtmaYA6ZUSMGyzFT5mVKtb6KNQC/ZNKHOIJWxykOjxxQ3l0G7dHmAeuzOMI8HoP
         akFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652908; x=1792257708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TFjLqjpz1OV1iGjbq0FG1a5x3VLRDXIY9kkC816eew=;
        b=XB2ayPsvu+wFilXBNKQcF0gfakMZqxalQc9AaT0jUEvWLmzxFQCQ8tTrlUthikWDOm
         V+G52QkdFS69Wx7+6NFB3qwyJWNxHPNmn27bN1y1tgYx1OW3lz0vtyt2S9AVqozsvpMW
         uPOfPHZnapmS4t2//gBQ9c+hvHcCj/EM95EwwMN9DoaJTt4w1i4UezkFYWu0sECHqPFw
         P5MNcM2ML/0V4cdVtoS+7xBbSMx6EPL9G+uUSdBjGI0Xtsd+8KEsSO4LgbossWkUaPOa
         LbIp8C9gh8ffzbMAciAypVVHWkNYXdH5xuAnXxZ0skRBxInI9yw3+kJliMgTpQ3eAT5Z
         cQfA==
X-Gm-Message-State: AFq9FYKhrDzz8jFLKPaeEUa/WNIRlMYRZakgDTI4kn9K47FwOyhfM5bH
	Q7c9UgoxwRWhW04z8uWrH744nMPFIAquLWNSvhrWRwJMfpjwAIearmOx
X-Gm-Gg: AYBFou3UZ7snpPNWCDie5JRWl46woS6xiNw4SJZ/cdL0Mmr3QYbeMdXxrZpezTYP9d9
	Olnx8VRTBED8uA7XbDvNhnrZSa2yichWq5dbC3UVZWcI+ywAMgLMDNJL14gfFe/RYbNoP7Y+DCl
	I5g6Vnt94v99peuXlFd9cbtg3yp/QsoHdGwNc5RjH1993VzR4fhg8czMJgqrs5tan1wuQo8KqzJ
	ds5phiMwGmzgrJ+QRPjzsn/sXNrvKkak2TRhbtlqIw2zLuhVsr/rOvQOf9v/QOnjEAdX/VWpWyc
	4QgbRnUJGtyeEF1NEcXSbelRKEfX3YJ0hOmE0stf+4XoG8fskt0oXecfHorMLK2vNsBtjuFI3UK
	kgzSXh+3zPLibSVeLXJ8NIuChlVsiwC8e+2bIuUv5hnZUBtZS86RSJuDm/i+unEOzh3+L5oWHOx
	x82okLV4rxoOp3o03SUGZvzLjy4fdW0OoKlBTgP1oI+JO9sFNqkYqAsKq82csrxfy4O7U/nQMnP
	EHAGW77j+0SnBddMEblFfDIO23d1guAeqfPARJCDek4wGDF6kHi31qXK9HMRO1z/CWruLFs/jTH
	pXr9ntQNaT2BtbDl
X-Received: by 2002:a05:600c:6207:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a18e4aff66mr96959555e9.18.1791652908208;
        Sat, 10 Oct 2026 10:21:48 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:47 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sat, 10 Oct 2026 17:21:42 +0000
Message-ID: <20261010172142.2138956-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_102152_761852_8A4145B0 
X-CRM114-Status: GOOD (  17.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access. Its only other user is the eMMC host of the older
parts ("cavium,octeon-6130-mmc" in drivers/mmc/host/cavium-octeon.c),
which shares the boot bus; the CIU3 parts serialize their eMMC with a
lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width first and fail the probe instead, and
unmap the window when the probe fails.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 arch/mips/cavium-octeon/flash_setup.c | 37 +++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 9242521..a616e7a 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -63,6 +63,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 	up(&octeon_bootbus_sem);
 }
 
+static bool octeon_flash_bus_shared(void)
+{
+	struct device_node *np;
+	bool shared;
+
+	np = of_find_compatible_node(NULL, NULL, "cavium,octeon-6130-mmc");
+	shared = !!np;
+	of_node_put(np);
+	return shared;
+}
+
 /*
  * Module/ driver initialization.
  *
@@ -102,11 +113,26 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
+		if (!map_bankwidth_supported(flash_map.bankwidth)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       flash_map.bankwidth);
+			iounmap(flash_map.virt);
+			return -EINVAL;
+		}
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 */
+		if (octeon_flash_bus_shared()) {
+			flash_map.read = octeon_flash_map_read;
+			flash_map.write = octeon_flash_map_write;
+			flash_map.copy_from = octeon_flash_map_copy_from;
+			flash_map.copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(&flash_map);
+		}
 		mymtd = do_map_probe("cfi_probe", &flash_map);
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
@@ -114,6 +140,7 @@ static int octeon_flash_probe(struct platform_device *pdev)
 						  NULL, NULL, 0);
 		} else {
 			pr_err("Failed to register MTD device for flash\n");
+			iounmap(flash_map.virt);
 		}
 	}
 	return 0;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
