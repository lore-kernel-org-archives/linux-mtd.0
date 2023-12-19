Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D56DC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EaEMh1rPpoLEPYiU0d6Y/AsWEu9NNyojtQLGSO09gLc=; b=gFJaU0Px8pYcdl
	hECCVlnQ/joejBEhXH3JfefyU6A9ElXP/NeQgT6RJ3vazI4ICrjHPNty0/jWOqbCrpWUKU/W63xSv
	MShRdhe/MaJV1R7DyDWFGwV3x1y/G6mOfotbcmZ6LwXLJDnzT4UF8rUDbI04HElJElF2dX3DjAXEg
	JeBDmz3nQSc8RaG2MSk7fVOsC4OesBVG/b3/PSwrDPURBe/9cKl6wwt4rXlDeoTjibsGZ1npQj4wR
	sz0bC3L5s95moHigFKKML/z6DQ2OW5F7RxMG2cgbqIoFtlVlC9an0uelRI9xzeHjlzIQDv6hkewGX
	5k9bWosVkz5WdWIN3hDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFW9Y-00DPpY-05;
	Tue, 19 Dec 2023 09:12:40 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFW9U-00DPoF-1p
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 09:12:38 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7E51A4FB;
	Tue, 19 Dec 2023 10:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702977151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nb4BQkMn7CZUy/4xRlRCnIBheKJWvx746c+gdEFQdbI=;
	b=IY8ZJwZVbahaHuHYYGRoZk0kSMGVxk+tKPqTsXVE+4DDGlMISmg79kT+Sghj60CI0WAKxN
	2/PP1dsYYIKYq6lVBwvZ6tEcLH/A6jHi05mGOrrGKQkEdf0srOkkMGajQ1p1nrHVbqFSyn
	S//CGgvlTToDRG4QG5sE/8x6dhNZZLLN2Bg0vK/IVtDnwccJ4jO7VYdOJ3mbOfgcWR+OSX
	Mlbbxvv6CscqpY/eTKtitayDiKaFqmRKKw4zk67pjJhzVSm+Pdm5oyoLQHokHDIU+X+I1z
	Cvle7foK5RxmjIATmv0CqUjzmLk6CuDayPx61PeVh/Axqs9+jzTfakzlmZk2hw==
From: Michael Walle <michael@walle.cc>
To: linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	mwalle@kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH] MAINTAINERS: change my mail to the kernel.org one
Date: Tue, 19 Dec 2023 10:12:18 +0100
Message-Id: <20231219091218.2846297-1-michael@walle.cc>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_011236_759274_92F0D91B 
X-CRM114-Status: GOOD (  10.33  )
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

As I'm doing more and more work professionally, move away from my
private mail address.

Signed-off-by: Michael Walle <michael@walle.cc>
---
I'd like this to go through the spi-nor tree. Hope everyone is fine with
that.

No update to the mailmap as I still (and will indefinetly) own my private
mail address :)

 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3ada3bb3652..8279761421ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9056,7 +9056,7 @@ F:	drivers/gpio/gpio-mockup.c
 F:	tools/testing/selftests/gpio/
 
 GPIO REGMAP
-M:	Michael Walle <michael@walle.cc>
+M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
 F:	drivers/gpio/gpio-regmap.c
 F:	include/linux/gpio/regmap.h
@@ -19920,7 +19920,7 @@ W:	http://www.winischhofer.at/linuxsisusbvga.shtml
 F:	drivers/usb/misc/sisusbvga/
 
 SL28 CPLD MFD DRIVER
-M:	Michael Walle <michael@walle.cc>
+M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
 F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -19935,7 +19935,7 @@ F:	drivers/pwm/pwm-sl28cpld.c
 F:	drivers/watchdog/sl28cpld_wdt.c
 
 SL28 VPD NVMEM LAYOUT DRIVER
-M:	Michael Walle <michael@walle.cc>
+M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
 F:	drivers/nvmem/layouts/sl28vpd.c
@@ -20446,7 +20446,7 @@ F:	drivers/pinctrl/spear/
 SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 M:	Pratyush Yadav <pratyush@kernel.org>
-M:	Michael Walle <michael@walle.cc>
+M:	Michael Walle <mwalle@kernel.org>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 W:	http://www.linux-mtd.infradead.org/
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
