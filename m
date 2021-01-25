Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00583C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 22:43:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E3D20756
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 22:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E3D20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4GUGY0kejX/ARNxEBLmKBCZ2sxdVoWpqVnbOVLD7rik=; b=aibhl8XbAFRm4jUBuZZLONBCI
	p7ZhXM6M9tN69WiKV4v1zWwZMyUQnGDV0mpX6GezwViQyefb4pT6ZQu4HGDvOAyXEGEAgvZegDYIz
	83HVz6uhEloOD2kw0cOrUrArAqB+S4u7s4l45LSO6QHTn+qhLQO1GkFT32mslvW40rRftzKnat405
	NBpLMb21Tb96rBitzBiwdAftamwillp8SfSrKUFaQ8f00F3SgglBgCX2EgK3EaIvM5N2s5mo2oJv6
	Zg45ED/pFubVOCyMNZ8gKFYkjFZ44AUC0KdUljdYAwj56NON/QBJ3Qr14oxkjQl67wS1vLqSSesTf
	C6Wp+Oj3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4AYm-000215-2b; Mon, 25 Jan 2021 22:42:12 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4AYi-00020e-VF
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 22:42:09 +0000
Received: by mail-oi1-f171.google.com with SMTP id k25so2416681oik.13
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2021 14:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C16k2tPv0ywSlhxsEf4kr9GhjRN4cyYWhe3TJNuKzzI=;
 b=IfoWsP3H6X5hUuGc7+suxOKqkyvqjrziFIoaExw3+LlaS8g9dhSdMfNuPSFD19dYQJ
 M6VW1Ih8Y0cweiwPVM1v2z9bg/oSZaZaWi4yQmW7mXPrlR9wd84gDlqBo4y+WAWnF0gz
 tK3+4tJlAozrp4wY58wk18FqZsWr5DG88cLAqdxUQqaoHWwEM7DbblfeFljp2XkgDOw5
 fUBuf3NbT6+V0Lmvu82SyAsEE5k8xW8Vc0r+qotszqcuKbfYWOrthULMWqp5JsQuUk2u
 HoZX3Os9mEGop25QO5RwXmcxE4Aw34wwVHkRHLzHVAYtkTwtJwkC+tYxCEQlyNjvh1c+
 uecA==
X-Gm-Message-State: AOAM530X1oWJCksiQJwRzo+QzJp3hbPqR/73xkzqtJiuhnHytv4ESIky
 SI7kx0C6LnALbSkiJGcOZg==
X-Google-Smtp-Source: ABdhPJxNAlUnSs1N3aeHo57kzd72x7tcnq/Np938jOWY7EEaiSXUXNM8ZPQuNIrsiTsmANBV4oAnsQ==
X-Received: by 2002:aca:c085:: with SMTP id q127mr1504728oif.70.1611614527227; 
 Mon, 25 Jan 2021 14:42:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a28sm391910ook.24.2021.01.25.14.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 14:42:06 -0800 (PST)
Received: (nullmailer pid 1163692 invoked by uid 1000);
 Mon, 25 Jan 2021 22:42:05 -0000
Date: Mon, 25 Jan 2021 16:42:05 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: add binding from BCM4908 partitions
Message-ID: <20210125224205.GA1131879@robh.at.kernel.org>
References: <20210115153901.31052-1-zajec5@gmail.com>
 <20210115153901.31052-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115153901.31052-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_174209_013793_A69C6063 
