Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAF1C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gsjK2zeu3oV5GxhH3ZaHcx5jKGJLk1qhjgmot4Wo6Q=; b=A/rfB6CZqmkbcD
	W4A6QL77A94rI+ReOZJel57EJqzos+Aftmi7ka5OoM0AXtGwYXeYVOZGCVBOh5SSp5zJ2yEHsKwok
	v7nX+YG/CW6nnJ0xC/M/bvYOEjcS8ET99+DbzFGH964pKXIFM+o1VDQoN5S4Btmb6pHtog48dU96I
	C75vqCqlTIs8hcSVt6QsX/u1T08OL+LGYH81HjnG7cAyMHfLMfbIWZ0V9FcpPS5k3LOqCQG3JSMVg
	ADec047t2hto2a/siMaVhKLWCewz7C3usXUnlmD1kFoYrSDUKQgohiaRNtnhLiMG54p0MRrM8bwet
	XTEI/YQkFhBBXHyu/+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMxs-003c0m-RJ; Thu, 09 Jun 2022 18:33:04 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMxl-003bwW-9n
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 18:32:58 +0000
Received: by mail-il1-f170.google.com with SMTP id h18so19381976ilj.7
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 11:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2fGJOOmf3MnqCqr0U0Gv08/FTGB7aMws3g7bnxXyMQU=;
        b=4LJgtOdIYAUrcHNHfupVxUg7xU9+Avq3zv/R9uwiarh5kEjGPcCHceFI2TrG46JgVw
         TL83vE8kEozD3TGyqh95o954is2rkilRwULRkDag5ggIILvLH+Np/VUCl7qDprWnEDKv
         RkzrRWlseCHSb+o2nH+d2hLwXBR58c4RG7xnSzFU4cRmhAYrYQ0LzFN3Z4CwRfYC57X5
         0M1Ki6OjzrSH8pcVocGToJDxUzgK0Vc3nwuTV4TCi6J6Km7pXhTxVEtwfF9NbW4tsowf
         2ij2/Tye/NyYYwF9cIr2VKWWGUuuPcBgGrFyp9BbbGII4rhqWrSayY7N3cIrmmreAns4
         2z1A==
X-Gm-Message-State: AOAM532YJo1nAjPxd8uXiccDDdFgJYmTuQX/0MAIXPkucmoi1geJU0Pl
	IhD/DUpCtpB3Nk89sFtV2w==
X-Google-Smtp-Source: ABdhPJx31++5ELqY9QeEp0vYvJBKv3sPIqcp+1xkOs3vD1KYC4Dzpfv4vFl3Og62AYuhKQ9LpohUWQ==
X-Received: by 2002:a92:dc42:0:b0:2d5:4875:1c6f with SMTP id x2-20020a92dc42000000b002d548751c6fmr10194139ilq.65.1654799575238;
        Thu, 09 Jun 2022 11:32:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id e16-20020a056638021000b0033195fabca4sm6237137jaq.175.2022.06.09.11.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 11:32:54 -0700 (PDT)
Received: (nullmailer pid 4081859 invoked by uid 1000);
	Thu, 09 Jun 2022 18:32:52 -0000
Date: Thu, 9 Jun 2022 12:32:52 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Axboe <axboe@kernel.dk>, =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: partitions: Support label only
 partition
Message-ID: <20220609183252.GA4072951-robh@kernel.org>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606151417.19227-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_113257_412165_F2781078 
X-CRM114-Status: GOOD (  26.38  )
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

