Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB55C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 15:30:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B17B20885
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 15:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W5D4HTok";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="GbuEjRaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B17B20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XEQV1BmmEb/FaHXYXlir19vrWIkWps9IeDyjM/5sDkU=; b=W5D4HTokCr4rWWrJcMfR0v7s0k
	BgsBaAYPOs0M1jRhAYe0Zw8iX2WeG8yBvtlnTqaloVfQXz84TpIGee04XVq9ly2dseZpOZBjn4/K3
	mUa8rfI33AQ3/iXdwoAfO87V6llVlWEzNpm0yVRrkbLTHOdX3TZMUMPD1x6r64q48XIWstGRl4RZx
	AEn1B1dbCQwHtEZ+9PnF9HOWuqX7cZ3agAiFdwqJJzIJfPmNwTvOKzkPPeiPR8/w0CqnJ1wxXw2TG
	tWaogmzbRIEdYWMC86rjydRPZmxhUu/Xspl+Umi5hSYwhMMwHd9XLoB76kxGG7vu+Bz0h+54B2Ncr
	5QhQnz+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5sh2-0001Lz-Na; Wed, 12 Aug 2020 15:29:32 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sgz-0001Kd-W6
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2020 15:29:31 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3A0CF4C8B1;
 Wed, 12 Aug 2020 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1597245330; x=
 1599059731; bh=WwjPfLnomL2r+HVIJaHtMZVaUiKzFEyoEtIATOH76YY=; b=G
 buEjRaUaNwzJY86BzNuWkSqAwqfLjuKUGGwhWfH6i34Jyq73OHB8FDZdWaeU5YIV
 05PPXNliL+N6k2qyxhYeo71xxK51Iha2Tms1fWZo6zJ393ltIG90KYxRZuE6ueMe
 dhOywejDY1fIE6lLFnFuGaHOnD5aPrnsna95U6FfQM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfm51ryF4SZ1; Wed, 12 Aug 2020 18:15:30 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8AD5A4C89B;
 Wed, 12 Aug 2020 18:15:29 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.2.34) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 12 Aug 2020 18:15:29 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: 
Subject: [PATCH 0/2] enable lock interface for macronix chips
Date: Wed, 12 Aug 2020 18:18:16 +0300
Message-ID: <20200812151818.16699-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.199.2.34]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_112930_256407_24583D66 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Ivan Mikhaylov <i.mikhaylov@yadro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TB(Top/Bottome protection bit) is not present in the status register for
macronix chips, do not touch TB bit in status register in this case.
Enable lock interface for most of macronix chips which are suitable for it.

Tested only mx25l51245g (BP0-3).

Ivan Mikhaylov (2):
  mtd: spi-nor: do not touch TB bit without SPI_NOR_HAS_TB
  mtd: spi-nor: enable lock interface for macronix chips

 drivers/mtd/spi-nor/core.c     | 22 +++++++---
 drivers/mtd/spi-nor/macronix.c | 75 ++++++++++++++++++++++------------
 2 files changed, 66 insertions(+), 31 deletions(-)

-- 
2.21.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