X-CRM114-Status: GOOD (  19.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMTUsIDIwMjEgYXQgMDQ6Mzk6MDBQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBC
Q000OTA4IHVzZXMgZml4ZWQgcGFydGl0aW9ucyBsYXlvdXQgYnV0IGZ1bmN0aW9uIG9mIHNvbWUg
cGFydGl0aW9ucyBtYXkKPiB2YXJ5LiBTb21lIGRldmljZXMgdXNlIG11bHRpcGxlIGZpcm13YXJl
IHBhcnRpdGlvbnMgYW5kIHRob3NlIHNob3VsZCBiZQo+IG1hcmtlZCB0byBsZXQgc3lzdGVtIGRp
c2NvdmVyIHRoZWlyIHB1cnBvc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tp
IDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+ICAuLi4vcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgt
cGFydGl0aW9ucy55YW1sICAgfCA2OCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2OCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlv
bnMueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFy
dGl0aW9ucy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjQwOTBiNjFhM2RhNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFt
bAo+IEBAIC0wLDAgKzEsNjggQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRp
dGlvbnMueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogQnJvYWRjb20gQkNNNDkwOCBwYXJ0aXRpb25pbmcK
PiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgQnJvYWRjb20gQkNNNDkwOCBDRkUgYm9vdGxvYWRl
ciBzdXBwb3J0cyB0d28gZmlybXdhcmUgcGFydGl0aW9ucy4gT25lIGlzIHVzZWQKPiArICBmb3Ig
cmVndWxhciBib290aW5nLCB0aGUgb3RoZXIgaXMgdHJlYXRlZCBhcyBmYWxsYmFjay4KPiArCj4g
KyAgVGhpcyBiaW5kaW5nIGFsbG93cyBkZWZpbmluZyBhbGwgZml4ZWQgcGFydGl0aW9ucyBhbmQg
bWFya2luZyB0aG9zZSBjb250YWluaW5nCj4gKyAgZmlybXdhcmUuIFN5c3RlbSBjYW4gdXNlIHRo
YXQgaW5mb3JtYXRpb24gZS5nLiBmb3IgYm9vdGluZyBvciBmbGFzaGluZwo+ICsgIHB1cnBvc2Vz
Lgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDog
YnJjbSxiY200OTA4LXBhcnRpdGlvbnMKPiArCj4gKyAgIiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQo+
ICsKPiArICAiI3NpemUtY2VsbHMiOiB0cnVlCgpsaW1pdCB0aGVzZSB0byAxIGFuZCAyPyAKCj4g
Kwo+ICtwYXR0ZXJuUHJvcGVydGllczoKPiArICAiQFswLTlhLWZdKyQiOgoKXnBhcnRpdGlvbkAu
Li4KCj4gKyAgICBhbGxPZjoKCllvdSBjYW4gZHJvcCAnYWxsT2YnLgoKPiArICAgICAgLSAkcmVm
OiAicGFydGl0aW9uLnlhbWwjIgo+ICsgICAgICAtIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgICBj
b21wYXRpYmxlOgo+ICsgICAgICAgICAgICBjb25zdDogYnJjbSxiY200OTA4LWZpcm13YXJlCgpB
bHNvIG5lZWRzICd1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlJwoKPiArCj4gK3JlcXVpcmVk
Ogo+ICsgIC0gIiNhZGRyZXNzLWNlbGxzIgo+ICsgIC0gIiNzaXplLWNlbGxzIgo+ICsKPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAg
IHBhcnRpdGlvbnMgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYnJjbSxiY200OTA4LXBhcnRp
dGlvbnMiOwo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICNzaXpl
LWNlbGxzID0gPDE+Owo+ICsKPiArICAgICAgICBwYXJ0aXRpb25AMCB7Cj4gKyAgICAgICAgICAg
IGxhYmVsID0gImNmZXJvbSI7Cj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+Owo+
ICsgICAgICAgIH07Cj4gKwo+ICsgICAgICAgIHBhcnRpdGlvbkAxMDAwMDAgewo+ICsgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImJyY20sYmNtNDkwOC1maXJtd2FyZSI7Cj4gKyAgICAgICAgICAg
IHJlZyA9IDwweDEwMDAwMCAweGYwMDAwMD47Cj4gKyAgICAgICAgfTsKPiArCj4gKyAgICAgICAg
cGFydGl0aW9uQDEwMDAwMDAgewo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImJyY20sYmNt
NDkwOC1maXJtd2FyZSI7Cj4gKyAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMDAgMHhmMDAwMDA+
Owo+ICsgICAgICAgIH07Cj4gKwo+ICsgICAgICAgIHBhcnRpdGlvbkAxZjAwMDAwIHsKPiArICAg
ICAgICAgICAgbGFiZWwgPSAiY2FsaWJyYXRpb24iOwo+ICsgICAgICAgICAgICByZWcgPSA8MHgx
ZjAwMDAwIDB4MTAwMDAwPjsKPiArICAgICAgICB9Owo+ICsgICAgfTsKPiAtLSAKPiAyLjI2LjIK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
