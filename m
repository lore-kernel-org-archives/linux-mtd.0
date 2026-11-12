Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA54606A880
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfrE8tvn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hbW4gx4x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlPpU5ZK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c1hoWXB/BNwnsvJ0GG35B0a8+AA9XWDyD6imbmjQPRk=; b=YfrE8tvnw86kUOZZMi8xcnEnfJ
	TwL25lrU21zbEiLAEzrezekOIKYvNAYCv3EIWuhqrFMTh57Y+LUwE0xB8iO2lczxoGyDn2jn6TjKe
	4Vv4vKA0o9JqQrw8PSOYnpRIEfhd02AtMQVELqr+hWoCSRhMYtGfAr6cszppDmFOp1tpoKQrbqSn+
	8uOI9CanbhAmeJwenlxwzEDbusUK+6bnSFy2y+3mX+s6khhf7FzUA5195lHsPah9UKfU2hadfH4au
	TCqkDCltn8eSNByq3OyCBGFJ6ago564ic4pT1vnMIZZCvofm1yOUmRkkx85sABYplSQOGnHFhTtWz
	ZO6LetAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdV-00000008NUd-0pyd;
	Thu, 12 Nov 2026 01:29:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcr-00000008MNm-3sGY
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=; b=hbW4gx4xIaLfoPW8178boF/ELi
	TDd6l4qEaUGw4IONp/xyZeOc5OSAFNkhSqydEZdYUdfuZUcdk+HwqQBpx6S05RMXcTwImZJTPleyX
	ZKzfFgiBZlHbX23nQA1QR49i1ajjrPyNE/r9g1ZhFDA/UU3NzMJY/jgLOYt87aK1URlLa6ZePeZrR
	zV7zf8cM84VdbOhuTBrEGS324PtzAFE6Y+Os0ydXpxWwOOHFg586H4ECNNcpGJm9OZy+9MqVCGp3t
	PwWqjmAIT9jr6EH9wDVq8ZcWq58x008vO1/7u9RahYvx3xAtzxMqE/HjmFZ3dUQ6cBmswE+DHcXyU
	QttvRFIg==;
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcn-00000009mrz-0ngm
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:16 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so1586850fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446951; x=1795051751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=BlPpU5ZKrj2VWT2S8ozUFvjrozQajVNl6cf0C1CN6/NUGBauF/IG+f+SQT2apk4CC2
         +UJzZQLTQ52ijZaCHAFZgTlcz1v6UGw3jtFS5Zb8QtYKydCGERGadM80GDB5M+DDLes8
         /3Bqa3nhd8NO2RnvJNa+ScwJaMz8mqaUEAoJFWGvtUdjBpwhCxnmpYgo+CMn5QuA8I74
         UlUODizq79KOgLNSNDO0fAafHbHwFjSxmZVSDeeaVxMO3TZZpwFwa0o7A/ecFqBDRRaW
         265AENqmBB6dLQwgG5hzUygCgRdIO1pkLRkQ8VdkjfISPFwU6jhexzyNlv00ybbhWrOE
         UgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446951; x=1795051751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=v4faB4fz0ATqFFOZgAUxP6NVD8D+Ow11B+c7dCv0kvLRV1fnDv7U+rOEVPO3CpgHw7
         t9DzpSp+4TA1tkio7fIplElS4GMefinRvSvlZrOat4XEiuCzG4VwrfPy/mNvxBxy1S7X
         8+0bG9FdKMWukvOi26j6WnhXmYuRpPArY2ZsieLCTw41AErKAL/H/9U1aCL9BiNS9TSR
         sKr8Bf6DfDZUwkN28++IYO4HkgzDbiKKwJgDvGBFHq5tOHp+M6fhZkGN/jfWKc9ONSV2
         6o81i5P2+6J9bYc3Zoz5SvDzO03odx7T8ZtoD/KOCHzsIRJGcPe9k4eVeDe4HZHqQT5L
         TWTg==
X-Gm-Message-State: APuU4Z+AfME/2OdpAwTNKA3+Quw1QNoWfqOjKWpJ4e28gNH9sKAx5vDT
	Y6FtZKiOVOBduDDOqZggMdfhw8gTshd4zEeuF6vAlgDRV3X2OtvgcwLU
X-Gm-Gg: AYBFou3bQibE2q08ENZ65sOAKGmk47JFEpYjqHtoyndk1k7RlqZS6yUODrKx+WCIiCm
	SqltT0dBZ+hPokFjE+CJZXEJ8ocgTS4C9Kf4AgK1aupb1mB/tMSJz2cXdNB63/IPutIO9iAO/zb
	veTPzG39KMpE/yp6/kqxK6uiBa9rzyrH6RGX/WBjhcHUIxr6hecU1lBUZLWWby5SVdnEraxDzqB
	u00WMrf5gtH4iiGPQfOpnHIK9NpFP5Y2AJWYkLOGw0hOWIqClb/oXWc5RCPWm4iJWYwMC1WA6FL
	KZpcLSPGN5/jd1R7NmyaH+i0sgkWeCXfR97QXij0sGg4t6DukUA+ZRHlmMR8vkv+CoBSWA3icYi
	LFK9XTdDUudxrD2qVC68RpvdHiHtLpfc7pXV2lVyX4ShSUQBXGZuwte5IXn5WDdaG6TCG5hMMMB
	7uUW4CduPjlsQBwsbLZ/jaPUkgaSWjwI7xuZWKMbODoRa3l5wC2WAV5BfdkMIlwkPd08QEWywXI
	rhCcSg+GROCq+fim29rEwXTHU7jbKzqqxecH8hsug5O6XYhAayED9OWi+NZ29Te6SF19wLiLchO
	JZeoBOygIDl/8AjWP2Fg8TKnCYCKm0nm3q6wrh7NS4RYWyHcmeC+JO4+LLb65uQFZNjADVZVNv3
	bZ4ViPMGbEWdUeQZyQrkv1zzrvsER1exA9vH2XI/n5CQX0bjwcwIDn8lQt753HKVRAw10BTWA1M
	jjm/Qgln1FHzGJ+rkm/N2+IGxui6jD+90L72l7J4lY60f1dQMuIBtV
X-Received: by 2002:a05:6808:c2b9:b0:552:9d62:f1b6 with SMTP id 5614622812f47-56b9803200emr3687194b6e.51.1794446946279;
        Wed, 11 Nov 2026 17:29:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:13 -0700
Subject: [PATCH v3 34/58] mtd: rawnand: omap2: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-34-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012913_317661_523A0CB2 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: 0.1 (/)
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep the shared GPMC lock for bound devices and separately retain each
device's allocation. Disconnected handles return before touching that
lock. Finish software BCH cleanup before releasing DMA and driver code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index aee7df4d768f..12a978f5f724 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct nand_storage		storage;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2218,10 +2219,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	err = devm_nand_storage_init(dev, &info->storage, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2285,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_shared_lifetime(nand_chip, &info->storage);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		rawnand_sw_bch_cleanup(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2304,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2318,13 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 	rawnand_sw_bch_cleanup(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
