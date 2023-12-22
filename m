Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF5FC41535
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLCEllkZwRHB7vg6ibWQc5PQgk+y6b0F7oWEyG6IGMw=; b=kGvBiqECdtELGL
	lO2IFIgFnkI7RtJvuXd65Be9i4uvpF23id8KxvJHzXYsfdZ+PxmsG+OSB4jFSqTyK7ufe+UyzqANC
	5qY48711omCXSiLid8vyDEaaX38MSeglIRRUV1pN/xMLKYDSCS98w2C8Rs6V6HPkKzssH7FeealNB
	4xDS9Vzy+Z8l8cb5ZKJXDL+Z8gs2DjzL5+sSiegb/KI3B3RXz6KSER1Y/dhM/XCSSXr/ElooPiLD3
	KcUhX1IVC4y86QaT2kkpCaAMzpAkVp5OZPnASG7w69MzjAzDFHiRjW8UAy44hATjAPVe8HQeq/mQx
	mtvaso0qZZx9EKIejlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqf-005i2s-2T;
	Fri, 22 Dec 2023 11:37:49 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqc-005hyJ-1G
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 11:37:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E74EF40008;
	Fri, 22 Dec 2023 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703245062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGvJdodaMoUH0kCV/D4eERpWVU5lmL4BMhIcgcPbJqc=;
	b=GMrQV5CwbYq2uD2Umx/e4P+DB8QzoBInUuHRVHk7bRXjrASUhUClJk/2KsobAx4Qbm85cr
	6wYzKL8ZeltE0b4nnv7kQXuL1Bhcv5Wd8iGjXjqSZ9RevGGKPJ0cmFp6XWLCZPVp0+UyKs
	PdHZEe9W0TK28Oavuj83m6Sc4AQbR4CA3bJBSqXAGTuTRwMPbq9bqTzzpPKQ8kCltv1hxA
	h/bd3dJSuNGBN01SQlvY1l6mjvCfY24MNj/xNlWeMoZgrtUhrVZBJ9IQ401RsDuyuoeMpc
	W2Moc88PH+Y5ojXJz1gsl+W9Wj5/vCgLydLjwwW80dBddJ4/omP0B4FmOjshbw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: rawnand: Prevent sequential reads with on-die ECC engines
Date: Fri, 22 Dec 2023 12:37:39 +0100
Message-Id: <20231222113739.786750-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'39eed454e35faeb235cd50765961f7955fd0a720'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_033746_563158_5FD57CD4 
X-CRM114-Status: UNSURE (   7.90  )
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

On Fri, 2023-12-15 at 12:32:07 UTC, Miquel Raynal wrote:
> Some devices support sequential reads when using the on-die ECC engines,
> some others do not. It is a bit hard to know which ones will break other
> than experimentally, so in order to avoid such a difficult and painful
> task, let's just pretend all devices should avoid using this
> optimization when configured like this.
> 
> Cc: stable@vger.kernel.org
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
