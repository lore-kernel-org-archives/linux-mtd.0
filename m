Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FB9E77197
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOiCBTVJIy8OMh4Ia4/w+TugKmiEGb43lAxu7+A62RA=; b=gyzn+CNJLVCviB
	rCdks1cRRloBY9x9EJxdR+OGakfdJ4GRHmYRujQimTOA8zShkvBbGZ7/d7EQlGiM1rRipQfbnxSIt
	pYqxGUX/khg0Z8BwwZ0B9LQYxRJTRsdkXknWkypNsgYVapbJMBqihMIfEy5wmJdiCWzksuHxiUuSN
	zhEnoc0lqNs7NfL1OlB8R9KXm+grIS5HOquaUATQsuM6Rhixa40HhchN6+UF79eYVd7PhYHthII+T
	IfQAFU8CGEd40/uRvsk0EQdJlkJVv6sK1c224AzVLFcV0Cxqyg5dFd2VarnDzHEJL191bRHQmBzjY
	MZ0AwwmlpSpz6xj0trVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxAk-0000000CxkQ-456V;
	Thu, 09 Jan 2025 18:22:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxAN-0000000Cxfe-0DIB
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 18:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90C495C5CB2;
	Thu,  9 Jan 2025 18:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E4DC4CED2;
	Thu,  9 Jan 2025 18:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736446918;
	bh=HUYcaAi4/JV5jIQI+twydTbBnBCwCAqUNrITbpBWVKQ=;
	h=From:To:Cc:Subject:Date:From;
	b=AnUXNaFaaBq2Tpe0zeypI2dv1pFYrPHALPXewpfmppYoBPuN4l3zn4ylrja27/JcB
	 Bii2mBoHjX8hJ4QC/gxbjcNIf1unxoPJy0653d+8qoc782gI58o/abDFTyLHopXoFK
	 rj2SRT7YhB0jR0mH1U7+Y+gBXn7l3cU6qaBAryFthzyealTb6aqZ1joWvQ2rZFVDAg
	 cw4cNlUMGgqhQVvlDP+N4cNhej1WwohFnHXxz0918EUQrgcoCihXgaIhKrRBBa67Qq
	 EzlCeUIRqryLvYmsc0cidTKSuKvHEEoOMCFzMlBCEt6bRSl6visA7LIxPv7vXfSbRY
	 rsK59lcQunkWw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: hyperbus: Use of_property_present() for non-boolean properties
Date: Thu,  9 Jan 2025 12:21:48 -0600
Message-ID: <20250109182149.3971698-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_102159_127014_688C6F54 
X-CRM114-Status: GOOD (  10.81  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 217f4e69233f..60bdce4391cd 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -176,7 +176,7 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_property_read_bool(dev->of_node, "mux-controls")) {
+	if (of_property_present(dev->of_node, "mux-controls")) {
 		struct mux_control *control = devm_mux_control_get(dev, NULL);
 
 		if (IS_ERR(control))
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
