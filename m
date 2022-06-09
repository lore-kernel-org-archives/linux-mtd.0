Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01327C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLWy2JpmFOEgbWDn62dCXtrNfI/r9EqdsTcl3TwYNQY=; b=QzCb8kRow0EsD+
	LAV5FjrUrWSDCd4jFK320ogLIJr+MVBjDy4uiK+jFaY72UKxwzewyhk4jDUaroOVnRPGUNJLbfkVu
	Q5/SrdkXjOn3WwNGGUZw4fJSj68tYDEgkbMnrfF7Pa2wIkuUI0sFhcSiHzUqOVUrsTqLD5tr9O9pi
	99qq5Exbe3BgYK0NV+rqbfmSapigFysJWnW98kPbtO8Tr1NXR3YzHoZanvCiDov8kPjCSU6Sn/K92
	oTp0xmp0wJ+ownRrKu/Jz7XAhcDakoRz0cZQqWxKzIZbZKo7NvWmnHjN8uj1azP98XZHafY6YX95P
	KQ5pipwSFD4At6kbzhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFM8-000yDM-KA; Thu, 09 Jun 2022 10:25:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFM6-000yBy-I6
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 10:25:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v25so30583383eda.6
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BF6ToR34rwIt5IS191pj4nLe5IsCsROznE05uP/+Uqs=;
        b=gtqh7qJZ0+9U+7O4nUcZEdHelSNVMDaG0OEAYUkiVxz31j1tif25vJdCXhsog2i0F0
         hLQcvE1btMskuHBWmmxwD7JNZTdliKE3mEB5Yu5B+S93BmPfX9us4+BhAJXWGi8Lgap+
         9ajET1/btAhBqayca1UWvEfr+u01ytkVQYZel7e58Vo984RfsnG/A7vyiU+tS3tld8gx
         whuUXyob9HsaA4MgQB0MI4BhuZXRGC0KL3CzS/l2YEj3sP3OcNsE8LpeeqNvquV5CdAm
         ryEHdAvZOn+2XKTx0jHkDEHCnMq050n8TZLxjxQldP5KFQSpGsbnSOtfP1YSNjOTXnP8
         R0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BF6ToR34rwIt5IS191pj4nLe5IsCsROznE05uP/+Uqs=;
        b=FIUhFfksSRjb0Pc6+07QiVBa1KXYSUmb8oGvNdGdLe0AIOG749KMNwhhoV998t17Kw
         Kpj5LszQdonU/LHTCjasp16ZvxKIFQLlr3XNmTy9eMwQdCh9R15cDzTgwd3pwyq1iPq2
         XcmhJBv5n4AbkIxR/SPmpw7r7hYA8z0sQOa3L1nJi+9+D1WDoBb+GW2zn2e/d0svB9KC
         HIgmDopFyOwPq8V3FZ+BKtxD7bp32MnC6Z8B6BgIL+G9lgcjwmSlbWxj9y+KuZCZBMHN
         7Oa3EBwqP/JFUJhs8q2YZGvVfsN3vUCBovB8eAXORsIFN8Pf7wwZd5Rvtbi86fedijm4
         lDkA==
X-Gm-Message-State: AOAM531tehw1y5zOvpPy9PzIONV1wang3dI3pYcddEeojbqS7RS1YZcp
	254s+WKL5UxzlqYWlwZNEX8=
X-Google-Smtp-Source: ABdhPJyeeDg7TxdkBdqiyTzlSIIZTnDroZskZzCgvxigfPZd5Wfw12Qot2iob0xzzEXxgfwEAGuVCg==
X-Received: by 2002:a05:6402:3318:b0:42d:f04b:f50a with SMTP id e24-20020a056402331800b0042df04bf50amr44005739eda.210.1654770330865;
        Thu, 09 Jun 2022 03:25:30 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id en22-20020a056402529600b0043120d5f3dcsm9146510edb.14.2022.06.09.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 03:25:30 -0700 (PDT)
Message-ID: <62a1ca9a.1c69fb81.3b355.0b02@mx.google.com>
X-Google-Original-Message-ID: <YqHKlxUo/0OnIGwD@Ansuel-xps.>
Date: Thu, 9 Jun 2022 12:25:27 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
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
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
 <20220608001030.18813-3-ansuelsmth@gmail.com>
 <20220609072029.GA2758@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609072029.GA2758@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_032534_636085_F388321B 
