Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_RHS_DOB autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C80C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2379620693
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtEcdfUg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2379620693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LowN3PDYKFuW8TSMMVwWuQFMM2oySRKpw45Hr2bRMMs=; b=qtEcdfUg8/xTmk
	rmEE4TVxuABeCR7ETj+iH5pjIBtxagCmYZrM1Ct++8ZueAXw6n52LQXIkZHCQYW7yJ42ntPWy/lzx
	px7G92m3FFexciYZRnJuBCLuI4e6hKf9/B6YJpVbtIycNg6LuPbA5drk5kmZV/X2GAptwZ5lkgSGB
	nHeQacGPgq/qlMEqxOGv/iNl2K1Vsy5e5FIq518vdk7w6e6Wzs0GxRTNt7bh5IaKDuPjL99oB3euZ
	LmxoU7n92MmoIa4xmGjF6t3gmOaSVR+2cd1rMAFHibMCAjsucmZUWQ5dOaCJ4+IG5Xru+jvAKQqYk
	j6lWOhXJ7kRuw4J2A12A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9eI-0003Ny-4t; Thu, 18 Apr 2019 16:12:30 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9eF-0003N6-0X
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:12:28 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 03E7F2000E;
 Thu, 18 Apr 2019 16:12:22 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:12:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix spelling mistake in error message
Message-ID: <20190418181221.377de8f2@xps13>
In-Reply-To: <20190401144901.8965-1-miquel.raynal@bootlin.com>
References: <20190401144901.8965-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_091227_199420_6B840715 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBNb24sICAxIEFwciAyMDE5CjE2OjQ5OjAxICswMjAwOgoKPiBXcm9uZyBjb3B5L3Bhc3RlIGZy
b20gdGhlIHByZXZpb3VzIGJsb2NrLCB0aGUgZXJyb3IgbWVzc2FnZSBzaG91bGQKPiByZWZlciB0
byAjc2l6ZS1jZWxscyBpbnN0ZWFkIG9mICNhZGRyZXNzLWNlbGxzLgo+IAo+IEZpeGVzOiBmODhm
YzEyMmNjMzQgKCJtdGQ6IG5hbmQ6IENsZWFudXAvcmV3b3JrIHRoZSBhdG1lbF9uYW5kIGRyaXZl
ciIpCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgCmJyYW5jaCBuYW5kL25leHQuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
