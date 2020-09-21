Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E423C43464
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 11:21:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B57F207BC
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 11:21:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mhjq/gju";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="hSiis93r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B57F207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B8eRABIl35YhCE7E3KBDhAkkXTGn1ijUupbFzPtQd3s=; b=Mhjq/gjuwmvurTKNEGa9HTOp5g
	bdBg9ZlvPPx+hnRNKxHymKWfGZbokzfU4Rz5jQm8Hm1etJ13brlt+992UU1NJmJylymD/C2PS+9Jx
	Hrb4QFecgl2lVkdtrNjHm6IBR1taqG2r+OHO4izTb3innf0UmKigg5w03Jh6GsTGlBKAgfXIs1Ar9
	zQqQifRi8pEAdDx9OjwVvSFNWm5NaQLHtaCJqLl7JWFx61IQ/jn2d7YTDvNwd4lJJs6VlhBQ6NT7o
	EYb67KcglTa1Xm8OisNEkCvHxC6hKFgl2fFRlUVjdDv8LZ5gM8L8mBvsGMzkDwSn3LxMKND1imzKP
	mLMj+tzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJsv-0002UU-L8; Mon, 21 Sep 2020 11:21:29 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJsq-0002SR-EH
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 11:21:25 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C2AF6542C0;
 Mon, 21 Sep 2020 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1600687278; x=
 1602501679; bh=YIKwPp9PgxP7cgWzG+qGdK2an79Qi369mnKtqyTcmY8=; b=h
 Siis93r8cc5T2iQWDlCED/Nn06xCAjr3mtTgrONPMOjkxu2m4X0ir413DbEEHtZv
 ehlnC801nDQOlHwHD2fB9FD1NnJou2nuuvctX3VEUcA0ZoU4jxqPd6CmPkyqzA4a
 kowSwERB+yKWf5I3K0JL+8l5GIDd/gQqxM3eRfxq64=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVjcfKRWjR3K; Mon, 21 Sep 2020 14:21:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8310E52ACE;
 Mon, 21 Sep 2020 14:21:18 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.3.38) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Mon, 21 Sep 2020 14:21:18 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [RESEND PATCH 0/2] enable lock interface for macronix chips
Date: Mon, 21 Sep 2020 14:24:48 +0300
Message-ID: <20200921112450.4824-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.199.3.38]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_072124_732469_F94DCFDD 
X-CRM114-Status: UNSURE (   9.37  )
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TB(Top/Bottom protection bit) is not present in the status register for
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
