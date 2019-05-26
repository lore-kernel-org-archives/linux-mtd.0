Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E0C282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6F820815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g9EXfH4o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTuRXYpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6F820815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dX/nM5Tsg5icXXbgJsyV2pmtERslfxJryfaHL0aPjfg=; b=g9EXfH4oz+YWlDoj1PlT+pu6qD
	QRk+gDCnBsp3pb18Nb9Smo/WaaJPbLVdHeVR/fc01/32rdm/vXUft391U8mEosTfcqDA01S98a0PX
	70hYWn/thBYWx+FERS+dMpNXaU7xwgmH6fljU/xBjB0ywTzrRSZIsxVQ2DjN90yiYSd4NOKqHqWtB
	0/UH7yZbUD3bS34wLJjjsOxXd/9jM+ncRLeMU0xS0RUv8CgYEc2t5MjtkDBQ5Lff24ybMcMPZ+98t
	auc6ihARFdTp8xUSRtpF3sALK5jCKoIYDHY5/t1uzB9Umw36jSfFvPKKlYy5yWbYb+BAkIh0f5Y4x
	e7PA13wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvFE-0007jx-3b; Sun, 26 May 2019 15:39:32 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvF5-0007cA-9K
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:25 +0000
Received: by mail-pl1-x643.google.com with SMTP id a5so6035349pls.12
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uLQ3Werazxybbz57JZRnXyeiPAj1arCFDNXT9NkV8Cc=;
 b=sTuRXYpwE2LQ6HQG2nGZmYog7lvNBrU7zTrzxPUzOdMKHE+M0HQGTYwsZhSaciheSN
 Fv8cM6FjhnuT+QAabdFJ92COpX/96Ahn1ucea1ZoYPP46n5HB3mQFTczVaUmsH6o1tfc
 UHWg5XaUV6WWv3V/QqZ4s1xeJdmMZ+mNkFLFN5CZOu0+rU+wZPjlYVKk4Zbts3gvffJp
 Ctcl+zW5EFWPKYjehKtCSn/MWRw4KHoS4Lbp4RJJUbVhiDwSOBORvsY1r2BanpsdQ3hm
 U1sKfUAUwm3QYoV0/c51dw9AQnSwtRQVX1QCCkt/AwKsdZIvS5uGjqaKss9Z2jltm8hU
 oSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uLQ3Werazxybbz57JZRnXyeiPAj1arCFDNXT9NkV8Cc=;
 b=s/cL7ELJS3I4Fbd6VvqxviKBXFoWgBL3PwRdLEdn8EDWcvdRNva0Y0r4zmL3SDLkCL
 EEDQ1eWgggu3rt/8xVLj3qo281qrAnGxEbxh0OGy0Ypk2wsBAqIqaIonC075hSg+OBna
 Ecl2e7MyxgveG+09ghHPhzC6E7okb7aEkDmG2MromSrVKTRxtqb3xU78rmKCR3YbUhPp
 2LQVzOFJ+DPe2Vo4KNfbpGQnPwLnU5DxBzorGcVw6W9yF9qfAtk7CETB+ZldOm8+nBbn
 DARPBSZRT3WxfERKjcCoRe0F2sxl+TX+w5J3EQzK4iGTfL/ctFPaDVSggafglg+9QKt3
 mIyA==
X-Gm-Message-State: APjAAAW7QoBIKJZUlIkaGnc94Um3f2L65MmQFA5YmjFrraPbkHG6X99c
 Id1FPy7q8x4tg0eq+4+9a3Y=
X-Google-Smtp-Source: APXvYqx4Pk4R53PvmzEUZtUMfn88IMbs+vEOVjLSu5V8TeA2M9z0usEYAgGkELnXUka+jMMXNJ08lQ==
X-Received: by 2002:a17:902:728a:: with SMTP id
 d10mr19605179pll.90.1558885162442; 
 Sun, 26 May 2019 08:39:22 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:21 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Mon, 27 May 2019 00:38:54 +0900
Message-Id: <20190526153904.28871-2-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083923_325629_B3D61BBB 
X-CRM114-Status: GOOD (  23.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, stable@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As reported by the OpenWRT team, write requests sometimes fail on some
platforms.
Currently to check the state chip_ready() is used correctly as described by
the flash memory S29GL256P11TFI01 datasheet.
Also chip_good() is used to check if the write is succeeded and it was
implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
checking").
But actually the write failure is caused on some platforms and also it can
be fixed by using chip_good() to check the state and retry instead.
Also it seems that it is caused after repeated about 1,000 times to retry
the write one word with the reset command.
By using chip_good() to check the state to be done it can be reduced the
retry with reset.
It is depended on the actual flash chip behavior so the root cause is
unknown.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
Reported-by: Fabio Bettoni <fbettoni@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change to follow Liu Jian's fixes in master for the write buffer.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Update the commit message for the comments.
- Drop the addition of blanks lines around xip_enable().
- Delete unnecessary setting the ret variable to -EIO.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just update the commit message for the comment.

Changes since v1:
- Just update the commit message.

Background:
This is required for OpenWrt Project to result the flash write issue as
below patche.
<https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>

Also the original patch in OpenWRT is below.
<https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>

The reason to use chip_good() is that just actually fix the issue.
And also in the past I had fixed the erase function also as same way by the
patch below.
  <https://patchwork.ozlabs.org/patch/922656/>
    Note: The reason for the patch for erase is same.

In my understanding the chip_ready() is just checked the value twice from
flash.
So I think that sometimes incorrect value is read twice and it is depended
on the flash device behavior but not sure..

So change to use chip_good() instead of chip_ready().

 drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)
 mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
old mode 100644
new mode 100755
index c8fa5906bdf9..348b54820e4c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1628,29 +1628,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		/*
+		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
+		 * the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)){
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
+			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_good(map, adr, datum))
 			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
+
 	/* Did we succeed? */
-	if (!chip_good(map, adr, datum)) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 	xip_enable(map, chip, adr);
  op_done:
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
