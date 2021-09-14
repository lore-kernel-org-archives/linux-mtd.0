Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5867DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C53060F8F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C53060F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xo+59ntcuN/A8Thz9MVYN6kexXfqvFc2vq4PabtO5s4=; b=HWTmb5VByC0KBO
	597MlMEJxXppUhu+k6XxAYnzC1iWKhCHVhEmzpO/uMtIjnfZZ6VAJ0KeUUIycmau46vCr9iqWOyp3
	jGRoLm9kfFO+ilcSstH2I6/fDT3hfZJWCzQBb5Ic/e9POUVZT55zyQAtzijFW64QsS+Nb97u++O4S
	ayLYTe713vJVJYnwGBx18dSA+BGd3cCpHqmh9AMczbJV9r4dmd405rU/zUDyxf3OBFzmMwK906Wl+
	v9uGi9d3todTe2jV7nXRyngm3q8iuDXM6b/F666a1eATSZgKyvPcFx7VO/PFnYofWytNRTBc6xGio
	Q4ROXZdbmoYldGN/qaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQCOz-006a1E-8d; Tue, 14 Sep 2021 17:39:25 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCOw-006a0C-MZ
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 17:39:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BDC731C0008;
 Tue, 14 Sep 2021 17:39:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Evgeny Novikov <novikov@ispras.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 Anton Vasilyev <vasilyev@ispras.ru>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: intel: Fix potential buffer overflow in
 probe
Date: Tue, 14 Sep 2021 19:39:16 +0200
Message-Id: <20210914173916.301250-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210903082653.16441-1-novikov@ispras.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'46a0dc10fb32bec3e765e51bf71fbc070dc77ca3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_103922_910789_F8134ABC 
X-CRM114-Status: UNSURE (   8.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2021-09-03 at 08:26:53 UTC, Evgeny Novikov wrote:
> ebu_nand_probe() read the value of u32 variable "cs" from the device
> firmware description and used it as the index for array ebu_host->cs
> that can contain MAX_CS (2) elements at most. That could result in
> a buffer overflow and various bad consequences later.
> 
> Fix the potential buffer overflow by restricting values of "cs" with
> MAX_CS in probe.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
> Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
> Co-developed-by: Anton Vasilyev <vasilyev@ispras.ru>
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
