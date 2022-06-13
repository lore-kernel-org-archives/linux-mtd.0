Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22E6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/b1nLfe5gWSB11vSR/cthzslZGRJLrshfR3W0Qor2k8=; b=AjZIFGAYfH5NT2
	6UKcygh2oF7P7gMuJ8WVkHMzuoLvdxH7VoYmPYUhfraiAheBJYTPnzi7aVm7RwgHzS1dckOQzVd7E
	yl5gc+jek3jQs2mC5L7hxMKqRIx7MXkp/M9Z60lIL9qCpCsFNLWT/oV9Sr8b9C+xLZfmBmSDWaYJi
	NyQVeHebWJGCS3UGcn1hnp2tcSi5fTSNcVvZvEcBG5WFytjFYmDKSg6MGcop4bQMVFTMclA7Mz/lC
	ejgz20h/X6a/zRwJ4Dy+5pUqvsIdnXvE+/HAwekK+JWA96kGGlhaZSXNAYhjS/422ujHxwnDE/zpg
	cor6mKIWjG/q3bZulRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0lpH-004UM2-2v; Mon, 13 Jun 2022 15:17:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0lpE-004UJE-AA
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 15:17:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id r187-20020a1c44c4000000b0039c76434147so4758809wma.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2022 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CxEVhulkT4pSVVwXU2sr40U8DsgeEjl1fZ9K8bvOkec=;
        b=EkqGJhO7UoEpuADq42dtRnnUgh+XctbfGO+G58/gw4a8XBXDu1pbvpzkP2jaapAeQ3
         YHmDhLDmrNJbm2rtIVjeoctWIilnBWH4rWcpyoYoYekw2GYv1bWM9Dql6BRxyvy65c9o
         nzNwkfdRxQhV3uAKErZbX6+19lp2/qjfdvsHE36m3dpP72v/3tbx7+WKsg3Ny7sH5Hay
         QV6f4DDBxWI/N6KP0yrHMN/Li2ghHIcQJLWfkqnEq4acijU4WPChWjRTvBxGsVyYKx8v
         Ry17rDs4mVWtEsArjMioo9Fw1j7w4of6QtKDzVg5saSEzePQnZ12IC56/BvKEfpG9twO
         My7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CxEVhulkT4pSVVwXU2sr40U8DsgeEjl1fZ9K8bvOkec=;
        b=HjDMtr+6OIEI6YM/c9LqdgPh/GY9KV8wScNQ25YAC/TBGDfp/GDReb625TG+L/TYuD
         Q5MAO8kKW9kRwJv3heNKZxP9DWws7CnI90IXXJefCOAla5lqaQYULLQwxiALUqHhW312
         OsCdMzrZgPftnpmr01ZLvkC1R+fpw7Dr+Vs7H/DBUbQWSCLgeXVkVeh6rf5sAjPy8s/f
         Y5OpX6CH6DxUND25/pDl3EL5UcDqY2Kbap8VD/jcJUHGvXP6xqge8Z0aMXVqhfp/6g8Z
         AkqpdqTEEbr2H5vSU+N8Q9K47EZdTujhE2dLpu28TQMcmsZOcMdWsxOZAN3opbC/pc+X
         +Evw==
X-Gm-Message-State: AOAM530s9/4yadRvYOmVhIq69OLlQmmDGP3b0W0JfBMMc9DEf4LKeuFu
	7s14sMy9iG2a6IRnbpIUt+8=
X-Google-Smtp-Source: ABdhPJzZYU2kxK4eUimUtj60AQJ4K9MdzwxUjqic6Ph/tmfCfIaqYIL7wGT2YEi+7lwHQXZOX6UcFA==
X-Received: by 2002:a1c:cc05:0:b0:39c:7477:3f24 with SMTP id h5-20020a1ccc05000000b0039c74773f24mr15369449wmb.190.1655133472561;
        Mon, 13 Jun 2022 08:17:52 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id m4-20020a056000008400b002102cc4d63asm10595788wrx.81.2022.06.13.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 08:17:52 -0700 (PDT)
