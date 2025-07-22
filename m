Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC31C83F27
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ch+kCFTjG+hChvNkACzt2IHa4ralj8lUMiUoF4sc29c=; b=2tWwKAcLNCs40Y
	rUIvpMo0AQykhzTldq8gkzWYaY/KOws2ccnOuuH4GD0fo+BSI5C7BBYujBBmaJJFFubn56IJdKpjk
	CYSdBrkek+T5pl2jji3TkZjkJDireCFs4jN0hkPd55qMaIP5XDRTicMC1Ep3+ueeRxBxDF8lR7c+X
	j+sH0QliP+ssSNwf0oxPaUhRqmvbva4MN1fUEeC7YszpRxrAgJYJB8MPoOu4C+LqWbb3Tr125Gszk
	qR6bwjEPSxIud+mzs0MVE0Ev4GCc7PkaZB46WXHj2ZuL5ILfGneNP3ovyocY4dtG60PFFUypK2h7Y
	brwOXDLUKTOuh6vbMpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9CC-00000001zX4-3ZAE;
	Tue, 22 Jul 2025 09:22:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue91e-00000001xIA-1CgQ
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Jul 2025 09:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1qT5EqoGKHr+/pMAM1wpvrbcVtH20F/ng0FdNccQR7I=; b=qFllXcZBwSMleP/NJxNqE6Qq4A
	bwRUhg4OrZj5rZrnQBtuQkf+WchMBAW8zVf5sPtGYkMFvRjvutkUwoivkxhvruvXgIgQXhuOX89/w
	2Pd7P27raXT54rpraFLAVNvJzseI8MtIDj1luVDitpBNd6sqNonFbL/A22Jt75di15ef2qHlqYM6f
	f0eTklwKknwWYMVgtJ6oaV34RWo7tzyOAaoDFOQ3fedLS8UPULAB/6LH85QiP8YO1SUVECl5JmLfu
	2CQ//n5ARWAEYea0KaAAHMgrGc21IPV4DOrD5BjbS+MpKJRhZC/J1gCz9dPuxkr9HEZNUr8zrdK5U
	VsRiRnoA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue91a-0000000BFPd-3aZs
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 09:11:05 +0000
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8Bx63GiVX9oQX8vAQ--.31048S3;
	Tue, 22 Jul 2025 17:10:58 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJAxQMKUVX9oprIhAA--.38699S4;
	Tue, 22 Jul 2025 17:10:51 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
Date: Tue, 22 Jul 2025 17:10:33 +0800
Message-ID: <66612301db891e8fcb0ca726d096b33e2b7912d7.1753166096.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1753166096.git.zhoubinbin@loongson.cn>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJAxQMKUVX9oprIhAA--.38699S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF18trykWFy5GFykXry5GFX_yoW5Ww4fpF
	17Aay7CF17tF45Zr90gay8Gry5Zas7JrWDGa9rX34093s3X345uwn8tF1rtF47JF12qrW7
	Zr93WFs5CFn8ArbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_101103_691394_11FA883D 
X-CRM114-Status: GOOD (  10.90  )
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

The second step in preparing to add Loongson-2K support is to change the
names of the driver files and Kconfig options from Loongson1-specific to
Loongson-generic.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                                 | 2 +-
 drivers/mtd/nand/raw/Kconfig                                | 6 +++---
 drivers/mtd/nand/raw/Makefile                               | 2 +-
 ...ongson1-nand-controller.c => loongson-nand-controller.c} | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/mtd/nand/raw/{loongson1-nand-controller.c => loongson-nand-controller.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..07158e8ee330 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16685,7 +16685,7 @@ F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
 F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
-F:	drivers/mtd/nand/raw/loongson1-nand-controller.c
+F:	drivers/mtd/nand/raw/loongson-nand-controller.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
 F:	sound/soc/loongson/loongson1_ac97.c
 
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 4b99d9c422c3..d9e3f13666ac 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -462,12 +462,12 @@ config MTD_NAND_NUVOTON_MA35
 	  Enables support for the NAND controller found on
 	  the Nuvoton MA35 series SoCs.
 
-config MTD_NAND_LOONGSON1
-	tristate "Loongson1 NAND controller"
+config MTD_NAND_LOONGSON
+	tristate "Loongson NAND controller"
 	depends on LOONGSON1_APB_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
-	  Enables support for NAND controller on Loongson1 SoCs.
+	  Enables support for NAND controller on Loongson family chips.
 
 comment "Misc"
 
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 711d043ad4f8..c182b9703a9e 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip-nand-controller.o
 obj-$(CONFIG_MTD_NAND_PL35X)		+= pl35x-nand-controller.o
 obj-$(CONFIG_MTD_NAND_RENESAS)		+= renesas-nand-controller.o
 obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
-obj-$(CONFIG_MTD_NAND_LOONGSON1)	+= loongson1-nand-controller.o
+obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
similarity index 100%
rename from drivers/mtd/nand/raw/loongson1-nand-controller.c
rename to drivers/mtd/nand/raw/loongson-nand-controller.c
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
