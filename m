Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B93BC43461
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:59:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91D52074B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QFI7zC6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D91D52074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S7+y9ZvQzoV6dMR//Zct8xRkRIePLRd6nW09ECUn8Sk=; b=QFI7zC6EKC6ehAZrmY0jr9UaG
	IxLliIv1Gc35d2ZdYQtZzsYHlfEVbRSyTuTaIP2pAqSOEVdQ6JY1qWlySSaPIJqhuQ6HDUakN6I5P
	DtPHdkqlZAAmWozkfLAh4CI+esRL/nIJq1ZPp3VhqUq6hCm0QjZuDXUmZ9ykMXvWIjRm81ajFcQhu
	dmX98Dw9oU88PUrrckM1z+haCKdYBjilI6TvhYw3r5jJNLYdNjW3yXPY0VDJ/G3+G0oZdhSLlylYF
	C0gDSG0UYg4NbajFvB5MfDQYP0piuJes1KU2Mem657QcZ0+z3rE1DitbQASB1kNuRsVcklrCCTyGs
	mHlUkSz+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmNg-00057M-2q; Fri, 11 Sep 2020 16:58:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmLl-000429-KD
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 16:56:40 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0FDE0100007;
 Fri, 11 Sep 2020 16:56:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v2 1/3] mtd: spinand: gigadevice: Only one dummy byte in
 QUADIO
Date: Fri, 11 Sep 2020 18:56:34 +0200
Message-Id: <20200911165634.29157-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820165121.3192-2-hauke@hauke-m.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e910e2d6287ed075a70153bd9cbb480f3bafac98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_125637_833456_79269AE7 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: gch981213@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 wigyori@uid0.hu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-20 at 16:51:19 UTC, Hauke Mehrtens wrote:
> The datasheet only lists one dummy byte in the 0xEH operation for the
> following chips:
> * GD5F1GQ4xExxG
> * GD5F1GQ4xFxxG
> * GD5F1GQ4UAYIG
> * GD5F4GQ4UAYIG
> 
> Fixes: c93c613214ac ("mtd: spinand: add support for GigaDevice GD5FxGQ4xA")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Tested-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
