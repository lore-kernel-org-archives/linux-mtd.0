Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2593C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 13:11:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF31206F8
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 13:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWqAbC/8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwo7Yx4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DF31206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vSqRiflIzQDcd6s9WziE8mvDvrYaFtoJz6+bTCYUPeY=; b=PWqAbC/8NOlEmDFTNzweAaavL
	oyHIs+mu6uoMFBEw+yNh8gq3nktB4oQ1cw4+hWc1IZ/F8fGwxfGXDKDT4wDiP83HIzvBMUdOO80u0
	xr7MWpI6Lu/u/PJD3UValNpH+7GdaMG/Bw/CULqFle0VRzV8HWyyAy9GjkCabVyzt1r41UT9FQeEg
	wS6d+58KMLqC9nyzwZud67KwbW5uytY3TZL9HlnHFppIZf33VyV93wXBH+SqfjUBAqFXYJiLrBPz9
	4y73AwcNTfxUvuEAbpMhqcVq+VBcYZ55KuauUk1zkkvt6J3HnmfGPntY9VZSJ4gKaVKyHLkncZaCh
	CgvELm+Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYSW-0002qg-AJ; Mon, 02 Nov 2020 11:57:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPz-00020w-SQ
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id x7so14269710wrl.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFnrCj5AUw9J2PyEpjsbtv1aDV1Keh7odnMYGn7YCNQ=;
 b=vwo7Yx4VybkS5xn8u6PYPuQ4vL2I2xyS/vM7Rci9CN9TrePI7gqUUmpdwqpJ2bmzb6
 WYOgVYZ7Ze2JUYdDxCy9KLuhR1t7GoLZdc2ueTppoeskmcwktxyRN44zXc39dDTKy82T
 O6WoTMUlElpFyNXzv70tLq+vUYF4OTKSE16+10jdao440d3hLFThjLDBCRnAwz/HHYsW
 wROXrUvMRkbkhprsH6TkynQH/ogmIBTCZHrLecMX0K13OzKsAtjcljydmv4kQqQmFYHO
 a+LqJVfSEnKkg0xGyDdf78sFjjUX5liYVsZr8+peyzW+G1UwqwMeXndUu0T37Flbb6pP
 JMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFnrCj5AUw9J2PyEpjsbtv1aDV1Keh7odnMYGn7YCNQ=;
 b=ehICW2U1CMyYbaS9Z7r1KIij/w9mQ+2e2RQOSyVDbO8LauUVnbXREPd29pxCVEIDXB
 eMbUY1yaqB+TTafYbSwW3FSlwTu7jCTvmqlp5CtJFDHKpzK++IlvMtDzmlvCwPwI7FF+
 QITelsHC9lQ2TptyPvYUb/emPfKif9Wv4kunDkSLpdLgez/3IvRsJVYAKNU6UAPwFVFm
 Gda6nwpcPJDB0n2iQOpc1mSBmnBaqtAasE23GwtobbA5gXUaHtYX8Z/m8KEZXQz5nIf9
 fIeos+saSzteVF11AlnJBLkfX5J4uouGNkYAaHafTAo2TtnqalTSun3ZMZXzUyRyQBhC
 gEUw==
X-Gm-Message-State: AOAM533yOL4QFZJRcYY07GRWPPYzqr0hdymj0rPplSPYByK6EcFjOGH/
 xcqqvT0+aDAYh+OXJTCeqGUR1ySbvp6Ahg==
X-Google-Smtp-Source: ABdhPJy5ZtHSIVaace5Co/vTqGEHfDVDCDQ5NYXntVwU3E1kI4P6xLWriuJnDUaxbUwOLSIDWL+Y8Q==
X-Received: by 2002:adf:ab02:: with SMTP id q2mr11069577wrc.320.1604318074911; 
 Mon, 02 Nov 2020 03:54:34 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 17/23] mtd: nand: raw: s3c2410: Add documentation for 2
 missing struct members
Date: Mon,  2 Nov 2020 11:54:00 +0000
Message-Id: <20201102115406.1074327-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065437_979136_2ED5D020 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: linux-samsung-soc@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index cb2d1b4e278cb..f0a4535c812aa 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -133,7 +133,8 @@ enum s3c_nand_clk_state {
 
 /**
  * struct s3c2410_nand_info - NAND controller state.
- * @mtds: An array of MTD instances on this controoler.
+ * @controller: Base controller structure.
+ * @mtds: An array of MTD instances on this controller.
  * @platform: The platform data for this board.
  * @device: The platform device we bound to.
  * @clk: The clock resource for this controller.
@@ -145,6 +146,7 @@ enum s3c_nand_clk_state {
  * @clk_rate: The clock rate from @clk.
  * @clk_state: The current clock state.
  * @cpu_type: The exact type of this controller.
+ * @freq_transition: CPUFreq notifier block
  */
 struct s3c2410_nand_info {
 	/* mtd info */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
