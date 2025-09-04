Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B8CA1002
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dUDuxm0tfh55v+v5FahazRjNU9k/4BQvxRnEWkwtKLI=; b=jZUc0SvjqS0NCy
	smqyxsTCE1d1pe6xAsCpgQDuXaF7hA4/hhC3Znv/akqqWxc7Wkn5Mzv1OL1Tp+uyktP0RaQjELxCd
	aLohQ4glWNfxAK494BCAuC4nb9hl+U7l5u0ew4bwTOAeZeevfGiQpEZpL85uYVGyaYtc5P7DN5YEH
	WYonsBrpkkafQf33LoXmLKZ3L3BnSZTOCc11p++nImpkXEFp51O/sYIBdLyF3RelK0FxOIjRRKmtG
	hvropU5tgjkfnmEcqR+iPAQyIAu9UnzOHF+cZP98J8QTr2H2jUeElscorC69HB93MIDSXKvVe1SN7
	U5aB+tqbyKqnwLfS0+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCmb-0000000CsiJ-0HyB;
	Thu, 04 Sep 2025 16:25:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9gK-0000000Bm5O-40nv
	for linux-mtd@bombadil.infradead.org;
	Thu, 04 Sep 2025 13:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Eu33c/w6XWUI4LJ7wNHA6DwIb15pBm0SD7xMt90+gKU=; b=BW9MKWEDICl6wr4EIRJW1RSx7w
	Mza1JvDm+JM39iuze2iNjmdZLBiZ6OwPfd+HW9HqKMh/nY9zmRH/ZJl/7bNhu032SkCkKPto7DIQH
	qE7X1Hvqb28DeNgjn6O0YTYLE5Ea3fLDWVyE5aSEJleUgoRG6PsZOYeQfhIkeHsT7k1ggW5ApPygN
	GLdQxrWKHjGx2Mv6uJZr2OJJD4l2HJmm4LlxqDot6uJ1vN/2aKqyz+iSczQ6THolBOH5LZmJ4ZPd6
	6e/fU15ABWBxKcMoSYO6NJd9CZE1Pqcdk6oIBKx64eWM9SRNUiwSY3aiTQ7CrzOVmBMu0SPnKl8Jl
	k8MsTixw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9gE-00000001DcY-3WaV
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 13:07:15 +0000
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8Dxb_DujrloL6wGAA--.14261S3;
	Thu, 04 Sep 2025 21:06:55 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxocLpjrlofA5+AA--.2906S2;
	Thu, 04 Sep 2025 21:06:52 +0800 (CST)
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
Subject: [PATCH v4 0/7] mtd: rawnand: loongson: Add Loongson-2K nand controller support
Date: Thu,  4 Sep 2025 21:06:32 +0800
Message-ID: <cover.1756991031.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qMiowJCxocLpjrlofA5+AA--.2906S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF17KryUWw1UCr1ktr47trc_yoW5Ary7pa
	y3u3y3CF1DtF47AFsIya48Cr1rZryfJ39rJwsxG348C39xu34UZrWFyF4rtFZrCrWSqryj
	qFZ3GF4xGF1UCFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jj89NUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140712_077336_545D86AB 
X-CRM114-Status: UNSURE (   7.98  )
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

Hi all:

This patchset adds support for the Loongson-2K0500/Loongson-2K1000 NAND
controllers, which are similar to the Loongson-1C NAND controller.

They support a maximum capacity of 16GB FLASH per chip, with a maximum
page size of 8KB. The chip supports up to 4 chip selects and 4 RDY signals.

The key difference between the Loongson-2K NAND controllers is that the
Loongson-2K1000 explicitly configures the DMA controller routing, while
the Loongson-2K0500 defaults to using APBDMA0.

Summary of the patchset:
Ptach 1: Rename all prefixes from ls1x to loongson
Patch 2: Add 6-byte NAND ID reading
Patch 3: Add chip select support
Patch 4-5: Add Loongson-2K0500 NAND controller support
Patch 6-7: Add Loongson-2K1000 NAND controller support

Thanks.

-------
V4:
Patch (5/7):
  - Split the flags variable into dma_bits;
  - Chip selects set before requesting the DMA channel;
  - '|' should be last character on the previous line.
Patch (7/7):
  - Use devm_platform_ioremap_resource_byname();
  - Add the dma_config() function pointer to replace the previous flags.

Link to V3:
https://lore.kernel.org/all/cover.1755757841.git.zhoubinbin@loongson.cn/

V3:
Patch (1/7):
  - Merge the first two rename patches;
Patch (3/7)
  - Refact chip capacity calculation. Use a big switch-case
    for writesize, and sort the big switch-case by writesize;
  - Drop the redundant 'nand_cs = 0x0';
Patch (6/7)
  - Add Reviewed-by tag from Rob, thanks.

Link to V2:
https://lore.kernel.org/all/cover.1754890670.git.zhoubinbin@loongson.cn/

V2:
Patch (5/8):
  - Add Acked-by tag from Rob, thanks;
Patch (7/8):
  - Update reg-names attribute description.

Link to V1:
https://lore.kernel.org/all/cover.1753166096.git.zhoubinbin@loongson.cn/

Binbin Zhou (6):
  mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson
  mtd: rawnand: loongson: Add nand chip select support
  dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
    Loongson-2K0500 NAND controller
  mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
  dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
    Loongson-2K1000 NAND controller
  mtd: rawnand: loongson: Add Loongson-2K1000 NAND controller support

Keguang Zhang (1):
  mtd: rawnand: loongson: Add 6-byte NAND ID reading support

 .../mtd/loongson,ls1b-nand-controller.yaml    |   56 +-
 MAINTAINERS                                   |    2 +-
 drivers/mtd/nand/raw/Kconfig                  |    8 +-
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 .../mtd/nand/raw/loongson-nand-controller.c   | 1024 +++++++++++++++++
 .../mtd/nand/raw/loongson1-nand-controller.c  |  836 --------------
 6 files changed, 1083 insertions(+), 845 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/loongson-nand-controller.c
 delete mode 100644 drivers/mtd/nand/raw/loongson1-nand-controller.c


base-commit: c9f62564252c21d739a5003e9b2d6ad0828aa7bd
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
