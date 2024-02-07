Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1D3C4828F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3d8/pzRaGDZpP22TCffvO2M/yjqxwqWg3woYc9vmfY=; b=aGLw4+e9jVToa2
	2aPzxdhlw5skI+GjDP7SLO+hZFv99JYeOJ2NaGE7iH/03h7hhaWBJP4CrhCU5NOkC1qvSDu3Kzdix
	Yb/nFs0p2/srtrL1jftvlmgRWmTJmw/0YKCuRkq9ko4BGXQECXFaXgGeb2yWCQ6bSLURsm4Hdtm1O
	r43AiWWKq3co3kEXhz2e0oVR5S1Zkyamue1SSVFzc6owQOqLtuxPQFvz9WSPqRubT9cUuAnWCKRON
	/v+eZNoYUjAfsdzbIrjKPZQEpVp5IDXEnVP+O/VuyJVJbWkYzVK8eA2gC15i6LY2VfDMn7PhmtqFL
	7iLDMEwmjAMRzSBx3xPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXm3o-0000000BMJh-3XYf;
	Wed, 07 Feb 2024 17:50:12 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXm3m-0000000BMIi-0QMQ
	for linux-mtd@lists.infradead.org;
	Wed, 07 Feb 2024 17:50:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-55790581457so1201929a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 07 Feb 2024 09:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707328207; x=1707933007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGDFZCXJsgP/e+y8DEUUTJO395BJkBwgpdtBp6SsTfM=;
        b=igG0Lm1gRqxzgxSaSBM14gv6nYYbujtE429EhTAMZhp/9zOlUL7D3eyebq7J5JSrTx
         doRLWA4+i40B1oEuEqRq2hPiWaeJSV5MluniqtQYOPqnJ7gwUn7+7qwZG9K+TJxKdL05
         GnIp2qlUylSbqYnsxPRS8uKOgIeW2Ef06CEx722+YuSfR3MMKgM9yGQuQA4ZJPOwYbnT
         dbU+RUWzQ3wYDtoaZkePJw7Oe95sE9bj3mG8KXBnuzdCZN46lBjhGfyh5yAL+FCgjR4S
         CdJyoih14r5JnC1HTxHc1mrw4Nhgc3BTJBWqEn1g8Q/4u2Og7fy+Po1jzibJmhZlVstc
         jbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707328207; x=1707933007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGDFZCXJsgP/e+y8DEUUTJO395BJkBwgpdtBp6SsTfM=;
        b=rkqWtUi0O4bcurVp62gyoH+qTg+2XjQnkFQPnW5w9lOqvbEyXv/0qMiGeM7svmeXtO
         thYHAlksKWFlchTFQN+Aior/Y4TS/v5hwD6eVrAuL5IrsN0Wh58ofNkvXpwpcYFO7i0l
         jr5CD5n1NRUdAztcvs00tJPpZkEjcavcdVCg6JvJa94WJUmG/h0jmWgWP588dPWCVsnu
         e5uEB8Mk5LL2DQiOg/ZBtnzGD+6T2b1fT0mDRLXSxM5bueVSeGwudPPcmdv8/2SrS2HW
         IvST+XwCT5W8rSbbHbJewbU9VX77i6zWdJNxjyWnkZlZu+H4vgF7yNUsTdbpbyKXchaf
         Kk5g==
X-Gm-Message-State: AOJu0YwPN7tEaPxMgkSEgXdmU2bRgOKb2jEfO0iarMTjM80TFJtTb2Iv
	rMaTm7Bm3AzEs+uSaIvldmZWOEhFwx/8CeKGM8brSWeKLT6q4SE4
X-Google-Smtp-Source: AGHT+IH9xD0ZoHBG4Q6eKYQphgfJ1ej5/WN2oX5gK7W7O7t8ZQSiENBsrXlUdeTnPhAhjCDUydEiig==
X-Received: by 2002:aa7:cf99:0:b0:55f:fd10:5e73 with SMTP id z25-20020aa7cf99000000b0055ffd105e73mr4160390edx.20.1707328207371;
        Wed, 07 Feb 2024 09:50:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGu6sWkBlNncMKRcXdn/T/yb4cLtusRzgoQNkriY5/pMQCTIw63d/+IgLuLYBPVkXJw2fTL444mEkyKSiKtS/98MgjhgrRzF0xsp6Xyv7V+nWt/qz6Kx9G0WtAmr3OtwoAlGHLVwBpnkGK/P+fxqKjTWWjifA2ooXe9k673XQksK5b0MDWHDkj92uUQJ8+MUp2OLJe/kVzO0XIHH6qhDMF5Y1WMwX02A3kIJUHXMCGIeqydSRMBKyylP6WgW8oRHcC4L4ChpdVistbJ1Z5BSsjS2dayDpMvM8X7DxB+6JozeOXVVk5pp9GAsGxqGHPeQ==
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id c18-20020aa7df12000000b00560f3954ffdsm180992edy.24.2024.02.07.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:50:07 -0800 (PST)
From: max.oss.09@gmail.com
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	patches@lists.linux.dev,
	s.hauer@pengutronix.de,
	han.xu@nxp.com,
	tomasz.mon@camlingroup.com,
	richard@nod.at,
	tharvey@gateworks.com,
	linux-mtd@lists.infradead.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [regression 5.4.y][RFC][PATCH mtd: rawnand: gpmi: busy_timeout_cycles 1/1]  Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""
Date: Wed,  7 Feb 2024 18:49:11 +0100
Message-ID: <20240207174911.870822-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240207174911.870822-1-max.oss.09@gmail.com>
References: <20240207174911.870822-1-max.oss.09@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_095010_168249_09040BA4 
X-CRM114-Status: GOOD (  12.18  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit 15a3adfe75937c9e4e0e48f0ed40dd39a0e526e2.

The backport of [1] relies on having [2] also backported. Having only
one of the two results in a bogus hw->timing1 setting.

If only [2] is backportet the 16 bit register value likely underflows
resulting in a busy_wait_timeout of 0.
Or if only [1] is applied the value likely overflows with chances of
having last 16 LSBs all 0 which would then result in a
busy_wait_timeout of 0 too.

Both cases may lead to NAND data corruption, e.g. on a Colibri iMX7
setup this has been seen.

[1] commit 0fddf9ad06fd ("mtd: rawnand: gpmi: Set WAIT_FOR_READY
timeout based on program/erase times")
[2] commit 06781a5026350 ("mtd: rawnand: gpmi: Fix setting busy
timeout setting")

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index b806a762d079f..fdf5cf5565f99 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -684,7 +684,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
 		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
 		      BF_GPMI_TIMING0_DATA_SETUP(data_setup_cycles);
-	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(busy_timeout_cycles * 4096);
+	hw->timing1 = BF_GPMI_TIMING1_BUSY_TIMEOUT(DIV_ROUND_UP(busy_timeout_cycles, 4096));
 
 	/*
 	 * Derive NFC ideal delay from {3}:
-- 
2.42.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
