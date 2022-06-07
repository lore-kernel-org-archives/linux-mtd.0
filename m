Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4190FC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vogdgraeK/SZuGT7uEaLJtI3e9C01bsZOT0OYkwaASM=; b=TmHD4GmNK3elyz
	48i5Cdha9WQO8ZdkWyEZSIgbshwEzWPp4/ytoEiJ/7J1/zoG4XkkiAlWc8QoRQZ7fhrER8vnd7ZML
	n6OB38zmX1TbJJ3zycE9HkcYILCgzuN69+/UEtV5OoBuZQAIxFu1VkEC/rABeGHEABoE70Z56I42i
	N9PP9knjS9wUAGcmZxj8/kaWPl/zODYI85f2n7tCsIOsR1qSTxaVw7Rp4+14+ZyzGD+yhfohMRFoH
	rK1vCFQ5aNtp+ABqM8mlDys+q8gfmoJfhLhGJlvxbHTU16BjCDAkk4QNVjABTxoVGSCEHWSLjnFr9
	z4C7F3OGy5tdg9AdIoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVTk-006CZM-V8; Tue, 07 Jun 2022 09:26:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVJD-0067v9-Ci
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 09:15:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75A3160B04;
	Tue,  7 Jun 2022 09:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501F7C34115;
	Tue,  7 Jun 2022 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654593329;
	bh=5h8hqwagvhF3XfyBKoQeu2Il4wlCPDFuCIODPfv0Rjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=keXiQNyO22UOTWAvRO4hpVtbzMvgrub7KUhhq6jRV+SzUW2FG7HNG2yUd+UI9sMWz
	 +MDWt5s62Fx8rygVKylIOYNQ401Qh2dDU4diH3LvpAkRxgWvCbhucPINTB8C4A7Sf2
	 4H60pD3XXW37tSeHT/2R9pwcf/xuTAh7eGac8BqCKVg5d+K5X4TkXoWfr1diAXp39q
	 gtI+vfERdLYIZ3DGgnCm5bw8BEpc1vYALmSSBkMg86eiXSdQ+a7WKMLk92gI9MZTOc
	 jzvVoRsqrRB2Dpn4baLtB6vuuyOQ/8HAHUBd9FaRZ3HvYIiYqsODU12Vk6UlFaCWsB
	 qq8iWCOPdoltg==
Date: Tue, 7 Jun 2022 14:45:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
Message-ID: <20220607091522.GB5410@thinkpad>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220519190112.6344-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519190112.6344-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_021531_545846_4DB61481 
X-CRM114-Status: GOOD (  21.34  )
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

T24gVGh1LCBNYXkgMTksIDIwMjIgYXQgMDk6MDE6MTJQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IERvY3VtZW50IG5ldyBxY29tLGJvb3QtcGFnZXMgYmluZGluZyB1c2VkIHRvIGFwcGx5
IHNwZWNpYWwKPiByZWFkL3dyaXRlIGNvbmZpZ3VyYXRpb24gdG8gYm9vdCBwYWdlcy4KPiAKPiBR
Q09NIGFwcGx5IGEgc3BlY2lhbCBjb25maWd1cmF0aW9uIHdoZXJlIHNwYXJlIGRhdGEgaXMgbm90
IHByb3RlY3RlZAo+IGJ5IEVDQyBmb3Igc29tZSBzcGVjaWFsIHBhZ2VzICh1c2VkIGZvciBib290
IHBhcnRpdGlvbikuIEFkZAo+IERvY3VtZW50YXRpb24gb24gaG93IHRvIGRlY2xhcmUgdGhlc2Ug
c3BlY2lhbCBwYWdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNt
dGhAZ21haWwuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxu
YW5kYy55YW1sICAgfCAyNiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwKPiBpbmRleCA4NGFkN2ZmMzAxMjEuLmE1OWFl
OTUyNWY0ZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3Fjb20sbmFuZGMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gQEAgLTEwMiw2ICsxMDIsMzAgQEAgYWxsT2Y6Cj4g
ICAgICAgICAgICAgIC0gY29uc3Q6IHJ4Cj4gICAgICAgICAgICAgIC0gY29uc3Q6IGNtZAo+ICAK
PiArICAtIGlmOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4g
KyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgZW51bToKPiArICAgICAgICAgICAg
ICAtIHFjb20saXBxODA2eC1uYW5kCj4gKwo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGll
czoKPiArICAgICAgICBxY29tLGJvb3QtcGFnZXM6CgpFdmVudGhvdWdoIHRoZSBwYWdlIGxheW91
dCBpcyB3aGF0IG1ha2luZyB0aGUgZGlmZmVyZW5jZSwgaGVyZSB0aGUgYm9vdApwYXJ0aXRpb24g
b2Zmc2V0IGFuZCBzaXplIGFyZSBnZXR0aW5nIHNwZWNpZmllZC4gU28gaG93IGFib3V0LCBjaGFu
Z2luZyBpdAp0byAicWNvbSxib290LXBhcnRpdGlvbnMiPwoKVGhhbmtzLApNYW5pCgo+ICsgICAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLW1hdHJp
eAo+ICsgICAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAg
ICAgIC0gZGVzY3JpcHRpb246IG9mZnNldAo+ICsgICAgICAgICAgICAgIC0gZGVzY3JpcHRpb246
IHNpemUKPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBTb21lIHNwZWNp
YWwgcGFnZSB1c2VkIGJ5IGJvb3QgcGFydGl0aW9uIGhhdmUgc3BhcmUgZGF0YQo+ICsgICAgICAg
ICAgICBub3QgcHJvdGVjdGVkIGJ5IEVDQy4gVXNlIHRoaXMgdG8gZGVjbGFyZSB0aGVzZSBzcGVj
aWFsIHBhZ2UKPiArICAgICAgICAgICAgYnkgZGVmaW5pbmcgZmlyc3QgdGhlIG9mZnNldCBhbmQg
dGhlbiB0aGUgc2l6ZS4KPiArCj4gKyAgICAgICAgICAgIEl0J3MgaW4gdGhlIGZvcm0gb2YgPG9m
ZnNldDEgc2l6ZTEgb2Zmc2V0MiBzaXplMiBvZmZzZXQzIC4uLj4KPiArCj4gKyAgICAgICAgICAg
IFJlZmVyIHRvIHRoZSBpcHE4MDY0IGV4YW1wbGUgb24gaG93IHRvIHVzZSB0aGlzIHNwZWNpYWwg
YmluZGluZy4KPiArCj4gIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4g
QEAgLTEzNSw2ICsxNTksOCBAQCBleGFtcGxlczoKPiAgICAgICAgICBuYW5kLWVjYy1zdHJlbmd0
aCA9IDw0PjsKPiAgICAgICAgICBuYW5kLWJ1cy13aWR0aCA9IDw4PjsKPiAgCj4gKyAgICAgICAg
cWNvbSxib290LXBhZ2VzID0gPDB4MCAweDU4YTAwMDA+Owo+ICsKPiAgICAgICAgICBwYXJ0aXRp
b25zIHsKPiAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAtLSAKPiAyLjM0LjEKPiAKCi0tIArgrq7g
rqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
