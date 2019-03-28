Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DADC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF0D206DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 04:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/keRk1g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="B53CFVYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF0D206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1c1DGmVF4D2DQ5ALmmJvWe0/aae349FgRMQ5anCRTk=; b=B/keRk1gxSFeQq
	/K3aoVfKY+/VW6dDVBDdEBdujvtXo4rnPVEBuiXiacgaTSjyqrBnbI6ueURgJcq7kUicI+S+QrOEy
	LlBv1Bvm1oDHFbRdBLe3IjT7aGVBgKSshO3sCNHHK25XTyH3jI0/yuB+jvXStQdvGIP6qQC6G4bLU
	s1d5uonhKv1BQIfa5azkoUX9yeP8qEWTxXzMWc4eR6HImkLbUvel8UpPBrH96ustwcajPPmz0PjyJ
	45NWNLyL6h65OHZTy2yOhreVmJsKbZSJzG99pyMWVnCjF6fAq1W7sXhMh/nWHAhexsS6TTqmD4g3s
	T9E9qvswaE7UAm2JxZBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9MFc-0007ve-RR; Thu, 28 Mar 2019 04:02:48 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9MFR-0007ox-2S
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 04:02:42 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BFEE5886BF;
 Thu, 28 Mar 2019 17:02:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1553745749;
 bh=7IcM2Np2Jw4fpk2C/09grz5DMdqX5tTC/aOPJS4KOM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B53CFVYclhm3ZCBLLzIwRklIXnQFGeaEAgH78/SufXW+v8wEPHmGVKEO81GBfDKxf
 Ixhd+PlpdLtpWDgIxurXtTc8HWMQbnAXCtkmQNndrwm5AlAQzJJAO8QzXls032tDoW
 BfS/P9ZFjNApaLLKtjDRNGeQadyt9NN4sL4hUFhlOHRhchVxji3K//QQMuuTHO2WMO
 D/BvbscGqzGVdJdd6z5aPWxK5ykM4JJVfot6Dn4wkzHxLJUI+uchrto7Uo23UA2HVs
 WolF3/yOnlo9S68VAi78A5TIbJNI/kjV+if0z51SbX+HTm+JI3LosS06fSbzuq+TwU
 lqG+cWT0i+hsA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5c9c47510001>; Thu, 28 Mar 2019 17:02:30 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id B236013EF08;
 Thu, 28 Mar 2019 17:02:24 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 9029A1E1124; Thu, 28 Mar 2019 17:02:24 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [PATCH 1/2] mtd: maps: physmap: Store gpio_values correctly
Date: Thu, 28 Mar 2019 17:02:15 +1300
Message-Id: <20190328040217.1895-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
References: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_210238_295008_AF9F6674 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When the gpio-addr-flash.c driver was merged with physmap-core.c the
code to store the current gpio_values was lost. This meant that once a
gpio was asserted it was never de-asserted. Fix this by storing the
current offset in gpio_values like the old driver used to.

Fixes: commit ba32ce95cbd9 ("mtd: maps: Merge gpio-addr-flash.c into physmap-core.c")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/maps/physmap-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index d9a3e4bebe5d..21b556afc305 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -132,6 +132,8 @@ static void physmap_set_addr_gpios(struct physmap_flash_info *info,
 
 		gpiod_set_value(info->gpios->desc[i], !!(BIT(i) & ofs));
 	}
+
+	info->gpio_values = ofs;
 }
 
 #define win_mask(order)		(BIT(order) - 1)
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
