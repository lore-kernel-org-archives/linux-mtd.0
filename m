Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B38C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A7Y4zHNShhvBCXyvror/iVQnaKuap+PEVr5Pxknczc=; b=aypmkfZcxZ4a+J
	xwmwWAb+cBaVpixm9d8cGJx7bP+afKuAvKfitkvK369cjq8AmCquN7Z9WZfqzU4ZgLaAxGixFelGp
	qxs2NSiJo7vX3vP87IpnKTuvakCoUkGv6bSc79Ys77wJ7pBcn95SSFi67c6LL+nKPvWEKmGulcFeQ
	w+1YHuQfDVaR2Dt0fiZwqdODYEM5Cv2mgdutq0aM8sFgKn7zuU6mIhq0Zqd7CGfcd8E3NQIvT9sPZ
	MKldEvfEa8dG3izdPItY3OJhptVE7a85lhxZRVJ9/8GOx9Y1w0pvN6iQNzYpgx468icS6CosAvNv9
	Y8EMa48Todoj0fhkkaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1w8W-0048l9-Jb; Thu, 16 Jun 2022 20:30:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1w8U-0048jK-2R
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 20:30:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69B6661DED;
	Thu, 16 Jun 2022 20:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22396C3411B;
	Thu, 16 Jun 2022 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655411436;
	bh=stQjKK5hULXhgTZqMOZMxI+VoTvhtjbBez+S+FBZsCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZ4taM7oD2t6T/xFHt/VoFygBcFsniVKbkMkrfaaYMsNCCxWfR5PxbjAdaCDJXywN
	 Py8FZ20KJd+rCsN4btXh4HfcUP1sYkIFRQAqmKtDcJGxZWm24fYoSnJFIhJA+T27YG
	 TVkq5YYEHa8uIDKvzctvf3sOCu8V4P38aBlC2dPFSFXOre2LYYVt/jJ2qqCgguDDeT
	 /cgUjrCIPWGanGM8KLwuue8bdCFCv9yPAG26EIhXUVsaPmKJOO52Ekkz9NcN1k5qMQ
	 L4Yk3IEkwnu3zrRgjgwqNXxiEqQgevO3eDvaQ+6tO45lRbf21Pb3SiRrG2X6v4sMHK
	 kn2f51c7b5ANQ==
Date: Fri, 17 Jun 2022 02:00:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-partitions binding
Message-ID: <20220616203035.GE2889@thinkpad>
References: <20220616001835.24393-1-ansuelsmth@gmail.com>
 <20220616001835.24393-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616001835.24393-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_133038_221870_9FF17573 
X-CRM114-Status: GOOD (  19.39  )
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

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMDI6MTg6MzVBTSArMDIwMCwgQ2hyaXN0aWFuIE1hcmFu
Z2kgd3JvdGU6Cj4gRG9jdW1lbnQgbmV3IHFjb20sYm9vdC1wYXJ0aXRpb24gYmluZGluZyB1c2Vk
IHRvIGFwcGx5IHNwZWNpYWwKPiByZWFkL3dyaXRlIGxheW91dCB0byBib290IHBhcnRpdGlvbnMu
Cj4gCj4gUUNPTSBhcHBseSBhIHNwZWNpYWwgbGF5b3V0IHdoZXJlIHNwYXJlIGRhdGEgaXMgbm90
IHByb3RlY3RlZAo+IGJ5IEVDQyBmb3Igc29tZSBzcGVjaWFsIHBhZ2VzICh1c2VkIGZvciBib290
IHBhcnRpdGlvbikuIEFkZAo+IERvY3VtZW50YXRpb24gb24gaG93IHRvIGRlY2xhcmUgdGhlc2Ug
c3BlY2lhbCBwYWdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTWFyYW5naSA8YW5z
dWVsc210aEBnbWFpbC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pQGtlcm5lbC5vcmc+CgpUaGFua3MsCk1hbmkKCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbAo+IGluZGV4IDg0
YWQ3ZmYzMDEyMS4uNDgyYTJjMDY4NzQwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwKPiBAQCAtMTAyLDYgKzEw
MiwzMSBAQCBhbGxPZjoKPiAgICAgICAgICAgICAgLSBjb25zdDogcngKPiAgICAgICAgICAgICAg
LSBjb25zdDogY21kCj4gIAo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAg
ICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBlbnVt
Ogo+ICsgICAgICAgICAgICAgIC0gcWNvbSxpcHE4MDZ4LW5hbmQKPiArCj4gKyAgICB0aGVuOgo+
ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIHFjb20sYm9vdC1wYXJ0aXRpb25zOgo+ICsg
ICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLW1h
dHJpeAo+ICsgICAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAgIGl0ZW1zOgo+ICsgICAgICAg
ICAgICAgIC0gZGVzY3JpcHRpb246IG9mZnNldAo+ICsgICAgICAgICAgICAgIC0gZGVzY3JpcHRp
b246IHNpemUKPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBCb290IHBh
cnRpdGlvbiB1c2UgYSBkaWZmZXJlbnQgbGF5b3V0IHdoZXJlIHRoZSA0IGJ5dGVzIG9mIHNwYXJl
Cj4gKyAgICAgICAgICAgIGRhdGEgYXJlIG5vdCBwcm90ZWN0ZWQgYnkgRUNDLiBVc2UgdGhpcyB0
byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwKPiArICAgICAgICAgICAgcGFydGl0aW9ucyBieSBkZWZp
bmluZyBmaXJzdCB0aGUgb2Zmc2V0IGFuZCB0aGVuIHRoZSBzaXplLgo+ICsKPiArICAgICAgICAg
ICAgSXQncyBpbiB0aGUgZm9ybSBvZiA8b2Zmc2V0MSBzaXplMSBvZmZzZXQyIHNpemUyIG9mZnNl
dDMgLi4uPgo+ICsgICAgICAgICAgICBhbmQgc2hvdWxkIGJlIGRlY2xhcmVkIGluIGFzY2VuZGlu
ZyBvcmRlci4KPiArCj4gKyAgICAgICAgICAgIFJlZmVyIHRvIHRoZSBpcHE4MDY0IGV4YW1wbGUg
b24gaG93IHRvIHVzZSB0aGlzIHNwZWNpYWwgYmluZGluZy4KPiArCj4gIHJlcXVpcmVkOgo+ICAg
IC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gQEAgLTEzNSw2ICsxNjAsOCBAQCBleGFtcGxlczoK
PiAgICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aCA9IDw0PjsKPiAgICAgICAgICBuYW5kLWJ1cy13
aWR0aCA9IDw4PjsKPiAgCj4gKyAgICAgICAgcWNvbSxib290LXBhcnRpdGlvbnMgPSA8MHgwIDB4
NThhMDAwMD47Cj4gKwo+ICAgICAgICAgIHBhcnRpdGlvbnMgewo+ICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+IC0tIAo+IDIuMzYuMQo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDg
rprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
