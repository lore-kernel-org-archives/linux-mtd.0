Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A05AC47094
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 11:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F1C061090
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 11:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F1C061090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9roPDqWiiXzdvk/OJKVa0j4uBeaSJOGFH04g0xLLr34=; b=yRJfwwVuOPiUF/
	3P76Ir8OTNrxAyJ+i4EPEXELz3HbBt90D3wv4io9Hst/HnBfB5vLDno8xC535efaQfSrcdm9svQEN
	xobgSlWo8jBmQO0FXwE5B5P4M42HPH7X2Y07rzYG6mDTdsYYlqFOZFod431vUDWxmJIUMSNbE2ijK
	PO2MkziHvSOo8KIn+2OtHSKMvbvpyhx2PnfhM2w2GplkGn7vYLiCs3hR+okudfjS0AbPCO0e+wcnH
	O/PE80Le3d7DT62qGGlFa/48FIxfvjqrDuy2il1H1RC/RXDmIU1dGknZtbmPmR0IeUWQ/N6RxK9HE
	a5StXlE0kupi/kItPN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqDQE-003LZ3-Iy; Mon, 07 Jun 2021 11:27:58 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqDQ7-003LUh-1B
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 11:27:55 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7FC4F22173;
 Mon,  7 Jun 2021 13:27:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623065268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rTTnPr3fbvvQSNNNubDTYCs5dbtwiY5bKpv1GTbh7/g=;
 b=J/RhPK7ufBxJc64d0sTZ4yDIIUE5ohUBfbyq1PHnz+Opsn/8s1GMqEpZaRzt1CqDBShzhX
 VU7SZ5FOfjrpQV7OaQS5FOBR1l68cPRifQdxtrVslf9Wlu+O1dBVyudnl+QmLeyLsKukNE
 sFWFAcbKKexhYWrO9rQ4PmIztrCybwQ=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 0/4] mtd: spi-nor: otp: 4 byte mode fix and erase support
Date: Mon,  7 Jun 2021 13:27:40 +0200
Message-Id: <20210607112744.21587-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_042751_269752_A63D42CE 
X-CRM114-Status: GOOD (  12.92  )
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

This series is the follow up on the single patch
mtd: spi-nor: implement OTP erase for Winbond and similar flashes

Pratyush Yadav discovered a likely problem with bigger flashes, the address
to access the security registers is either 3 or 4 byte (at least for
winbond flashes).

Changes since v5:
 - squash new patch into "Fixes:" patch

Changes since v4:
 - add new patch to get rid taking the spi lock if length is zero. Please
   note, that I didn't squash this into the "Fixes:" patch because it is
   unrelated to the actual bug.
 - add comment which explains that we could also branch on an error in
   spi_nor_mtd_otp_range_is_locked()
 - check zero length in spi_nor_mtd_otp_erase() and return early before
   taking the lock

Changes since v3:
 - new patch to check for read-only OTP regions before writing
 - clarify term "security register"
 - don't combine lock and erase functions anymore. there are now
   more difference than similarities.

Changes since v2:
 - fix 3/4 byte mode access
 - use spi_nor_erase_sector() by swapping the nor->erase_opcode
 - use more consistent wording regarding the security registers

Changes since v1:
- fixed kernel doc

Michael Walle (4):
  mtd: spi-nor: otp: fix access to security registers in 4 byte mode
  mtd: spi-nor: otp: use more consistent wording
  mtd: spi-nor: otp: return -EROFS if region is read-only
  mtd: spi-nor: otp: implement erase for Winbond and similar flashes

 drivers/mtd/spi-nor/core.c    |   2 +-
 drivers/mtd/spi-nor/core.h    |   4 +
 drivers/mtd/spi-nor/otp.c     | 156 +++++++++++++++++++++++++++++++---
 drivers/mtd/spi-nor/winbond.c |   1 +
 4 files changed, 149 insertions(+), 14 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
