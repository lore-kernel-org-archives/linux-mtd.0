Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11F3C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7B1bnsA1PdohncQvs2DySkrkdjrwoFPpMepnlR7G90=; b=jC4uA+aDrNIiMt
	RabXBvpisPKE0ugn8BJ/emTaTD3E+/YqWsV6XuEzNz0N4s8/qFJRC6njb+e3QsbDmoQ5dD9Wi2fpf
	354X8T5KsMcwVTEFhCg3lKKvn8fQ1PI5oqOWnAaKfB++wT123ejm3Sd3IU0Xx73ACy7xGjePv29Op
	cMKPFUzkJ29PtPOT07grcqxJkcx/Beqk5UVFMxzyyWletBLOiORkO/RxImzypC7wA3JT4DmvRr/+o
	BwG5Ucurb754AjD2ap4+EyZAT/0sI4by9CfBbH6prx6Sl+XIrNAqp4qjw1v201OJoMZJS3HpMgASQ
	A0wKaDBB1O3Sy02J4nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCTS-00HKlD-0A; Thu, 09 Jun 2022 07:20:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCTF-00HKfJ-Fh
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 07:20:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 825C8B82C43;
	Thu,  9 Jun 2022 07:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE514C34114;
	Thu,  9 Jun 2022 07:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654759242;
	bh=GkGBXoZ0lI7pgry3fH1/hlxhfCuW2nQ9dPWKJZmlobA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIu5f75c01gsq7A3FlZhFl61flEc+x3EMTgwC3K9Z5wVWV94lT1v9XT19H3pE4XmY
	 zkJHzPb7PIiuOttMo612C0vDIMMjAAbc6Q3Jg2bUt0SsxfX7IBMmknuc5Tc1Bk/Y7c
	 G6goJu3RbUBQTTnbMsPvEpmDQDtd8+7i9Zqk12nf4TQqUzi0EMjCY2orDkBzO6lDET
	 y5yUWSI4potzwd+KzBBvaG5KvVPnaHO8t0hi1PiDnJ95BPnanexYgWuoUkF/l+Vijy
	 vW7j8YWSvCN8HByxNRwN9RnSVX94VJYvpiKKyIg9aNvK5qayjrVykTAEMJhmzs017W
	 EhbY9yKtGZaBQ==
Date: Thu, 9 Jun 2022 12:50:29 +0530
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
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-partitions binding
Message-ID: <20220609072029.GA2758@thinkpad>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
 <20220608001030.18813-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608001030.18813-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_002045_836878_3BC84124 
X-CRM114-Status: GOOD (  19.71  )
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

T24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDI6MTA6MjlBTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IERvY3VtZW50IG5ldyBxY29tLGJvb3QtcGFydGl0aW9uIGJpbmRpbmcgdXNlZCB0byBh
cHBseSBzcGVjaWFsCj4gcmVhZC93cml0ZSBsYXlvdXQgdG8gYm9vdCBwYXJ0aXRpb25zLgo+IAo+
IFFDT00gYXBwbHkgYSBzcGVjaWFsIGxheW91dCB3aGVyZSBzcGFyZSBkYXRhIGlzIG5vdCBwcm90
ZWN0ZWQKPiBieSBFQ0MgZm9yIHNvbWUgc3BlY2lhbCBwYWdlcyAodXNlZCBmb3IgYm9vdCBwYXJ0
aXRpb24pLiBBZGQKPiBEb2N1bWVudGF0aW9uIG9uIGhvdyB0byBkZWNsYXJlIHRoZXNlIHNwZWNp
YWwgcGFnZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdt
YWlsLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMu
eWFtbCAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gaW5kZXggODRhZDdmZjMwMTIxLi5hMDkxNGNjYjk1
YjAgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9x
Y29tLG5hbmRjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3Fjb20sbmFuZGMueWFtbAo+IEBAIC0xMDIsNiArMTAyLDMwIEBAIGFsbE9mOgo+ICAgICAg
ICAgICAgICAtIGNvbnN0OiByeAo+ICAgICAgICAgICAgICAtIGNvbnN0OiBjbWQKPiAgCj4gKyAg
LSBpZjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAg
ICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBx
Y29tLGlwcTgwNngtbmFuZAo+ICsKPiArICAgIHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4g
KyAgICAgICAgcWNvbSxib290LXBhcnRpdGlvbnM6Cj4gKyAgICAgICAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItbWF0cml4CgpXb25kZXJpbmcgaWYgdTMy
IGlzIGVub3VnaCBmb3IgY292ZXJpbmcgYWxsIHJhbmdlcz8gT3RoZXIgdGhhbiB0aGlzLAoKUmV2
aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgoKVGhhbmtz
LApNYW5pCgo+ICsgICAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAgIGl0ZW1zOgo+ICsgICAg
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IG9mZnNldAo+ICsgICAgICAgICAgICAgIC0gZGVzY3Jp
cHRpb246IHNpemUKPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBCb290
IHBhcnRpdGlvbiB1c2UgYSBkaWZmZXJlbnQgbGF5b3V0IHdoZXJlIHRoZSA0IGJ5dGVzIG9mIHNw
YXJlCj4gKyAgICAgICAgICAgIGRhdGEgYXJlIG5vdCBwcm90ZWN0ZWQgYnkgRUNDLiBVc2UgdGhp
cyB0byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwKPiArICAgICAgICAgICAgcGFydGl0aW9ucyBieSBk
ZWZpbmluZyBmaXJzdCB0aGUgb2Zmc2V0IGFuZCB0aGVuIHRoZSBzaXplLgo+ICsKPiArICAgICAg
ICAgICAgSXQncyBpbiB0aGUgZm9ybSBvZiA8b2Zmc2V0MSBzaXplMSBvZmZzZXQyIHNpemUyIG9m
ZnNldDMgLi4uPgo+ICsKPiArICAgICAgICAgICAgUmVmZXIgdG8gdGhlIGlwcTgwNjQgZXhhbXBs
ZSBvbiBob3cgdG8gdXNlIHRoaXMgc3BlY2lhbCBiaW5kaW5nLgo+ICsKPiAgcmVxdWlyZWQ6Cj4g
ICAgLSBjb21wYXRpYmxlCj4gICAgLSByZWcKPiBAQCAtMTM1LDYgKzE1OSw4IEBAIGV4YW1wbGVz
Ogo+ICAgICAgICAgIG5hbmQtZWNjLXN0cmVuZ3RoID0gPDQ+Owo+ICAgICAgICAgIG5hbmQtYnVz
LXdpZHRoID0gPDg+Owo+ICAKPiArICAgICAgICBxY29tLGJvb3QtcGFydGl0aW9ucyA9IDwweDAg
MHg1OGEwMDAwPjsKPiArCj4gICAgICAgICAgcGFydGl0aW9ucyB7Cj4gICAgICAgICAgICBjb21w
YXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gLS0gCj4gMi4zNi4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+N
IOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
