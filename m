Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60397C28CC7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:19:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A89267AD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SRvb2zxr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FrLaKWUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A89267AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vu/OLPYJmq00JYZZLD0OxR57GdJj6242FXDesScjSWo=; b=SRvb2zxrXlL5kj
	npMGDY79AVTNTGN1SZhbIsaDh0LlgUkWERF8gOxG3YlM10NQXuBlXh6nm+vmbt9cieGtUwInLT5E4
	GvuiBxL466wQ6YmcYgk9aAM5ngTo6G07P0XECaeeIjHkWNtEtT4f+HMWh8rpKWtFPEag4X0rddkcS
	1xksA04IH27wim7TW68o1rsGEFe2LsILnWW6HgpkyTLrHozYWzzws4b3jv8d+5i9hZluXzuF6EH9K
	YyUmILF4BnlknmrBhnTI8zL8uPIHQdYn4DhPgguPjWusiZCllXFJnet1MZdqiHl+XR6W2mR/+13P2
	3P4Foeu22kfsQFnZ77eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXiBi-0000q1-KH; Mon, 03 Jun 2019 08:19:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXiBh-0000i4-86
 for linux-mtd@bombadil.infradead.org; Mon, 03 Jun 2019 08:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VUoX0il5iQLfxDTbApZKx3Wh5eL0++xhktRAgCB99wU=; b=FrLaKWUdV+3xaEhT106KPhngwb
 Jl4dhQirZK8eV7HjMOuwMY/6s1x2/RujzO2tLuWcyS12k3peTDYtr2wGXMm3QWCbFoKYiMI9bAR6S
 vvNpDvYBZtzazwAfuiH6OFpsG7DLkZWx5+pology1oGT16f7Oa82bHUXa8lCjXKl5aKU8oFNlAz6G
 6VbDXdMSoytoVb0T82/9gIh06im6c17Gy8eWCAvmbq3/S1rpghkCgdB2OfDZ7DVX7fXPBxpIyKBEE
 6Q9moqeiE6WdeEpBnqAE1fcJ9Yhen6ogw7glUlKq/Ku63jLxzdZWcc8kzjlYWAMBRTAdNVZ6ub+Ql
 5km53gfA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhy8-0006PR-4p
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 08:05:26 +0000
X-Originating-IP: 90.88.144.139
Received: from localhost.localdomain
 (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E63831C001A;
 Mon,  3 Jun 2019 08:05:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: fix bch ecc layout for large
 page nand
Date: Mon,  3 Jun 2019 10:05:00 +0200
Message-Id: <20190603080500.28988-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <1556738544-29857-1-git-send-email-kdasu.kdev@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 20f23230d790b075e531d2c138939385728a5bef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_090524_932316_740E35D3 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-05-01 at 19:22:14 UTC, Kamal Dasu wrote:
> The oobregion->offset for large page nand parts was wrong, change
> fixes this error in calculation.
> 
> Fixes: ef5eeea6e911 ("mtd: nand: brcm: switch to mtd_ooblayout_ops")
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
