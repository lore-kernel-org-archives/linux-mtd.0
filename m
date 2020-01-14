Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41ABC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858DD24676
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ltxIcO3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858DD24676
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euj4a0SLgkkcUXu8xmAEjufWF/L6KgOzJoIPiupZhIs=; b=ltxIcO3wKwWhQ0
	mT4jHYicGp8JALo48pGg3xkAjlFMezHC0VVqqs2EKP0ixPOigW20vyY30E39sto2Ti+rKSr4jL8kD
	CjJrRnfu/NtjcnWgdIInWHKUOBaYXAmY1GMhwz92BVV0+KQsPPqP1CEH6fTg6T5oVHypI67pBrLEW
	syZh2bV7+ZRh9qaMwpMl0KBfzn56I7KMhOqZ2sGzo6PFCX6k9l6ITlSoUxnLkj/hKuM/c4evSHC5c
	fjUeHEpQEZHBP/esl0vywLnuCpCKTogUod7qsqQBF3pHp5eQ0CZJRPYGlTrFcueMMCfYP7s7SwUrZ
	HSU01KinZArhyKypfdJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPdr-0000i8-HJ; Tue, 14 Jan 2020 17:06:11 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPcs-0007hz-Vt
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:05:15 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id EFA8524000D;
 Tue, 14 Jan 2020 17:05:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, andrea.adami@gmail.com,
 bbrezillon@kernel.org
Subject: Re: [PATCH -next] mtd: sharpslpart: Fix unsigned comparison to zero
Date: Tue, 14 Jan 2020 18:05:00 +0100
Message-Id: <20200114170500.1384-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191230032945.18708-1-yuehaibing@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 662d990e1919dfb0b75834f71f28576343c83d82
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090511_204531_707DAEF4 
X-CRM114-Status: UNSURE (   6.75  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2019-12-30 at 03:29:45 UTC, YueHaibing wrote:
> The unsigned variable log_num is being assigned a return value
> from the call to sharpsl_nand_get_logical_num that can return
> -EINVAL.
> 
> Detected using Coccinelle:
> ./drivers/mtd/parsers/sharpslpart.c:207:6-13: WARNING: Unsigned expression compared with zero: log_num > 0
> 
> Fixes: 8a4580e4d298 ("mtd: sharpslpart: Add sharpslpart partition parser")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
