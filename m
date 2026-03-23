Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC1EC01D4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2026 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQKS7bBv6WVkQwPPQs1uz05OAvk6YYauDB3G8ts2H4s=; b=gwsWRiVuEbXmqY
	9bfNZid96TxTv+FB5MO3hxlOe5bi8KPxTOhaKlbr+yKHPkYab13G9v0usmbf3OwD3NXH4zvreOAJ7
	OYr2m8U7joS1xZCsJVdRG0Lkav+Fetbulbq9BDRphiJ0VICMF3e6q0I+QszdtD0Cbc+J3vaRzP9ma
	tp0kVkWDdHksmDFHdOMddmF5pqF7rfvlAnQuvSFfSaxi23ECmCJQAxrz2KbeRSq6b2US3/N/2EEjh
	eyY+mbQrZXPVE6wzlrfKtRwc3g/CVEO2etUaNvSEQjqvqmCdg7O39jUh4d08ufXjZ9q2quSU3RMLE
	TgKa67qQ1b0PD/ist6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dk9-0000000Gdxx-0V0v;
	Mon, 23 Mar 2026 11:46:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dk6-0000000Gdxc-1dOj
	for linux-mtd@lists.infradead.org;
	Mon, 23 Mar 2026 11:46:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82ae378fff8so2043698b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2026 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774266405; x=1774871205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6YDeWZHXRa4daiYxKEEr5jdpzKRDCkw5dQS/GFEp8F8=;
        b=mihtbLPsohm6txCRbQWslArM8WgeaYIyfCsYEnu473pmUt8FDATuDsGQ0Q5/g1wdxT
         yg3GRM9jHZtwLimzYat4SKZMPwflTZqeyDPFdz/CAeJsTBKodFIbPZ6NFkQiO0tWaa7H
         GZgvqDuRiuA6giwwa+eq8wCKiefRimduXOgNfcAwRtF9uzz+6CEq+AqhCafHG7JstoV/
         WryWynhc6WAAwrxOtBhOET75azv2Xxp5r8fba9Vgjpp/BkWQoNNR1Kgp8sctWrNYS4A0
         UEC89/jMViswgoyYQOoZEhsLRHEETncjGAINeNlPNerBuCQKXqdGokBl+L2/lIXxXYJV
         pbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774266405; x=1774871205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YDeWZHXRa4daiYxKEEr5jdpzKRDCkw5dQS/GFEp8F8=;
        b=OL3eSn8q0jfRWZAsenagGHbaP7vud7dU0zj7giGPo5hPu8XBFkRJlmyNv9vRAQ0tLJ
         XIhDqn28U0INMlWD1XLDZGqB+sPwhO9czTmTF1OUw8+XewjBA2uvF1vVaUmeKYxwJQDg
         4oT0w4IxbIDNHMWaWMLeUqOAhDX5aEo9NpK7Qt0Pe4VrLvxxSNeS5uCVZBbMfbHATKpD
         DJdkXhM1ZjmE06R+s5AkrTdT6D8sQ7NcN79mbhDQyjNoV4tB8yvVtcZQS8jm+AxWVU//
         Arlf5z0XTSBmq25URMoU7j9/R9cDrBUcADEjLfbmtj4nMQf7i8HLajULFypr31LaC6dM
         v2IA==
X-Forwarded-Encrypted: i=1; AJvYcCUIQc+lc8Idzj2+IO0W8tD5BR8PXXaMo4o/nnockathHaNvTxqhmApG6WbWS6iyOfTl6VOnxX1WQfA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFYBwFXCiGWfwVz6mtQDVKfGa1NBDCg3dkCfKmLfb40EgNooi4
	m6lq2IRZEYseqReFaG0Zmb59E5Auiv7KMa/PjiBEvgu6g/Kp1OYFyZU58GH7E26S
X-Gm-Gg: ATEYQzxbNsYthenCjp4aiuFFuHUVY24m7AAzMtyIY6vIi8hzEuilE4V7yEq8U70lb2n
	ZMvN98v/hZ6Al0MFmFcwGN2qqjzdzyIFmR+DwN+j7vIXP75NC7eco0Bpc6Uv2lNedt4HuNhUHGf
	TCUISwPduPp8gXcwbcpz8JFSxvMYwwZ8Ln4CnlR9uwFrff1mL++bxDgxbQrgZSX+SLaCCz4coDJ
	FaeoF53CHTf5vvaDvQXGaAeeE3ndUg9Ja94gSV7MN8AtU236O7SRh0ue7oYJv9mJfCj5R2eNF1Z
	ULeWU49GeT1Zx9Q0JVQwIaziH+acC0M4gbqxstElAukTp4+cN1Cdh2koJBxIEBG1r3dwhY72+gZ
	nWLdEfHDOknqT4RkngKmJEceisLTGeHzPWdDgGP4zEfofGNvh733/GWHdVRkDti4j5Z03Ho3JMB
	IrJciFqNN/d7olHoGHkoTWZI/SZwPu8/icxxOAD+ZF01TduS7hrXQw
X-Received: by 2002:a05:6a00:e0a:b0:829:a590:6d0f with SMTP id d2e1a72fcca58-82a8c3b1e1cmr10419776b3a.58.1774266405098;
        Mon, 23 Mar 2026 04:46:45 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa7d8esm9046980b3a.4.2026.03.23.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:46:44 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"haoyu.lu" <hechushiguitu666@gmail.com>
Subject: [PATCH] mtd: spi-nor: micron-st: Enable die erase support for MT35XU02GCBA
Date: Mon, 23 Mar 2026 19:46:35 +0800
Message-ID: <20260323114636.2020-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_044646_511656_20A0DAB4 
X-CRM114-Status: GOOD (  13.84  )
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

From: "haoyu.lu" <hechushiguitu666@gmail.com>

The MT35XU02GCBA flash device does not support chip erase according
to its datasheet, but supports die erase. The existing code had a TODO
comment noting that the SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
to be enabled and the driver implementation needs to be converted to
use die erase.

This patch enables the SPI_NOR_IO_MODE_EN_VOLATILE flag and adds the
mt35xu01gbba_fixups to the MT35XU02GCBA entry, which includes the
micron_st_nor_two_die_late_init() function that sets up die erase
support.

With these changes, the flash device can properly use die erase
operations instead of chip erase.

Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 drivers/mtd/spi-nor/micron-st.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 88033384a71e..4e8c6ef14697 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -220,7 +220,8 @@ static const struct flash_info micron_nor_parts[] = {
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.fixups = &mt35xu01gbba_fixups,
 	},
 };
 
-- 
2.53.0.windows.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
