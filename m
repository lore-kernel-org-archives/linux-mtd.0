Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE40AC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 02:59:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA3B20774
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 02:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FLnl4rpp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2eTvr2el"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA3B20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=II9f8+jM1DbBUim6mfcAmIdjFGBrmCKWEO+Bfjx+wL8=; b=FLnl4rppF0uS8zNsTLQh+mB9iX
	QeZoEZ4wL0GViePgaMz+ErXr5hf6DnPqU3KfN2SZiY+7/UNdhzYcGpmhjXoTU0dFQiGgN9b58jXxF
	v6N6nXrHBjs+FfeheOV0N0m6Pn7XsA+rEQJFoj0wrojeYaZwI+8FuonKajH2CBQuEN6NDtOsT5QzN
	CwdGKFHt3kOZdYV/FP8XCGiHr3J5HEvvrAVUD0I9cK6tV0CKEr/ts63Nd0yToshXhpcv1c4lZ6/dE
	042PJaMXNJ8z3niqzhu0aZADm9rmPpreRwA8Vl5gUpbxGrm0/RMzRvP8pCQooY5b7wQs4m3W46DMl
	69aU4abQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA2gX-0007nN-8X; Mon, 24 Aug 2020 02:58:17 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA2gT-0007mT-1D
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 02:58:10 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1903B891AF;
 Mon, 24 Aug 2020 14:57:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1598237870;
 bh=o4lNcSIrdI/eNUWihGfzjOy8zXW6NxDz/kki0266Xb8=;
 h=From:To:Cc:Subject:Date;
 b=2eTvr2el0/SDY1f2lyA/zMSW5cnGuDa+Q93ZQTu1MufoMVf7qJCsJNScgcg4B3T1v
 ca20fPMSUoOnt6Q7/s7zuzuu7xY1zdSsymbmW+Z6ZEZ3daoxtZHahaNbKa0P30tHnb
 2tHKydqD4knI+ngki+Jh2SkwFBDM5tPJ1tNH853o+NrnBdQmA89qR4mFbhNfLvmZTv
 OiwiaRLytYVCqmh7j7oyb+EisX3SQxZ45wLEtpC2brwHQcADJvO6cjFn6lPl5OmxGb
 /5lCFqExOomFTcR58iKHL2c1RaOU2/OAL1qg0kqXharwpisQx8Tb5YHwLofg3qGL9+
 O2W7o+XJXvTzA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5f432cae0000>; Mon, 24 Aug 2020 14:57:50 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id 125C013EEB7;
 Mon, 24 Aug 2020 14:57:48 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 29427280032; Mon, 24 Aug 2020 14:57:49 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Subject: [PATCH] mtd: maps: physmap: Retain mtd-name property from dts
Date: Mon, 24 Aug 2020 14:57:44 +1200
Message-Id: <20200824025744.25992-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_225809_813717_E3A87FBF 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In physmap_flash_of_init() the maps[].name can be populated based on the
optional 'linux,mtd-name' property in the dts. Make sure this is
retained when filling in the rest of the map[] data.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/maps/physmap-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 8f7f966fa9a7..6372197ad865 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -515,7 +515,8 @@ static int physmap_flash_probe(struct platform_device *dev)
 		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
 			   res);
 
-		info->maps[i].name = dev_name(&dev->dev);
+		if (!info->maps[i].name)
+			info->maps[i].name = dev_name(&dev->dev);
 
 		if (!info->maps[i].phys)
 			info->maps[i].phys = res->start;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
