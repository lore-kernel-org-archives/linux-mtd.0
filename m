Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CB5C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52CF206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRBknbpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52CF206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyspOv/rVngk6xiCiUkahnilVuLY2U0d8WdWMhes1Z0=; b=QRBknbpFur6Iri
	78H3RE0CPfLfaYrKEcUHFrG3pkCSSy/AxtErAinaVNsYJcZmAFSzl+L6vyoFgSbD/11jRze3X9ewV
	Wzka20to5IojT1YxkV2uyyvu6zrKHFxdD1yDais0VNzNuwAKC7FpHQ5ImboTAiBx9pifXhudrlBfQ
	5y6xD6LXxkJCgOUKFFj3OMtw7oxD0Xjrvo1BpMCer2/iJqk9+z4jk+K6YvzQamUafQnk/TciR1Gck
	w2fEDA3S2vq4sZD3eyqC62UjYw2eTYGBLVx7B0NfLLOGFbBDyhhbtyYVU5T+KnISF8zoDdUzbOq2R
	+hGVgSKkjF8EJSPObpTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsMe-0006tH-1u; Sun, 10 May 2020 20:15:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsE2-0002Qw-BZ
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:07:04 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F3AD9240003;
 Sun, 10 May 2020 20:06:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>, harveyhuntnexus@gmail.com,
 paul@crapouillou.net, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH -next] mtd: rawnand: ingenic: Make qi_lb60_ooblayout_ops
 static
Date: Sun, 10 May 2020 22:06:58 +0200
Message-Id: <20200510200658.3330-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200410115121.11852-1-yuehaibing@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 73ab61552e2ffb1b794b70545d04c1d2b60e89e7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_130702_544899_734CF5A7 
X-CRM114-Status: UNSURE (   5.62  )
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

On Fri, 2020-04-10 at 11:51:21 UTC, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c:105:32:
>  warning: symbol 'qi_lb60_ooblayout_ops' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