T24gTW9uLCBKdW4gMDYsIDIwMjIgYXQgMDU6MTQ6MTVQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IERvY3VtZW50IG5ldyBwYXJ0aXRpb24gbm9kZXMgdGhhdCBkZWNsYXJlIG9ubHkgdGhl
IGxhYmVsIGluc3RlYWQgb2YgdGhlCj4gcmVnIHVzZWQgdG8gcHJvdmlkZSBhbiBPRiBub2RlIGZv
ciBwYXJ0aXRpb24gcmVnaXN0cmVkIGF0IHJ1bnRpbWUgYnkKPiBwYXJzZXJzLiBUaGlzIGlzIHJl
cXVpcmVkIGZvciBudm1lbSBzeXN0ZW0gdG8gZGVjbGFyZSBhbmQgZGV0ZWN0Cj4gbnZtZW0tY2Vs
bHMuCj4gCj4gV2l0aCB0aGVzZSBzcGVjaWFsIHBhcnRpdGlvbnMsIHRoZSByZWcgLyBvZmZzZXQg
aXMgbm90IHJlcXVpcmVkLgo+IFRoZSBsYWJlbCBiaW5kaW5nIGlzIHVzZWQgdG8gbWF0Y2ggdGhl
IHBhcnRpdGlvbiBhbGxvY2F0ZWQgYnkgdGhlCj4gcGFyc2VyIGF0IHJ1bnRpbWUgYW5kIHRoZSBw
YXJzZXIgd2lsbCBwcm92aWRlIHJlZyBhbmQgb2Zmc2V0IG9mIHRoZSBtdGQuCj4gCj4gTlZNRU0g
d2lsbCB1c2UgdGhlIGRhdGEgZnJvbSB0aGUgcGFyc2VyIGFuZCBwcm92aWRlIHRoZSBOVk1FTSBj
ZWxscwo+IGRlY2xhcmVkIGluIHRoZSBEVFMsICJjb25uZWN0aW5nIiB0aGUgZHluYW1pYyBwYXJ0
aXRpb24gd2l0aCBhCj4gc3RhdGljIGRlY2xhcmF0aW9uIG9mIGNlbGxzIGluIHRoZW0uCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiAtLS0K
PiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sICAgICAgIHwgMTYg
KysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gaW5kZXggZTFh
YzA4MDY0NDI1Li5iZmY2ZmI5ODBlNmIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55
YW1sCj4gQEAgLTExLDYgKzExLDEzIEBAIGRlc2NyaXB0aW9uOiB8Cj4gICAgcmVsYXRpdmUgb2Zm
c2V0IGFuZCBzaXplIHNwZWNpZmllZC4gRGVwZW5kaW5nIG9uIHBhcnRpdGlvbiBmdW5jdGlvbiBl
eHRyYQo+ICAgIHByb3BlcnRpZXMgY2FuIGJlIHVzZWQuCj4gIAo+ICsgIEEgcGFydGl0aW9uIG1h
eSBiZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQgYnkgYSBzcGVjaWZpYyBwYXJzZXIgYXQgcnVudGlt
ZS4KPiArICBJbiB0aGlzIHNwZWNpZmljIGNhc2UsIHRoZSBsYWJlbCBpcyByZXF1aXJlZCBpbnN0
ZWFkIG9mIHRoZSByZWcuCj4gKyAgVGhpcyBpcyB1c2VkIHRvIGFzc2lnbiBhbiBPRiBub2RlIHRv
IHRoZSBkeW5hbWljY2FsbHkgYWxsb2NhdGVkIHBhcnRpdGlvbgo+ICsgIHNvIHRoYXQgc3Vic3lz
dGVtIGxpa2UgTlZNRU0gY2FuIHByb3ZpZGUgYW4gT0Ygbm9kZSBhbmQgZGVjbGFyZSBOVk1FTSBj
ZWxscy4KPiArICBUaGUgT0Ygbm9kZSB3aWxsIGJlIGFzc2lnbmVkIG9ubHkgaWYgdGhlIHBhcnRp
dGlvbiBsYWJlbCBkZWNsYXJlZCBtYXRjaCB0aGUKPiArICBvbmUgYXNzaWduZWQgYnkgdGhlIHBh
cnNlciBhdCBydW50aW1lLgo+ICsKPiAgbWFpbnRhaW5lcnM6Cj4gICAgLSBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gIAo+IEBAIC0yMiw2ICsyOSw4IEBAIHByb3BlcnRpZXM6
Cj4gICAgbGFiZWw6Cj4gICAgICBkZXNjcmlwdGlvbjogVGhlIGxhYmVsIC8gbmFtZSBmb3IgdGhp
cyBwYXJ0aXRpb24uIElmIG9taXR0ZWQsIHRoZSBsYWJlbAo+ICAgICAgICBpcyB0YWtlbiBmcm9t
IHRoZSBub2RlIG5hbWUgKGV4Y2x1ZGluZyB0aGUgdW5pdCBhZGRyZXNzKS4KPiArICAgICAgV2l0
aCBkeW5hbWljYWxseSBhbGxvY2F0ZWQgcGFydGl0aW9uIHRoZSBsYWJlbCBpcyByZXF1aXJlZCBh
bmQgd29uJ3QKPiArICAgICAgZmFsbGJhY2sgdG8gdGhlIG5vZGUgbmFtZS4KCkdlbmVyYWxseSwg
bGFiZWwgaXMgbmV2ZXIgcmVxdWlyZWQgYmVpbmcgc29tZXRoaW5nIGZvciBodW1hbnMgcmF0aGVy
IAp0aGFuIHRoZSBzL3cgdG8gY29uc3VtZS4gSSBkb24ndCBzZWUgYW55IHJlYXNvbiB3aHkgd2Ug
Y2FuJ3Qgc3RpbGwgdXNlIAp0aGUgbm9kZSBuYW1lICh3aXRoICdwYXJ0aXRpb24tJyBzdHJpcHBl
ZCBvZmYpLgoKSWYgdGhlIHB1cnBvc2UgaXMgdG8gZGVmaW5lIHdoYXQgdGhlIHBhcnRpdGlvbiBj
b250YWlucywgdGhlbiAKJ2NvbXBhdGlibGUnIGlzIHRoZSByaWdodCB0aGluZyBmb3IgdGhhdC4K
Cj4gIAo+ICAgIHJlYWQtb25seToKPiAgICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFtZXRlciwg
aWYgcHJlc2VudCwgaXMgYSBoaW50IHRoYXQgdGhpcyBwYXJ0aXRpb24KPiBAQCAtNDEsNyArNTAs
MTAgQEAgcHJvcGVydGllczoKPiAgICAgICAgaW1tdW5lIHRvIHBhaXJlZC1wYWdlcyBjb3JydXB0
aW9ucwo+ICAgICAgdHlwZTogYm9vbGVhbgo+ICAKPiAtcmVxdWlyZWQ6Cj4gLSAgLSByZWcKPiAr
aWY6Cj4gKyAgbm90Ogo+ICsgICAgcmVxdWlyZWQ6IFsgcmVnIF0KPiArdGhlbjoKPiArICByZXF1
aXJlZDogWyBsYWJlbCBdCj4gIAo+ICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQo+IC0tIAo+
IDIuMzYuMQo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
