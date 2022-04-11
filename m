Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD65EC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGBR9Ta2oTXfY7t71jzOHFJFiXkBGoctoUb3m5w9bqo=; b=RTscz8ylDANhs9
	hTevek8LnSH5h3CVLaauMwTY66cJQ2DzIQIHL9vsTJdx4pwA10WeLxvBzStCL1gd0ULGxf07ACO9t
	0GkCvpJDZXPiqYdmUAHRQT492NAELiyKX3gMRnByW2vPeeKyO0yjFIafsTlKpvblQ1T0dlM2R3n6Q
	S+j6wT7tYW7M6L492dYf85pN48bGOAbCI5kL2+yhC6j7sNJmpIiPq35S3lnajhyskxY7ebexh6hEU
	7MSztjd6cKNZBQOBaAfCTvKGFH0/eVcm5/MuVHjOjJl5JsJ9b8yIb1Y1xQ3g7ZxYIvieA0ezr2c9B
	VpaCgR8txujrbonDVQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndptn-007h8X-Ib; Mon, 11 Apr 2022 08:59:51 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndptW-007h1V-6k; Mon, 11 Apr 2022 08:59:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 762EA100010;
 Mon, 11 Apr 2022 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHhGfgxL0S3jJMjJ9eWRoGXgfDat53Md5h9pfpllbBk=;
 b=hUgcWSpQ8LygWqNmSFSaYQ/9wS/ZhdbQ/KhyoVXhioGge6FYFMWgsvU2FVjaONpYB9+QV7
 q8Mq0VmJwvQ0Tvy3h8ylFoszzMx3LV0iCZg8o05/YUCVTBjx4PLqxpuqJbfRQNEagkvX5e
 e46VxrinOS09rppBS7bBLTnmzV/EhhPnQSvJvvn5DxP+Avcnw/HSC4yOozsn8GyuMuu1U/
 znMEsTEGTfc6ZAQ/B5q1xr0PQ1n8VtzVrleov4c5yZ0elX56U2IUtbXG9BTHV1DRwIj4fF
 ViyOLILWIidJS1ZRdBP37G4D9DdYFVAHsHfp5SZWdkzj7kEPCi/Gn+KrRjJnfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?utf-8?b?UmFmYcWCIE1p?= =?utf-8?b?xYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] nvmem: add driver handling U-Boot environment
 variables
Date: Mon, 11 Apr 2022 10:59:26 +0200
Message-Id: <20220411085926.10925-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220406143225.28107-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'06a39b4da6de04315c133eaca4c785ae6ebc930f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_015934_397406_0FD13FDB 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIyLTA0LTA2IGF0IDE0OjMyOjI1IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFUtQm9vdCBzdG9yZXMgaXRzIHNldHVwIGFzIGVudmlyb25tZW50IHZhcmlhYmxl
cy4gSXQncyBhIGxpc3Qgb2YKPiBrZXktdmFsdWUgcGFpcnMgc3RvcmVkIG9uIGZsYXNoIGRldmlj
ZSB3aXRoIGEgY3VzdG9tIGhlYWRlci4KPiAKPiBUaGlzIGNvbW1pdCBhZGRzIGFuIE5WTUVNIGRy
aXZlciB0aGF0Ogo+IDEuIFByb3ZpZGVzIE5WTUVNIGFjY2VzcyB0byBlbnZpcm9ubWVudCB2YXJz
IGJpbmFyeSBkYXRhCj4gMi4gRXh0cmFjdHMgdmFyaWFibGVzIGFzIE5WTUVNIGNlbGxzCj4gCj4g
SXQgY2FuIGJlIHVzZWQgZm9yOgo+IDEuIEFjY2Vzc2luZyBlbnYgdmFyaWFibGVzIGZyb20gdXNl
ci1zcGFjZQo+IDIuIFJlYWRpbmcgTlZNRU0gY2VsbHMgYnkgTGludXggZHJpdmVycwo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkFwcGxpZWQg
dG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xp
bnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
