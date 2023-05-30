Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB2FC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 20:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OApGplqb0IzyjxhTn9hmqdeRRi12v0N8+DwNFjNDbl0=; b=CdqmGtfLN8VAs7
	l/6yvl0ps58q3+cDU0pvHmjbVjcM4lU930QlYtlOJJU71IMxpcqoKVN+Of7JFgKeb82/4/G+6swzr
	o5Q0mWiKD0p40Hc393+74kE2RMBTN4uwzvwoCRHmxqkxt5ltpOFqNXxBhqJot4JAdZ+DN/8uclZB/
	9RqGcpCgHcFD8nTMSjajPmavhAO4QA2IOQRmbnxhMgh9DxRluKemIrUxDYcZar0rXL5hO4pIRwhzi
	vGgaejSD/x8WNbFfX3uiVti6fxb28vUI1NmMoxZH1hm+4JDyftfxrKR9j9Hjaz86mJUa0XdMlMq4A
	MZoApCOU05/4u4WEfj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q46Jx-00F8GG-04;
	Tue, 30 May 2023 20:51:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q46Ju-00F8FZ-0a
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 20:51:55 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso4286385e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 May 2023 13:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685479910; x=1688071910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TrgBmKJGwFG5QVEtdccA9rS9WI/vJpdncuZgfZwG7tk=;
        b=jvFT6QYLc2E1w+49YkMglp49EqKa6tOrpDpiM8QFsCmyow1H47o2rWbeFkG26Z73yZ
         jm1/i5kDB2oePMYLB9kowpaZwIrr+xiuQOzWCiqpYfXZ3604flG32ZTK3abC4YNTY/oS
         v1y8W7FHq9IO+MpwQDCQixnuNL9RP+qQ+C1+lw88Cbjm5iSFQhzbgYwQ63B3qfkInfHV
         E0T2mOQyuSSac8665v85OlTyDkNfKQgzbcINmJsDWunsaPsn24tDgxdn91pKC9spx94/
         ugF93sYOomD0QG4JLa4/nsbOzIz+KwqAQ8UkBhKXD/JfYaZumgQUizpJIdFfbzm8UlKE
         s/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685479910; x=1688071910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrgBmKJGwFG5QVEtdccA9rS9WI/vJpdncuZgfZwG7tk=;
        b=FXJACFBgv6074Ep9400zKwa1tK1iTyGWx0fDbJdj7636s0vL5G24k+uqrhryXVS22L
         1eoX4g+4gMpigLMvMBZb1GlWn+kAUhyHDXGM09lqBghI4SHpXkQxV2T666yGssy/wCr9
         pyCh5FaMsO57G7DzRJ1h3Dziotf/X+qOG0zRLeEYA2zDRYb0jsz9StAGqhSnVrzMfzLD
         TqSKHQlUleFEP4N09lgSgXiT8i3dhaOlc3iYHYDwBtM9kYUegLDJW++ZMxvz7i7Gh+bY
         Twz/VaICTbInp4SfYszmabQCpuqIgvsSvpu0z/ALhFwLDgHUVqG7qTtBs0mF7HAsPg9t
         HeGw==
X-Gm-Message-State: AC+VfDy5/crZnxhNg3CRks71Wes5phGITtUI1B8K/hbER3iIExurD8G8
	u0ozF9Lmeaqel8mG/G1x/5CJBg==
X-Google-Smtp-Source: ACHHUZ5f8EMwKultV2yESWu210IpLgEvIt4UxPAI+PWDu29gEQHzM5uQxJkn5tHzBaHDKIeHzk+7TQ==
X-Received: by 2002:a2e:9955:0:b0:2af:228a:a277 with SMTP id r21-20020a2e9955000000b002af228aa277mr1390005ljj.21.1685479910242;
        Tue, 30 May 2023 13:51:50 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm3004012ljg.126.2023.05.30.13.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 13:51:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH] mtd: cfi_cmdset_0001: Do not check for OTP outside device
Date: Tue, 30 May 2023 22:51:46 +0200
Message-Id: <20230530205146.3200321-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_135154_290423_E1E8F66D 
X-CRM114-Status: GOOD (  15.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Currently the offset into the device when looking for OTP
bits can go outside of the address of the MTD NOR devices,
and if that memory isn't readable, bad things happen
on the IXP4xx (added prints that illustrate the problem before
the crash):

cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x00000100
ixp4xx_copy_from copy from 0x00000100 to 0xc880dd78
cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x12000000
ixp4xx_copy_from copy from 0x12000000 to 0xc880dd78
8<--- cut here ---
Unable to handle kernel paging request at virtual address db000000
[db000000] *pgd=00000000
(...)

This happens in this case because the flash memory ends at
0x11ffffff, so 0x12000000 is outside the range of the MTD
device.

Breaking the while loop of we offset outside the size of the
MTD device fixes the issue.

Cc: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9cf..a979e0316b31 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2352,6 +2352,9 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 			reg_fact_size *= cfi->interleave;
 			reg_user_size *= cfi->interleave;
 
+			if (reg_prot_offset >= mtd->size)
+				break;
+
 			if (user_regs) {
 				groups = reg_user_groups;
 				groupsize = reg_user_size;
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
