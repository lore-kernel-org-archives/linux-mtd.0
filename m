Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18162E77188
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2025 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D2PhOyp4tjriBcrpSmQw5XBQhJ52fcfHv1wjvWXUb8A=; b=bnrkwXT1/NR4Mg
	eOx1IuRWYha3gfWStno39KEt9BHf5pkWIk0ypcekxsVRY4sBBbhs0QpwC7zlmlSSKeuLi7TxADfYJ
	yutpdyPCchJ6Y6Lfcj9Zvc4aFI8gAq6lWa5kTgIWPkYH/ONZEFl7I9zrXtS++7dM/7Q2QE63JvJ0J
	Qf3mLMRuumuHwF3XqelaDkiDDsQYGBPJvdqW8lqRgglTYHGx4RoABfso+nkePaFJWPTiX/IVq7KwJ
	KZXWeMJ7NY8sQyINgqgZThRGIweBxfLnLpNubhTv42bWGamcxPkfp8uisCCcp0I4zkjQ4+nuiOO3+
	eMRzj1xrPG9/rWSKWhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcon-0000000CRFJ-2EM7;
	Fri, 03 Jan 2025 08:14:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcoj-0000000CREp-3SI2
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jan 2025 08:14:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F2B720003;
	Fri,  3 Jan 2025 08:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735892036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fOxLl3JdFX4IELuFKgWw+PeYYO1bQeEIihumJcyavt0=;
	b=NDvXwsYOUZR0PtMI0sk34jgoNty37h9+smr1Z9DwjljyuGSQ4G4f9ULQFWhrHkJF6lzWDz
	K09HxJvKVayFO4filMMzjrBVpdI9PqbE3L5/gvCo5xLeTYBLvM06xG2E4XS2VczuNJdPXh
	tYUJ7pEz6q6SmoiTLZ01EXNxNyfUeM3UJrK0By/z0ZWtJ6BmwHCMhd0JUpazXIXNGY9IKN
	n6VLXCnIay5Wx7jx9LxfyBwRphWesjYGbfdHPKv00HHF05bI4JeH9ccuLwGj4VT5wY8ET/
	CAWScUSPrrYyOWJk65E39kziBdncwmcklX02V7MP+hgTTgk8Cc1cHK4UPLK3jQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Fri, 03 Jan 2025 09:13:49 +0100
Subject: [PATCH v3] mtd: rawnand: davinci: Reduce polling interval in
 NAND_OP_WAITRDY_INSTR
MIME-Version: 1.0
Message-Id: <20250103-patch-nand-poll-v3-1-c85ca7bc54bd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADycd2cC/4XNTQ6CMBCG4auQWVvTGSn+rLyHcVHKVJpgS1rSa
 Ah3t7BzYVy+XzLPzJA4Ok5wqWaInF1ywZc47CowvfYPFq4rDSSpRsKzGPVkeuG178QYhkG0hOr
 YNKylJihXY2TrXpt4u5fuXZpCfG8PMq7rbyujQNFIxcqislTraxvCNDi/N+EJq5bpj0BFMOYkN
 TLXLO23sCzLB9DHCuXyAAAA
X-Change-ID: 20241219-patch-nand-poll-b215766ea0a2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Christopher Cordahi <christophercordahi@nanometrics.ca>
X-Mailer: b4 0.14.2
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_001401_999940_2ADB6E6A 
X-CRM114-Status: GOOD (  10.82  )
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

For each NAND_OP_WAITRDY_INSTR operation, the NANDFSR register is
polled only once every 100 us to check for the EMA_WAIT pin. This
isn't frequent enough and causes delays in NAND accesses.

Set the polling interval to 5 us. It increases the page read speed
reported by flash_speed by ~30% (~10% on page writes).

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Changes in v3:
- Set poll interval to 5 us (instead of 0).
- Link to v2: https://lore.kernel.org/r/20241219-patch-nand-poll-v2-1-cc80a1ee4e0f@bootlin.com

Changes in v2:
- Fix SOB.
- Link to v1: https://lore.kernel.org/r/20241219-patch-nand-poll-v1-1-605e5f15f24a@bootlin.com
---
 drivers/mtd/nand/raw/davinci_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 1f8354acfb50b2f4d155cdfc03afcf2863539f66..1a6c3b02a2c503f89ed54d557c6d181b68ce0fc8 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -724,7 +724,7 @@ static int davinci_nand_exec_instr(struct davinci_nand_info *info,
 	case NAND_OP_WAITRDY_INSTR:
 		timeout_us = instr->ctx.waitrdy.timeout_ms * 1000;
 		ret = readl_relaxed_poll_timeout(info->base + NANDFSR_OFFSET,
-						 status, status & BIT(0), 100,
+						 status, status & BIT(0), 5,
 						 timeout_us);
 		if (ret)
 			return ret;

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241219-patch-nand-poll-b215766ea0a2

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
