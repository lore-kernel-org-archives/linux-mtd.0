Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E48EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD7660F9E
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FD7660F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbU+1L57Q4oEuqZ5glGgMuu85MKHX2kRstSAhEfMhdQ=; b=xN+dw88gwCeqPY
	WMaRzK3s+kN+EKFSLrjD3ZaVqT4iiOwhh8VYIenU4d6jGllmASk9SHWmiHIbZyepA3yDLFMjpGUYe
	ZcE72+YXj8wA1s1cBrDpAKZdlk4dfiNHhjYXANW/4im5/IRZNvlhS3Bg1TrRaCsUEfHQxIYe73TwE
	oNl5VQwF/6aXBT465Faoqu+1GZXwxFH7Tkxu/gn6BOejKQVrv6hoX+k6LDBUW7JCkPgDF9dqikwBa
	hw4EsYuJixMJG+KvomqVYBZ2Wst4qpYCYbmIkWiyDThmHxxXo7uj1H5HYCW8JltgxeXqm3Rr67W+T
	ms6LPL5jkTUaGZxy3TMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKVb-006UlR-DQ; Fri, 15 Oct 2021 10:32:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKUz-006UYg-R5
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id F2BD9100004;
 Fri, 15 Oct 2021 10:31:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Arnd Bergmann <arnd@arndb.de>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC] mtd: fixup CFI on ixp4xx
Date: Fri, 15 Oct 2021 12:31:30 +0200
Message-Id: <20211015103130.949127-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210927141045.1597593-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'603362b4a58393061dcfed1c7f0d0fd4aba61126'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033138_034983_5C826C51 
X-CRM114-Status: GOOD (  10.67  )
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

On Mon, 2021-09-27 at 14:10:37 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> drivers/mtd/maps/ixp4xx.c requires MTD_CFI_BE_BYTE_SWAP to be set
> in order to compile.
> 
> drivers/mtd/maps/ixp4xx.c:57:4: error: #error CONFIG_MTD_CFI_BE_BYTE_SWAP required
> 
> This patch avoids the #error output by enforcing the policy in
> Kconfig. Not sure if this is the right approach, but it helps doing
> randconfig builds.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
