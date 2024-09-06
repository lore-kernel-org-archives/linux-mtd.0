Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF54E6FE26
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHkyJ5kdYBGS8dpNN8YUXNMCeHYBCE60cJEtuBQcXMY=; b=Cus/MAjaxnKEfs
	YLI3CvbKF/qCiu0ZY1Vym3T9/5YvJtr4HXcFVHGvhDQliwXm1Ts9XqyMqVrnnUcb0lsWFs0ChTjk2
	lOWWC5VnSdB/BCc8A7vHaCp6ZX7HvYlKthrE/qAwG7WLBH9K/1iJWR66CM4vsm6pRu3sjEYL3wJqF
	99KLoAAtL18X02UI8nRs2Z9QNMR7bw1kBM/wFmADl8n1hUG+nqlkyKqmR1JXHJ7p0GFbJ7xaGLHXS
	uEpJ85u8tFcoGJJlqROOFahtSRPPLzNCSraYCSJyOrQqY7nrStaz3Bb5HDXGy0waUx/bxHc47fixW
	j/YDykF4lA4cOPI6iPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smal6-0000000Cjiu-2ItL;
	Fri, 06 Sep 2024 15:20:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVb-0000000CfH8-2C8J
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:04:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D80FE1BF20B;
	Fri,  6 Sep 2024 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gu8WlYrp67DjmlhUAIWGWERM27gFJ6rN/ABd1QN4YmY=;
	b=Em5CdFZqP9ATwOAJG3egjY/PjoxlO9c8E9PeQMkrS8fiFGnMu7LUKN+v6pcTlH1N4nu+2F
	B2TxLJr/XvezRBQ3GbokdbZA69r29PPusn/4BGGlP/wM2IWhoubGMgNr97Y47GiRzxOGrb
	4EXYpdY54zPj84QnusjWIjWbDu7ReSxFkrJU2jHOxMPYjCb0jKm13Y0MRoUJ+k6WOzCW68
	1G0yoOAI9jucT68DB7YggmtbGq6m79JUzbErGCGAIklzqXXzHEJBCfed/SB6U0PY+yNENr
	CMzAY9ULoInN7/ktyJHZ742UPtGi3kOUjK9hVMfIYqJ2Nt3UM8VgQdaYpoXmTw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen Ridong <chenridong@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	chenridong@huaweicloud.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 -next] mtd: rawnand: denali: Fix missing pci_release_regions in probe and remove
Date: Fri,  6 Sep 2024 17:04:21 +0200
Message-ID: <20240906150421.734870-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826024339.476921-1-chenridong@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd43b24f50da293009050e172e7c3769571db79c6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080423_715587_FBA0DE1C 
X-CRM114-Status: UNSURE (   5.18  )
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

On Mon, 2024-08-26 at 02:43:39 UTC, Chen Ridong wrote:
> The pci_release_regions was miss at error case, just add it.
> 
> Signed-off-by: Chen Ridong <chenridong@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
