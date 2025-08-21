Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A102FCA0FE6
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Aug 2025 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0to0fVFFyxAg1yQibm1j54ixHV9zid0q63VMYlZOnQg=; b=KGSgLPtmSsidID
	NDGtG3rUS7l+U633dBYWTlzORaTSCcgm2f+mD+hlkToSRWRfcCZAZW/oB4ZsM1uRF2O645s9m58UW
	pJmvSSSrRiDGomxSAKq7bBSUhRpfY/yyki6BHCZXqqNQIuu7QO6031cGBmBBVzfD6by+yOyaQWPhL
	bJJwBy9WP1/Sdn0oCPSWb2MyDzmAl6rgSPNL4/pTzqEKSkESovnaZTSlxRgbN1Gl2eWvE32RqNaDu
	kw83rvGrE1cZljBe3RFLSo/QruwlD0KcxX0mxV0YPwPSdzdtE6Rz+P7+9pE+hidK7rDuo5EeY0SCM
	IvZ5X8Up02IKaU94TmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozHI-0000000G1vh-3YAc;
	Thu, 21 Aug 2025 07:00:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxG-0000000FyZx-1jJ1
	for linux-mtd@bombadil.infradead.org;
	Thu, 21 Aug 2025 06:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mal0W9Ck0wW3GB+ooqHxs72sMUXOAAe59tEoRZbEuSw=; b=Lmu+QJreaAwkp/QxquKF+prNZ4
	owwfGgi5TScZ4qJ0UVp0zGGeyyxIgdz0atRsMbgb4rzIUhMLQC4K3QUCAvYifndFkcznr2g6JRXHA
	9Qt5MyGtC4UKJXq6Q0+cX0J5S4uLsDCJxvPAuSZ5ztBg/0Rkh3RCYsG7ObGKpd+6ngt2Dh90gv4+E
	gsS1RFJfeBee5Luvc9AUBTtMGWLAFj2BKE9Z9hfsr0iMjeXf598QTOUCouJHWNozBZlztcj/7g+Tc
	9rbowcZ8b9wU87+sAEMsF1sCHONmiC2RQP+DmRp4f349WAUARsI5dg6hH0vzw44rgrr8J/3Dy/gYr
	Pu/RW5TQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyxA-00000002GaE-3szR
	for linux-mtd@lists.infradead.org;
	Thu, 21 Aug 2025 06:39:21 +0000
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8AxztILv6Zogk0BAA--.2493S3;
	Thu, 21 Aug 2025 14:39:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxT+YIv6ZohPRcAA--.21919S2;
	Thu, 21 Aug 2025 14:39:06 +0800 (CST)
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
Subject: [PATCH v3 0/7] mtd: rawnand: loongson: Add Loongson-2K nand controller support
Date: Thu, 21 Aug 2025 14:38:53 +0800
Message-ID: <cover.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qMiowJAxT+YIv6ZohPRcAA--.21919S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF17KryUWw1UCr1ktr47trc_yoW5Jw48pa
	y3u3y3GF1DtF47AFsI9a48Cr1rZryfJ39rJwsxG348C39xW345Xry0yF4rtFW7urWSqryj
	qF93GF48GF1DCFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_073918_190427_0B49B54E 
X-CRM114-Status: UNSURE (   7.44  )
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
 .../mtd/nand/raw/loongson-nand-controller.c   | 1021 +++++++++++++++++
 .../mtd/nand/raw/loongson1-nand-controller.c  |  836 --------------
 6 files changed, 1080 insertions(+), 845 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/loongson-nand-controller.c
 delete mode 100644 drivers/mtd/nand/raw/loongson1-nand-controller.c


base-commit: fb2fae70e7e985c4acb1ad96110d8b98bb64a87c
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
