Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C494C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:23:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D83A6101B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D83A6101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6EF65i995udk2wChyhPZs7I2yoacSCsS+pbF9KGL9wM=; b=l5OcSfvCSq7mfeiO7UWnUnqEua
	kDDjtfhSaT4cXDI3FvftixHCGiWVMZY8VGFpFgIwg5TLm93BWvWV4z9OPHN8cglhQKBo/UXoI2hXF
	YUmNfsKWLQGUz2eAJbnS3M+3APGL3f9NN8LOVqrUBwASBFrjX7Bl5jvLKcJEHhlv2VGiAgjmFo+sY
	D+vqtwww20TwK6eOoch5XlTLvSQ+RgVNgNxDYu8iyBilTTjL7lj8eZoZ67fKmSUJ9XuKhLbB3HFLU
	mbDeN/EkFFZ7mxhSI72o7IagaHQ4c/g9RmiYuQ/dVjNUa3AixoKNspfAx/xyj+2n3dD/hZs0fOCp/
	MJJyxRxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1B7-00Dc17-ME; Mon, 10 May 2021 08:22:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1B5-00Dc0i-3f
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 08:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=n2outg9JLX+gLz3HUIDFDjTpxHfJehLylOpnhwXBk9A=; b=jV+DTI5Oa6a9HAcBa6JRDZR1sa
 tSlSQwOMvT9xzTw73MlXWcXmD4xS2zvAdSrc+0UudsLksjWiZkcGt/G8BmeuvuS3ywpU/0UY5L7jz
 zYTY0HqVhNH80KLpsfj5aLMFkg5h2M5nl5+hglH3KvUHv0ktbHKjfOa4lRwFm9269dIWTm2BY26hs
 ojn6rCCkcvTmV4O1gFIaiAGGvZ8MnkPIy5xU/QAy5KCe9nwIoJN2DErSsELaOzmcWw39gS8I16hz/
 CR8kZWV+ZCaEQvpAin1tpCyWhyPYOdr2BImlDl7hJ7NcRV3ta7ZjVhRzFjiMNBv/Z0w5FfzMbzW9p
 pXiQzHRg==;
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1B1-008PNf-Ps
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 08:22:09 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG3.macronix.com with ESMTP id 14A8Ldmm031761;
 Mon, 10 May 2021 16:21:39 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: Zhengxun Li <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 broonie@kernel.org, jaimeliao@mxic.com.tw,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v4 0/2] Add octal DTR support for Macronix flash
Date: Mon, 10 May 2021 16:20:34 +0800
Message-Id: <1620634836-13181-1-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 14A8Ldmm031761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_012208_128618_FB1A6EDC 
X-CRM114-Status: GOOD (  10.26  )
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

 drivers/mtd/spi-nor/macronix.c | 172 +++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-mxic.c         |  41 +++++++---
 2 files changed, 202 insertions(+), 11 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
