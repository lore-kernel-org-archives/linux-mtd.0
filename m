Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F42E6FE22
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAyjx21Glo7ogesBEsIcqmqDA5QaGdCSvbtVfAcjCg4=; b=SURva/UJwngZFP
	/3ugan3V8x5McCF61ItRl5j/XxUqN7H9JwE4Kn50Bs0mfacjg33uacRrO8la8SkRCluuPlfjEdh5K
	XJob5ozrG2tHVAnHjrssz/k59rwrj0ALwlUpCYLqgEeZGCpqopAh3u5v7i2qDYUorVBJTWYLR5XFq
	ar9/QnLvR1EwMDVXbOJWDuX/0XWh++LTH8UkRDNn9ylvltDI6iruBRid4e/m4Kts3TFj9WqdkbumT
	M0zrT/XsKyXGkaMmPCNSGF+9DvhqEaSlOocC6XgbK0GyRSIKvw/ETjRTEPMaLJjOxhUehRrmRCmh/
	5o3bG8qljszkuc5jL5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY5-0000000CgBW-42HW;
	Fri, 06 Sep 2024 15:06:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUH-0000000Cek4-3Prb
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F6F51C0007;
	Fri,  6 Sep 2024 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZgzzVby86WW2QxPJTKMBlk81abD2xZrqMTgOPwrYiE=;
	b=T7GQovWLwE0kBGOo5gowjl6lMN9IwqEZNLsuF132Cbaxjd/hRhJzrp+TbxrD1HYjYV3+vB
	KFS+JjIrvp7n0NAFvR/XD33HfexSS7e5K3AaA35RS7DyVaSUniMFrD+WNMLm+Oh4U2x7qM
	yZCSvK42kBEBjGE7pB/aXNfrGDk254+uKNx5cofeVfeT/ZBmGiBByn9gst9NKk8IeB5dxn
	5FuyYYoE9lYimUBXQnjAGlaoiaNz+vSlHtQJIlUIOI0OTISRU/sKzhLX3+HWsxqJ8t/kjF
	YmPfQxw6l4nz4KTwKO5QfacyGft13qzNbk/vu3BRx80PWQm7IfC8upWUyn1fWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 6/9] mtd: spi-nand: macronix: Fix helper name
Date: Fri,  6 Sep 2024 17:02:59 +0200
Message-ID: <20240906150259.734298-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ed148d30eaf4ff55c95ae495ad9b9ffb970f7826'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080302_009363_6E560F2E 
X-CRM114-Status: UNSURE (   6.50  )
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

On Mon, 2024-08-26 at 10:14:09 UTC, Miquel Raynal wrote:
> Use "macronix_" instead of "mx35lf1ge4ab_" as common prefix for the
> ->get_status() callback name. This callback is used by many different
> families, there is no variation in the implementation so far.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
