Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B8C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HElFs4H7co5Aby+xWlrD6YdhNI3nk6vnjPGymgPzrCI=; b=Zc8OkZHtK6ztO4
	+cmLMOuJUWVN/fO+hONEdjRKTy3WeOCmp/R92vUwKcdYqEEoIE1UnkEY3BLwPHv1aIN6P9DueiGbh
	1pi88szKGxBDdNk1yjbjbqSMcq8H8WRaNg4N8UXTNZZequPawR+yRL9ksYzGghIhIzi6uWaVT2VAc
	WQCl/WOvnRLGcxVMqp/8Djqfe6mpfCn33jWsuCotW0yeYdj+/wfCsiJbICkYnu2qdeUQxh2OBKL8N
	8E4cqsGisXOXi2vaaWpXEyzfBixVJmXNA54Wd57rX9+iIdAC0PDpky+L4tv7cjzAU1kM6P1VCBxwe
	MptfUw8xw6utniY/W3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLwY-0038L5-EF; Thu, 09 Jun 2022 17:27:39 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLgB-00306K-0J
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 17:10:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v19so32056499edd.4
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YOQJZv6DXLC4OLwRVn231eqFTPEfawUDpXHNEiex4bo=;
        b=CwbKPKSNxp5YBunmE6UC1ut68jz2Elg6HagvQgpmZ4OMU5/LGQ6gVFbCrz2QuVTENn
         IIC2XVmBXK5Mb466jWvOL/SYXcCfm944NQtIrbP1EqsWtLInlv8H9MeTEz33eRrXSxG0
         JaX3EtOzOap5l7nI3Dj8feT2lmQDA5bhpeYEY4Jy068b/xcIbQgLH610qH8Cgsjvb0eO
         1gcu5kEGDIhLTAbDpzO25UQslez7FyYFV9gTWjdwv8KCIHYx3QaC2s5qyH8rS8AiGwxI
         f6JgtB9rWjnSXq6EPJWFg8CgXePTiWYXaSZuz8CY1ERplhhgS805UrdqofNwBMiT7XOd
         a+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YOQJZv6DXLC4OLwRVn231eqFTPEfawUDpXHNEiex4bo=;
        b=5KjCS2q11uhT+jMteoJzDoglRLwratopSmJbmlxXjPbnAbiRML9G9ikKbPcRixI7Aq
         CR7CRll+brZVrbY+qrbxLmI7+7T+Azi6yapfX/yJFgsgjDaAtd9oLmQdBGIroZXoxMw3
         TZ2kAwsMN0tLMnJOSBic033by0RhRzOcL7w2RPVjqsmuOEcLX0MVGY5HIuDK6vF7CM4L
         ekrAC1PLR69M1Cd7lrWqe7gh9b3Xi5OuYPjT/xiYsygwM6aZ94UJubTyyGdog/LX8EU/
         WhPRXtJbUIkrauPOmzNofSObIGMsUrmJy4o3QKVlN6Rxot3e2T21xcq2loeeJy8sG2g8
         9iXg==
X-Gm-Message-State: AOAM530oJxsve93Gabmuboj51wyEdWb9MTDmXo/o53+VrFZoF2zttD8V
	cVCAJO3qHeBiUkImhRS/6v0=
X-Google-Smtp-Source: ABdhPJzg3yBm+tCizifx1o9yscxNe4FUUthz6U/luW+cQRetX6xULG0qN2cVQ6l8EG+UteRU3SyPsg==
X-Received: by 2002:aa7:d456:0:b0:42d:d7d9:34c1 with SMTP id q22-20020aa7d456000000b0042dd7d934c1mr46597774edr.21.1654794637540;
        Thu, 09 Jun 2022 10:10:37 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id d10-20020a1709063cea00b006f3ef214e5bsm10963516ejh.193.2022.06.09.10.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 10:10:36 -0700 (PDT)
