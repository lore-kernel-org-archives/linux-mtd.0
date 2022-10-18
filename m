Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF1C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tt9wEVazq6vaLAG7D9ChXbWMu002P0ofghpY1gNIluA=; b=z5Kmb+KKmRMNbp
	L18YcCdFKItI+UAMdZ+BAWEVKvb/R0mn4A80YrSQu/w7B8L0uy1X3OyswntCjpG/bfPlgwzx5fiVD
	GyQdKBGKjp5AVGmV+2Ca8S/Fep1dgIcHjARY6iY4yXtR+AV4UGEGNFBN1+2EoyA1NzZ7G/I8zLtdb
	lWsO/tUpUEa4hlG84Am0cq92dZdcS0CZ6z2NKFARZRGrFz0GfIoT5qkLyt7mh35FieUzDCcPUoQRo
	/ZaroAccshZwxH16iLJj7XHRSLBPKe+g2DO//h6fT2HHYsAJbQUqu5qeYYI45NMR6+n3AAqMe8sIA
	hAg8/+D19LjI3Jl6yKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLE-005PEk-GS; Tue, 18 Oct 2022 09:56:56 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjKV-005OMh-73; Tue, 18 Oct 2022 09:56:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F0640240010;
	Tue, 18 Oct 2022 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666086969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUYw5ppAKogS4p3St4Ga/MgVfoaYufWQGcRDVb97qfA=;
	b=SRmPPsZpF1XW3VHAFV6EIlidS/8R89kNtuo3tdgbaG0be5VeeesLMWOUxLeJdIbl6NEqQJ
	iqs/MStUw0INdWVwfAScgHsDurTITE96f1A+kBDB1gOCnIDew4KdosX2UfWOSSXD5DP018
	sG0cj58MGrKe1e4jtgVHZyHZ1A1cJa+5DtiZAfAe4pL2xRGR+HMY5Z/vxM2WtKMSJozRaN
	2y5jgfCgayP9VVjqYZ7ujCsmvWlfvCuotYRy91JBDzGYIbbhXUM0v4rhSgqPfuus6Y1bAm
	3QlwrO0UKCiJc6iLjpdFT/aUvYgmL1874MLiJkmVaIcndpUyeFQQBNR4AuJK+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	bcm-kernel-feedback-list@broadcom.com,
	John Crispin <john@phrozen.org>,
	=?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date: Tue, 18 Oct 2022 11:56:05 +0200
Message-Id: <20221018095605.543203-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015092950.27467-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'82d284a21963aa39385842db46b674bf80414eff'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025611_415109_E07B1375 
X-CRM114-Status: GOOD (  10.14  )
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

T24gU2F0LCAyMDIyLTEwLTE1IGF0IDA5OjI5OjQ5IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IE1vc3QgVFAtTGluayBob21lIHJvdXRlcnMgdXNlIHRoZSBzYW1lIHBhcnRpdGlv
bmluZyBzeXN0ZW0gYmFzZWQgb24gYQo+IGN1c3RvbSBBU0NJSSB0YWJsZS4KPiAKPiBJdCBkb2Vz
bid0IHNlZW0gdG8gaGF2ZSBhbnkgb2ZmaWNpYWwgbmFtZS4gR1BMIHNvdXJjZXMgY29udGFpbiB0
b29sCj4gbmFtZWQgc2ltcGx5ICJtYWtlX2ZsYXNoIiBhbmQgTWFrZWZpbGUgdGFyZ2V0ICJGbGFz
aE1ha2VyIi4KPiAKPiBUaGlzIHBhcnRpdGlvbnMgdGFibGUgZm9ybWF0IHdhcyBmaXJzdCBmb3Vu
ZCBpbiBkZXZpY2VzIHdpdGggYSBjdXN0b20KPiBTYWZlTG9hZGVyIGJvb3Rsb2FkZXIgc28gaXQg
d2FzIGNhbGxlZCBTYWZlTG9hZGVyIGJ5IGEgY29tbXVuaXR5LiBMYXRlcgo+IGl0IHdhcyBwb3J0
ZWQgdG8gb3RoZXIgYm9vdGxvYWRlcnMgYnV0IGl0IHNlZW1zIHRoZSBuYW1lIHN0aWNrZWQuCj4g
Cj4gQWRkIGJpbmRpbmcgZm9yIGRlc2NyaWJpbmcgZmxhc2hlcyB3aXRoIFNhZmVMb2FkZXIgcGFy
dGl0aW9ucyB0YWJsZS4gSXQKPiBhbGxvd3Mgb3BlcmF0aW5nIHN5c3RlbXMgdG8gcGFyc2UgaXQg
cHJvcGVybHkgYW5kIHJlZ2lzdGVyIHByb3BlciBmbGFzaAo+IGxheW91dC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gUmV2aWV3ZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQs
IHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
