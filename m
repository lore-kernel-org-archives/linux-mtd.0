Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77237606C22A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJyG1n+q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J6bHF/SY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fd02YMID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QJ0Jc9u09jG1UR69uRDoz2v7XH9j5qlPcYPvPj5b9B4=; b=CJyG1n+qhaNCeSeC4+8BMnlQQU
	+6qKgn5RXXqa8/LlggIy3zR1ACk2TSv2U7heevopjUHy+ZbEBjdt/fHeRDqNSIDkQA8AtOQ9fwmpD
	pdxnI5Ouat01U9ERtm+8l+bL67YgVo/S3KwN9pg3qIhrNedD59gE6VJsjRzjmkjzunXj2Hrp/vIfA
	4CpR+t+d3B/a+uTf8eZwXPxDbyq/U7knN9OW3RCFvQv3dlYIFrZJWwghBLZBXAtujofWZuX9ANk+s
	Sf0muqV4ieJpCszuL21EGcx4TJrMqirdJf7HClR7KUou61YtZ8Rg3FWeX1JpIqxrcy2i927i3btRr
	EyqnRXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEi-00000001G4L-2uFy;
	Mon, 16 Nov 2026 06:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEW-00000001Fh3-0CgX
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=; b=J6bHF/SYHDLSEBjq9fqaFwuGNQ
	Sh25tI3GYHBlkfUNMj8BsG1l0PMGUS1vmV2+ACdC01rsYMWWN5+fOJQ2i63+Oe5VOqvMdE3GUFsa9
	G2QBN59teMiJsnZhg3OzJajIG6Ge2Ywp5O99HDiCOQGHZsQEg0UZzFUh3SgHG5JqZbX9kW0Rf/2xO
	lJS83NzufQShfqPIPHuj6tcuVwUDnkPjGr/EMcHACl1ZjnqG7lmeijELsB25F7rXdClV+h9FMDjuS
	a7/eXcSuwmPDk/MbUVlCayYLcTAHB8WASgATyrRa/9QhGf5ZDxwKMUKWiVrp7KApRbDAuJEpPp27C
	Fh6oWpWA==;
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqES-0000000DPFG-2vXS
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:26 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so5292408a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810622; x=1795415422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=Fd02YMIDCQQEivDBJOa4WD84gkNztn1yfAVGu0QzsNbPmbtNim48yH+C9GU5+FjUYt
         WJg0HNYV0D1MbrKItsK93jKt5UYZFU2N9IY17kGREVGg+6DD/Ubg5Rp4b5MThhmN5Km5
         ZTJqgyKxj6udYQiCivNqWH8sMf2QVa2jghHhsaNzhtWvptouhjiuxw/mMAePGL/SRxy6
         dMAO6NiC6ConfGaOS7aCAT/PEwF0ZwhrzxWQsiPtf1er24xUTCmybXxTgtsByhq6203w
         6IoduUz4T7cIEpasB49oEKZpw4pKy+u374UdSLioKHAfHg4XTJzgQyNoIp3f4fC2Iptv
         vL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810622; x=1795415422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=1LXsNUkR3HZRVwByYwKHul8OLbN6V3C5tU/1CZvft+8jryTFJY0LBpvB5ANcCk5LpX
         Ays50gwxUUeEwVtamzdlemUZdSkSb1VjaIjTyz/ecqlLnGY3y+XdirCL0b8qU5XnIphf
         ieerzPNB+m6n1x8FmZlea5etBx1GvGSaJnlgD0La5Zo9w6dIQaST3wKOW7Xw/WaQ1M56
         GpQyJAnSQ7HvYL8vE9ZvFwGhG001vpGx7PLJPgcMoQ5jNiUI6AZ46RqCrr3ptq3Ejw1w
         9lYDCqJ3pAf+UBvlnX0MVzEFJJ4N7dhO9NCRRmBcGwE08j/kqaddDPLe9D2Fx37nEXtu
         LSYQ==
X-Gm-Message-State: APuU4Z+NEqX7pZkx1uncyEBAsaY86etw0CsELiCRKGiufNFLSCFOthc9
	qx5aZ0geenYg1YMSTJUhss5JAhuDpeXcvNWEeicnbssAgpslHQ1HVwpb
X-Gm-Gg: AYBFou0XjeJDIbTVzLqYcx9Jl9payIOUlT1kcT0AyQpY2NRLMKCP0bFLLJf4WX3yWsf
	O9bdSFbrfi8IEAdh/dlBWPDovDHcHLHx1s4g7wZbpImIlQT7ZXBH/jx7o1WatQb/5jrp65EzmLt
	Cr0L3Q4Mi+xl8FRFAq15cNwicYw+/wnh/ozJYHqkV3gncACGQqGObkmUhd/5X9KU95OBTiC+n8T
	KFt6P/Ow1ijKe7ND0MD/v5Ty6/uUr0Dstk/xC4sGA/+wIn/MQ5PHs/12zMsGPL/p1uNQzUUG5/X
	rkr3eCrXIphb4quzSoNuFCFA8GfY1A0xNrvxl3zpjksCtqqNsTJOLA5jenmmPCppQrK1BFE/+Ou
	akrZmVbHNCWtZlSU0kOQWfuOXaAiS1Fv9QPOpcuuzf0MlMBntIZPwBu4BcAiwwaeDQHhEeLuKv/
	Grfzubr8JKgO3DfVuSk9dikNkTul8xkOT1xRL7vgVA+Y9TLIBQMLf7BLzsfLCY0dLyKbISk/Zff
	2hwxHd8RnTzAfqgJdNnKWMztXQNgdjN9KhtHRnLzV9cVRhljmL7dqCIyhqQSqlTy04Ih5kj46e3
	VX6a72YaE7uHJ8oJM1MnweK7GzsYETw8ejSpRaso7lu81eFWvGAOjs34Eitcbdm1mSkB6sVc2hc
	v/SrRuE/BLs9pAlLyr0nDhM2ZaefPXRz9jie+trIsh8ieBfus/bfZ4kK1kJERVGjGU/n50HJVfM
	bro8mhvJFD1lD3/2QXOX6SJnaThO7spPlh32mjUnLDEgXFESI22XSDjKRn5vwUolDyJQ1vY62Q
X-Received: by 2002:a05:6820:1c91:b0:71a:e9eb:6ba8 with SMTP id 006d021491bc7-71ae9eb6f4fmr2091389eaf.45.1794810621709;
        Sun, 15 Nov 2026 22:30:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:44 -0700
Subject: [PATCH v5 29/58] mtd: rawnand: ma35d1: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-29-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063024_851401_137A1582 
X-CRM114-Status: GOOD (  15.55  )
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

Unlink each chip before dropping its initial lifetime reference.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 23db2f4fefbb..9d89263ac09c 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -866,8 +866,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +875,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -899,23 +900,33 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	nand_set_controller_data(chip, nand);
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, container_of(chip, struct ma35_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +939,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -953,11 +965,13 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, nand);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
