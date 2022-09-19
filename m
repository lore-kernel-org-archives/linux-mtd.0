Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF270ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7bO+UWbyJzwLeZby2WyBmg9HzXhHdAiXcQEbaR3SRs=; b=J3OvcP+s0GXPBz
	0Ec1Da/NDhAlawMQJWLfr7YdergwQeuIVKlkaDj7jpAzXr19z1/p2HkKsQT37Yuvg6rttD6NXQ7UV
	tIdX6xC5M65GUXTN+x3jMPak5qgfF4Kxq55m1Zk/8+adjtTfJqPHbzRPO2al10yet22qWRK5jM481
	Ozdh2MD3LF9k//Wlh79OuWBThAsSOuVjbLvWPh4PhRtkfB1pCQkpEG1L1JM3/YUH13PiBy/AvWJbP
	KajmVKvsaI+EzPJoHWkopJqqu4soCij/IiN6rBlofDwx/r4It/4gGiN0/ccGH6NLYuCObwMzuJdj/
	L3FDdm8sJ5HxpKV88iWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJR5-00Cnrp-AY; Mon, 19 Sep 2022 16:15:55 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJR2-00Cnpx-1C
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:15:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ACD16C000C;
	Mon, 19 Sep 2022 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Dc/RlglN5rD6jeAjq6bz9fLtyemoPUuRw33vxFl6Yo=;
	b=N/DqyCnoZ+xMZrFCE4iiOhh4jKP7f/F7t3X+VHB/ob54vs0YF6fmJTgeHlksp28mY/sMDf
	yrXBWs2PCajxTQJOdp1kZ1/9/uv8oeGFyWrTzfDDLgLrr+fM5Nb3fKEpDHRbKh44VFyk19
	KcDrRVpVz7GveGNxE3m527KKKnsdlPFrsD/0FBcF3sqqi54bnBQflgQs+7EzB9aMVWSxQd
	gtyGzCs3FrfQMINODn8cJkZTxL/Edh+wC+jvP7RSoTKLlYSf4QcvW0NiXo5OduhT1iyZ3n
	ppe+s0ovLtsuJIvKj7H/oLF//DF/qglA1Vu2H5SksSGHqemUr4pm0QmZuYWVkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wangweiyang2@huawei.com
Subject: Re: [PATCH -next] mtd: ftl: use container_of() rather than cast
Date: Mon, 19 Sep 2022 18:15:46 +0200
Message-Id: <20220919161546.226481-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816135910.268016-1-cuigaosheng1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bf3e6b8f837afdf01d31cdc86028660f3f342bbe'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_091552_238617_E2523B64 
X-CRM114-Status: UNSURE (   5.68  )
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

On Tue, 2022-08-16 at 13:59:10 UTC, Gaosheng Cui wrote:
> The container_of() is much more readable and also safer.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
