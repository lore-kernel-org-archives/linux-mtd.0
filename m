Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347BBC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:41:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34582206D4
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JNCmjWYV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJW30ndV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34582206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3B7m4NJNbRKnLTKL2bBWyG0pIubeldGVkoj/R2Dl0BM=; b=JNCmjWYVlFT11fdDntGTBuxD7
	UFc22b+vfJ7YKxIhqY3ckCPweqq0YRRpjasU4EHc+HoK6abJAjGrGkZxOxjX9wGaWqz7DMkZs0zHP
	pOf29QUPgqyBiBUFpMpFkxiN5s85sDznOujPCqdnAEJhBIxEG+k1TlBgB/1ZMBc+JNnIK+pvNfzgY
	+E0moNYQrbu5eCSW3yXk++R54DnHHcU4bUiyt0XSPfz8XCX5sjpjKpBi3O5DW8tbfdHLvchL7XGmq
	OVW0x9+sDM2QTHRE+lMmLoCUhNkm8vZ4PhuO2VCbvNFZVFFpck2I9l4M++vXU406gDdPcQYmrlFXt
	ZXANTpinA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9TJ-0004Qp-VG; Fri, 06 Nov 2020 21:40:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9QI-0002ik-Ir
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id h2so2825286wmm.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=sJW30ndVh1qGXkUaw3pZaZEjF2ef9gfmBHcrLUN8CKyAoBZToeJQQGOgveJ9pOnH9G
 iLnj25fAUb5CHE4pzNXFTP4bhMNeVU9zyQDF1cWEHGd11k8kQJFQMEHxT3Dl1zjar9i1
 fLeGKBfoVm5SSIuvPhaI1FnA013nnfZJ8yjEL9YynAZGNTKmaaPzx1Z8entolXVdwDXF
 CpfAG963D1ALbbrNpXiYanN/0p8rW8kbDmkOIfYRs2zp7QT0lXC2BhMYgEqAXpdrHyfE
 U/pK0fH1kVdmS6ynQhtxJ6E8bO3EBpBdOD+PU9rYMIdej1Dw7doRpC+V18xrgEa4Q7rq
 2Adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=ZBkUKhLeNywQO2PJmQidBV7942ZdHRu44BCjEbuGUOJpQs5PsuBECDdaDN+lyNkVqI
 JltbYrKDOWchXS5YCJqBnFSZ0Us+Hk1M2da62sWRRgg6LzNeF+GHLuYhYsZcc8QDAm0t
 FGhx+p4W9H/UH/2sPl85Fk2lvyFIvdZK5HcOzZgwGiE4xqeevwx2OCvtgN4ldx2ioLV3
 blqeVsbgVGSlBIT2ShnHUp6k39qybvd/qLY8781M7kEcB8seJQ9PYDLFp+GrOfAyAaf/
 1b5otE2Xz2Bftl52WskwvZCJJ1xjmvcoAwiNL98C/xisD2UYt/eYu3tt7mBOsvXkNBUR
 /bTg==
X-Gm-Message-State: AOAM531qzwPWGgRyQJZFUIlkuXjfmzhfqZn1w1nKOQVL3ocUkWYW7UV5
 tJ8Fr/bJhpY+/mbiEqGvN5NqWQ==
X-Google-Smtp-Source: ABdhPJxG+LiIYfVShEQWJVAJMZtLl+cVPcfShbpulxjLFaLqCc0rq0BMZWwZRXF2wVzCbzIu7Bfcjg==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr1574214wma.14.1604698649574;
 Fri, 06 Nov 2020 13:37:29 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 23/23] mtd: devices: powernv_flash: Add function names to
 headers and fix 'dev'
Date: Fri,  6 Nov 2020 21:36:55 +0000
Message-Id: <20201106213655.1838861-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163730_730873_835C6947 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/powernv_flash.c:129: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:145: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:161: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:184: warning: Function parameter or member 'dev' not described in 'powernv_flash_set_driver_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/powernv_flash.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 0b757d9ba2f6b..6950a87648151 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -126,6 +126,7 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 }
 
 /**
+ * powernv_flash_read
  * @mtd: the device
  * @from: the offset to read from
  * @len: the number of bytes to read
@@ -142,6 +143,7 @@ static int powernv_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
+ * powernv_flash_write
  * @mtd: the device
  * @to: the offset to write to
  * @len: the number of bytes to write
@@ -158,6 +160,7 @@ static int powernv_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
+ * powernv_flash_erase
  * @mtd: the device
  * @erase: the erase info
  * Returns 0 if erase successful or -ERRNO if an error occurred
@@ -176,7 +179,7 @@ static int powernv_flash_erase(struct mtd_info *mtd, struct erase_info *erase)
 
 /**
  * powernv_flash_set_driver_info - Fill the mtd_info structure and docg3
- * structure @pdev: The platform device
+ * @dev: The device structure
  * @mtd: The structure to fill
  */
 static int powernv_flash_set_driver_info(struct device *dev,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
