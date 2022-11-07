Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F2EC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vWI4H/FYgs9kNn/DFGOXVGOg0uEpin9kEd+mY/IPmw=; b=NEaIOAOMKN+TCo
	GHuTYU+9kyUhQNfPgkmRWDGXqg5ocID5c4T/ZQ0J5wUO7pQaeqSVZqH9pIRjPgLrsOHjXiP8o/oto
	rpKjxjtmWnIkrt1DjOqyd1VR6EIqd+Pic0plwuJT6nCkUHfYmtcOkW9cMicOoPs5R2SsVP2ugOYN3
	hNYEtuamFrIBMVoku6BnjgO8DeypuzUfUQZiboQGmQt6p3cKz7Qj0Us82UEOlOCKyCZQxkyk5CaG/
	zyWYNMnLrE+3xcQmI/bMvTgl9GS6eOHuRLsplYY1O8RTCtJR2A2WOu57qpeCisxzBK2vwvuRPNeWV
	DjBu1qyw+K/VreImlZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os8YS-000Ht1-Aw; Mon, 07 Nov 2022 20:17:12 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os8YJ-000HpO-83
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 20:17:04 +0000
Received: by mail-ot1-f52.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso7222119otb.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2022 12:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBvKVOrTqtufY18A1PJxgGDVCctpKYN6ta+YBKMwfj0=;
        b=2/1Jop3ssE6LfdWl1NzoUPUhYw7sTxMc6EF6Ea8mBYPY9OBuA3QDmgV1MYBFHeyNb1
         h/BL/cL3TwbkKW3CAVFfeRTfWosVG+P8Tchvas20fbRAMXJ5xa4Kx7pG+DgtZZMuGt5R
         Fu2VviXqLOrhFqnHMEDKnjrQAZ2u2hAny5FaaBns+lp1EOzhwnW2glo3XTDOpztKETe3
         VrArXinKsGja8WtZjTXMBH02t59gZNQ8qR0jHfQ2t/VPxOdmRxr5gOO61trM3ZTtor0C
         o8cvQZr9XHHwkGSnpGcBYpfwFFmqsmzjcLIe2KTGKrKpbyPUOd2EdHwPU7iyxYan64/z
         Vovg==
X-Gm-Message-State: ACrzQf0hlqxe3Dz2P+OYbWIr4UGB7+Sd3rEnEWLcxr2KnfhElBzcipvO
	phsLCKIuZvfiJeglqBmBEQ==
X-Google-Smtp-Source: AMsMyM75/WK9/WdSwnGkkhLFdL5pLrFI+obq49f0flEL+TH+zw9Csxl9yG8JBbbIIy07mUvPclfnEg==
X-Received: by 2002:a9d:198c:0:b0:661:aa2e:1aa0 with SMTP id k12-20020a9d198c000000b00661aa2e1aa0mr25432082otk.154.1667852221173;
        Mon, 07 Nov 2022 12:17:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 4-20020a9d0604000000b006621427ecc7sm3275762otn.60.2022.11.07.12.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:17:00 -0800 (PST)
Received: (nullmailer pid 1574276 invoked by uid 1000);
	Mon, 07 Nov 2022 20:17:02 -0000
Date: Mon, 7 Nov 2022 14:17:02 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, bcm-kernel-feedback-list@broadcom.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: mtd: brcm,brcmnand: update interrupts
 description
Message-ID: <166785221995.1574183.14364467307586191893.robh@kernel.org>
References: <20221104085316.24499-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104085316.24499-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_121703_309385_594043F9 
X-CRM114-Status: GOOD (  13.17  )
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

Ck9uIEZyaSwgMDQgTm92IDIwMjIgMDk6NTM6MTYgKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gMS4gRE1B
IGFuZCBFRFUgYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZTogZG9uJ3QgYWxsb3cgYm90aCBhdCB0aGUg
c2FtZSB0aW1lCj4gMi4gUmVxdWlyZSBpbnRlcnJ1cHQtbmFtZXMgZm9yIDIrIGludGVycnVwdHMg
dG8gYXZvaWQgL2d1ZXNzaW5nLwo+IAo+IFJlcG9ydGVkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxm
LmZhaW5lbGxpQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gSSBhbHNvIHRob3VnaHQgb2Ygc29tZXRoaW5nIGxpa2U6
Cj4gICBpbnRlcnJ1cHRzOgo+ICAgICBtaW5JdGVtczogMQo+ICAgICBpdGVtczoKPiAgICAgICAt
IGRlc2NyaXB0aW9uOiBOQU5EIENUTFJEWSBpbnRlcnJ1cHQKPiAgICAgICAtIGFueU9mOgo+ICAg
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBGTEFTSF9ETUFfRE9ORSBpZiBmbGFzaCBETUEgaXMgYXZh
aWxhYmxlCj4gICAgICAgICAgIC0gZGVzY3JpcHRpb246IEZMQVNIX0VEVV9ET05FIGlmIEVEVSBp
cyBhdmFpbGFibGUKPiAodG8gYXZvaWQgdGV4dC1mb3JtICJvciIgaW4gImRlc2NyaXB0aW9uIikg
YnV0IHRoYXQgZGlkbid0IHdvcms6Cj4gICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1hLmpzb24KPiAuL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sOiBlcnJvciBjaGVja2luZyBzY2hl
bWEgZmlsZQo+ICAgU0NIRU1BICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJv
Y2Vzc2VkLXNjaGVtYS5qc29uCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9icmNtLGJyY21uYW5kLnlhbWw6IGlnbm9yaW5nLCBlcnJvciBpbiBzY2hlbWE6IHByb3BlcnRp
ZXM6IGludGVycnVwdHMKPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20s
YnJjbW5hbmQueWFtbCAgIHwgMTYgKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
