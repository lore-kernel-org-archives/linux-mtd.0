Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C99BC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 05:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aeVykGdX2MPqDf5+qDXLOiCcG4E7IxeWHiuqyCtZCtg=; b=Izi55TTsUptHwq
	03Wy5HxH2ZfaNi3dKj9hRsLUfDbLzh/eDJl+wA+6rNasNfxjhmCVr+NGThZQy5fqL4glfmjmF4s+B
	JQw9VXSsPSX9kDIH2vXvVZ5HIgGMYMtu++hNaULtvVkcwINiww8JxW5jO6OCnQiEUm2t90bqsHqc4
	E/JW+NRWrxwMvqG4fNn5tD1q0TV0cxcWtwYgILcGEtpn8fFwKt0W7lTTXbiTlpGdnAyH2ccm2z02Q
	dqIZ/Uzs+vrBgHH2JG7yGznv7W7jwJfEZAtzjWtT+oJUBwFm4zY7muzA/xar7h3V+ACjoiudmqEuA
	km/I+tZoA5iq+4yCRKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl2O5-00FcHE-4T; Sun, 01 May 2022 05:44:53 +0000
Received: from mx-out2.startmail.com ([145.131.90.155])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl2O2-00FcGV-EJ
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 05:44:51 +0000
From: "Marty E. Plummer" <hanetzer@startmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
 s=2020-07; t=1651383887;
 bh=eIKWJyoaLkJuB+nzU9OpjewDEuEGEm0it8FLQCd8BaE=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Transfer-Encoding:From:Subject:To:Date:Sender:Content-Type:
 Content-Transfer-Encoding:Content-Disposition:Mime-Version:
 Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
 b=cZmGGMcQLi8neWNptANOwYRSIn7ZXoRUdTezksV5TgjQC57ZizSyXisUGZdIPuFm4
 qD6vcRCDR5Qle1tgfYuCoifl9D0KFYd71uxcvc2Ozj/No/9zmU5TRIJO2fRjO96NS2
 bqD/8U5zh23kL4yaLXq+BjCYPgRgRjijCMowNgrSfH3Du+9el0FRkW3SLN2QDP70vi
 nFtIaQ3rEC9EqHyTaJAcDpkrzfvF4m0ckemUJkEmmXe1CN/zXjo1ThfX/mtxTkfrLJ
 ZQtYIHXYcsW1W2sdYBaTLs+jROMSxyzhy2HB/0f8LdZrt6M/Cz3VjhmHvpPTVrdXMX
 nHT5ZR8Y+nsJg==
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gengdongjiu@huawei.com,
 rdunlap@infradead.org, hanetzer@startmail.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, tudor.ambarus@microchip.com, p.yadav@ti.com,
 michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 cai.huoqing@linux.dev, novikov@ispras.ru, linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Hi3521a support.
Date: Sun,  1 May 2022 00:44:40 -0500
Message-Id: <20220501054440.2434247-1-hanetzer@startmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_224450_702048_C4DD154F 
X-CRM114-Status: GOOD (  13.45  )
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

Hey folks. Its been a while. Finally got back on the kernel dev train.
This *mostly* seems to work, but I've ran into an issue which may
require some upstream support.

Basic gist, I was attempting to boot a buildroot-built intramfs, was
mostly working, but it would not give me a login prompt no matter how
much I badgered it, so I decided to try a flash boot. That also failed,
and after much banging my head on the desk and annoying people on irc,
we finally came across *why* it was failing, or at least part of it.
The kernel parser could produce the mtdblockN partitions based on the
devicetree, but for whatever reason, when the hisilicon,fmc-spi-nor read
its superblock, instead of the magic 0x73717368 (sqsh), it read back 0x73717360.
At first I thought it was a mistake of mine, as we had tried modifying
the header, and 0x60 is a `, so it could be a hex editing issue, but nope.
Reading the data in u-boot (2010.06, vendor fork, would like to get mainline
running on it at some point) showed the correct magic, so its something
with the controller driver, I guess. CC'ing the people associated with
that as well, hopefully we can get to the bottom of this.

Marty E. Plummer (2):
  clk: hisilicon: add CRG driver Hi3521a SoC
  arm: hisi: enable Hi3521a soc

 arch/arm/boot/dts/Makefile                |   2 +
 arch/arm/mach-hisi/Kconfig                |   9 ++
 drivers/clk/hisilicon/Kconfig             |   8 ++
 drivers/clk/hisilicon/Makefile            |   1 +
 drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
 include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
 6 files changed, 195 insertions(+)
 create mode 100644 drivers/clk/hisilicon/crg-hi3521a.c
 create mode 100644 include/dt-bindings/clock/hi3521a-clock.h

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
