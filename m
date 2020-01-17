Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59824C33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1640E2082F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WM3IX/Zr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="PxJt/ceh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1640E2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpvCSqIMv7OPjElY1EIf7GGbmBchHshy5o9dDYDGyQ8=; b=WM3IX/ZrAZEgoZ
	TEPNBPEIkHMdLw7Yrtd36GEsTMm1lpAHMcEnI5ZlYBzehKOGj6O3/SRGejkoA9VLUv6I5aQ3epF2s
	0AOtSPM3EwMrS9jqUr5U/G8XKfwCfyWVPmeFi4EHz8fspa7URHLqwxCNhg0TVBBtkKdYzP0hSuPZ8
	yYXWTd02Ld2j5yWrYEmDRoEZe/xjXkvZFeJx8VtD1gLGjhkR7bw9cSK+Da7KjRHpibCUUIMa8LyTT
	vhIwdBa6nK7nPC7IQ44vMEVDePyHSZJxsHQFRJlz3PyxCr/IfTACiwzTL3uZIyNZiteSsYIRqppJS
	xDqjk2Q7yFaA7wp+g0Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isXsV-0001yO-Gu; Fri, 17 Jan 2020 20:05:59 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isXsH-0001oQ-3f
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 20:05:50 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id 4DADBAB870;
 Fri, 17 Jan 2020 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1579291492; bh=xCGrTy0HVPAotxr0/+n4SsgbLUiKQHIExIJ8+yhvuBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PxJt/cehWVZ08wPGe6GCrLvLxXMBYbDmadtfAUILLc9GpY9gXhCNuiigqc5k7/8hF
 EbkBjOc3QSKNqg9dgklyomCvlsSlXzrKnROZ7D82DzCldn7IByUgN1eDqoOxB0F+/w
 9OsRcU4HqbvDP/sC/+MNIsYbvwL6TH7zLobtt5H6M3W6bVLy+A1zOujkeo4FaF/EJG
 WLvkQA63lrvP/HRge9JNjvvwD2fWX7FRc8t6pkTxC1DiHZACTJb4rQ84VX8wYbLUKl
 cvbWe2PkDi134iI5UJpQ54oSgZ8YGAZT0Bejt2Wgw4rbtBrgG92oOcx7kVu5JmH/hV
 SNxObh0rNoJ0Q==
From: Esben Haabendal <esben@geanix.com>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/2] mtd: rawnand: gpmi: Restore nfc timing setup after
 suspend/resume
Date: Fri, 17 Jan 2020 21:05:37 +0100
Message-Id: <20200117200537.9279-3-esben@geanix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117200537.9279-1-esben@geanix.com>
References: <20200117200537.9279-1-esben@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_120546_011301_001A0F28 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As we reset the GPMI block at resume, the timing parameters setup by a
previous exec_op is lost.  Rewriting GPMI timing registers on first exec_op
after resume fixes the problem.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 879df8402446..b9d5d55a5edb 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2727,6 +2727,10 @@ static int gpmi_pm_resume(struct device *dev)
 		return ret;
 	}
 
+	/* Set flag to get timing setup restored for next exec_op */
+	if (this->hw.clk_rate)
+		this->hw.must_apply_timings = true;
+
 	/* re-init the BCH registers */
 	ret = bch_set_geometry(this);
 	if (ret) {
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
