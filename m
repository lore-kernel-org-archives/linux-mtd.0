Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7346AC282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459BF2084A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e0ayhahl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459BF2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FljrUF9Xk2l6p3GNCJo+ZKO7+NFudLdbeB156CS1J4Y=; b=e0ayhahlmUoYYh
	huqVBCbqlpTWRmZUuVmUe/WlFei02Fs4hmRvkzpAEYjrltwRTfqOw3eeQJuG/CW8QpWhw0/IrGdGS
	X165kJGntcGdYDVKpf2eywzHHB1FHB4rXsZKWkmL/ngjUwMj5LQdbCT2Ys0CODTfPevC+8spSRicc
	+hP+ZFDVIt2ItV2RR4vpOXzGWHWRnmEEjIEI7OiCyr4e/s0UWN/+d22wl074Ow5hSk/Msju2DxNFT
	mv+5+BgHuqyymfIIbIdcYap0LLEiaZFAH8qnWtJEE3fcLlNWFPI/I2csGFXsBoIuOaU9pAz2XY55K
	evZiJjpAODtzAn+moL1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glu9U-00034L-Pn; Tue, 22 Jan 2019 11:23:32 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glu9R-00033d-75
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 11:23:31 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id AA01767BC89;
 Tue, 22 Jan 2019 12:23:23 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 22 Jan
 2019 12:23:23 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Tue, 22 Jan 2019 12:23:23 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] mtd: rawnand: Support bad block markers in first,
 second or last page
Thread-Topic: [PATCH v2 0/4] mtd: rawnand: Support bad block markers in first, 
 second or last page
Thread-Index: AQHUskTiZRErDsCrDEO9QpZop6Kcxw==
Date: Tue, 22 Jan 2019 11:23:23 +0000
Message-ID: <20190122112258.20042-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: AA01767BC89.AEA34
X-SnT-MailScanner: Found to be clean
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: boris.brezillon@bootlin.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_032329_582609_0F88ED2A 
X-CRM114-Status: UNSURE (   8.28  )
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

Some ESMT NANDs are known to have been shipped by the manufacturer
with bad block markers in the first or last page, instead of the
first or second page.

Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
first, second *and* last page needs to be checked.

Therefore we make it possible to set NAND_BBT_SCAN2NDPAGE and
NAND_BBT_SCANLASTPAGE at the same time to scan/set all three pages.

This series also contains patches for AMD/Spansion/Cypress and ESMT
chips to enable both flags at the same time.
---
Changes in v2:
==============
* Rebase on 5.0-rc1
* Add patch to move bad block marker position info to a common place and
  rename/prepare existing flags
* improve/rename function nand_bbm_get_next_page() to use new flags
---
Frieder Schrempf (4):
  mtd: nand: Always store info about bad block markers in chip struct
  mtd: rawnand: Support bad block markers in first, second or last page
  mtd: rawnand: ESMT: Also use the last page for bad block markers
  mtd: rawnand: AMD: Also use the last page for bad block markers

 drivers/mtd/nand/onenand/onenand_base.c |  2 +-
 drivers/mtd/nand/onenand/onenand_bbt.c  |  2 +-
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
 include/linux/mtd/rawnand.h             | 16 +++++++
 15 files changed, 100 insertions(+), 62 deletions(-)

-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
