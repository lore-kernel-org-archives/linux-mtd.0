Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4381C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgaa85g1RB/PANQufYz8aN/zcEusKKNFXrNJYvxn73w=; b=zMBBifjcZFUCcn
	6qpBAV1nFp39MfAgRyLheJiwbzYvbgyYQz2n1MQ8PpnX5Hj8EIHkxVgzsxk7W/hUeEb/JJ8YnNw9h
	WAmQuAdwBaPTYiCxF9CJmaFNEmJOel5MyjJ2LKnFcnG6WwafMQVu6nYW9M7ohc+omEcxoZOJlVruy
	i7uLlz7XozNPtc5FAJH7v9jwQHmj7sjGSFMjitoyoEx4XmiLrusBVkO1RosVmp7y4b62gguhkYLIh
	UoaoLL+FxjRufK7QRPVYJ6g2/31CXqJGG+4wcMzssJzNMjCvnI/OT69e9HXttfqk3RKBEwfb5hNaZ
	o/HkI5EZhNPnvTK0fouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQt-001hSd-Ur; Tue, 20 Sep 2022 08:16:44 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQZ-001h6d-8y
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CFE1840006;
	Tue, 20 Sep 2022 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lJLYtNdnYyxGkQOr2/EKomoBqLaYzUWakFfl52hdZs=;
	b=FtZPgkxfKqhHuH/hHTgESkkTb0Rvid23Lr7g8ftlSnIC8ZbmBWAFV2lKKi8GH/MQ+M5AN1
	u6A3N280Yk8XU3ZvCN9ncAvAcRjyne7rtujGalpc7Xj6w4Gv3+IstML4peVTyLibefuQK9
	xFcq6bienaNUsfe5OvfJ85201Ulu+J9xUAA9IyWm3lrpJITrcJHH1J24qZON9kPRloidjd
	yckV/ATNXtTvKqdq/xiHR/mGodD0dIWM+OqXvrAvYgt8/dZGja3AnzW5JCvI3EzND7ijVQ
	t7J2knbtcEHy3c0t6iT3Rp6wZ1LUzHOyvnCVg42BqN2mLm0lA7cObPRaIVfeug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v3 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible string
Date: Tue, 20 Sep 2022 10:16:19 +0200
Message-Id: <20220920081619.598320-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-2-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c6d7ce0a7e0562846431dc3c7c390dde7d0c0c42'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011623_992153_AFCBC466 
X-CRM114-Status: UNSURE (   6.86  )
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

On Sat, 2022-07-02 at 23:12:20 UTC, Martin Blumenstingl wrote:
> The driver which was added at the same time as the dt-bindings uses the
> compatible string "intel,lgm-ebunand". Use the same compatible string
> also in the dt-bindings and rename the bindings file accordingly.
> 
> Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
