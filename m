Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB179C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9J9dh/sjj+lDtg2mmrfNoO6gMUeZP3S9E2BAEnoO1U=; b=KtFZTMVTsgwkZ/
	fRJppUm6Qw9wv59NO8NLjv/R+69bg9sI4xO/VLtnFYmcUNbb3jJladH+KkQhv9CkXZLKFACDhdDff
	361J5p8kA0Ond5NEy+3bHVPR+idGswT0E7rGy6dAoNHo2Obrhnu/eGZHvZftSezeYimwAlvK+H9mx
	KWlDhbDmoxIpoxTgrmjgtmz1s7Zmxb+bpoY7amrPCWQ/0aqs/YP3jmzhLg2L1TplUgZLY/Cqf4VN0
	BBNbez31l9Ilr/J+HjZMrCoBiins5hKFg38IG7nTt/9+8D6BMEdfpxTEvB4Y1qNtdEiLz+TmOHTNK
	EktLT49Eh6KK3OyxXBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHWQ-001qZ8-0q; Thu, 09 Jun 2022 12:44:22 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHWM-001qTz-CG
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:44:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A9C31BF213;
	Thu,  9 Jun 2022 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fpphnyK7b9ecDg9PuHfvurWOcMuG1P88E9vjHqCoLrI=;
	b=O5rUK0/7QdJ8mcqUhI8ZENgYNQURVW8+InTVJyOMjBEq7YSZhwdxFQxXiBs/HxuyNc1JOA
	cVdLaOV1A1bXu0dcKdY44/5/fLGxU0l1487TkWw4//9OnkVYLI2Fny70T1JZkrCBpM+RYZ
	rDLy8SStl/o/p0wJ77Hzbxh3dpRaa6nWujG+4v/so1pQMh5YqWIOczjRYoBUjjxHdLWT4U
	TCf+2Fk7OxT7J3BTAoWl/xUEWRWNxlepQAjbnAy4/Fx0wEkLDODRGcRnYEw3koXUM4cYsW
	6jw0ESR24ss1CPBGXxZP4gpWIfnjhLT8hPYJykHdy3vnW33W79c2vZzqVc9a9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?utf-8?q?Uwe_Klei?= =?utf-8?q?ne-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Drop undocumented properties from example
Date: Thu,  9 Jun 2022 14:44:13 +0200
Message-Id: <20220609124413.209204-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525205947.2487165-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'99c1734f318c97492083c16910cbda2583830eb1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054418_597163_12BE33B5 
X-CRM114-Status: UNSURE (   5.89  )
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

On Wed, 2022-05-25 at 20:59:46 UTC, Rob Herring wrote:
> With unevaluatedProperties issues fixed, 'nand-bus-width' and
> 'nand-ecc-mode' are flagged as undocumented. Removing them from the example
> is the easiest solution to silence the warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
