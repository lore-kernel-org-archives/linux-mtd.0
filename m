Return-Path: <SRS0=zboj=YN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371EECA9EAD
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2019 23:01:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0212921929
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2019 23:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4J+V6KA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HpSfZmtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0212921929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hg5kdAPxndfcHgOeV+aC+zGpSaa7Mgwg26iCQey0oJY=; b=t4J+V6KAx0c5rj
	DnkoEp6S8SFX7iGMTCGxoIlamSGel2t2IpLYPEbWS5qkQXgwBChuAscV+i3+6HE8v7OSweehBBPU4
	JDcMw2baxmQAsozz3jhqkwV1tXd/0/qX+Wt5WS502LvyISH2TCYtnzbkjVXrzwGkSCnLVRm4by3G0
	75I6LCYCKaaRj8zna8W3puWCyupLqhvkOS8HKRbNbuDAIMoP4GOiDXqeoXKmAhbakyAS29ZkM08DT
	3Fx/3/IK41DQAbduF2LIbX5S6VoECU7kkKFf9mVc44YkI5eTzUPyssLyfkZrbPdLovdjFFAshxXFK
	uj2Rvepq5k0LGw3cJaoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMKC1-0005kM-Gv; Sun, 20 Oct 2019 23:00:57 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMKBv-0005Ce-GG
 for linux-mtd@lists.infradead.org; Sun, 20 Oct 2019 23:00:53 +0000
Received: by mail-lf1-x142.google.com with SMTP id q28so5249417lfa.5
 for <linux-mtd@lists.infradead.org>; Sun, 20 Oct 2019 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VYr9aCDj4PnFzDPIIIY7KJpxkUoLJ3Nn3QAOb6G38+I=;
 b=HpSfZmtTANCZMC/v1YzmmGiA43QviDigJusdPALJuCYSz00i9zTFOWSoPg/jBN5nHL
 Ipr5P771YvUTRXy1TJtWDzU7/erC4mDnz8W8YnSJQP5EhDVOJgQExQ6L2pH1imzU8T0t
 7tan04vCe14WIxFfOfYgjZ7LZaHhEQACvV31sDqS2T/NBWyENeq8VImOZW2C2J0YxiN1
 MDHgvy4hn8OmGUWnCqgvUDLMAJ1PmPI0W8pBqJD6ZGCHKUD7MkThqfIoGFs5ocZ+B1vr
 +NtzjtJTlzxIVkiAwGptXM5NfY+A6xZgUCP2yeGMzuk/EWzXLbrEoofUpSLW95q1vJyj
 Yc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VYr9aCDj4PnFzDPIIIY7KJpxkUoLJ3Nn3QAOb6G38+I=;
 b=YUjcHIMlaSumMTjWK5WwZCAhh6V16f97utfJHDtFgmUY2ClpR/NXSGnoCOxTW+e7bZ
 R3k5dJmrjrvixZFk2o3W7wIxusQGQYyQ8d7cQwNbpBVfvvsVuV0S+UMNk4T8w0IqDyIZ
 1Ww6AZ9l/w8XpDY6idll52ZRVf+NHXzT31LnHZobrvb6PNOxswe2OL8O0M8Axrg5wECA
 9f+a5wMDzruYJkLU61kBagJbxeT20T6UmKcjD2g73ofaQoUSa830a4jOWlIyFWP0uQcW
 4KpPnfouH7WZnyzDrzQSU7RHSTto4+XS3XuyDB1659Jm9ZPaX8NrS83PffO0PsEHmtY1
 E2qw==
X-Gm-Message-State: APjAAAXvcc0dFy0LBgz9Pcl8j7i35bxcBHhd1IV2HS4f5rIGuP4bRk2A
 qbvVA1Jqzqh30xQ8wb6SMAmrdQ==
X-Google-Smtp-Source: APXvYqzBwh2aw+V1KrR2jzfKHGhhMkxOeOADzXN51+d7Nj8sASEsVsiB9ZrnumS5H9z6k5nG43JiEQ==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr2780699lfa.182.1571612449275; 
 Sun, 20 Oct 2019 16:00:49 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
 by smtp.gmail.com with ESMTPSA id 77sm6011174ljf.85.2019.10.20.16.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2019 16:00:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/2 v4] mtd: add DT bindings for the Intel IXP4xx Flash
Date: Mon, 21 Oct 2019 01:00:41 +0200
Message-Id: <20191020230042.7364-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_160051_591696_5A09A2B3 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds device tree bindings for the Intel IXP4xx
flash controller, a simple physmap which however need a
specific big-endian or mixed-endian access pattern to the
memory.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rebase on v5.4-rc1
- Resend
ChangeLog v2->v3:
- Rebase on v5.1-rc1
- Resend
ChangeLog v1->v2:
- Collect Rob's Review tag.
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
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
