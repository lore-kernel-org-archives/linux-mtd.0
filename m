Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017A9EDA694
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAkQ7a/6yj0AH90yQaMTLVRwkVC6IgZ83+l12aBZ8iY=; b=zqt+I65tBjk8vP
	uyr2sPiN78ar/bi0xhh6xZ5byJPDZq4N1S767ZOKCc/KpxiBG+MTW+ScLgM4DHrRxu4pxBwNsACHT
	jZIoVqPmRtq70MDPRYjXTtA0GYmmufameIqbgJBQpyYXx38HYDqTL0KIpX4V994l4a4kGgUXhVe1p
	ihfDVSl+NwoakrsvIUawrYq0zHAYHF1+bQpH3FlrK1PAO83mZahRR0sPtFZXrI2fmP7OVo/pICchl
	YDcOSM+97v6MYjc8OVYDhv32BGCAYKR3Fhu8t1/eop+t3VTv2bTctseX35Zqyhs2BRGRFC1Oo4KiO
	wSLQ/Pvhm3qr7IQoVm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdO-0000000FZMJ-36ay;
	Tue, 03 Mar 2026 16:30:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdN-0000000FZKE-1C0k
	for linux-mtd@bombadil.infradead.org;
	Tue, 03 Mar 2026 16:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0jEzN+ZbuPiy2X43ltzsOH8xhPtq3QTkuVtmlsPHM9I=; b=PRyAuUf6OoB3uafACOUmFE03jo
	JHboLm++0SFf9QiqOlmU1nTU6LmtPMYAYKNa4mSfZaWuOAL10wHOq9eq5u3aFGNQGFgjKQMcGDt01
	iry++Er9N9DZSO0IqT08QRg5rI3C4cMxp9TvLs031Wfz2Y4sttV6DFdMYx4LshtPhnDVZj2ctuPxy
	ICuWWS7YQhzUtO4dGe2eX8DlT+I8Ku6jbrWokf1xGwfw8H/EE7qNKU2/dx5vODn94+3YqYqZSJyQ1
	5WGfOqo82ST2acXewEGaHdQQe/FzOp+TGlHJkvFpFXM14D3Jb2X9kLMIgbOwLg/9AaL/m1WDx76Bn
	Wduu0axg==;
Received: from mail.fris.de ([116.203.77.234])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdJ-0000000Bnad-3x1d
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:30:07 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jEzN+ZbuPiy2X43ltzsOH8xhPtq3QTkuVtmlsPHM9I=;
	b=uh8WI7mG1o6aI/mjEFxWTylQAQHFKTSjYQ96O6N7o74Oo8x/T7qAALbKOm4Fn3qWQ3z3EA
	dfVXtmnGsKr6kRsxyhIL07ctqko0sq8dVVW3l6sIZctd0O0VuTEU6WYjKPngwiGvhQfJyc
	ijO04WpWy1+rMVySo93grJ5edJATcvU8CzFTfZyhog53+knXMm4/buPCNyPZ6Nh2T1DvyM
	28h89o48kWGG7Mffxn07dXfFk/4jmawRLZ5NLEkNRxDdZzXkoz3mD8bvv9XDJUEuZSdFPa
	qXa73xU0NW8g8Ot8i/88+gvV2IJSco/Sujdvnq7X0T4QzjyAsjkCzv3NwbemfQ==
Date: Tue, 03 Mar 2026 17:29:27 +0100
Subject: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point() for
 each op
MIME-Version: 1.0
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Han Xu <han.xu@nxp.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=LwNCpqII5STHerKJFGgtW51z+gveZ5FdSLV1sPEkDaQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T1P05w+c/q8f1HEL/z9e/rvzbY+NyWeGXpP/6wQ/3
 bgsUW7ZUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJHcOIb/HoluqStOqzE3b4qy
 +nDB45R3uEPozJs2q9cbHDpUoaH4lOGvoJtN7NmJf64wx6T4qTF9z9qRK2F/MEEjoXFpik9k1EU
 WAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163006_199251_ABDFEDB4 
X-CRM114-Status: UNSURE (   6.89  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

With clock rates changing on a per-op basis, we need to make sure
that we meet the RX sampling point delay constraint of the underlying
SPI chip.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/spi/spi-mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index a09371a075d2e..6b8bee7d6f5e3 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -589,6 +589,8 @@ void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
 {
 	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
 		op->max_freq = mem->spi->max_speed_hz;
+
+	op->max_freq = spi_set_rx_sampling_point(mem->spi, op->max_freq);
 }
 EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
