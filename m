Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E1606E10C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cMKPoWJ3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWtf6mKU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QCPKe7MmZLORHNbSKfjdAH50/Op1sr98XluwcV25cqE=; b=cMKPoWJ3RHMhAQoRchANerTrEl
	vNv2NH8jaWhbOLCwtr2MQc52zLkmPtsLb96YOor1jqKIz+s24PRUYnaJCdRbc/0Rj96UkR9z5DKvp
	E58RwCZ/2Oz7VMIlu7d5Pq4HeJcA4ZAvt/0qxyshhHq+CiW67n2hzlRBDVWNPi6L5iLftVCV87AHs
	VZKaMG/E0kALI6GnZrFwaklpZLm8OOXcZ5u/rrAZ/Nqftu+RHLW6SvbMlyWamkchvyMfrVG9CNdXA
	NSfxGZkgPcvDoLqyGEUozaDTfGgdgmf+Z6tldBFR/fLV2mJGi6IGyAkeDtBI4qwOa2xb1LHYnDp7y
	B0Xbz9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcS-00000008Lcn-3KX2;
	Thu, 12 Nov 2026 01:28:52 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcJ-00000008LJz-3I72
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:46 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-53dbe9b8d6eso322114b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446923; x=1795051723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=rWtf6mKUUvs7s0nKxZigwIvmfOryOWnl5a8UhONm7kCkkEc7uekQPdnQ6Cl8UOQZRK
         UCmo41gFQ9HGQc8p5ymlI3mdrIjIVbIabyhZ+AZUuNmD+7SidwE/5c6HvzezlmrJ17m8
         /Yk280mc6gmeBmA1J/I0Xtr4/9IU05PGnHPcSiK9WVXb50XhURyd0N1skeE8rQ+0k2bg
         I2g2zqUWJuHW6Nd0M+XU3jNV8LrSgB98Ul8H2BY1Cf/GcOY3M0hMvGmvD1Mo3jmp+DWY
         791WlyMdxvs+UY5yYmqtWsDbsu7pZ62jsxnn2EN03tDgOAtR7PwcjGK+jNGes7MtWOkp
         BmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446923; x=1795051723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=Vw5YSrJwxZwVBzsqA517MBbMB/sdbjspl0lCEpn+v9hTmjgHAy0xM6HOCRX662CyXd
         FlUv3fMntEDK5VTb+SVJQ3SISUK6ZIdHijoW3hEsmKR52Nw3WZhgti8Xyi8dRkuSK0BK
         o2S//Y4A47CTSneRxAq4C+6IuT2VdwuVcIjZRakAm6itMQXGDcwuaB0uoFBGo5/D0rtD
         v2tZa0EbvaTyGZ7a4blduQ0O+qEb5U+HsYfHNVbUEk2BoXeN4Bjbi79Y9W6U7/f5cIlc
         ti4+s8W0jVuFvxtx667pR/CePyV5n1Pw6/tXiVXjntHUZMXRIQcR+miIr6fd8RS9EkxS
         qyfg==
X-Gm-Message-State: APuU4Z8v9S0y/lB82vnSkPMmQD1lrzDVtce3b4z7+0tcj/ZCtTuforjl
	1tvCwdIqMh/fuTUehfT78gRb+LpWdx6XW8sCj477lfZnYpq5fsvQFtYJ
X-Gm-Gg: AYBFou3gbCEdFCVMjn2jRZD2edc6g9kat6h+Haq8ko9Co+DB1/QjWPz4uN3Kfam9Wc2
	AKILbPUlrKYaZXAecG/TPRyoF6IrBhQbknWwF/X8xAn0ApGceXDH8gqJSbk6zX3/wkVyGLNWiAn
	5xlMmKNaO1dI63taT0YDtO/nxM9pcO0TRMh2B9RTQsoBXRIRPpGZkj0Z/42/+nFZOlLqnbA2hko
	QpYT4c60agl8Hty4QOujHcY/MqZPDQkLJbGZs57Aw0JIeS6XD+Qsc9K57CkBsfUpBX7uV0we1Yi
	Re/QgcEFu/DQNmJr6itWb5qv46LJHRprZJagJxKLJUFv0UpyXc+S9maQdOLm62PBAyZwBuV0uUa
	D0HcoUSZDnDrMGpV3TPrtDoURwe1WxjxIJEkjGTW10Knopk6xgIO8a2Vjwr4iGQgw0ZWqiTXq7D
	NHFR03M9dogI1HblCha5pCR2Wv+BbrUwrXYDUG98XZ/+6dJVEarKyPNUR/A2MY9xHQycXsM0+5x
	mIe4q1lPdoe0OjAB3eCIWKBZBO8G1yxO7UkUmza7120onfFHXCxqKO5iGTu7HUiWPkPuc8U205x
	YZn59rYiF/pcrZu7tM4PAlUFVsrGIe9dmnaoYXHDCEXtlcrDgTaiMK0bxy3n89455y9hJVms/sr
	a2Z9JQEShWlgxCYqjMNBK2Qa5rSLW3BtbwbwqIUJDZcQ6eYl1izZb5ArLhjuAqJ7iaJfuDPDX6a
	2FINgWDuKCm8zjG4k9zok6Kd3DrC621WgCt7yQvPihI0p9QfN9ZtB1dw==
X-Received: by 2002:a05:6808:5142:b0:564:3e9e:b498 with SMTP id 5614622812f47-56cd673bd8bmr887601b6e.22.1794446918084;
        Wed, 11 Nov 2026 17:28:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:48 -0700
Subject: [PATCH v3 09/58] mtd: rawnand: gpio: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-9-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172843_876578_8E6EA0C6 
X-CRM114-Status: GOOD (  16.06  )
X-Spam-Score: -1.9 (-)
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index d17fb2244923..2a8c44865636 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -273,13 +273,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +295,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpiomtd);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +349,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +377,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
