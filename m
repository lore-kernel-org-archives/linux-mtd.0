Return-Path: <SRS0=gIgt=YY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FC0CA9ECB
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 20:39:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1331520656
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2019 20:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KwUpWw6G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="MIMI/SN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1331520656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8agy2ERIsOHx6qKJuU9HvwiLj0Bg0ppGuLwyMYBqhpk=; b=KwUpWw6GSaqVrlSuyF2oDq0G0D
	iAIguQ2RaRrqtsKk/ELU9giGBDEngXlUkJIeJAdOP6zp1Yw3x43eA6nTFh4xVuqTMVK438GDhGRs3
	hpzjMu+JsCV5MvtzavwIMHVAj2QEl05sdGYUFFSIwLo3MI36HSakoJtaTTFI4Kaak5y8kvdxM2qd2
	c6+EYr5qPAZw/551Sv8ks7oqt8mRBFu+kxmvOyQ8R2Miy4j02YoARroy2B6LOTktF8PJHaqyu9wRa
	OlU9EOT8b6VMmZlZjCjfAv3cXE7BxRD/ue6s0pvm2tsDJgCY5ZeG8nbwDtBRysAqxZjYFcF9THM1B
	WPgdOccw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQHEX-0001bh-7R; Thu, 31 Oct 2019 20:39:53 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQHEQ-0001av-19
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2019 20:39:52 +0000
Received: by mail-lj1-x242.google.com with SMTP id m7so8093298lji.2
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2019 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Z0jDmBW3R1NBtBiH0WYuGYmDmUlaN1ckbjcYWKP3Dc=;
 b=MIMI/SN3srVSbaKSOh1RXYoqBeUer4mjVi5qG4pgfR9jqI09wmuj8Vbbf3mninU7pY
 pSmR6yfOsdk0bjBOJLOY40SIYh5jGcn8HJdD1GJTsWo0tOJx3b70zQVq+WyCasGLjFQv
 3opSuyqB6VL4D0/drLIEPMZerylioItt3C0byt2UdIy5+WBLjGGg1aisCGkUqtyc8tZ1
 MC0Xxp4kopyJOH87oNIV/J3fT3QJM0pTdHWmRQbDRvye+IJOdufSqtaXIOtTXo0F6Xwm
 +hFqdD3XHfGh2ChK436sAuHFHKONuKCSCLl61dN2AH3Pb8r3SBSUrZN0DSMArELm4q1Y
 TCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0Z0jDmBW3R1NBtBiH0WYuGYmDmUlaN1ckbjcYWKP3Dc=;
 b=RQulgLLmG9gzsMPy3fYZA85KOUKHATTB4WxWmPgUGrpoYx4a0JIGfkofVQbKlSRoMR
 xpomJpG/XKKlKKChE5yn6hvDAek2b3KqivFbpo8QBc4q2eNe2brWj55nLnwiV9e5BXp4
 hopVfst5M7K+tfEqLiWysuAo+jub7IM4qbgq4EL78i9+GzqFJ4o7Lfh26J1aPy1e7KU6
 EP9roZF01P4ON0mu4j62RQjmpS2mwqWU3P92L2+xFqWpsxZ9w0xyMqdi+T/XwD4pOna8
 Qh41HV/qgoDmF7uHLPXS3benAcD4cy9ixRQQET2LonfQ2gVNt0r1xqPK6QGzSfUskpIu
 xV/A==
X-Gm-Message-State: APjAAAVueaUHBuQ43A9jqgZq3SNOU66l0NYUSHKpOHW22lQhRtnqkCmi
 OqAQzi7Ba2oBR0JmQzITr8jnrscVtl0=
X-Google-Smtp-Source: APXvYqxnPOcitq6YGNehINJMRRHSOq4Nx/RyyiDC9KTWuTxGV8Z9CS6Zjb1juxs9n74rM7G1VIUkzA==
X-Received: by 2002:a2e:868d:: with SMTP id l13mr5516434lji.136.1572554382125; 
 Thu, 31 Oct 2019 13:39:42 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4822:288d:75c2:539e:7f95:d420])
 by smtp.gmail.com with ESMTPSA id g23sm2204996ljn.63.2019.10.31.13.39.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 13:39:40 -0700 (PDT)
