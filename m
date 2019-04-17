Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDCDC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:28:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B73A20835
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mv1Z/N6q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rLPJt5mV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B73A20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eppzmxw7QOeRsp+pc37j5rUdRaqcDpIlQ2gpiV0wzPE=; b=Mv1Z/N6qEh84ci
	FWT4jUU3f41xs2Rj6jqB0401dLfQHaEySRi/sRvmRbVA+6oydgBHutigfMLgvIttpMli1wcb9BIbJ
	3Tb0wDW2VjN81Db8boccdFDUCGFq3FS4MDWaENSg6jXRdd5s+Jd+68UlycNWKavI1YoXkcRto9dzb
	NYPslpS9AnyWRG0IQ+SMbhWSTAfvbaJjbxeXhh8sVuftSgWN3/hyXu0i46vN0rVuoDmbXN5SzObi2
	Vqv+Yue+vaUuHAA79XDIQStN3NXPvD3iF+A052G087hg86buhIu0zmYmyEdb6xyRsrp2lRJWX7p3X
	6Vbs2vo5IHzHzqmvxRTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhnT-0003RZ-FB; Wed, 17 Apr 2019 10:28:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhnS-0003RS-46
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlxGQM+IbarJcJygCRr5L8BTn8/TjtFqhCAWlHZe/Zw=; b=rLPJt5mVN3LXBVLQmFbWUbcB3x
 /01OdfzypXONq+U+ax2JH9GRwIFXMBHZxUjgTXibPnmkTpZ19oTdH+Jnm5p8+J4Q+1IILNjsR7BWW
 OvN2ZhPHAT/LVJGoEAM9p8mTRAMIxCbt1YM9Sr54j9c9ywg3OgxcunDUQQ+oIpg6wQA9IgXIhLvXG
 4X6gehZkxTu+yeqJKbu9E0huG0gK+LTZLpyyzGR2mYCq3Z/Ah7SnW1g2XKn4FuWTiASqb8f5rw4aj
 76pLQeKNw/a/alinPlIND7AgJXiflVAhvMCXPwOL53a6FC9mir+nLfC9mXHbzHvbI6JjX5jAvDJ5C
 XqzRydYQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhnO-0001Ax-QV
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:28:04 +0000
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C311A200011;
 Wed, 17 Apr 2019 10:27:20 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:27:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 08/14] mtd: rawnand: gpmi: Drop unnecessary restoring of
 previous chipselection
Message-ID: <20190417122719.20cfe182@xps13>
In-Reply-To: <20190409113421.3037-9-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-9-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_112803_006571_94F6FD6C 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjE1ICswMjAwOgoKPiBUaGUgaS5NWDIzIHNwZWNpZmlj
IG9wdGlvbiByZWFkIGNvZGUgaXMgY2FsbGVkIHJpZ2h0IGFmdGVyIG5hbmRfc2Nhbi4gV2UKPiBj
YW4gcmVseSBvbiB0aGUgbmFuZCBjb3JlIGhhdmluZyBkaXNhYmxlZCB0aGUgY2hpcHNlbGVjdCwg
c28gdGhlcmUncyBubwo+IHBvaW50IGluIHJlc3RvcmluZyB0aGUgb3JpZ2luYWwgY2hpcHNlbGVj
dCBhZnRlciBuYW5kIG9wZXJhdGlvbnMuIERyb3AKPiBpdC4KCnMvbmFuZC9OQU5ELwpzL2NoaXBz
ZWxlY3QvY2hpcCBzZWxlY3QvPwogCj4gU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhhdWVyIDxzLmhh
dWVyQHBlbmd1dHJvbml4LmRlPgo+IC0tLQoKV2l0aCB0aGUgYWJvdmUgYWRkcmVzc2VkOgoKUmV2
aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
