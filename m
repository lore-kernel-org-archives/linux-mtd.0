Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7154DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39BFF21773
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eabBqeZX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic/l5UNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39BFF21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f3vzvaoibN+wBB8+2OrI1Se0Z/gwWAPyl6YNGL+MqGU=; b=eabBqeZXyImumaiN3SUpONTVop
	32wXiNK6KObNl9MHFS2xbmvBl8C0xGtEZLZCTNBJ4ay7Cvv5l+jRLbVZuKl1y0FNmMKVLVxUCmaUG
	4tNo15/Gbd2QwzlmkDklqjgAc/ZPT1E25I9yKz11KRFchkFyTHqJHh+/Qysizm6nOQDX2E6VYCBxD
	fvZtzo5DKp7b+aeGOegc6caaIxEKwHj00JaZmO+nY2Jk7GeuupTBvJzFCt9gRT6L5eEMV2mD4NtkS
	lfi6SGoJZN9KGzpQDl4D3655OHq6y9UoguzVYOxbA7Vjf7qixBtcfJaHzb4NRvIfiMqCm0k/AQ7TX
	F6OirEjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9VsJ-00022M-5t; Thu, 28 Mar 2019 14:19:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9VsA-0001sj-KQ
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 14:19:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id f3so3786226wmj.4
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=viIckbTkgF0tqHSzDsKQ/EGpdVoMTV3xTNPJQk3jHto=;
 b=ic/l5UNeBWuyYo+4+r4rMYSb+IxtVARZD8EKpS2uwnUUPe1sHyf09E2puP0eHPerTs
 9rfP29iHCCGCeB1Dw4XtxS0LajxgY73oTSpav+wsaqDiq2NksoYOPlObqZvZUlCWXh4E
 oyY4XtWz/U5xUFAlrEqeW6EgXzP4witlCDOOUApeyi5nTchNOsEMMH75VLTnApNfKJ++
 MtH9b5jdgFNdBUO4v/b7vpYjR0SKsTAxIreiznyf0jjlBaZK0ojBgL85iI/bDzTAOwCI
 qZjSjSg1JxBfNO1GPadUyoXYXcKBWbaqMCex0RU2RbsI1LT2swO2hdN8j1zwEmHwwxaH
 6TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=viIckbTkgF0tqHSzDsKQ/EGpdVoMTV3xTNPJQk3jHto=;
 b=Oie6oFEzzkfH2gazAMBhus7U7Ql4nX/hsDSPdGiLeJmaX4eYQ5JLExAeXu+6vd228i
 s3meu8CXNRMp3FncuoH1v15OrftKmGkGefvSJRWIeLNHJQ5kzKQBoY93WVA3dJEyVqtX
 tBO/SlwTA/wQD3qXt74tJBIIUzQTY9yw/xd7ILw8wfWciAI5nYsaoe42qIZ7ZLdlWN9w
 6g2gBUrpCXZDbVPw6bXkTdcobwImdoZCyGv+foqSdOpO6s94AXJKQ5bBs0MO8bqcu/Oc
 2g7orlZ2TW5dLRNdylKi/RbserV6BKkQJ4jyRfz7xVN9CJCUapFKUHErPu+3OyvV24qk
 YyiQ==
X-Gm-Message-State: APjAAAVbNhmcbP6+7GPnuCUTV4ek6ut6MoEZspm1Rif+msgRWGDN6iuz
 to2XRYgvz+qv1PxdT8ar7yuLB86L
X-Google-Smtp-Source: APXvYqzcnKwCe6ffrgtV/J5sepfVDrSATJkGA8+tVWffSOJaUsJdFyl5t1AuGQU7HT9gf6J0w6TYUA==
X-Received: by 2002:a1c:cb0e:: with SMTP id b14mr129642wmg.149.1553782752855; 
 Thu, 28 Mar 2019 07:19:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
 by smtp.gmail.com with ESMTPSA id t2sm51802879wra.9.2019.03.28.07.19.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 07:19:12 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH V2 1/5] dt-bindings: mtd: describe the simple BCM963XX NOR
 flash layout
Date: Thu, 28 Mar 2019 15:19:06 +0100
Message-Id: <20190328141910.5723-2-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190328141910.5723-1-jonas.gorski@gmail.com>
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_071914_665620_30DD0BB6 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add binding documentation for the standard CFE based BCM963XX flash
layout, found in most devices using a BCM63XX SoC with NOR flash.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 .../brcm,bcm963xx-cfe-nor-partitions.txt           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
new file mode 100644
index 000000000000..9f630e95f180
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
@@ -0,0 +1,24 @@
+Broadcom BCM963XX CFE Loader NOR Flash Partitions
+=================================================
+
+Most Broadcom BCM63XX SoC based devices follow the Broadcom reference layout for
+NOR. The first erase block used for the CFE bootloader, the last for an
+NVRAM partition, and the remainder in-between for one to two firmware partitions
+at fixed offsets. A valid firmware partition is identified by the ImageTag
+header found at beginning of the second erase block, containing the rootfs and
+kernel offsets and sizes within the firmware partition.
+
+Required properties:
+- compatible : must be "brcm,bcm963xx-cfe-nor-partitions"
+
+Example:
+
+flash@1fc00000 {
+	compatible = "cfi-flash";
+	reg = <0x1fc00000 0x400000>;
+	bank-width = <2>;
+
+	partitions {
+		compatible = "brcm,bcm963xx-cfe-nor-partitions";
+	};
+};
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