Subject: [PATCH v2 2/2] mtd: cfi_cmdset_0002: fix delayed error detection on
 HyperFlash
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <6e2348cc-7035-29b9-5172-ada329bea397@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0f13549b-91f2-79da-55b9-a52f1f7c8f2c@cogentembedded.com>
Date: Thu, 31 Oct 2019 23:39:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <6e2348cc-7035-29b9-5172-ada329bea397@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_133949_842092_B500B609 
X-CRM114-Status: GOOD (  22.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
status register") added checking for the status register error bits into
chip_good() to only return 1 if these bits are 0s.  Unfortunately, this
means that polling using chip_good() always reaches a timeout condition
when erase or program failure bits are set. Let's fully delegate the task
of determining the error conditions to cfi_check_err_status() and make
chip_good() only look for the Device Ready/Busy condition.

Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- added extra check for error bits in cfi_check_err_status();
- reverted from pr_warn() to pr_err() call in do_write_buffer();
- reworded the patch description.

 drivers/mtd/chips/cfi_cmdset_0002.c |   58 ++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -123,14 +123,14 @@ static int cfi_use_status_reg(struct cfi
 		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
 }
 
-static void cfi_check_err_status(struct map_info *map, struct flchip *chip,
-				 unsigned long adr)
+static int cfi_check_err_status(struct map_info *map, struct flchip *chip,
+				unsigned long adr)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status;
 
 	if (!cfi_use_status_reg(cfi))
-		return;
+		return 0;
 
 	cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 			 cfi->device_type, NULL);
@@ -138,7 +138,7 @@ static void cfi_check_err_status(struct
 
 	/* The error bits are invalid while the chip's busy */
 	if (!map_word_bitsset(map, status, CMD(CFI_SR_DRB)))
-		return;
+		return 0;
 
 	if (map_word_bitsset(map, status, CMD(0x3a))) {
 		unsigned long chipstatus = MERGESTATUS(status);
@@ -155,7 +155,12 @@ static void cfi_check_err_status(struct
 		if (chipstatus & CFI_SR_SLSB)
 			pr_err("%s sector write protected, status %lx\n",
 			       map->name, chipstatus);
+
+		/* Erase/Program status bits are set on the operation failure */
+		if (chipstatus & (CFI_SR_ESB | CFI_SR_PSB))
+			return 1;
 	}
+	return 0;
 }
 
 /* #define DEBUG_CFI_FEATURES */
@@ -852,20 +857,16 @@ static int __xipram chip_good(struct map
 
 	if (cfi_use_status_reg(cfi)) {
 		map_word ready = CMD(CFI_SR_DRB);
-		map_word err = CMD(CFI_SR_PSB | CFI_SR_ESB);
+
 		/*
 		 * For chips that support status register, check device
-		 * ready bit and Erase/Program status bit to know if
-		 * operation succeeded.
+		 * ready bit
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
 		curd = map_read(map, addr);
 
-		if (map_word_andequal(map, curd, ready, ready))
-			return !map_word_bitsset(map, curd, err);
-
-		return 0;
+		return map_word_andequal(map, curd, ready, ready);
 	}
 
 	oldd = map_read(map, addr);
@@ -1703,8 +1704,11 @@ static int __xipram do_write_oneword_onc
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum))
+		if (chip_good(map, chip, adr, datum)) {
+			if (cfi_check_err_status(map, chip, adr))
+				ret = -EIO;
 			break;
+		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
@@ -1777,7 +1781,6 @@ static int __xipram do_write_oneword_ret
 	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
 	if (ret) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
@@ -1974,12 +1977,17 @@ static int __xipram do_write_buffer_wait
 		 */
 		if (time_after(jiffies, timeo) &&
 		    !chip_good(map, chip, adr, datum)) {
+			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
+			       __func__, adr);
 			ret = -EIO;
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum))
+		if (chip_good(map, chip, adr, datum)) {
+			if (cfi_check_err_status(map, chip, adr))
+				ret = -EIO;
 			break;
+		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
@@ -2075,12 +2083,8 @@ static int __xipram do_write_buffer(stru
 				chip->word_write_time);
 
 	ret = do_write_buffer_wait(map, chip, adr, datum);
-	if (ret) {
-		cfi_check_err_status(map, chip, adr);
+	if (ret)
 		do_write_buffer_reset(map, chip, cfi);
-		pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
-		       __func__, adr);
-	}
 
 	xip_enable(map, chip, adr);
 
@@ -2275,9 +2279,9 @@ retry:
 		udelay(1);
 	}
 
-	if (!chip_good(map, chip, adr, datum)) {
+	if (!chip_good(map, chip, adr, datum) ||
+	    cfi_check_err_status(map, chip, adr)) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
@@ -2471,8 +2475,11 @@ static int __xipram do_erase_chip(struct
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_good(map, chip, adr, map_word_ff(map)))
+		if (chip_good(map, chip, adr, map_word_ff(map))) {
+			if (cfi_check_err_status(map, chip, adr))
+				ret = -EIO;
 			break;
+		}
 
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
@@ -2487,7 +2494,6 @@ static int __xipram do_erase_chip(struct
 	/* Did we succeed? */
 	if (ret) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
@@ -2568,8 +2574,11 @@ static int __xipram do_erase_oneblock(st
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_good(map, chip, adr, map_word_ff(map)))
+		if (chip_good(map, chip, adr, map_word_ff(map))) {
+			if (cfi_check_err_status(map, chip, adr))
+				ret = -EIO;
 			break;
+		}
 
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
@@ -2584,7 +2593,6 @@ static int __xipram do_erase_oneblock(st
 	/* Did we succeed? */
 	if (ret) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
