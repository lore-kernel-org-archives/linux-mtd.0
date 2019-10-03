Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB52CC32792
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 18:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1192086A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 18:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DmbC+AfS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="FRMts674"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D1192086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=upJIV64qEYXThDI1eYP4zQdy5fvDm7K6x1QIqlcwLak=; b=DmbC+AfS0hatwQNnpRrchXY5X4
	kbvtDNY3aay8qsqdoLSGftKx99XvfGrQlFkGliDWe87JLfJI/usCKg54E5Vn3EPZr4BLJQxddD1lj
	tAvxgtEBzCqulgdIhB+egfHMZuFrvLdEZDlh2M1cutHPWaWvGfmDkx3nCORLillRPKbNDniyMhSBf
	Fv+V+rIdgYMzSM6yXV5j0nR7CdL/zQ5kPc6wdYLxvGAave5DyimGyFKceltqLcceqonrXN8h4ES9Q
	dtVnsJWXLXjaugm9WwHdqZjVaEK5Gvast0mH/s+o35mOp7WZPTwlaKku/ji97OzD0E9WvtnLGLMY2
	cU+QO26A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG5vh-0003Ug-IM; Thu, 03 Oct 2019 18:34:21 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG5ve-0003Te-79
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 18:34:19 +0000
Received: by mail-lj1-x242.google.com with SMTP id d1so3847417ljl.13
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2019 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yVd3PyboFSjsqGh3Ars2txvkocusu0l7iXj1NgKTvDU=;
 b=FRMts674l4uD/SD+W949nvsQzq2f2X13MtZ2+4NW6ygxKYX21Q4ZoXynJ+psV00WD4
 3MLCVD+3ksiBfVehqPPFgFLc4biq7xpZ8Kuh18Ua86Nn+OW9QM0wv6pkImUQs2hJ6F1N
 sU8thl/lRLdTud2lJsUF0ZMMYq628BnZwMGPBq9M2kT/Ue0BVX19KC0amGyTDKPHo80H
 xqx+hf21gaOLzqz2RFMJwXEZCz3n5l6Cq82ui3VPRjymw+ZK2Lk8cuEzisHGE55NvTwi
 bvqPZuQ+nUT+KuIsgP+HU+fGcR0uaJOG8MO1d3v2ZlKo5SXzS2Ce+F3ZRBZryBpI84hg
 inJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yVd3PyboFSjsqGh3Ars2txvkocusu0l7iXj1NgKTvDU=;
 b=o6Bw+lQ+VEQowXUKXVPWHBi+RdTmHnsG2X8/tDapIWrP9xhEypP4SSv8hs6H0J0ABU
 RAtOKgOXqFR70Digi44/zC4PJSPD8cvuij98oJcoFUj6YGdusu/WMKFrUNcmAoj+O3DM
 9dUXTjJCrwmNyyx9SYgEKjRyErb2L8Hwqp3/pV9BNpSYff087zcPa17vC2HjUiXA8v7o
 Q1t8S2ywdUsZPUroEutv3Al3u5epVjGYpu441RPlt4Lyg8gOBTWWnvDee6JCSGw56fpt
 qZy1aS6Sqh1JKMmk+goycs99XEATBXhMAjLAmfUoW5gEgt3HgzF77oLUQn2+hK5aBlI3
 vSyQ==
X-Gm-Message-State: APjAAAWcrM1nq3ML2FMO1ojyrlEPHBZ8Wj7iLWK/S9UsLH9bfRJvBEkV
 tZpMZjZiH4Gkxzz5chFaXJBYwkI0Yso=
X-Google-Smtp-Source: APXvYqwIoUq5vUCM/xnBPsRrtYeEAE8/8+pUCx2TjWSvChs7RWptcSB6c0fbdkR2GgGAWKGJzmetpw==
X-Received: by 2002:a2e:9e90:: with SMTP id f16mr6966383ljk.155.1570127656101; 
 Thu, 03 Oct 2019 11:34:16 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4289:fe73:b1e7:ad72:df1a:c82e])
 by smtp.gmail.com with ESMTPSA id o13sm682378ljh.35.2019.10.03.11.34.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 11:34:15 -0700 (PDT)
Subject: [PATCH 2/2] mtd: cfi_cmdset_0002: fix delayed error detection on
 HyperFlash
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
Date: Thu, 3 Oct 2019 21:34:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_113418_264299_004051BD 
X-CRM114-Status: GOOD (  22.09  )
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
chip_good() to only return 1 if these bits are zero. Unfortunately, this
means that polling using chip_good() always reaches a time-out condition
when erase or program failure bits are set. I think the status register
error checking should be fully delegated to cfi_check_err_status() that
should return whether any error bits were set or not...

Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |   55 +++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 25 deletions(-)

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
@@ -155,7 +155,9 @@ static void cfi_check_err_status(struct
 		if (chipstatus & CFI_SR_SLSB)
 			pr_err("%s sector write protected, status %lx\n",
 			       map->name, chipstatus);
+		return 1;
 	}
+	return 0;
 }
 
 /* #define DEBUG_CFI_FEATURES */
@@ -852,20 +854,16 @@ static int __xipram chip_good(struct map
 
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
@@ -1703,8 +1701,11 @@ static int __xipram do_write_oneword_onc
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
@@ -1777,7 +1778,6 @@ static int __xipram do_write_oneword_ret
 	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
 	if (ret) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
@@ -1974,12 +1974,17 @@ static int __xipram do_write_buffer_wait
 		 */
 		if (time_after(jiffies, timeo) &&
 		    !chip_good(map, chip, adr, datum)) {
+			pr_warn("MTD %s(): software timeout, address:0x%.8lx.\n",
+				__func__, adr);
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
@@ -2075,12 +2080,8 @@ static int __xipram do_write_buffer(stru
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
 
@@ -2275,9 +2276,9 @@ retry:
 		udelay(1);
 	}
 
-	if (!chip_good(map, chip, adr, datum)) {
+	if (!chip_good(map, chip, adr, datum) ||
+	    cfi_check_err_status(map, chip, adr)) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
@@ -2471,8 +2472,11 @@ static int __xipram do_erase_chip(struct
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
@@ -2487,7 +2491,6 @@ static int __xipram do_erase_chip(struct
 	/* Did we succeed? */
 	if (ret) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
@@ -2568,8 +2571,11 @@ static int __xipram do_erase_oneblock(st
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
@@ -2584,7 +2590,6 @@ static int __xipram do_erase_oneblock(st
 	/* Did we succeed? */
 	if (ret) {
 		/* reset on all failures. */
-		cfi_check_err_status(map, chip, adr);
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