Message-ID: <62a2298c.1c69fb81.bc909.d2d0@mx.google.com>
X-Google-Original-Message-ID: <YqIpibuM0ECVh6Gl@Ansuel-xps.>
Date: Thu, 9 Jun 2022 19:10:33 +0200
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
Subject: Re: [PATCH v6 1/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
References: <20220609132344.17548-1-ansuelsmth@gmail.com>
 <20220609132344.17548-2-ansuelsmth@gmail.com>
 <20220609170722.GA5081@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609170722.GA5081@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_101043_113195_810B0043 
X-CRM114-Status: GOOD (  22.29  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTA6Mzc6MjJQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFRodSwgSnVuIDA5LCAyMDIyIGF0IDAzOjIzOjQyUE0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IFJlb3JkZXIgcWNvbV9uYW5kX2hvc3QgdG8gc2F2ZSBo
b2xlcyBpbiB0aGUgc3RydWN0Lgo+IAo+IFlvdSBmb3Jnb3QgdG8gcmVvcmRlciBvdGhlciBzdHJ1
Y3RzIGFsc28gYXMgSSByZXF1ZXN0ZWQgOi8KPiAKPiBUaGFua3MsCj4gTWFuaQo+CgpNaGhoIEkg
ZGlkbid0IGZpbmQgb2J2aXVzIGhvbGUgaW4gb3RoZXIgc3RydWN0LgpUaGluayBJIHdpbGwgcGFz
cyB0aGlzIHdpdGggZHdhcmYgdG8gYmV0dGVyIGNoZWNrIHRoZW0uIFNvcnJ5IQpGZWVsIGZyZWUg
dG8gcG9pbnQgdGhlbSBpZiB5b3Ugbm90aWNlIG9idml1cyBob2xlIHRoYXQgSSBkaWRuJ3Qgbm90
aWNlLgoKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8
IDEwICsrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiBpbmRleCAx
YTc3NTQyYzZkNjcuLjdmYmJkM2U3Nzg0YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9u
YW5kYy5jCj4gPiBAQCAtNDMxLDExICs0MzEsMTIgQEAgc3RydWN0IHFjb21fbmFuZF9jb250cm9s
bGVyIHsKPiA+ICAgKgkJCQlhbmQgcmVzZXJ2ZWQgYnl0ZXMKPiA+ICAgKiBAY3dfZGF0YToJCQl0
aGUgbnVtYmVyIG9mIGJ5dGVzIHdpdGhpbiBhIGNvZGV3b3JkIHByb3RlY3RlZAo+ID4gICAqCQkJ
CWJ5IEVDQwo+ID4gKyAqIEBlY2NfYnl0ZXNfaHc6CQlFQ0MgYnl0ZXMgdXNlZCBieSBjb250cm9s
bGVyIGhhcmR3YXJlIGZvciB0aGlzCj4gPiArICoJCQkJY2hpcAo+ID4gKyAqCj4gPiAgICogQHVz
ZV9lY2M6CQkJcmVxdWVzdCB0aGUgY29udHJvbGxlciB0byB1c2UgRUNDIGZvciB0aGUKPiA+ICAg
KgkJCQl1cGNvbWluZyByZWFkL3dyaXRlCj4gPiAgICogQGJjaF9lbmFibGVkOgkJZmxhZyB0byB0
ZWxsIHdoZXRoZXIgQkNIIEVDQyBtb2RlIGlzIHVzZWQKPiA+IC0gKiBAZWNjX2J5dGVzX2h3OgkJ
RUNDIGJ5dGVzIHVzZWQgYnkgY29udHJvbGxlciBoYXJkd2FyZSBmb3IgdGhpcwo+ID4gLSAqCQkJ
CWNoaXAKPiA+ICAgKiBAc3RhdHVzOgkJCXZhbHVlIHRvIGJlIHJldHVybmVkIGlmIE5BTkRfQ01E
X1NUQVRVUyBjb21tYW5kCj4gPiAgICoJCQkJaXMgZXhlY3V0ZWQKPiA+ICAgKiBAbGFzdF9jb21t
YW5kOgkJa2VlcHMgdHJhY2sgb2YgbGFzdCBjb21tYW5kIG9uIHRoaXMgY2hpcC4gdXNlZAo+ID4g
QEAgLTQ1MiwxMSArNDUzLDEyIEBAIHN0cnVjdCBxY29tX25hbmRfaG9zdCB7Cj4gPiAgCWludCBj
czsKPiA+ICAJaW50IGN3X3NpemU7Cj4gPiAgCWludCBjd19kYXRhOwo+ID4gLQlib29sIHVzZV9l
Y2M7Cj4gPiAtCWJvb2wgYmNoX2VuYWJsZWQ7Cj4gPiAgCWludCBlY2NfYnl0ZXNfaHc7Cj4gPiAg
CWludCBzcGFyZV9ieXRlczsKPiA+ICAJaW50IGJibV9zaXplOwo+ID4gKwo+ID4gKwlib29sIHVz
ZV9lY2M7Cj4gPiArCWJvb2wgYmNoX2VuYWJsZWQ7Cj4gPiAgCXU4IHN0YXR1czsKPiA+ICAJaW50
IGxhc3RfY29tbWFuZDsKPiA+ICAKPiA+IC0tIAo+ID4gMi4zNi4xCj4gPiAKPiAKPiAtLSAKPiDg
rq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgotLSAK
CUFuc3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
