Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E28C38A2D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TRWSgtd4eoHjijWeRXolMd6j5gO2gCLWJw9v/WsaPY=; b=JSQmwi3zh0w/EA
	SONeAyFlxnH3m426HeFiOMOb44oEnrIsNG8nIrs8MmoEN174L/phSHkCMNTPhW1HrBud9Ve/RaEk0
	DhDxyhpaMgidMCpDFp9T8YLnBASZSKwdnWoYX5/Bdtp6uDD4jrVzlp9okBDKwXyBwVVv4l8WXdIwB
	pHM6wUFU+gwYhJ33bd/HuglQGKmltcTH+FFUM2jx0LJKmMq48vDUdiUwgFLqT4FQ9hT+aO4fvAZai
	Wru4448nfwXdbdBmbOAYv5CMBQ4mbRP489Z1ghs8jUyLdPejwqhJCxZhGkCHAP1k8z+f+BC8eXI9G
	+TuXxnC8t1XNNHUYnTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omzgL-002Axo-63; Mon, 24 Oct 2022 15:48:05 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omzcK-0029GK-Ve; Mon, 24 Oct 2022 15:43:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3D64A2000C;
	Mon, 24 Oct 2022 15:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666626232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBuQRJf5o8jnwEhp0sljdhub5NXushkq7FT9EjADBvU=;
	b=aVntb3TlCW6S4JwPnqJRR7r3sIB4XX/ka0RnW9LdenHniwPyzKjD5jjvD66L057kvFlBSq
	tlscpxmwH3B14MUT0b7GVz+fb2yRpqQzALBM/O7W8Bo82Wy46yiOz0oWDF8lC3crBNqY2b
	dFp/cDudIDZkXYCtxK9KJajIBNcc2xjrP99GFs3jbFz5s5w7Ap2NxYwNUqCv8BzazhC5Qj
	V+4/yuROUE7mU8AsflDr+WdqQaTpKL+kwYimIl4yyw44Nn15S7cUFYCR9xEQTGjI6A153r
	txlxz5/ry1TC1ef4GLQ12hnSVZmCZHd2B+oZWu+aSuezJbyyvuKq9KYHLfKVNw==
Date: Mon, 24 Oct 2022 17:43:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Elad Nachman <enachman@marvell.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20221024174349.756ed154@xps-13>
In-Reply-To: <VI1P190MB03171976C0A5F4BEA804FD87952E9@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
References: <20221022082628.23876-1-vadym.kochan@plvision.eu>
	<20221022082628.23876-2-vadym.kochan@plvision.eu>
	<5ef70149-5079-173f-ab6a-a9f0cc01f281@linaro.org>
	<VI1P190MB03171976C0A5F4BEA804FD87952E9@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_084357_357041_216FA10D 
X-CRM114-Status: GOOD (  12.31  )
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

SGkgVmFkeW0sCgp2YWR5bS5rb2NoYW5AcGx2aXNpb24uZXUgd3JvdGUgb24gTW9uLCAyNCBPY3Qg
MjAyMiAxNzowODoxNCArMDMwMDoKCj4gSGkgS3J6eXN6dG9mLAo+IAo+IE9uIFNhdCwgMjIgT2N0
IDIwMjIgMTI6MjE6MDcgLTA0MDAsIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBPbiAyMi8xMC8yMDIyIDA0OjI2LCBWYWR5bSBL
b2NoYW4gd3JvdGU6ICAKPiA+ID4gU3dpdGNoIHRoZSBEVCBiaW5kaW5nIHRvIGEgWUFNTCBzY2hl
bWEgdG8gZW5hYmxlIHRoZSBEVCB2YWxpZGF0aW9uLgo+ID4gPiAKPiA+ID4gRHJvcHBlZCBkZXBy
ZWNhdGVkIGNvbXBhdGlibGVzIGFuZCBwcm9wZXJ0aWVzIGRlc2NyaWJlZCBpbiB0eHQgZmlsZS4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZhZHltIEtvY2hhbiA8dmFkeW0ua29jaGFuQHBs
dmlzaW9uLmV1Pgo+ID4gPiAtLS0KPiA+ID4gdjI6Cj4gPiA+ICAgMSkgRml4ZWQgd2FybmluZyBi
eSB5YW1sbGludCB3aXRoIGluY29ycmVjdCBpbmRlbnRhdGlvbiBmb3IgY29tcGF0aWJsZSBsaXN0
ICAKPiA+IAo+ID4gSSBndWVzcyBhbGwgbXkgY29tbWVudHMgZnJvbSB2MSBhcHBseS4KPiA+IAo+
ID4gRGlkIHlvdSB0ZXN0IHRoZSBiaW5kaW5ncz8gIAo+IAo+IFN1cmUsIEkgdGVzdGVkIGl0IGZv
ciBhcm0gYW5kIGFybTY0LCB0aGFua3MgZm9yIHRoZSBjb21tZW50cwo+IEkgd2lsbCBmaXggdGhl
bS4KCkkgYmVsaWV2ZSBLcnp5c3p0b2YgbWVhbnQgd2l0aCBgbWFrZSBkdF9iaW5kaW5nX2NoZWNr
YCwgYW5kIEkgZ3Vlc3MgaGUKZGV0ZWN0ZWQgZXJyb3JzIHdoZW4gZG9pbmcgc28gb24gaGlzIHNp
ZGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
