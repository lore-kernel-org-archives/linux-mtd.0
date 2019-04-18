Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0B6C10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:25:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEAE2171F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BjT6j/AL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EEAE2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qVt/M4KIkGEEYgEYBFdJrt9F3CbhDU19fY5wCFCLqo=; b=BjT6j/ALaIyro/
	B6KuGPEKvx1f5eoiarQmop63y4jiX1cZGXWS5O0O5+jtdNzvohf3xp8HNr10hzXRYX4xUK2XBVxbY
	BF/zfNvgmT6ci/InrlW0OXlHjOKcgwhrxQjabsYV1+BDsRu6yIAtkoLfCMO2CzOJLCUYxPSyp2gTy
	LltfPOWBzZNzfII3Q+mIa/F1WukCqIHrLNilYCQtjldSAs+GJQh5yAG4VCH7dIrDepGMvCXyZWGEM
	Bf0roI7AISzEfw+cubz3MpMTiq5HP3DOX+IHfd4orlZv0abuq+XEtwbeqqIENzCiYuYwiLDbnlgj8
	1pkJYBA5pEfmQdYiTqaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9r7-0004C3-Ek; Thu, 18 Apr 2019 16:25:45 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9r4-0004BS-IS
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:25:44 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 481316000C;
 Thu, 18 Apr 2019 16:25:39 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:25:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2 v2] mtd: nandsim: Embed struct nand_chip in struct
 nandsim
Message-ID: <20190418182537.41f7e7ee@xps13>
In-Reply-To: <20190417185433.29666-1-richard@nod.at>
References: <20190417185433.29666-1-richard@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092542_757167_2674E8EC 
X-CRM114-Status: UNSURE (   7.44  )
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
Cc: bbrezillon@kernel.org, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9u
IFdlZCwgMTcgQXByIDIwMTkgMjA6NTQ6MzIKKzAyMDA6Cgo+IFdlIHdpbGwgbmVlZCBzdHJ1Y3Qg
bmFuZF9jb250cm9sbGVyIHNvb24sIHNvIG1vcmUgc3R1ZmYgbmVlZCB0bwo+IGJlIHBhcnRzIG9m
IHN0cnVjdCBuYW5kc2ltLgo+IFdoaWxlIHdlIGFyZSBoZXJlLCByZW5hbWUgIm5hbmQiIHRvICJu
cyIgdG8gdXNlIHRoZSBzYW1lIG5hbWluZyBzY2hlbWUKPiBldmVyeXdoZXJlIGluIG5hbmRzaW0u
Cj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxh
Ym9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KPiAtLS0KCgpCb3RoIHBhdGNoZXMgYXBwbGllZCB0byAKaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCAKYnJhbmNoIG5hbmQv
bmV4dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
