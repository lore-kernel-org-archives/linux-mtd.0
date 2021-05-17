Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF1FC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 06:19:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EDF61166
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 06:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EDF61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYdoyEjg5JALad/2JPF1VeDMnlU8ZS5QOm+AYTqJ3Nw=; b=puH8AnMsVs5d6obWAOfR2fbGOw
	SwTa/Cnl7JYTMD1HoP5yYcAGhvlvB8cSBmoS4dFbMPs9252hdKt4oKeOaVabHjzUbHsDyN9c8dHtX
	Uksdxne4K90RwSkXJq9+U8S2cfjuzSwRnnhSGQeHupR4oMgEixZNHaFsYlVSM/gPPwF4OV8BDrNDN
	64w6dJPpO1oa2hU2ZFXkRNwHYTSHXWhr7MqKtmwYZBahTng8Qxfdep3I5kj/oCxI03o1jkGgG/QMz
	Rjg77UGv5BaKzoMOOw0uK1dfJfCPhRnzgDjbG7SEY/dqAMQWVC9W91d7hvEgNjD47Bzus1z5dumUL
	dE9//wDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liWZP-00DqRr-J9; Mon, 17 May 2021 06:17:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWYV-00DqKT-Oy
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 06:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=kYJjtoODKM0eh3LDCmoEsGpaPs2YsC7snRWswfFURjY=; b=MXJLCp61VfSaG20v7iyE49TZLV
 gWAuRzWzE0JCYZNeL0w7ldRX8P07jiBy3mNbFagEt7C709rsqZoCGn4si1EXYjX2dqbwro6QrnUV1
 Ig7kKTkviHKH9TzDOUw9jNJhysDigOup99F0cMYUWbLf/tPtBheAs3D1jSngwObN/Q/GhmzWGWw6A
 euUWKAoFGWOYYwlhYVw0Gddu4aZnOndnrliz3UiF2h03Mb2fUgHNPkif1t/y41OueNzpjg/ks+qpP
 cibIWyD+StDqhImAZQFD14HULRfgZhOcSR3dIUUBwIS00XbozsU17msbV7+6wLNSxfP2Igi5GSWSW
 2yIqqe5g==;
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWYS-00DVGp-4R
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 06:16:41 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG4.macronix.com with ESMTP id 14H6G61f052301;
 Mon, 17 May 2021 14:16:06 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: Zhengxun Li <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 broonie@kernel.org, jaimeliao@mxic.com.tw,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v5 0/2] Add octal DTR support for Macronix flash
Date: Mon, 17 May 2021 14:14:46 +0800
Message-Id: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com 14H6G61f052301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_231640_492495_67FE8D46 
X-CRM114-Status: GOOD (  11.68  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds support for Octal DTR for Macronix flashes. The
first set of patches is add Macronix octal dtr mode support and
Macronix octaflash series support. The second add the Octal DTR
mode support for host driver.

Changes in v5:
- Based on Pratyush patch[0], modify the length of the value written
  to the Octal DTR register (1 is changed to 2) and add check ID in
  SPI mode.

  [0]https://patchwork.ozlabs.org/project/linux-mtd/patch/20210506191829.8271-3-p.yadav@ti.com/

Changes in v4:
- merge patch 2(support octaflash Id) to patch 1(support octal dtr)
- add switching back to default mode(1-1-1) support if octal dtr is
  disabled
- delete the duplicate code settings initialized by the Profile 1.0
  table. (such as cmd_ext_type, rdsr_dummy, rdsr_addr_nbytes, etc.)
- add a description about stacked die

Changes in v3:
- Add support for Macronix octaflash series.

Changes in v2:
- Define with a generic name to describe the maximum dummy cycles.
- Compare the ID directly in the loop, no longer copy and execute
  memcmp().
- Add spi_mem_dtr_supports_op() to support dtr operation.

Zhengxun Li (2):
  mtd: spi-nor: macronix: add support for Macronix octaflash
  spi: mxic: patch for octal DTR mode support

Zhengxun Li (2):
  mtd: spi-nor: macronix: add support for Macronix octaflash
  spi: mxic: patch for octal DTR mode support

 drivers/mtd/spi-nor/macronix.c | 185 +++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-mxic.c         |  41 ++++++---
 2 files changed, 215 insertions(+), 11 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
