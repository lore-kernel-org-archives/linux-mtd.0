Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FA606A32F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFqnWJTH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apQVm4N8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wRryVKFoaJOy73L9XyUv11MgiQuDzoFl9tgNRotUpPs=; b=FFqnWJTHlckAG4JBFEg61/5GJR
	qQ1JM4RtXmFYxRcWcVejmfLR3WwQShUXS68coFWGbHVY9Qjq+YY4J49uonL4OPWVkUPf5v8YlVwfa
	uylg3wPv98n+kAMdcTBErYk5zQCYzmWCbeKsAubMTlRDQKUf9yYblUPlHXvNFEFeEBcLmYGM9sIJS
	biUlnNsH0xd2+s215pzlIQAGodBw8f7K0ESGMFXujgD84Q/Mn3aM1nrHFV2NuoFuYUsCw71XYkQ3K
	ZgCyvayzXZHI917p9i0/NKPkEYeZ1rcMmm0M/CoyGi0dr3eZxmVQKgqDx7wkFD7q1bZ4tRePRpDKX
	Zus9wShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw7-000000079IZ-0Kg5;
	Tue, 17 Nov 2026 21:41:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw4-000000079G9-0Kc9
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 21:41:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4187295e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951710; x=1795556510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MggYMX94BkHu56OsrtWdSBo0pOhg3kRRf9jDuhg7bx8=;
        b=apQVm4N8oj0icHRkREvhPVkQNF3MSTgFOmwSFJbeOqS+nrQN1kXkmJbYly9bpYSIPy
         2VDIxKGjEJdbpb2CU9MrmCdkwXXfGazSsg4q97EV4N0leYlsiXxcygOPZCGibe7LSLGt
         X4djSoMpkj/OpW7ES1MfBxs6qj/yL+C+A6aa42q5fkRfD5IpkSPBBKhFKJ/BK2n0Sp1w
         Xqm6zaPEZOZbziNYh88E00yiIPm7xk7WZVWx3Yl1NsEVx91P8pM9UqDqe8mRgPooqljp
         1yaS5S8S7YpTmoLtTbRJ2ZvZoQhIkfEy6w6SfVaR9sWkwPh8Ebwb0Dn+5Au3jpeGDVVX
         VBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951710; x=1795556510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MggYMX94BkHu56OsrtWdSBo0pOhg3kRRf9jDuhg7bx8=;
        b=tiqolKzX88QJLh+tCkzm/178TcdGM4unXmTYpuzvDtw/x5TiD3okUpd5gsMXngcR7k
         n+u+YgJEV+gcjnSQN1DbpzCiZHX5kaFEl6ilf352HmNaclossb2RWdkk0Th221p27UCx
         7hVASlL4B8qEUOaxyeowkg9TxBSlNr5DzkpHueQv7htPzRRHEv64lF5T5KKf6sTTU6tM
         7r+LwBJPNlpNwLG63S8IXDDJNAaKJfpVURv1rmMNNUssLHSpsSqqBp6uyfdRuOW5TM5y
         NJmDzqEwRWxP47I8ronjuHopPMMe3Pvx08W6yQtXCBJ3fi/GqAt8rU4ek7YKuafFn2pg
         i1dA==
X-Gm-Message-State: APuU4Z9LxIILGq0RoeaozkOP+GA7Nl/VJN31ruGTEiOQYNWdsUQpVFhR
	CP6n5X/zgM+WSyjW4jNu0jyux1MOSNnTQm5xAK1ctXran39lW6mX0P7V
X-Gm-Gg: AYBFou1S9JdQ/QBIDo2V2bX2oBuND1ExPtV4hzkwOJ6lcQrSoHjosGq9TiZfEAIh8ls
	IzVgvLDENzDR5Pjr9lRqR1jRrGlCPE72JEfwr8Wld3Fk1MxwsuTtwIRuWtMSglRuMb/+l6blco9
	5L8Gi1Kvon227+cjiyo8KCccldd4eY9bExmF2RCZKcIDyKhCTX1lT+KB+vWQCL8aKvYL/58tFNe
	6lpJVyovi3TGFXGX/ygGpr3/jjApSHG1H8SH9JmKcEUqgxE1ZUORvQOSew+KHrgfUTEcPZhkkRv
	vyEJynxlg+2+K70VnsDShpZojUyrRSO1RIUc3cvDV3FdM7CwVOwCgXwfT0FCFJ2HuTUEJliLSQC
	PXvEGPM2egIVbWjaS4K8yNZYS5m1UfoT+eCY1fXTE0q1FcwcL1rFed2uEfe1nbsjrxc0rth+9aQ
	XBEKZ5zms8y62Kkvmi+0cvFGv3WXR7Jv85A11jvjoQA2ail8UXs7vJBGpJbERhpaRIch5xnTSMK
	2XWxqZwZpPnhld460TZn+YQsd1e5qcceKpMjxlZOmXAyvlZr5UVkm3iJKecDL7meCothuCT0D4C
	g4TZR3ZqcvUpS7WGgjROiLmmMbXkGEmi2j7jDMJWZwa5CbjRKx1fLCeeiUCpE81B0BKAcp4p0q3
	LzjprvrE9gtXdzz2VGT0V9QxCrhFNsovXMKYkPjH2fEhpaCVsE+WtnkgY7io338X+Tuef
X-Received: by 2002:a05:600c:4e04:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb7da0f929mr7988855e9.10.1794951710179;
        Tue, 17 Nov 2026 13:41:50 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:49 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v4 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Tue, 17 Nov 2026 21:41:41 +0000
Message-ID: <20261117214141.3826637-5-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134152_329053_F3D9EB53 
X-CRM114-Status: GOOD (  20.32  )
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
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
    On top of the new 3/4: simple_map_init() gets the per-device
    map, and the bank width check runs before the allocation.
v3: Assisted-by in the documented form.
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map was one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).

 arch/mips/cavium-octeon/flash_setup.c | 36 +++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 0e5652f..62612cd 100644
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
@@ -85,6 +96,12 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
 		if (!map)
 			return -ENOMEM;
@@ -107,11 +124,20 @@ static int octeon_flash_probe(struct platform_device *pdev)
 			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", map->size >> 20, map->phys);
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
+		 */
+		if (octeon_flash_bus_shared()) {
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
