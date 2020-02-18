Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB66C34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 10:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4BB521D7D
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 10:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PVjxpFov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4BB521D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MGIjvb+IVHQl7R4PT5VeC46SH4VIgdmYP0kDDQgx9NE=; b=PVjxpFov8OOmZY
	Tm36Kv1QwPHodMi21xhsU7fAM6NzYPY2dByHnPIcMtdePdmBw2LtwVDBW21NQsundMtKGH+4skDG/
	orshfJUbvw7l6guyPzEBtJQdVxw6wykCO37tJ28N/Bs6ps1XZoyP/QzHD8ohADEESffndGypKVEWS
	4PCgBhEILtQoaTwiLtlrEGDc1RuBArRG8/CycWMBQLTDHH/Awx1YrwL4LMwXtHlvYmR4j3bovGGMz
	HJPXp9KeihBbvps1r/vj8Z5R08pGZc5+eTHpZU4Yy8CLfYMNaXcUiVIltpj/qN8gtzblc5V69ie5N
	A//8KoWv8TJ2Cdr8qd2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3zkh-0004Cs-Fz; Tue, 18 Feb 2020 10:05:15 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3zkb-0003cP-4f
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 10:05:11 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id C294467A8C9;
 Tue, 18 Feb 2020 11:05:05 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 18 Feb
 2020 11:05:05 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Tue, 18 Feb 2020 11:05:05 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <bbrezillon@kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Jeff Kletsky <git-commits@allycomm.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/3] mtd: spinand: Fix reading and writing of bad block
 markers
Thread-Topic: [PATCH v3 0/3] mtd: spinand: Fix reading and writing of bad
 block markers
Thread-Index: AQHV5kLklyjvbjA0n0+NOcSxtTmLCw==
Date: Tue, 18 Feb 2020 10:05:05 +0000
Message-ID: <20200218100432.32433-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: C294467A8C9.AC44A
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, git-commits@allycomm.com,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_020509_368443_B6901762 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

We were pointed to the issue of bad block markers not being saved to flash on
one of our boards with SPI NAND flash. After a bit of investigation it seems
like there are two overlapping bugs in the original framework that cause silent
failure when writing a bad block marker.

This set contains fixes for both of these issues and one more fix (patch 2) that
should not affect the actual behavior of the driver.

Changes in v3:
 * Patch 1: Correct "SPI MEM" to "SPI NAND" in commit message
 * Patch 3: Fix the subject line and the commit message
 * Patch 3: Add Boris' R-b tag

Changes in v2:
 * Patch 1: Incorporate small improvements proposed by Boris
 * Patch 1: Add Boris' R-b tag
 * Patch 2: Add Boris' R-b tag
 * Patch 3: Instead of waiting for the erase operation to finish,
            just don't do an erase at all, as it is not needed.

Frieder Schrempf (3):
  mtd: spinand: Stop using spinand->oobbuf for buffering bad block
    markers
  mtd: spinand: Explicitly use MTD_OPS_RAW to write the bad block marker
    to OOB
  mtd: spinand: Do not erase the block before writing a bad block marker

 drivers/mtd/nand/spi/core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
