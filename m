Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5398DC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 06:31:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1269C6103E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 06:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1269C6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X88zw0fnfDsxpH2qUesxc9Ah3Af6h+z5pKX49ogC5T0=; b=cAWlkHsa54tDdo1Fk7UEWhMEQw
	UhZ/WL0pfZFvq8cAPsSVz1cXiWpWoKrOfqlOheJBk0/DSb9gWamhijPmxwlxmtsRiJktha0vH8YV4
	O1r0xMAbQ9TTW2pDiieu7IVv/DOQ9NchQNw+1LKK7I6grs54lSNb3sqgD4Abyqabu8ARbW0vad5zL
	ug4Iwc9JjFfXeVApzl0h20pV+yFKHkW/pP/c0+qhcZKvxzYusdF7RSHlp5mO2+7CKE8K2utPGso2Q
	Wfsgnt4ZycMSxw276pY7/EjSiBazNTmgp9txo20zKJmSwE66IsoEtzOY15x3b9S+1h4bbBFskJiqs
	Kjp76Iqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYjuO-00BMFM-Qd; Tue, 20 Apr 2021 06:30:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjuN-00BMEx-2C
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 06:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=L8C3Rk14l4aU0BPk5bHN7m39iMpEK06GnxbFSsaO2EE=; b=j4ajaEv+d5vqAiVHLhb+bRxTwM
 f99IZFoh1Zvu3oTs9F1gC0ZgcCP0z8+k1aHhUz+UfmDA0sPfYa+nnXngWQbne5WugyGbtYBJ3AWEB
 ZyQ1f569ZYLCWYBMIqwsXCQ5x6RgFchrae9E4aZ0DD/GbvTLsR/tv1pNrKJwN3oYgrO5Kt1S4uaa6
 Uzla4aii4Yhf9AZAnbaVh3cFDu/EEw/691TyQ91aLptF3H74TKaaWKFkyKnuVoE2/676HIGXbgV0a
 +D6eDVaaZ2hpFiuy8gzaab6sltpp63oaU/knyX9L56AwDgeufuRKI4X1BzSEb/cOLWZ4fR0M1xWmP
 SarthF0Q==;
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjuG-00BqgF-Kw
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 06:30:49 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG3.macronix.com with ESMTP id 13K6UM7b083760;
 Tue, 20 Apr 2021 14:30:22 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: Zhengxun Li <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, broonie@kernel.org,
 jaimeliao@mxic.com.tw, Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v3 0/3] Add octal DTR support for Macronix flash
Date: Tue, 20 Apr 2021 14:29:36 +0800
Message-Id: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 13K6UM7b083760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_233045_004212_68999D97 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
first set of patches is add Macronix octal dtr mode support. The
second set of patches add Macronix octaflash series support. The
last add the Octal DTR mode support for host driver.

Changes in v3:
- Add support for Macronix octaflash series.

Changes in v2:
- Define with a generic name to describe the maximum dummy cycles.
- Compare the ID directly in the loop, no longer copy and execute
  memcmp().
- Add spi_mem_dtr_supports_op() to support dtr operation.

Zhengxun Li (3):
  mtd: spi-nor: macronix: add support for Macronix octal dtr operation
  mtd: spi-nor: macronix: add support for Macronix octaflash series
  spi: mxic: patch for octal DTR mode support

 drivers/mtd/spi-nor/macronix.c | 217 +++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-mxic.c         |  41 +++++---
 2 files changed, 247 insertions(+), 11 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
