Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62904CA0EDC
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Aug 2025 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pq0XIe6E1735Nc+0zXAggN+c4vCegoauoZiB1F44qq0=; b=fLo6s4wBMMNf/F
	HNuVeI1SXLKdKTV5upPNL8dcv3kIBv2eKbqeS9rgBWWxoh1HpnL8CWNZIQVIXXWtMmF/YXQzrHzXi
	WBvdoC8KUxwOsQkE9i72sTsbaQaIYy0SRlFYCbSRa628t6AYDRf/4rc//7+mL6uJO3jZZNTv0EN1I
	9d8NxPhOzKkx5DKxnyeTkMQgOp5FGvV9uZMP5IELQpSimWWsczmaXqkoXfPANqhEfSYj8yDKiKiRS
	PhSti5/y77g5lOyaaoP8NpPeWxzCB7ZNxJKZw/FWgdAktgD6/uOYGha0jRZj33Hm+WbWP28XtVAYx
	43kprimhH3AMdHeH3EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozHK-0000000G1we-1ino;
	Thu, 21 Aug 2025 07:00:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxk-0000000Fyf9-1hOs
	for linux-mtd@bombadil.infradead.org;
	Thu, 21 Aug 2025 06:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tYdUHole4ZyWAG+DVMrEFOCro9qSHlcjwViwlH5Ntuw=; b=m9q3tBc8wDCeTExLQzDkOaIHrr
	8bMnRMTFEimNFtYj7sWDBE0NFkvu+unE7H8YVDMrCuYPb4ST1SKhA+tcvsSRevqkd8huzafgYCedn
	26EbH63dN3mZ5eBLH+DCDtuF21Bl+Z1tm5eoa4Cwd9Sysx7J7gKqJmb+ZIW36dkeddWeRPnoRi9w8
	YPV3hJ19T+9UbwOI9auFgFYZtN/ibxCwLOvQu0zTesBsIplTZQiC/qoSfKR9KQepFtq3uViNDIwfQ
	LkBjPqGxVAbjCaErP2W5OBO2QQlZJ4JOEyogOipBNSuDRVL4D0Yi5T8k+zqqbLebxqY/JZAGgDHRT
	jbK+Oo3w==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxg-00000002H7U-0OLf
	for linux-mtd@lists.infradead.org;
	Thu, 21 Aug 2025 06:39:51 +0000
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8Cxbb8lv6Zo2E0BAA--.1455S3;
	Thu, 21 Aug 2025 14:39:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJDxrcEhv6ZowvRcAA--.65049S2;
	Thu, 21 Aug 2025 14:39:32 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 4/7] dt-bindings: mtd: loongson,ls1b-nand-controller: Document the Loongson-2K0500 NAND controller
Date: Thu, 21 Aug 2025 14:39:18 +0800
Message-ID: <ef8d5c91403cbe7e91ec63190159aa031ebd7dfe.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1755757841.git.zhoubinbin@loongson.cn>
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJDxrcEhv6ZowvRcAA--.65049S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1ftr13XF4DJFyUKry3Awc_yoW8WF45pF
	ZxC3yxKF1IyF13Za90ka48Cr13ZF93Jw4DJanrJ347G3sxWw1YqryayFn5X3WUAr4IqFWU
	ZFyvga1rJ3WDAFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_073949_347628_0D7644C0 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

Add new compatible for the Loongson-2K NAND controller used for
Loongson-2K0500 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../bindings/mtd/loongson,ls1b-nand-controller.yaml         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
index a09e92e416c4..4ec2b5d1e89d 100644
--- a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
@@ -4,13 +4,14 @@
 $id: http://devicetree.org/schemas/mtd/loongson,ls1b-nand-controller.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Loongson-1 NAND Controller
+title: Loongson NAND Controller
 
 maintainers:
   - Keguang Zhang <keguang.zhang@gmail.com>
+  - Binbin Zhou <zhoubinbin@loongson.cn>
 
 description:
-  The Loongson-1 NAND controller abstracts all supported operations,
+  The Loongson NAND controller abstracts all supported operations,
   meaning it does not support low-level access to raw NAND flash chips.
   Moreover, the controller is paired with the DMA engine to perform
   READ and PROGRAM functions.
@@ -24,6 +25,7 @@ properties:
       - enum:
           - loongson,ls1b-nand-controller
           - loongson,ls1c-nand-controller
+          - loongson,ls2k0500-nand-controller
       - items:
           - enum:
               - loongson,ls1a-nand-controller
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
