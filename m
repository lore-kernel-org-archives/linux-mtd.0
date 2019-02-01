Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D71C282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34A721872
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KaLIEiYL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCQRNF5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34A721872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1sveRMtozLobtwix/43GG9x5DFuDvUoIHhp4+UcnaGs=; b=KaLIEiYLl+zb/2
	JJhCMz9ym8IjpbRQHJfb8K+QtIoshYGh+dhaGSyJzYFMZp3rKXP0TJcRNuQnChZExcTYpFknx64k7
	6/Cp0+s9ssMyM6QBzY+Df6lPAltWJMt30w5I+BwqfGShseScvXLsz6kubn6F2Lmoik8+YVmu79fWU
	dAItM10Tg56/c0U+hBZ9PDH14SWWozyBg4CfDRfAbxRowSxptuDjcZX/BNa3Vk41cERT/u9jVg9T5
	Wg/kljfOpUXfDjubXYXfuz++PzjZX3rFbPUIQOVZyvswSXux093p07DgAxRHUO/JraE+sFOEoSNE7
	DyvG+1kQIx0c07vFIiKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpVgV-0007ny-GI; Fri, 01 Feb 2019 10:04:31 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpVgS-0007n6-0c
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 10:04:29 +0000
Received: by mail-lj1-x242.google.com with SMTP id n18-v6so5271371lji.7
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2019 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qTqjDdI4/9bt0VuW3/iTUWoBQxKuywYtQ/zFacF4SdY=;
 b=QCQRNF5eHPezUaOigAdJv7iwUUf6HEfwl06sNifS1sw697q/1aB9qx6mD9vf5pxcnH
 mrIY+58Z/GOsMbOedQ+BTB5HsIT2rlfBsqtlJvLk6pqk0fnX/PW10DJ3gE+WvRZmpseu
 1OpL4UCOE1vRgB/SldWhcn1WIBv8Qx95n53R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qTqjDdI4/9bt0VuW3/iTUWoBQxKuywYtQ/zFacF4SdY=;
 b=ZcVNztWeyoWTpzkQvQuRKJOTnpk3N8hB+90YIBD4PmSmbC0Grqqztmr/foskyZjQtd
 zNlDOnP5APYTtIw0Wz/D+jcbTJB0P5o/pjwwQq98lYgdBD9nEzCtaEtTgDNBzO/npCBQ
 uwr5O71gG6R+6L5zXjV0O62DdKrOrtR5B85cM0DkyceaVouFIkwvtrbOkZGK75/EZxc/
 BLOMOjn3y0PPBs1zEhlOFNM2Jx7cJzXVg/62rlXqe2sXYVoDublcXP8KzkQTNjAimJZz
 ysekakHJVh4MA9Xw7M9p3O0DjRN0JZG8+fBy6jqog7JwtQAtz6bIhk0ly4Fqwd2ddFsr
 s2dA==
X-Gm-Message-State: AHQUAuZQRpn5h4Hp1lqN+lMXgEK1SOpBAvQXnV519dxn8qsoYZb2Fomn
 W/8CHmbRk3jyxE9u9+GIIqSaTA==
X-Google-Smtp-Source: AHgI3IbQSApkksOIXi/mGhx0LQDLd5QCsNnPi1rnzHbH7SVzvlYQg7q39OMnGZtTAoxSbWsdOSLGjg==
X-Received: by 2002:a2e:3a10:: with SMTP id
 h16-v6mr26574711lja.184.1549015465123; 
 Fri, 01 Feb 2019 02:04:25 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se.
 [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id g15sm1279197lfb.1.2019.02.01.02.04.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 02:04:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: add DT bindings for the Intel IXP4xx Flash
Date: Fri,  1 Feb 2019 11:04:20 +0100
Message-Id: <20190201100421.27504-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_020428_107115_C34B39C3 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds device tree bindings for the Intel IXP4xx
flash controller, a simple physmap which however need a
specific big-endian or mixed-endian access pattern to the
memory.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/mtd/intel,ixp4xx-flash.txt       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
new file mode 100644
index 000000000000..4bdcb92ae381
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
@@ -0,0 +1,22 @@
+Flash device on Intel IXP4xx SoC
+
+This flash is regular CFI compatible (Intel or AMD extended) flash chips with
+specific big-endian or mixed-endian memory access pattern.
+
+Required properties:
+- compatible : must be "intel,ixp4xx-flash", "cfi-flash";
+- reg : memory address for the flash chip
+- bank-width : width in bytes of flash interface, should be <2>
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+flash@50000000 {
+	compatible = "intel,ixp4xx-flash", "cfi-flash";
+	reg = <0x50000000 0x01000000>;
+	bank-width = <2>;
+};
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
