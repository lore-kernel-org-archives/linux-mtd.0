Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A36BC31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FEBF206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bCxcei1c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTqWxPbQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FEBF206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yrtpFhl1XxPx4YyNIUW2OZttFB1OEXMs1jw5zy/QOjA=; b=bCxcei1csR7meMJ9T8nwNLlhYk
	D0EyXtVNpjI87LavBG3S1ygiAZJ6MENVDEDSxrHjGSuzn/1tQXIPKpqZoi0ATyKQyuUbgONAUUbMp
	8/K8M8eX+GVN7ck42h4ZuIz3jCmlkEsl5ymJT2/D72Ofxm9VwhzocZBip/8EnuA2R/YZ/uINUjdDh
	I2hUpAxKVCtxmMtpDRgkOrLo96p+dJnAv3aWKEsDtSSLKAHZ1lf6DEVf+dNe41IZ/vkFwDocM0J3z
	uMX2UQ+iH0lQzl588Oi2Bl4DNXxNNy5eLntoMpYgWtI/J4r4bpMIKE/+KMdjYBS22i9a2WdQav2Es
	SGQLDrsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddmz-0000GT-5Y; Wed, 19 Jun 2019 16:50:25 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddmu-0000Ez-EM
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:22 +0000
Received: by mail-pl1-x644.google.com with SMTP id b7so47966pls.6
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7zVrBvcdPjl0GzZ78aZFm1r+u0O6iXAiVi+Gz//erUM=;
 b=NTqWxPbQx5p7gokqJ3PfnlPBkfJl9fLcnheWQ6duIzMhkmYO/rVPcYh9J8+eVJaB1L
 M0hjmXsTVMx+9KdVybYagyXkzKF3j4UMYC8NlvoAFMFUyjKnZI1OAT2kW4PWe1NIMxD5
 uCxUWhNdxfyStVlnK7gDjs04hSkOmRJ6MaZSP82yBk/LoH5WuxVW73Hct1IYRc6j4PlA
 /Cj1UR2KO2hbYZgl+oQgfLwfID+qHQ43jyxfhGK+B9OzqWZlEUFh9iZI0cS1Tsl9A1Ia
 rfr1Zyfm6DFk+heoFbvJef/NMNc4Tg0/K7iW9PUQ2zAalagsYAQNwNnCazup+4BT6bRs
 ZRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7zVrBvcdPjl0GzZ78aZFm1r+u0O6iXAiVi+Gz//erUM=;
 b=W05sqJsJrwpkrxvOgePAd4KU66hlnAPFegWKixeIYhwzxQ/TcJPhQjLiXspHnVZokW
 vmKUurhUMrcaJA0hJ6KbaDTtZzYtDLyHxUVecm12I0n90xh8YxRxlnnSag8/wXcKHDwk
 7xFJvqS0jlidUXGR5U68SHITBiXFNyUzvTGPSFvNllBRydytKmi2jp2aQP96ETdzWEvP
 2r/YYZW/WFUHa0Uo8KzyvgvRu1sTD3V1yIeS4k2Mmi2JpvCo1HF5KpGhpt8RVsmU9Zvq
 V+RjwWm3HNavVUCHRXemQCEj5BmyTUBITPwKVV6bwKbIS+u5Hh3RAZ0tE/JveriPuhTk
 b6UA==
X-Gm-Message-State: APjAAAXmJ0p1wp3+F8p651KpP3Pd55GLPyph7bqvKRCkhy6cHh7/qjpj
 HW/jiP8ZuojkKfawcbXU4dg=
X-Google-Smtp-Source: APXvYqzTtFtSBdTaHs9jWn/R9CI9j35mgUJ5Xs3tsHfC8R2s/+Qmo5j6lwBxjOkxFf5s00ZrxECqiQ==
X-Received: by 2002:a17:902:7087:: with SMTP id
 z7mr8437698plk.184.1560963019683; 
 Wed, 19 Jun 2019 09:50:19 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:19 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 1/9] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Thu, 20 Jun 2019 01:49:53 +0900
Message-Id: <20190619165001.28410-2-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095020_484017_161AFEAA 
X-CRM114-Status: GOOD (  24.68  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
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
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Reported-by: Fabio Bettoni <fbettoni@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v6:
- Change the tag of Hauke Mehrtens to Signed-off-by as confirmed with him.
- Removed the tag of Koen Vandeputte as confirmed with him.
- Address the ./scripts/checkpatch.pl issues.
- Fix to remain the file type as 100644.

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

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index c8fa5906bdf9..ed3e640eb03a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1628,29 +1628,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		/*
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
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