X-CRM114-Status: GOOD (  22.99  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTI6NTA6MjlQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDAyOjEwOjI5QU0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IERvY3VtZW50IG5ldyBxY29tLGJvb3QtcGFydGl0aW9u
IGJpbmRpbmcgdXNlZCB0byBhcHBseSBzcGVjaWFsCj4gPiByZWFkL3dyaXRlIGxheW91dCB0byBi
b290IHBhcnRpdGlvbnMuCj4gPiAKPiA+IFFDT00gYXBwbHkgYSBzcGVjaWFsIGxheW91dCB3aGVy
ZSBzcGFyZSBkYXRhIGlzIG5vdCBwcm90ZWN0ZWQKPiA+IGJ5IEVDQyBmb3Igc29tZSBzcGVjaWFs
IHBhZ2VzICh1c2VkIGZvciBib290IHBhcnRpdGlvbikuIEFkZAo+ID4gRG9jdW1lbnRhdGlvbiBv
biBob3cgdG8gZGVjbGFyZSB0aGVzZSBzcGVjaWFsIHBhZ2VzLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbCAgIHwgMjYgKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20s
bmFuZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxu
YW5kYy55YW1sCj4gPiBpbmRleCA4NGFkN2ZmMzAxMjEuLmEwOTE0Y2NiOTViMCAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55
YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20s
bmFuZGMueWFtbAo+ID4gQEAgLTEwMiw2ICsxMDIsMzAgQEAgYWxsT2Y6Cj4gPiAgICAgICAgICAg
ICAgLSBjb25zdDogcngKPiA+ICAgICAgICAgICAgICAtIGNvbnN0OiBjbWQKPiA+ICAKPiA+ICsg
IC0gaWY6Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4g
PiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4gKyAgICAgICAgICAgIGVudW06Cj4gPiArICAgICAg
ICAgICAgICAtIHFjb20saXBxODA2eC1uYW5kCj4gPiArCj4gPiArICAgIHRoZW46Cj4gPiArICAg
ICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgIHFjb20sYm9vdC1wYXJ0aXRpb25zOgo+ID4gKyAg
ICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItbWF0
cml4Cj4gCj4gV29uZGVyaW5nIGlmIHUzMiBpcyBlbm91Z2ggZm9yIGNvdmVyaW5nIGFsbCByYW5n
ZXM/IE90aGVyIHRoYW4gdGhpcywKPiAKPiBSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pQGtlcm5lbC5vcmc+Cj4gCj4gVGhhbmtzLAo+IE1hbmkKPgoKSSBtZWFuIHRoZXkg
YXJlIG9mZnNldCBhbmQgc2l6ZXMuLi4gQ29uc2lkZXJpbmcgaXQncyBhbiBvbGQgU29DIGFuZCBt
YXgKbmFuZCBtb3VudGVkIGlzIDFnIHdlIHNob3VsZCBiZSBzYWZlIHdpdGggdTMyLgoKPiA+ICsg
ICAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBvZmZzZXQKPiA+ICsgICAgICAgICAgICAgIC0gZGVzY3JpcHRpb246
IHNpemUKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgICAgICAgQm9vdCBw
YXJ0aXRpb24gdXNlIGEgZGlmZmVyZW50IGxheW91dCB3aGVyZSB0aGUgNCBieXRlcyBvZiBzcGFy
ZQo+ID4gKyAgICAgICAgICAgIGRhdGEgYXJlIG5vdCBwcm90ZWN0ZWQgYnkgRUNDLiBVc2UgdGhp
cyB0byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwKPiA+ICsgICAgICAgICAgICBwYXJ0aXRpb25zIGJ5
IGRlZmluaW5nIGZpcnN0IHRoZSBvZmZzZXQgYW5kIHRoZW4gdGhlIHNpemUuCj4gPiArCj4gPiAr
ICAgICAgICAgICAgSXQncyBpbiB0aGUgZm9ybSBvZiA8b2Zmc2V0MSBzaXplMSBvZmZzZXQyIHNp
emUyIG9mZnNldDMgLi4uPgo+ID4gKwo+ID4gKyAgICAgICAgICAgIFJlZmVyIHRvIHRoZSBpcHE4
MDY0IGV4YW1wbGUgb24gaG93IHRvIHVzZSB0aGlzIHNwZWNpYWwgYmluZGluZy4KPiA+ICsKPiA+
ICByZXF1aXJlZDoKPiA+ICAgIC0gY29tcGF0aWJsZQo+ID4gICAgLSByZWcKPiA+IEBAIC0xMzUs
NiArMTU5LDggQEAgZXhhbXBsZXM6Cj4gPiAgICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aCA9IDw0
PjsKPiA+ICAgICAgICAgIG5hbmQtYnVzLXdpZHRoID0gPDg+Owo+ID4gIAo+ID4gKyAgICAgICAg
cWNvbSxib290LXBhcnRpdGlvbnMgPSA8MHgwIDB4NThhMDAwMD47Cj4gPiArCj4gPiAgICAgICAg
ICBwYXJ0aXRpb25zIHsKPiA+ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRp
b25zIjsKPiA+ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiAtLSAKPiA+IDIu
MzYuMQo+ID4gCj4gCj4gLS0gCj4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCu
vuCumuCuv+CuteCuruCvjQoKLS0gCglBbnN1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
