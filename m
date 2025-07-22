Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E6C83F34
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfXXXOHjmwTsjJMG2UnWh1q/csArPc6e5l8EBF7LNeo=; b=mRcw+9oPEOCtlZ
	qWXX6w3OAuWsu9PieP9vI02rK3yEs6jQajB68SYM2dgDoEX9nUCf/rxW/iaxDT18Bc4VsIHTV5OGK
	5O8Ls66fGIgNmMysEmiwqUo5fnEPRGW2cF9lFD+UDVrOjYlL8ZV0eAW2j6ujbwuoamnrO2utK448f
	j6g8UyLRdXBje8RjoataWR9VcZuEn8GhdAgOr73Ie5fvrhokSjOJ0YcCK7woRC6j3qSy7a1VS9sS2
	LE8+aLOuK0qBlXETemjvCx++TvsAveSjxqj42x8RYDGNjknefx+kso+3kWtkJLKhk1kJLf+B/Gucb
	NeZjB2UQrBBqLBBE56Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9CB-00000001zVQ-0DOZ;
	Tue, 22 Jul 2025 09:21:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue91a-00000001xHu-2MUP
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Jul 2025 09:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9N8CL5mvV6annpiF6Nh3IP4QCzOKd0HYidXErGh/He8=; b=L38VfqQOEZGyCfdsmnprBhnL2Q
	DK54DzTmQRMT+sSa0gs/7dNAdEAddY0rvVyW10XIFJZce/mDVw/iB6r0UAzYo3vLu5TA50iet8AAs
	jhaglyh5NIVkozkLR+9bS14BfJO5o21T9i9947dV5JLrj4l71ripD3u99RDZzZAPRvvQ9jwtdrZF0
	Pjxu8iGl3r8Zqwh+NFPdoaltR3OcDXtda/sU3J+FUJYay103iU2iDOFfrfKgJpyONkoqlM/INvNjY
	uv4VDarFbrvESPJ677CqRg1Hw/SGcDJvNydNWluWmSnZySlvLf4NZj5JNNabVxFBxQH1AZXXeoRg1
	3Gg4VK9Q==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue91U-0000000BFPK-2lY4
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 09:11:00 +0000
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8BxjayWVX9oD38vAQ--.63060S3;
	Tue, 22 Jul 2025 17:10:46 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJAxQMKUVX9oprIhAA--.38699S2;
	Tue, 22 Jul 2025 17:10:46 +0800 (CST)
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
Subject: [PATCH v1 0/8] mtd: rawnand: loongson: Add Loongson-2K nand controller support
Date: Tue, 22 Jul 2025 17:10:31 +0800
Message-ID: <cover.1753166096.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qMiowJAxQMKUVX9oprIhAA--.38699S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr17ZF4fXF47KF4DGryfGrX_yoW8ZF4Upa
	ya93y3GF1DJFW3AF909a48Cr4rZFyfJ3srJwsxW348C39rX345XryjyF1rtFWxurWSqryU
	ZFyfGF4xGF4DGFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_101057_415065_3809156C 
X-CRM114-Status: UNSURE (   8.41  )
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
Ptach 1-2: Rename all prefixes from ls1x to loongson
Patch 3: Add 6-byte NAND ID reading
Patch 4: Add chip select support
Patch 5-6: Add Loongson-2K0500 NAND controller support
Patch 7-8: Add Loongson-2K1000 NAND controller support

Thanks.

Binbin Zhou (7):
  mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson
  mtd: rawnand: loongson: Rename loongson1 to loongson
  mtd: rawnand: loongson: Add nand chip select support
  dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
    Loongson-2K0500 NAND controller
  mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
  dt-bindings: mtd: loongson,ls1b-nand-controller: Document the
    Loongson-2K1000 NAND controller
  mtd: rawnand: loongson: Add Loongson-2K1000 NAND controller support

Keguang Zhang (1):
  mtd: rawnand: loongson: Add 6-byte NAND ID reading support

 .../mtd/loongson,ls1b-nand-controller.yaml    |   64 +-
 MAINTAINERS                                   |    2 +-
 drivers/mtd/nand/raw/Kconfig                  |    8 +-
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 .../mtd/nand/raw/loongson-nand-controller.c   | 1032 +++++++++++++++++
 .../mtd/nand/raw/loongson1-nand-controller.c  |  836 -------------
 6 files changed, 1096 insertions(+), 848 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/loongson-nand-controller.c
 delete mode 100644 drivers/mtd/nand/raw/loongson1-nand-controller.c


base-commit: 9358bdb9f9f54d94ceafc650deffefd737d19fdd
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
