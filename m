Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B5BC4332F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrfDkCi78REgFdFTFHJDR+Q61A9PoAZhMTwfsREimkw=; b=w1RtbTzt/p+5mf
	BDEKLuxBLDy9079OeWamPuivL4xPTuWSUGfsOgm/Kzwvoi7QL0xcCL8OQ3p3tWgZw3mHTN4oJiLDa
	Qc2DmagunSOQL/r6QZ983HizYeeX7W5ercrFIfvJFrKAwMRT/qfxqCWHeGldphGNz4bdOKIKgIwZk
	8N1GmhkThBRVpJ+4FkrEfwjfjVXo3yTc4PBpcmcUIpfhPVahDRP0XLFCFhecQGxeZLW/DCRC2GxnD
	4VPASQyNZTGsjpnnt4Hka30RFqrRurzkTmZQpPA5LeoBsJPDLEa0RuPlybLV+nKElr76NjDSCUMhX
	TcEw5glEms+E+Dmbg99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJwk-003ikx-Ux; Tue, 08 Nov 2022 08:27:03 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJwh-003iii-Q8
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 08:27:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AF8A2100006;
	Tue,  8 Nov 2022 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667896013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nyOQBBCwy5LvUjAVyjwQzg8dIstpjePTgDnGaoZhyTc=;
	b=JCsoJTuYrYVbQKGBrMvdrxIEAjU4s5FrXPqhzBnkoQJEeloXaTWlJQi9U/pRF0jFvWoIeL
	gk2PxZA2kt9qhH4nAzoq20C7cTDQGge8fvyq8Z3EWiZU9AMeZjJX25ZfZClzIn7GtXi+PJ
	qbkbDYpdoc8Y82HoKjz7R1mRKvZza3Sft/CkN1kP0NhUP1I2CQJQA4UwNqdGNPPienVjks
	UeUJUOpDn4wLPhykQMAF5bty2/ut68j1ggNQ8HyIl7ukfktDTaQJPEwH+e5pfeCtKX16kQ
	T3N+x5nBX0AumgguvIi9a9tj5F2+7+Xo+XPikruR7J6Rz7A6pD8vXJ7gk2tQNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: brcm,brcmnand: update interrupts description
Date: Tue,  8 Nov 2022 09:26:49 +0100
Message-Id: <20221108082650.60536-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104085316.24499-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'075e181fba721d7af83dd1f2b65aed64703f5a40'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_002659_999508_2E21D704 
X-CRM114-Status: UNSURE (   7.90  )
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

T24gRnJpLCAyMDIyLTExLTA0IGF0IDA4OjUzOjE2IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IDEuIERNQSBhbmQgRURVIGFyZSBtdXR1YWxseSBleGNsdXNpdmU6IGRvbid0IGFs
bG93IGJvdGggYXQgdGhlIHNhbWUgdGltZQo+IDIuIFJlcXVpcmUgaW50ZXJydXB0LW5hbWVzIGZv
ciAyKyBpbnRlcnJ1cHRzIHRvIGF2b2lkIC9ndWVzc2luZy8KPiAKPiBSZXBvcnRlZC1ieTogRmxv
cmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoK
TWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
