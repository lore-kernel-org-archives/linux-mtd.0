Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AA01125847
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R55yzMF4TOhrlCNH00UWswPX+AdUPcc6o6zuRa+SFxo=; b=n9ZuRZElvzEQMZ
	32lh2Z7JXrEZXZG61JyR29j+v8/39IDKQSNZBnESzaDYaVz2whyJV15eZrlxNpzXgjirxOC3876De
	MIyvlv2M3LtGD1F1GapXKPBGEtpQDqyRTzppytkZIprR5FEcRNnQ+8KLlpEkPjgQQOKmjsqywvY8R
	/JoFIWltpeKx1oc7/yUhL8EbeYXAyJf+VjSa7l4TmELyJ9lq+2XFo7+j4anoVgzt4IpcQ/9okotua
	sQVkGmB3MLBtRFXQXvBsnmmPyQj1FYIACu7Ube/1+W/yiiVgO94fnGo+Z0LkZP5uVxE9X0z5GjQhX
	D11zbIDxpL3wNfEo4NZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRb-0000000BolE-16HO;
	Wed, 11 Mar 2026 15:25:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRY-0000000BohL-2Aml
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:25:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CB1D4E4261D;
	Wed, 11 Mar 2026 15:25:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E52D660004;
	Wed, 11 Mar 2026 15:25:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFF5710369D02;
	Wed, 11 Mar 2026 16:25:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773242750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zSKPonUvHb2gGCvampT9jeEKT/zJuf2nzMw6wtOz/9M=;
	b=xDOC//x34BBY+EUooh1GCSyL4ycYZBfdiCp3iNM9JpHbHVRWOdfkmpAlCSETbSgvBtxgzy
	2exGy0npd1UUVxfGn0Vzn2NvFr5Vd6LqawCWJKRIsvwbJvbUCtG4a83ntRUYfYM0+DBddY
	QlPfsWMUO2789p4xPlRfQaHTlBEJh1d1gFAZFqOBeBs7R8S9RLEt46OvMiOX/WK/1QffSS
	RxBkFC5OqJIIktO/Bwca33lESLUPsUbO1UHQ3edIFGBxARkvLnONp1Ld+Q7QcWowS84Y94
	ZPMJGnExMeHX+rd1LHEzqiK8pQY/ZvOdz/PQOn66d8FpInwaNOjJLzjMORCnbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
Subject: Re: [PATCH 0/3] Fix spear600-smi YAML conversion
Message-Id: <177324274850.685435.11462507375095087792.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:25:48 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082552_706617_CC978F52 
X-CRM114-Status: UNSURE (   6.31  )
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

T24gV2VkLCAyNSBGZWIgMjAyNiAxNzoyNDo0MiArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBSZWNlbnQgY29udmVyc2lvbiBmcm9tIHR4dCB0byB5YW1sIG9mIHRoZSBTcGVhcjYwMCBTTUkg
YmluZGluZyBieSBBa2hpbGEKPiBsZWFkIHRvIHdhcm5pbmdzLiBUaGVzZSBhcmUgbXkgMmN0cyBp
biBnZXR0aW5nIHRoZSB5YW1sIGNvbnZlcnNpb24gZG9uZQo+IDotKQo+IAo+IENoZWVycywKPiBN
aXF1w6hsCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzNdIGR0
LWJpbmRpbmdzOiBtdGQ6IHN0LHNwZWFyNjAwLXNtaTogRml4IGRlc2NyaXB0aW9uCiAgICAgIGNv
bW1pdDogZjliMmFjMzk1ZDkxZmE5NzRjMDkyMmJjOTQ5YmJiNmM4ZGI1OGYzZQpbMi8zXSBkdC1i
aW5kaW5nczogbXRkOiBzdCxzcGVhcjYwMC1zbWk6ICNhZGRyZXNzL3NpemUtY2VsbHMgaXMgbWFu
ZGF0b3J5CiAgICAgIGNvbW1pdDogODg1MjdjODRmZmZlNTFhOTEyZjM2ZWFmMWIwZWYxMWFjYmNm
ZjVlNwpbMy8zXSBkdC1iaW5kaW5nczogbXRkOiBzdCxzcGVhcjYwMC1zbWk6IEZpeCBleGFtcGxl
CiAgICAgIGNvbW1pdDogMGJmZWQ4YWFmODY0ZWM0MmE4NGJkNjgwOTI5MjMyODJkNzY0MTM2YgoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
