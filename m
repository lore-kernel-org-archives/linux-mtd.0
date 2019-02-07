Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_ADSP_ALL,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2133EC282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 23:58:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7E921721
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 23:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HFijk4Al";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="cYRZ0v5d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB7E921721
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6jYExiYiXFpoE+17tLkDnzF6H6rsFLnhDOenTc5tv5Y=; b=HFijk4Ald5aq6e
	Cx2myvF/NRix0hHHhXls8H8NuSnV4cRlMQFH6QhJFvO32JQn2VhqG2oK/8WkEl4LzzS3Yhb69Rwjb
	DfCyVID8/TM7tAtnVPbPwrvAuPrH0FeDQLSFu9BPTwvfXZNmSr7m9mambAAM613nM3nha+b8dS4g9
	u0epfzrc7Yo0T8X/SW/kVtgWle7/5FDxGEIhges8ISTuexKJlTwow9YWpBnoWx6krypEx/vExBaI1
	ZXtEjJ9gmoXj8j7k1DS9Xd3KzghkIrH4W9Ob3XdjDPw1NqvZNwhpAo9lBkprINw5PyjwLG63Q4PXI
	3TLvGtGztl94EWYLqfRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grtYc-0006Uo-RI; Thu, 07 Feb 2019 23:58:14 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grtYZ-0006UN-9z
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 23:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1549583891; x=1581119891;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mnyf8p+HNXO+HAyAnTN+Ruco2QnGclwwxib3/x2rngQ=;
 b=cYRZ0v5dfvS7GOEqLLF64udIuzfHetMDGTRPPhhfoOXrDNNvlpx+jbyD
 PlN5Pra0SuEME0qSfqRYWvn+oUDnehpoTS5YdiI5MvhZRqFe0/AdCMOnB
 C8/M7WMGovO8/WPLBpZGIbEwPkr9htiJ8Lh63bBgboClktXgUyHINiIaP A=;
X-IronPort-AV: E=Sophos;i="5.58,345,1544486400"; d="scan'208";a="781582587"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Feb 2019 23:58:09 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id B82C4A231D; Thu,  7 Feb 2019 23:58:08 +0000 (UTC)
Received: from EX13D07UWB002.ant.amazon.com (10.43.161.131) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 7 Feb 2019 23:58:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D07UWB002.ant.amazon.com (10.43.161.131) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 7 Feb 2019 23:58:07 +0000
Received: from dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com (172.22.49.115)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 7 Feb 2019 23:58:06 +0000
Received: by dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com (Postfix,
 from userid 5078557)
 id DAD1547151; Thu,  7 Feb 2019 23:58:06 +0000 (UTC)
Date: Thu, 7 Feb 2019 23:58:06 +0000
From: Przemyslaw Sobon <psobon@amazon.com>
To: <bbrezillon@kernel.org>, <Joakim.Tjernlund@infinera.com>,
 <linux-mtd@lists.infradead.org>, <chris.packham@alliedtelesis.co.nz>,
 <fbettoni@gmail.com>, <ikegami@allied-telesis.co.jp>, <liujian56@huawei.com>
Subject: [PATCH] mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Message-ID: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_155811_410829_90D07F67 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: psobon@amazon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to
       check correct value)

There was an endless loop in CFI Flash driver when a value was written
incorrectly. In such case chip_ready returns true but chip_good returns
false and we never get out of the loop.

The solution was to break the loop in 2 cases, either device is ready or
device is not ready and timeout elapsed. The correctness of the write is
checked after the loop ended. That way we ensure the loop always ends.

Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 72428b6bfc47..6cc31d2057e9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1879,15 +1879,18 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
 
-		if (chip_good(map, adr, datum)) {
-			xip_enable(map, chip, adr);
-			goto op_done;
-		}
+		if (chip_ready(map, adr))
+			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
 
+	if (chip_good(map, adr, datum)) {
+		xip_enable(map, chip, adr);
+		goto op_done;
+	}
+
 	/*
 	 * Recovery from write-buffer programming failures requires
 	 * the write-to-buffer-reset sequence.  Since the last part
-- 
2.16.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
