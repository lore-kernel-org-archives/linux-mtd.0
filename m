Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2D3606A330
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xsS7HjM3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbWGckUa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nMB9hYTReHPIk15TD2TopB7DdmB9Xq0eYcgOyA91OHk=; b=xsS7HjM3/yra3kR1jFH9NBk1i+
	3yQdjrSjBKmclPhaULReb4Cmz9kio0gI9nMj8gfiPrqibGhljsfla/b6StmGV0smyMRVz8l/K/0ia
	7bIx80khzXKJHFYZkyj36gcrIyi2QpWjyCdLnj8ueavtgU7FWlg49EL5eihSzbVPJwIjKIvPEnHJ8
	PDybFZPJOQFN9Y8ipCQp+et65LLH1Uq7CrlkhiyyqqgA72OZltz2wvoPePpw7kn7DAE8Ld7Hmsg5Z
	Gp/SMVnDE/POBQVaoQV5+sO9gP3N8WQAtYEcERMswBEgKGEG8dEm3sru5ui+Ba32aV2e5FN17Lv3C
	sjo0YdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVK5-0000000CT9c-3SyB;
	Thu, 26 Nov 2026 08:59:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJz-0000000CT4x-1gb9
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 08:59:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so62981135e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683553; x=1796288353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=SbWGckUaZ7pdULaJ4gtKbQ2wm4a/LUFFic1YIqHacMomQiVrjkoZ0ZV5dOD4bg5S6c
         q5SE2tIzp6kHpfSYCJGW7UlN9tx3TIrwSZzUGTq2Z+ui9Fvyjw/JehXuoNmpbaoNO8Jk
         gPDtkhcEsY/EUMbqSzbVcbyRdijhN4HyKaowlGI/HZQX45GzhfEi1OJtZiLBga+2FwqU
         Lrr28j7C0IATjzdLSSWkhGs3uh0lAlWdfdmFjj7vzow5WjtDEcuXqlffHRz522tZ+1+1
         yRTaCTS5PU+s3CceScCl67AqblDNDoQtYxezc2oDpON0sNYRbhQ1mW0Qn9iV75dis0dG
         IGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683553; x=1796288353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=cLBhbRyGdD8osImQZLo7HSxiZ30lcSm7SiQyyd+/Y8MdUrgTGTVUWSnDXgIW4mPQGB
         ee6N3B22eMplPXd9+7y6Rb+NzTvkMm5EpO0d0mhdNyYBhmnajmJW1/dcdIdC5FYGBPUD
         EY1fQbVL4hrDIh/ohf587S26lodBBykmvhLjdgadj/0k9QTjfiYA4TWXsGd9V/SV72D7
         RRIMwtUPQPAz7HsJAjgvBBU+zSetC21d4bkugy8xUpm2w0mWbssh2SEGUHAgt7qU17Wx
         iKO8+0RDCofR+YPAfVDAqUL5W3HoKPSMOY+yRnYVD2GESU6ds0JGH+ZTpxi4Y+Xq0SGE
         tZHA==
X-Gm-Message-State: APuU4Z9Kp62eOgs5mr6nu1EbiH4YWbSmorge6ouF30R7n9Ol9f3gllxE
	p6bZ/AxCJ4jBNDMo55GnD1v5EA+5t637h3cpzb8Uvuot6yjf6ffhf6Lj
X-Gm-Gg: AZFdTZfRAsLHe5KxKQrYZpSh0sz/6ROgsjyPLDctDC9hqflqokKLIUN8zTFbszCUQwH
	yaivXy35gLYDrYPxlJU+hmI4Siu+yj1fx6MHQ4567y5rx371X51Bijbqn7k2EW5uINg/HvV9jZL
	honL24VOlyQiShUzCkFkF49VOMuYeOHA3qFaGkScNBX7uUGcDupuCQ6bjTUqG8ypvb7RgQATHhT
	aNIPGMc/JTEOF2PB1LtyVq5zLuqFZGeoVNIPn5hj+zKf/6zKvNxXLyMy/7XFyn6e52FbZIexj7I
	tzEdwvHQ7StUb/1osLhr3b7Mev4XVUaaaXUshhEoorlGJhVsyEmOOqaJ7xh6eJBJF2fti0pCAnH
	lxpyLhcporRAoPKCFJCfgcNLqKsnmf+lXhnlRyJjP9Zblb+o2JaYGZDomitgSPgzuk6VwrRcBxD
	E0fFEi2Sygjs6AI1P8w8XUd2Op/qk9JzkkQ6XYXVvSeg10Qw4FIIBRCGhkvOd/MaXtafqgJS++A
	QwSTaMSb0m/SEiVaTp8WCvQLr3PQ4qhQrifhifcTW8LWlghXCQ/UGvWueneOMX2BOfUmOicu9Dx
	al2+S/l5F3qgucGr7GfxeftuCK/Fhf0Yn13EMKv56b/mXUhwk5Wvg5Kd1pN9rnaVPyDTAcHa8nA
	=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr417095995e9.18.1795683553331;
        Thu, 26 Nov 2026 00:59:13 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Thu, 26 Nov 2026 08:59:06 +0000
Message-ID: <20261126085906.814373-5-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005915_493055_3D6EF90A 
X-CRM114-Status: GOOD (  20.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access; that commit gives no reason beyond "Without this,
we get bus errors." The semaphore's only other user is the eMMC host
of the older parts ("cavium,octeon-6130-mmc" in
drivers/mmc/host/cavium-octeon.c), which shares the boot bus; the CIU3
parts serialize their eMMC with a lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

A little-endian kernel keeps the semaphore accessors: the boot bus
there needs the address swizzle of the I/O accessors, and a pointed
address would be read with plain loads.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: keep the old accessors on little-endian kernels (sashiko);
    quote the reason 8c1e6b14e27d gives, and drop a duplicated
    bank width comment.
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
    On top of the new 3/4: simple_map_init() gets the per-device
    map, and the bank width check runs before the allocation.
v3: Assisted-by in the documented form.
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map was one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).


 arch/mips/cavium-octeon/flash_setup.c | 39 +++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index d69249acf..896baf52d 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -61,6 +61,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
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
@@ -85,6 +96,11 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
 		if (!map)
 			return -ENOMEM;
@@ -107,11 +123,24 @@ static int octeon_flash_probe(struct platform_device *pdev)
 			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
 			  map->size >> 20, map->phys);
-		WARN_ON(!map_bankwidth_supported(map->bankwidth));
-		map->read = octeon_flash_map_read;
-		map->write = octeon_flash_map_write;
-		map->copy_from = octeon_flash_map_copy_from;
-		map->copy_to = octeon_flash_map_copy_to;
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 * Not on little-endian: the boot bus needs the address
+		 * swizzle of the I/O accessors, which a plain load through
+		 * a pointed address does not get.
+		 */
+		if (octeon_flash_bus_shared() ||
+		    IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN)) {
+			map->read = octeon_flash_map_read;
+			map->write = octeon_flash_map_write;
+			map->copy_from = octeon_flash_map_copy_from;
+			map->copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(map);
+		}
 		mtd = do_map_probe("cfi_probe", map);
 		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
