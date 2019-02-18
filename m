Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA29FC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 10:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933082147A
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 10:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPABY4fr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933082147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k/c+u6ie0IMZ7f31hZoaRrDi2wzvvdYrroV9k/cPheo=; b=IPABY4frcE4xis
	AcsiOAnmGd0eD44Oj46huGfPqfeSV+DfR3nBPwhEnBTyecZPwH0y8sPBwqHCvRK9qdnUF/tT7izRV
	rtUAXij3L29O9lSCLgf/2oSO2IeauJytAKRWFa8vr22oUlXEEBAVIhZSbRuG4Bza8uiRIunvDv3GH
	uSqBK2g7Zp9P6NU3bS6vHpsHsg+43moi6xqdsM54AlJlIZWkKZX6kELXeuPAf7henlZXMGTdbdJOI
	tzpomEOaUPgH4Q3Ew+doQMOtpdRxdEYVWPLZKVtJUGNa3a1Ujh12btYBxGi134FkrK01XE4Jkgq3v
	YiBMU1tzifsqY6Kn4AeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvgNj-0003gf-3e; Mon, 18 Feb 2019 10:42:39 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvgNb-0003fs-8k
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 10:42:33 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 6A949600387;
 Mon, 18 Feb 2019 11:42:18 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Feb
 2019 11:42:18 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 18 Feb 2019 11:42:18 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/7] mtd: rawnand: Support bad block markers in first,
 second or last page
Thread-Topic: [PATCH v4 0/7] mtd: rawnand: Support bad block markers in first, 
 second or last page
Thread-Index: AQHUx3aePo7JMrWUtkuj0rXSuXPgHQ==
Date: Mon, 18 Feb 2019 10:42:17 +0000
Message-ID: <20190218104122.18788-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 6A949600387.AC325
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_024231_632846_76EA7F9F 
X-CRM114-Status: UNSURE (   8.54  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Schrempf
 Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Currently supported bad block marker positions within the block are:
* in first page only
* in last page only
* in first or second page

After some cleanup and preparation in patch 1 and 2, we make it
possible to set NAND_BBM_FIRSTPAGE, NAND_BBM_SECONDPAGE and
NAND_BBM_LASTPAGE independently of each other (patch 3).

Some ESMT NANDs are known to have been shipped by the manufacturer
with bad block markers in the first or last page, instead of the
first or second page.

Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
first, second *and* last page needs to be checked.

Therefore in patch 4 and 5 we set all three flags for
AMD/Spansion/Cypress and ESMT chips.
---
Changes in v4:
==============
* Move onenand changes to separate patch
* Add missing badblockpos field to onenand_chip struct
* Move cleanup of badblockpos field and flags to separate patch
* Move assignemnt of badblockpos from onenand_bbt.c to onenand_base.c
* Fix incorrect usage of bbt_options in nand_bbt.c
* Add R-b tags

Changes in v3:
==============
* Fix bit offsets for new flags in nand_chip->options
* Move separation of flags for first and second page markers to a
  separate patch
* Fix cover letter
* Fix S-o-b tag
* Add R-b tags

Changes in v2:
==============
* Rebase on 5.0-rc1
* Add patch to move bad block marker position info to a common place and
  rename/prepare existing flags
* improve/rename function nand_bbm_get_next_page() to use new flags
---
Frieder Schrempf (7):
  mtd: rawnand: Always store info about bad block markers in chip struct
  mtd: onenand: Store bad block marker position in chip struct
  mtd: nand: Cleanup flags and fields for bad block marker position
  mtd: nand: Make flags for bad block marker position more granular
  mtd: rawnand: Support bad block markers in first, second or last page
  mtd: rawnand: ESMT: Also use the last page for bad block markers
  mtd: rawnand: AMD: Also use the last page for bad block markers

 drivers/mtd/nand/onenand/onenand_base.c |  5 +-
 drivers/mtd/nand/onenand/onenand_bbt.c  |  3 --
 drivers/mtd/nand/raw/internals.h        |  1 +
 drivers/mtd/nand/raw/nand_amd.c         |  8 +++-
 drivers/mtd/nand/raw/nand_base.c        | 64 +++++++++++++++++--------
 drivers/mtd/nand/raw/nand_bbt.c         | 28 +++++------
 drivers/mtd/nand/raw/nand_esmt.c        |  9 +++-
 drivers/mtd/nand/raw/nand_hynix.c       |  4 +-
 drivers/mtd/nand/raw/nand_macronix.c    |  2 +-
 drivers/mtd/nand/raw/nand_micron.c      |  2 +-
 drivers/mtd/nand/raw/nand_samsung.c     |  4 +-
 drivers/mtd/nand/raw/nand_toshiba.c     |  2 +-
 drivers/mtd/nand/raw/sh_flctl.c         |  4 +-
 include/linux/mtd/bbm.h                 | 14 +-----
 include/linux/mtd/onenand.h             |  3 ++
 include/linux/mtd/rawnand.h             | 15 ++++++
 16 files changed, 104 insertions(+), 64 deletions(-)

-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
