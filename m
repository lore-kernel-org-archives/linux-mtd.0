Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46405CD342D
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rElZElD5dO1qickH3Q+bqot5nPc8PacRlODPGzIY9pg=; b=uHQHhrfMIQIwbF
	SyOH+04S5mTfbgJ/eeGRWVsgntfyBUy8TuQeev99Mz5AwSPlC5biYlOC8T1UTJtk9sRuTC885I613
	oszQ9gHGE443WpzEMgwWXjjMm0OEsGRpqUwIAmp4/hMmNbETZ9XWg5t3P69KkvprJ5yu7O32ZzEoC
	FKV2YQJOrmUffvAkrnYu4+4crmtXsZhAz7DuZeDaMtTvhgkwkXScsqMIAv3XlWa/k3XGzpHSBOCLt
	bS40Kzvtov2W2E0L5Oeb3Dl/NgsLCsGABEsMy09E7xI8ecmkrjtGfimvdgi8Mhu5IS3/u+9FFCNEO
	odyDQrQj+2pzOwBtFP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTGw-00000000IuL-1ZPw;
	Tue, 03 Sep 2024 13:08:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slTGs-00000000Irt-2u4G
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 13:08:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1F111C0006;
	Tue,  3 Sep 2024 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725368912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pB2vNbOkOQHLpYZQbbZDQTzWnUnjZRAGf+Nhk5QM0w=;
	b=IXZPo+KTvxrtzSiz3SiL1HOa5CNDzdKsNQQizKxXRTvvVJXiXtFUwnYvyg09JY3mz65lf/
	1stZz1eLHmN0hskkocyekJfFkLdYbWHaf0FTqL7L0NCMaWc8Cc3wrELDxAbpJgmFKz9sEp
	uM+cUAdlkG5yLsEnbr8oDEZmePRVBO3rVWOntYy/wQvHRFsW7EmZByiGHJXN5C9jX5y601
	6/byMAzy+PbQfXBVQCCU7qbEA5KryZZfm1yiaUAQthly/FsvvhprBDl9/kDhDxAByPhHAN
	G00VPk1wiDOdSNlis1OuAUb8J3BqwJTd5RBY1xqp4Mr6PDNzXZwcVlHiVuASbw==
Date: Tue, 3 Sep 2024 15:08:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <richard@nod.at>, <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
 <esben@geanix.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
Message-ID: <20240903150826.749b8560@xps-13>
In-Reply-To: <5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
	<5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_060835_497424_D7895A67 
X-CRM114-Status: GOOD (  13.96  )
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

SGksCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUdWUsIDMgU2VwIDIwMjQgMTQ6
NDU6MTUgKzA1MzA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiA4LzIwLzIwMjQgNDoxMiBQTSwgTWQg
U2FkcmUgQWxhbSB3cm90ZToKPiA+IHY4Ogo+ID4gICAqIEZpeGVkIGNvbXBpbGF0aW9uIHdhcm5p
bmcgcmVwb3J0ZWQgYnkga2VybmVsIHRlc3Qgcm9ib3QKPiA+ICAgKiBBZGRlZCAiY2hpcCIgZGVz
Y3JpcHRpb24gaW4gbmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0KCkKPiA+ICAgKiBBZGRlZCAiY2hp
cCIgZGVzY3JpcHRpb24iIGluIG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KCkKPiA+ICAgKiBDaGFu
Z2VkIGRhdGEgdHlwZSBvZiByZWFkX2xvY2F0aW9uMCwgcmVhZF9sb2NhdGlvbjEsCj4gPiAgICAg
cmVhZF9sb2NhdGlvbjIsIHJlYWRfbG9jYXRpb24zLCBhZGRyMCwgYWRkcjEsIGNtZCwgY2ZnMCwK
PiA+ICAgICBjZmcxLCBlY2NfYmNoX2NmZywgZWNjX2J1Zl9jZmcsIGNscmZsYXNoc3RhdHVzLCBj
bHJyZWFkc3RhdHVzLAo+ID4gICAgIG9yaWdfY21kMSwgb3JpZ192bGQgdG8gX19sZTMyIHRvIGZp
eCBjb21waWxhdGlvbiB3YXJuaW5nLgo+ID4gICAqIEluY2x1ZGVkIGJpdGZpZWxkLmggaGVhZGVy
IGZpbGUgaW4gc3BpLXFwaWMtc25hbmQuYyB0bwo+ID4gICAgIGZpeCBjb21waWxhdGlvbiB3YXJu
aW5nCj4gPiAgICogUmVtb3ZlZCB1bnVzZWQgdmFyaWFibGUgInN0ZXBzIiB2YXJpYWJsZSBmcm9t
Cj4gPiAgICAgcWNvbV9zcGlfZWNjX2luaXRfY3R4X3BpcGVsaW5lZCgpCj4gPiAgIAo+ICAgICAg
SSBoYXZlIGFkZHJlc3NlZCB5b3VyIGNvbW1lbnRzIHRvIHY2IGFuZCBmdXJ0aGVyIHBvc3RlZCB0
aWxsIHY4Lgo+ICAgICAgQ291bGQgeW91IHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGlzIGZp
bmUuCj4gICAgICBhbmQgaG93IHRvIGdldCB0aGlzIG1lcmdlZCA/CgpUaGVyZSBhcmUgc3RpbGwg
a2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0cywgc28gdGhpcyBtZWFucyB0aGVyZSBhcmUKaXNzdWVz
IGluIHlvdXIgY29kZSB0aGF0IEkgZG9uJ3QgbmVlZCB0byBwb2ludCBvdXQgZXhwbGljaXRseSwg
YnV0IEkgYW0KYWN0aXZlbHkgd2FpdGluZyBmb3IgdGhlbSB0byBiZSBmaXhlZC4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
