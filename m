Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89287C43603
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 11:32:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2792465E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 11:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBEo+jVy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="pL9OgSTY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2792465E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NjqJCYHhSiFWuE3VDpaD3AaSrzULMYvDZNr68qdQ+Gk=; b=VBEo+jVywdU7UHtXwev3ptuljP
	yuI+wqwV27nfykkbV9Trz6RWPmqSnZ4PcC4PY1Ih3KCq2Z6Jau5BCax/HoH/7BqVeIgwxUrdw+OS8
	os48KXIL0FZUpZrWdLnHwscIpCJUz1HPyjc6Y+zLnOr5siPfRKa7I8rb4dg/zGpwOTnZjIKloysXo
	u5EZzOxuwr6Ros6BTWLuij2Nz8/aHR1eggqNupnrS+MdLebHqa/3zCqFg+fzZEOXS9iKZgKMMTZPO
	s7OfbURws+DnF9DUdQXT0LHYDYPiRuT04O6woW2hYJ1G0nu2FcHIYHX1cDoFSX6Cy+CIVuWy4JRJU
	aBVlkQVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiGWL-00009d-9g; Fri, 20 Dec 2019 11:32:37 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiGWH-000081-C8
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 11:32:35 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id xBKBW2Wu010984;
 Fri, 20 Dec 2019 20:32:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com xBKBW2Wu010984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576841525;
 bh=WGVhzVxsVRHHV9K5PX1qsTPL9sZ/TX/2a6e9iLEFkEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pL9OgSTYihHRsBMj0HJjckEVg+6jPwcYJ1MVymxrrVFMOSwkVPwH7zMi6+cqfTCpH
 waSMA/0JLXDGt1amff3gogIeH8tQIeV5TIkhEp2veEcozWQkOyN1cDfw4CG9S9mzme
 VmWg0vxUnZMBUwaYk9yc+DBk5l32sknvf8bf3mW1erkUZix5UhNzdBni865Gv6eH/c
 sH7HiR2XHewDHs29xNJCrqoBlyd3Nc+9MS6sLcsGT3qRvd3uMmk1ax8dGPrrOuQ3Q+
 J6o0e8RgsGWUsXhszV0iZoHaqDbv4dJ/MQYhcl8JCrwjZE1oWUjazczErtLbQ09cbS
 E1FDCqDymC9iw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/5] mtd: rawnand: denali_dt: error out if platform has no
 associated data
Date: Fri, 20 Dec 2019 20:31:51 +0900
Message-Id: <20191220113155.28177-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220113155.28177-1-yamada.masahiro@socionext.com>
References: <20191220113155.28177-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_033233_778909_74662682 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

denali->ecc_caps is a mandatory parameter. If it were left unset,
nand_ecc_choose_conf() would end up with NULL pointer access.

So, every compatible must be associated with proper denali_dt_data.
If of_device_get_match_data() returns NULL, let it fail immediately.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali_dt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8b779a899dcf..276187939689 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -118,11 +118,12 @@ static int denali_dt_probe(struct platform_device *pdev)
 	denali = &dt->controller;
 
 	data = of_device_get_match_data(dev);
-	if (data) {
-		denali->revision = data->revision;
-		denali->caps = data->caps;
-		denali->ecc_caps = data->ecc_caps;
-	}
+	if (WARN_ON(!data))
+		return -EINVAL;
+
+	denali->revision = data->revision;
+	denali->caps = data->caps;
+	denali->ecc_caps = data->ecc_caps;
 
 	denali->dev = dev;
 	denali->irq = platform_get_irq(pdev, 0);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
