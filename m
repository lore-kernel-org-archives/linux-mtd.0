Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C46FC63798
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 22:43:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD0D2145D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 22:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0WVQDQF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="e0qQHq5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD0D2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Otf242o6n0pSWy3D7s5D5yjgI7JgFn4NWXyzDykrLnM=; b=B0WVQDQFrZFFSeq8qWj5x/QKYm
	Sss7TEbCn0fm0Hg+1PtqXjP6pfwiSBfAF/jZVAY4jEq+wmUGUrM5lkeXVRJPPYZT5ICDr7cubkKFs
	BRzQ1vT/dpqk8W+8bAzXSe7H9KhaVohbT/sQ8DSjfk7zJgo5SDnhN0ryTaTvduVLTqc8aZuWmqWFp
	sFlxTlUjYk6MTU6nb/Lo4VKbtL4Ny9cdB5IgXLXTWAb/Ea2aqnhA8WUbe+jRxCaacdckuAPmoacRe
	tB7GtOwMuOED8vka3vP8DDNnnlMrFZ+7gm/SVe1akGHCz6tJsmXC7hBE2fPdB0I5cWngVW/dIzvZn
	MQh+EJ1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiPxG-0001SN-61; Thu, 26 Nov 2020 22:41:34 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiPx8-0001OM-N6
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 22:41:30 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E4F8D806A8;
 Fri, 27 Nov 2020 11:41:12 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1606430472;
 bh=ibQIjtzj17Sag1ch+kvT1RM37ybLllmUOxQl9ilejyM=;
 h=From:To:Cc:Subject:Date;
 b=e0qQHq5SRfJ2t34htLIAXhzgDbjPE9INP7SlxRhQYXLueOjEfVclux+TUE+ubp/Og
 KdiEX//AyzbNNqcNeSbcTAz5G9B1mRuRano4ON4vkeNqSqIuGiEYh1PJj36PM9LCK7
 Upsq8JBs9SxR0MPpMDNqUjSU03zaMzUy6ISeNVVbekC1LRpM0belO2pWTC733jVUqn
 x51XMRlBArvuMWwdj/4kRHAW6qFdwch9arxH2mXTRhAoMYpdnYZEmL4eVYnIe6yprA
 QNzGRb6xOP3v8ousyTk7i7+DOlveHQaLPkaW8wwVdFp8qYq/m6wQQP+YLKqiLGtadZ
 KRT8ToNR9bToA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5fc02f090000>; Fri, 27 Nov 2020 11:41:13 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id BBD4713EE9F;
 Fri, 27 Nov 2020 11:41:11 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 6F1062800AA; Fri, 27 Nov 2020 11:41:12 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Subject: [PATCH] libmtd: avoid divide by zero
Date: Fri, 27 Nov 2020 11:41:08 +1300
Message-Id: <20201126224108.2325-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_174127_423525_437B9050 
X-CRM114-Status: GOOD (  18.97  )
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
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some mtd-ram devices report 0 for the erase block size. Avoid a divide
by zero when calculating the erase block count for such devices.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 lib/libmtd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 9d8d0e8..8aa1cb1 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -791,7 +791,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 		return -1;
 	mtd->writable = !!(ret & MTD_WRITEABLE);
 
-	mtd->eb_cnt = mtd->size / mtd->eb_size;
+	if (mtd->eb_size)
+		mtd->eb_cnt = mtd->size / mtd->eb_size;
 	mtd->type = type_str2int(mtd->type_str);
 	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH ||
 				mtd->type == MTD_MLCNANDFLASH);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