Message-ID: <62a75520.1c69fb81.8de59.2dc6@mx.google.com>
X-Google-Original-Message-ID: <YqdUc1oAxxgRyLzC@Ansuel-xps.>
Date: Mon, 13 Jun 2022 17:14:59 +0200
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
X-CRM114-CacheID: sfid-20220613_081756_434823_07A4177E 
X-CRM114-Status: GOOD (  23.77  )
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
Y3RzIGFsc28gYXMgSSByZXF1ZXN0ZWQgOi8KPiAKPiBUaGFua3MsCj4gTWFuaQo+CgpIaSwgSSBy
dW4gdGhpcyBjb21taXQgd2l0aCBwYWhvbGUgdG9vbHMgYW5kIGl0IGRpZG4ndCByZW9yZGVyIGFu
eXRoaW5nCmVsc2UgYXNpZGUgZnJvbSB3aGF0IGkgYWxyZWFkeSByZW9yZGVyZWQuIEFtIEkgbWlz
c2luZyBzb21ldGhpbmcgaGVyZT8KCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0
aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMgfCAxMCArKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYwo+ID4gaW5kZXggMWE3NzU0MmM2ZDY3Li43ZmJiZDNlNzc4NGMgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gQEAgLTQzMSwxMSArNDMxLDEyIEBAIHN0cnVjdCBx
Y29tX25hbmRfY29udHJvbGxlciB7Cj4gPiAgICoJCQkJYW5kIHJlc2VydmVkIGJ5dGVzCj4gPiAg
ICogQGN3X2RhdGE6CQkJdGhlIG51bWJlciBvZiBieXRlcyB3aXRoaW4gYSBjb2Rld29yZCBwcm90
ZWN0ZWQKPiA+ICAgKgkJCQlieSBFQ0MKPiA+ICsgKiBAZWNjX2J5dGVzX2h3OgkJRUNDIGJ5dGVz
IHVzZWQgYnkgY29udHJvbGxlciBoYXJkd2FyZSBmb3IgdGhpcwo+ID4gKyAqCQkJCWNoaXAKPiA+
ICsgKgo+ID4gICAqIEB1c2VfZWNjOgkJCXJlcXVlc3QgdGhlIGNvbnRyb2xsZXIgdG8gdXNlIEVD
QyBmb3IgdGhlCj4gPiAgICoJCQkJdXBjb21pbmcgcmVhZC93cml0ZQo+ID4gICAqIEBiY2hfZW5h
YmxlZDoJCWZsYWcgdG8gdGVsbCB3aGV0aGVyIEJDSCBFQ0MgbW9kZSBpcyB1c2VkCj4gPiAtICog
QGVjY19ieXRlc19odzoJCUVDQyBieXRlcyB1c2VkIGJ5IGNvbnRyb2xsZXIgaGFyZHdhcmUgZm9y
IHRoaXMKPiA+IC0gKgkJCQljaGlwCj4gPiAgICogQHN0YXR1czoJCQl2YWx1ZSB0byBiZSByZXR1
cm5lZCBpZiBOQU5EX0NNRF9TVEFUVVMgY29tbWFuZAo+ID4gICAqCQkJCWlzIGV4ZWN1dGVkCj4g
PiAgICogQGxhc3RfY29tbWFuZDoJCWtlZXBzIHRyYWNrIG9mIGxhc3QgY29tbWFuZCBvbiB0aGlz
IGNoaXAuIHVzZWQKPiA+IEBAIC00NTIsMTEgKzQ1MywxMiBAQCBzdHJ1Y3QgcWNvbV9uYW5kX2hv
c3Qgewo+ID4gIAlpbnQgY3M7Cj4gPiAgCWludCBjd19zaXplOwo+ID4gIAlpbnQgY3dfZGF0YTsK
PiA+IC0JYm9vbCB1c2VfZWNjOwo+ID4gLQlib29sIGJjaF9lbmFibGVkOwo+ID4gIAlpbnQgZWNj
X2J5dGVzX2h3Owo+ID4gIAlpbnQgc3BhcmVfYnl0ZXM7Cj4gPiAgCWludCBiYm1fc2l6ZTsKPiA+
ICsKPiA+ICsJYm9vbCB1c2VfZWNjOwo+ID4gKwlib29sIGJjaF9lbmFibGVkOwo+ID4gIAl1OCBz
dGF0dXM7Cj4gPiAgCWludCBsYXN0X2NvbW1hbmQ7Cj4gPiAgCj4gPiAtLSAKPiA+IDIuMzYuMQo+
ID4gCj4gCj4gLS0gCj4g4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCu
v+CuteCuruCvjQoKLS0gCglBbnN1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
