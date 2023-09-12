Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E0CA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWHKu8hzfWLN+hlybl2wJVylkkYA4hPyzBdNLgXodRU=; b=kXsLRRPmP0OC5j
	WFVp5uNsPSAPdfFVc50DQfN0vJ0eyT7zr/LsUgtKBOKOCUpoxszKIpYOift+uiBGYaz3/7KE3/CxI
	8gcK3bIytWhfsfePoKpT3JF7DkqKX4jyQBm+2y/HwZx2qj3WPCsS/UjRY5jiAva4+ZCTw8SbTjW0J
	D7CiOEXTYVXs8zgCR9zaS6KWx/wg1nZep+yaihMVfjE4xH9FVNfUG+Mj4IOx6ali1J6qXuV1Yq4tx
	6wJdzLJMSfStUAHHgX+poPuambrWiL9CKfU4AsrPR38LzhEp/3Y0oRFeyklUFZ/7ufHMDLiL9f1DQ
	hxQw7xmA+SLc1MeMSdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0k4-002yWr-1C;
	Tue, 12 Sep 2023 10:35:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0k1-002yVq-1A
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 10:35:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6043BC0006;
	Tue, 12 Sep 2023 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694514930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PfNKUEe1V8KEfVBvwqyAc2BJuRiSsvuYo2fkPdeAuyE=;
	b=NLMouHSTBIAOeOHMgnmjPhhBBPCzQwTzrjQN03cYB4UQihuzTlgc8C781HPPx2gabnznG0
	FCUTIq+F+ICFMDQoGsOfch7Nx33YpYd9je+4DbXzpN54iIy4gIuCMesViV2RVP4MMR1bbL
	x9q3cDzm4Vz/v9Uu2ltIdjHKcp3Zv/27DbzZQhS6npFznhsDY5NhoIEazKefY/M7S07uga
	y6/+LHjoaNjIDEzsUR8FYmQjpe1C4wrf4BtFzVgy4BpA9zRh7wBn2W4Y2GU5l7jFV0fBFn
	GoXPg1dtvsQ/y1yqZjLq8hAZmS+VEV/6WRS8Vyhc9m6amPTk7PFkHRKzEyEEPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>,
	stefan@agner.ch,
	dev@lynxeye.de,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-mtd@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: add missing check for platform_get_irq()
Date: Tue, 12 Sep 2023 12:35:28 +0200
Message-Id: <20230912103528.936288-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821084046.217025-1-yiyang13@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0a1166c27d4e53186e6bf9147ea6db9cd1d65847'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_033533_542305_C5AF3A35 
X-CRM114-Status: UNSURE (   6.13  )
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

On Mon, 2023-08-21 at 08:40:46 UTC, Yi Yang wrote:
> Add the missing check for platform_get_irq() and return error code
> if it fails.
> 
> Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
