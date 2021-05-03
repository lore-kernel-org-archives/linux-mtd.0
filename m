Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69978C43461
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 15:58:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0FC4610C8
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 15:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0FC4610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVBid/yHym9ZuIBiHWp6bvCx9MS3dirdT/lygw+olgM=; b=py70s0Ukz5Y7NrYC1RrIUo83Wv
	XEf52VynTRBLQZE5MZWZm34p12ECIFqqmnATo3YMwv1gasr4xVMIRUpUZEU/7H6UFmVTn8mlWliKy
	cff26dX2av0gxitW+XGtsSH1FWPbDOn4hWFWqWdNp/ucxfkS7yDeRaPnGeKpiKgu8/23FsLOTla5U
	XZj8txjnTufS1t++0SiQix724kGpYHMpsVvrJqKfsS0V3aNWyxwz6pFym4tIFRmPVtm5GZs56VGQv
	H7u2HzsVp5wSbPgk6AABobHjzP7BS6571s5NjXkZd6/GMz4Fuem5T0I0hGtWo8QZGVAwVMOBS3bzl
	RFIjaeAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldax2-00EJdG-EK; Mon, 03 May 2021 15:57:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldawX-00EJae-35
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 15:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9KttZtarF6opM3O8v0iI0WEtIdwrMkc9FPFepsHdxOY=; b=oFl5msXZIIRbbKuw7axPEwzr2T
 Wp73wwQpzvZ8EcnVaWapzgoH33u0WAUTEmCOUc3sP2hq4+LHzJQvuYVdUw6gBupNVlx1EpWNYNbaj
 DfVLsX6cA9x/EoMkVqiSwtRfOd9NwqzcLt74VqsRMKumH97ttHu99KG8iuAcFav98Bqqn1/k31Qe9
 GZyKs/D10vnkjaaorRZ9q3SuZ50zjQoLnSJzOWB6NQvH9ePdwvYLiZZ5pCadNX8NBzRhfTyzvPUtY
 QEoma9Dkfz2kGZcwy7lUc5djNrBrdkb6rfSXY8HhE6blDnwDSnLZyXhuSZziO15mrHzqe8L1iuLOj
 bLaOHQig==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldawU-003Cuv-CO
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 15:57:07 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1042922172;
 Mon,  3 May 2021 17:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620057418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9KttZtarF6opM3O8v0iI0WEtIdwrMkc9FPFepsHdxOY=;
 b=GhVjVlD1Oh6MBSGhe/qvjJf2yBNKe75GP9hK5cQ/Rwp/vH15ZlpiSqL5WXnpQkXh9eHiZG
 jMNI5juEHaEb9XSJdnQQkCzeH3ngoaDvXJPIJRVUpDONgHTVitUENolLboJFg9p6ewF+er
 JqMF44rwkm6tLEubus1K+2Lqe1SjIa4=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alexander Williams <awill@google.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 0/2] mtd: spi-nor: support dumping sfdp tables
Date: Mon,  3 May 2021 17:56:49 +0200
Message-Id: <20210503155651.30889-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_085706_594061_08E88125 
X-CRM114-Status: GOOD (  18.45  )
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

Add the possibility to dump the SFDP data of a flash device.

More and more flash devices share the same flash ID and we need per device
fixups. Usually, these fixups differentiate flashes by looking at
differences in the SFDP data. Determining the difference is only possible
if we have the SFDP data for all the flashes which share a flash ID. This
will lay the foundation to dump the whole SFDP data of a flash device.

This is even more important, because some datasheets doesn't even contain
the SFDP data. Fixups for these kind of flashes are nearly impossible to
do.

I envision having a database of all the SFDP data for the flashes we
support and make it a requirement to submit it when a new flash is added.
This might or might not have legal implications. Thus I'd start with having
that database private to the SPI NOR maintainers.

Changes since v3:
 - move spi-nor attributes into spi-nor/ subdirectory, suggested by
   Alexander Williams.

Changes since v2:
 - use .dev_groups of the driver to attach the attributes
 - add manufacturer attribute
 - rename attribute name to partname
 - add ABI documentation

Changes since v1:
 - use sysfs_emit()
 - add comment about the allocation of the sfdp dwords
 - free SFDP memory in the error path
 - use BIN_ATTR_RO(sfdp, 0)
 - use spi_nor_read_sfdp()

Changes since RFC:
 - Don't read SFDP data after probe. The flash might already be switched to
   8D-8D-8D mode. Instead, cache the SFDP data
 - add two sysfs files: jedec-id and name
 - change the file mode of the sfdp file from 0400 to 0444. There is no
   hardware access anymore.


Michael Walle (2):
  mtd: spi-nor: sfdp: save a copy of the SFDP data
  mtd: spi-nor: add initial sysfs support

 .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
 drivers/mtd/spi-nor/Makefile                  |  2 +-
 drivers/mtd/spi-nor/core.c                    |  1 +
 drivers/mtd/spi-nor/core.h                    | 12 +++
 drivers/mtd/spi-nor/sfdp.c                    | 58 ++++++++++++
 drivers/mtd/spi-nor/sysfs.c                   | 93 +++++++++++++++++++
 include/linux/mtd/spi-nor.h                   |  2 +
 7 files changed, 198 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
