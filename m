Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91AEC282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:03:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76FB121872
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKhuRo4u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ld2i02Jx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76FB121872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QoecdzOCKkCtn7gKnawi0OhuVNT5PtbdYNEWAxq827U=; b=EKhuRo4uZwLUBN
	U+ybJ3j0sSwXCRZY2bcLey+z2TwhBYoA7ZkFCcAe6lBRyHNex89130awy6rb1cK3N3FIGi1LTR3Tc
	YtJFmzEZZzp23UYvwZDkZwwXnJ1/AmDtWTmnbYyyUkceCgdhaynalfMSLaVxcEveIHv6E/YGoSOPf
	aQ9WvmDjAaxjLevw0oHcyp5xjVCGygtOr4XM7xfgmwwlIMe3YZXNxxiVj50sj9sgCQMJ66TxCiBb8
	A/S0BVWIbT14JtkMwdHPHr/xBu42VnofstY4M1M9tw8Pwf3o9Oq2EZhKDi3SIEMpEH/pwFw+RbFKS
	yHWz5UDVwF/w+unRSJqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpVfj-0007WM-Ai; Fri, 01 Feb 2019 10:03:43 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpVff-0007Vv-IQ
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 10:03:41 +0000
Received: by mail-lj1-x244.google.com with SMTP id k15-v6so5276142ljc.8
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2019 02:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pdryh2qZln/mdEKeX6uKOdno711aZXsOFM/PptAooIE=;
 b=Ld2i02JxerTHK8gv+TC29wu/uzRXQu0lKV4b3d93GT4ZCFuSctXynbqWAucZ1CaVE/
 mzgoOjNKBwJpJDy73eO5i1ePR+Vtv02u2d8DNQkXBt+SCCmdhqkDuAPvTctDa0Fd8ucO
 hoK5q2ro4IoBnNNmtXPGZOPhClFgdaRrf+HXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pdryh2qZln/mdEKeX6uKOdno711aZXsOFM/PptAooIE=;
 b=NXKOFgxVAF3Yv/BhFd325E0AGZaQifp8gxXH75S+uv7aobp+/HGhpHUehHcufqGL5v
 AcOWr0Tdrm+jAMNFH6ZBCIIBkUedgDomjcAwnKSl449MNj/Qi4ATCksGGhLNpxhVxrkt
 Bu89TcWHLij6LYRpisy8yHHqcWd/MIBf83j0o2luP2QQ/b1MfTIBm5qumb5OrwfhqbYb
 z7OhlJbTKdgKoIE/gRd60KCGDv38M7rxPwWrGHDoTHZnUYQbl3/8Ehgr4u8XcYQkFq8w
 r2+WsBPJiWU2gu2Yh/qUyDwvZhFpyuFYun1C0vxhxn4TPzTFLeT2kQsWhzbj/JzzMcxY
 gYUw==
X-Gm-Message-State: AJcUukfcIUQnHxfFG5loLeYW1ks/jbfY1mtItul2wyEVk2/qcbZ08YAb
 Um5Uz+c4/ogRgYmaDmhxsNKOAA==
X-Google-Smtp-Source: ALg8bN6kR3Twvu1jUYjR23Ey/jdEpMTfh2vU5MUUx2FuvzZfTfiJ2mx/JKSDQl59taLQKtmGIxWeWg==
X-Received: by 2002:a2e:5d12:: with SMTP id
 r18-v6mr30306956ljb.89.1549015416783; 
 Fri, 01 Feb 2019 02:03:36 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se.
 [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id r1-v6sm1223897ljb.64.2019.02.01.02.03.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Feb 2019 02:03:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: add DT bindings for the Intel IXP4xx Flash
Date: Fri,  1 Feb 2019 11:03:30 +0100
Message-Id: <20190201100331.27224-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_020339_607714_2A9D4709 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds device tree bindings for the Intel IXP4xx
flash controller, a simple physmap which however need a
specific big-endian or mixed-endian access pattern to the
memory.

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
