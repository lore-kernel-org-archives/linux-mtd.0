Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EFFC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 10:05:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4D0205CB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 10:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qThrkR1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4D0205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gxmDzUiek7dIbtWWUUkTluxFc9ivsS1D1N9rN0g5hA4=; b=qTh
	rkR1GIbcqEx+0ampFAO508/71sSI6fj8Q3w7MohkENXtmzZEttas4+Ezx33HPecKn0hpDKkgZd7K0
	BU9NpHIUIbXeon1Vi0jckb5D/vKfhxE31LGU35FiGFsXZZpmmPKyedkbhxuSWf2xWvZwbg1Yk8j3I
	0vjyvFIGyV3YNTlHe0u+boM92DnLTO+5oMpomqsveIaRMEi9dlkEkAPG/zogBQndzIOf6v5tKtieT
	eLTIK2377K5IuZ6C2jTVLlyxLa+98gqEiSUYZ4Ee3gEn99JWyD0F/hd/bDAVLPuX7JJVjSPvVnPNp
	rXKq6nmyTl6HG76H5h1Oo8mgx6W4O4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc4Yb-0006lZ-Pl; Fri, 22 May 2020 10:05:37 +0000
Received: from mail.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc4YY-0006kw-WD
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 10:05:36 +0000
Received: from localhost.localdomain (unknown [222.205.77.158])
 by mail-app4 (Coremail) with SMTP id cS_KCgCnNAjgo8de57cAAg--.58484S4;
 Fri, 22 May 2020 18:05:24 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] mtd: spi-nor: Fix runtime PM imbalance in cqspi_probe
Date: Fri, 22 May 2020 18:05:17 +0800
Message-Id: <20200522100520.22130-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgCnNAjgo8de57cAAg--.58484S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyrGrWUGrWxtw15Jr1kZrb_yoW8XFWDpr
 48XFy7JF40v39Iy39Fy3WDXFyavFyfXayUGrWDK3Z7Z34rJa4UXr4rta4ftF1kJF1kXa15
 AFZ7A3WxZF4FyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxE
 wVAFwVW8twCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r
 4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VU8jFAJUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUIBlZdtOQgrAAIsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_030535_336201_1C6947A5 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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
Cc: Thor Thayer <thor.thayer@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When devm_reset_control_get_optional_exclusive() returns
an error code, a pairing runtime PM usage counter
decrement is needed to keep the counter balanced.

Also, call pm_runtime_disable() when pm_runtime_get_sync()
and devm_reset_control_get_optional_exclusive() return an
error code.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index 494dcab4aaaa..eabdf01e0d08 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -1377,6 +1377,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(dev);
+		pm_runtime_disable(dev);
 		return ret;
 	}
 
@@ -1390,12 +1391,16 @@ static int cqspi_probe(struct platform_device *pdev)
 	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
 	if (IS_ERR(rstc)) {
 		dev_err(dev, "Cannot get QSPI reset.\n");
+		pm_runtime_put_sync(dev);
+		pm_runtime_disable(dev);
 		return PTR_ERR(rstc);
 	}
 
 	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
 	if (IS_ERR(rstc_ocp)) {
 		dev_err(dev, "Cannot get QSPI OCP reset.\n");
+		pm_runtime_put_sync(dev);
+		pm_runtime_disable(dev);
 		return PTR_ERR(rstc_ocp);
 	}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
