Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0E8C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7460060EBC
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7460060EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCCuD/oE4lhy6mvoJ8IC4kvER2FvEkCPJQEqIDHh894=; b=MO8PGos2/FWa2I
	lwFzEGT9lDul+lMpJ/s0wJTMdCX9njA7Ln6ExuSkFLunwyIdUlLXoPNuN445283q2U1AaSMXQL0Kp
	1KUoua5OROKwmjoXAHBiOsxpRqOHXB1GM2/IlRHdfdxtTE3QGv0Ld1weTy7uSR3F3INGcWr3rFkBn
	7Ojl42+6muPgMG1++NHNEuN+LICFtdSrDPZRH8oTRub0ghmSOVGG6FY9EGBa+unzue4bJKxyMF11F
	GcfaBHqslMwd26ZvTyiaJdW9fq5IC7HPmwIvycH1YAL0uwaV/aH+UdJmH7uQJqMZuQLVBO/D4skte
	14LZm3XTq4M4B/NZK60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG2HC-0031Si-0V; Tue, 17 Aug 2021 16:49:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG2H7-0031Qh-A7
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 16:49:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A4EEF40005;
 Tue, 17 Aug 2021 16:49:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com
Subject: Re: [PATCH v2 2/2] mtd: mtdconcat: Check _read,
 _write callbacks existence before assignment
Date: Tue, 17 Aug 2021 18:49:12 +0200
Message-Id: <20210817164912.108616-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210817114857.2784825-3-chengzhihao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a89d69a44e282be95ae76125dddc79515541efeb'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_094917_552048_F662FEF7 
X-CRM114-Status: UNSURE (   6.53  )
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

On Tue, 2021-08-17 at 11:48:57 UTC, Zhihao Cheng wrote:
> Since 2431c4f5b46c3 ("mtd: Implement mtd_{read,write}() as wrappers
> around mtd_{read,write}_oob()") don't allow _write|_read and
> _write_oob|_read_oob existing at the same time, we should check the
> existence of callbacks "_read and _write" from subdev's master device
> (We can trust master device since it has been registered) before
> assigning, otherwise following warning occurs while making
> concatenated device:
> 
>   WARNING: CPU: 2 PID: 6728 at drivers/mtd/mtdcore.c:595
>   add_mtd_device+0x7f/0x7b0
> 
> Fixes: 2431c4f5b46c3 ("mtd: Implement mtd_{read,write}() around ...")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
