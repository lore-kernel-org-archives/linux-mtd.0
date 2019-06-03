Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A6C04AB6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E9BA24A87
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cOgrcHWi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E9BA24A87
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvA5xmPVGBIxGJvamzzpiklsD6MHCY9NiV68rqnW+Pw=; b=cOgrcHWitMxdOX
	t3ztmQ99zHehrRPN3e+idlakarr7dSzVfS8gBchOuwMP5wp2cS9tD/iWQWFs9PGWQ65xuvxQOsPkb
	yb3MpiTUiTFmVgxVRg8eNfgPEuGJIt9Bz9E08GpaxVflB56FForUGPsJ6UsYvszm9sB1Xz9lJt4qo
	mwFbfgJlttivk1tRySQsZg0V+YmfRRiHcRsyYd5vHBJN4Kf0sk0DVlDNYTZkBFNQezxFxuvBMWLl4
	8swhxkK8SWMzkIYfuI1gV1YBRegHsdE5fBGvmFw2MtLxorZ/pLImGdHVkenbEbHb4baoIVK+nMkZy
	Hn9HAbF7pEV/EjUJfToA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXhyg-0003aq-3w; Mon, 03 Jun 2019 08:05:58 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhyA-0002sD-1o
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 08:05:56 +0000
X-Originating-IP: 90.88.144.139
Received: from localhost.localdomain
 (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 014721C000D;
 Mon,  3 Jun 2019 08:05:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 kyungmin.park@samsung.com
Subject: Re: [PATCH] mtd: onenand: Add support for 8Gb datasize onenand
Date: Mon,  3 Jun 2019 10:05:18 +0200
Message-Id: <20190603080518.29054-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190426150634.5643-1-pawel.mikolaj.chmiel@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 04e8af9c0b99907a47a16bf47eb46a74079b59f0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_010526_650274_589944D0 
X-CRM114-Status: UNSURE (   6.28  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, Jonathan Bakker <xc-racer2@live.ca>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDE5LTA0LTI2IGF0IDE1OjA2OjM0IFVUQywgPT91dGYtOD9xP1Bhd2U9QzU9ODJf
Q2htaWVsPz0gd3JvdGU6Cj4gRnJvbTogSm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5j
YT4KPiAKPiBVc2VkIGluIHNldmVyYWwgUzVQVjIxMC1iYXNlZCBHYWxheHkgUyBkZXZpY2VzLCBh
bW9uZyB0aGVtIFNHSC1UOTU5ViwKPiBTR0gtVDk1OVAsIFNHSC1UODM5LCBhbmQgU1BILUQ3MDAu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4K
PiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFp
bC5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
