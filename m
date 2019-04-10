Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BCDC282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 19:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E752075B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 19:59:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwkumuFx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNNRePeJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E752075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jjUgE/5Qf6E8lnKR3SRHmfoWVbFv761ButXeT4ii1Ao=; b=IwkumuFxrWt7dA
	/0p6F5PJaqWT5cxWtalvN01rDoejY2RkCOY3ipRfmfwPZbMZLufUyv+mGUBANyYm0mq/AFZWcuRbC
	NzVbkioWvboCkOzN2NsGd9J5K12RAQRyjFPi1aTChSGDySPKX3QImpKFIlipHlGYitNDAAbdhzcEJ
	1q2LQaQLLcdbYl8dnON4qsMXLgqxKtwalVSYT95qZmrZBJrfA67gIBic+uG5KH6hRw42kiV1t77YS
	7lnI07wfot1AO4sUfgak8eDwTzjpkwIw2WwRv9eCLMWvx4eKjQmgalyTR1wWk+D5jA7HSMECIFm1q
	LNJt7y/cbSHzo0PZKMwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEJNC-0007c3-OY; Wed, 10 Apr 2019 19:59:06 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEJNA-0007be-Om
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 19:59:06 +0000
Received: by mail-lj1-x244.google.com with SMTP id j89so3300817ljb.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wcVt5VTKGlyZxp0vS8+Fu1r59HHgCfHanefStNqWyW4=;
 b=qNNRePeJKdY7jFnfDSk9PmpyTxY6zSzPSAtVRIWK+uHxJMacppvEn/3kXlOkTwFnk1
 uz5S+S6k/szSe3cRBRXt7t8V+Jl9+asGbYFbEE2UxvSsy2DAtX8ivFvuT+BfK7OydkmQ
 BprZTTXTXlQLr3aIH9y11wPdFzohP2cKdOqdWWNLaYOOj/Voob1MY0TFa9bX3nPi8WPm
 5ZfZGAMDo0rVka+2OC4SmA6bIzpRpR4LL9WKgiGhfxWkkrtRhMq2lg7DzmbvV73VK0is
 usC5IT+TGuKBi+D1/bvXF/whPmT2wDCf9DUMxxjSwXnrqVV7oEtpHwvtlKbH8HhvXgW9
 3paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wcVt5VTKGlyZxp0vS8+Fu1r59HHgCfHanefStNqWyW4=;
 b=beHaZwIykWq88+N+4wuXj3ROEg+e+7Xp4CaCAvTYJOFZ/cgdaDNTXn8I1MrJNopLX7
 kxicNCuyavmIPKb/5LOQLsjr0dyoyg0tVLgRLYuoF6LD5hCKknDnP0Y8ZsrWB97Px9KX
 vKTgdNB2W3siT1bubOkGq2xtHFJsVJirtbwzWbJsM6VhSsJiFRLOgxiqNmrnB+5E5rMq
 +8ub6VB7IXbknbHSn9+ZYME5xSMZxeQ+F8C4ciGkci4+yZHJ7+RFQAf3UFzV2xUx8at6
 A7f3tt2XYUS2ttonqkARAlIw5bBErzaXRBU/K+KMcZuC9kG2fqqHvjABIxt54CWR0Fx6
 qIgA==
X-Gm-Message-State: APjAAAUWLOc/cG3RVSccohLix/tLmzstiVxuEGPx57COFHzvyIwmUPux
 ZAe+C1PQJFlVRskub6c9J2qkNA==
X-Google-Smtp-Source: APXvYqzEU+l46yVUS0tw1cyCFtByDwJvoWU6r0hypUQaIJ8ibKACU2J4bsFIzFVDIBR8LGvfED1Lcg==
X-Received: by 2002:a2e:6c0f:: with SMTP id h15mr23337379ljc.155.1554926342648; 
 Wed, 10 Apr 2019 12:59:02 -0700 (PDT)
Received: from localhost (c-573670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.87])
 by smtp.gmail.com with ESMTPSA id w3sm7398594lji.59.2019.04.10.12.59.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Apr 2019 12:59:01 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org,
 marek.vasut@gmail.com, richard@nod.at
Subject: [PATCH 1/2] mtd: nand: Kconfig: correct the MTD_NAND_ECC_SW_BCH select
Date: Wed, 10 Apr 2019 21:58:51 +0200
Message-Id: <20190410195852.4066-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_125904_834185_3BF3D2EE 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Anders Roxell <anders.roxell@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Config fragments should not have the prefix 'CONFIG_'.

Rework to remove the prefix 'CONFIG_' from 'CONFIG_MTD_NAND_ECC_SW_BCH'.

Fixes: 51ef1d0b2095 ("mtd: nand: Clarify Kconfig entry for software BCH ECC algorithm")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/mtd/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 7fcdaf6c279d..f9258d666846 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -207,7 +207,7 @@ comment "Disk-On-Chip Device Drivers"
 config MTD_DOCG3
 	tristate "M-Systems Disk-On-Chip G3"
 	select BCH
-	select BCH_CONST_PARAMS if !CONFIG_MTD_NAND_ECC_SW_BCH
+	select BCH_CONST_PARAMS if !MTD_NAND_ECC_SW_BCH
 	select BITREVERSE
 	help
 	  This provides an MTD device driver for the M-Systems DiskOnChip
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
