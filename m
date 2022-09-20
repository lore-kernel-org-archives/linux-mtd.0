Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25F6C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGTlCBhMvKN5JlQc3Lb/8c+To9VEGfvkvu3ypELIjME=; b=U27bovjPGUOSuJ
	Q6hWcmuu2jxYKSE8MC7vwraLGFStGr3PZcjNpaD1dNg92Ai3kCG+3v6VfZY5IwrkPRrjRIJencXCH
	9NY5Wy2LpfD2j+6KWAC1GULnKgzzux27boA+FbH8Fbvpev9+wCvOqPa/4J3N4rfwGpzxhiBJBgozR
	sd2L/P69tZ6yQ0dZd/lTk5CWlOvYA99CH4Xw/qAscChqSXxy7a7nVrgikMbCiAudos4ai13WMpdDY
	SpawNGzZFYw+Ua0x5vb1r9fmI8ERu3XxEEgxMdfd8OfcymLFMX6Ymux8wOfmCLi0OMxP8ZXgdcNd/
	nTp85djGmlK+3OPbp2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQe-001hDF-61; Tue, 20 Sep 2022 08:16:28 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQN-001gvk-UZ
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78933200008;
	Tue, 20 Sep 2022 08:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2UK/fMafGJHq2A4rubZyAxQifHg4A1+dtkWTbGarVQ=;
	b=oD2UgYBNhr5DMSNSwNEHjAVzVmX1VWNpn4/wNxV6qtAdkezjv0BNvRcbijmiUjh6xr4lTg
	IQzkzyNyUih9zU7hwepgUQXs38UqcMF4E/dtJZGfBpGbzYwGnoC2WfKb1LIbW57awxdWXz
	0RrKqgQRnf4emvzna2gQ0T80/l8hCI0BxsEhRReWvuyFkfwd9XLOtSQmldZYNjD6bpgcZA
	DhbE6Af5/UJQFyMmto4kVNS1y4HBF6XXPm8wPGKj2vlFhZT7uokUJClH6xT0fdJeeVVR3o
	4B6sB25xDFcfGAy1Y2v76W1OH1TwxZkd1Vj29no/BjcLGN1XXLkXcOm6ZoGvjQ==
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
Subject: Re: [PATCH v3 4/8] mtd: rawnand: intel: Remove undocumented compatible string
Date: Tue, 20 Sep 2022 10:16:08 +0200
Message-Id: <20220920081608.598236-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-5-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'68c02ebaa34d41063ccbbc789a352537ddc3cd8a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011612_172090_2B9B28AD 
X-CRM114-Status: UNSURE (   8.03  )
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

On Sat, 2022-07-02 at 23:12:23 UTC, Martin Blumenstingl wrote:
> The "intel,nand-controller" compatible string is not part of the
> dt-bindings. Remove it from the driver as it's not supposed to be used
> without any documentation for it.
> 
> Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
