Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3423EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9o29KvnOEfV8/G8XBah/H5M9N0eZTLtUudb4/aDt6Y=; b=mvVdIxDc3F+Rf3
	ikAsoiNgUcL9XFJ90KeHfHdLzREq9w4pwZ6BRe8VufatE3DTHcPkzkKGW/g3wTM0Y81CfOVZxKct+
	A86IVPYuuCRfR7mCFoS1zMNc2UbH6pLLYEJmF/Y+z4GOP2MxLZilXhZL/mlEZyb7bipiFe+sipzfH
	IihBOvEXGxS7jxMfCd7D+C1u6ECDGzu16630G/ecJOa1PUDcNS1X9WbvYzMgzI79CgHz5hKlVsMoT
	fefhcq1zHyK1WPdIe3TshPgnGO7Cn0mqE+xyyWUcABlvbxZpFWPGn40m1rdhdMEUr5gYIIeUWnV02
	58R5u/9UnRdganEr1lEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmM2R-00Ch94-F1; Wed, 04 May 2022 20:55:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmM2O-00Ch8Q-Ja
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 20:55:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a18so548881ejf.2
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:cc:subject:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q7zZY8qF2MwCRzHE/3XXIlQWea5rmwXXYBxoggSeEAE=;
 b=U8ilqybDjMzspl9yEbac8RVR5f5bDbXLSHxsQQGrsP69fl+4ZhNDFRgg5Sti4bcSkh
 KBWJqBNrZdMAXVgsT0GFdI67GWbbKk8OYT6h+DQKqwOfMx4+/ddryZ5RiZCP+oQUjiDu
 U2g4VsPF83O9S1tyIgMxF08EE9E14tahf9BfzXsbhVHQ37hDDeWgseAyZaXKrqy+jKHR
 L+yTN4jXqZzguhDUmv9YyFtRZ8t2ZGVQnj/05WgO4CrYoLO1GCnaYQYvdLoErP8jz+6s
 THC90zInTyO2vgWd2TRipsnfRpWcNnzbiDMCd/NwFQC7LLBpT36YZCDrlw8nrWsfHu7Y
 pGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q7zZY8qF2MwCRzHE/3XXIlQWea5rmwXXYBxoggSeEAE=;
 b=qmQzpoKH/VQoEiMncv5byQvVXaGI2bS59j1Eh0ecGV4Rwc/hLSNExG3btEZ0uStlsB
 Tmd+PTSwacciJFP5ACzICxYK3GN3wYTN+y+LP0qhbq0B2Z9fjn4ZwNuVMEseI/MY16Gy
 Ja3ynguDA8kBvDGH32RVluygYJrWUTE85KF0bZVaiNDyeCK2ec3rP7LCuuPHWyo5XyBp
 oLjzAnmF3bNfOCcMCRsXtFkL33iTNAn6LLyTFxEXYYqgfSXUXWlvnVnKLpxIyC1gugyS
 xEhXOraEXL6QiL+OSt4zmpFuwJ3SgH1k6VjJdHMUQB7bZ/FmuD5jMcoc5ZFVJLAfAHrL
 UsaA==
X-Gm-Message-State: AOAM532q3mwmgrlw2zTkfZ3rKybhhManR65btHU6glUv5483IIGMnKI2
 Wtdr9P/9sasUC0F9fZjsb1s=
X-Google-Smtp-Source: ABdhPJx72qWCwDTwj98zNOzlfLctr0ngFY0pMtin9Wh5YteHdfnXGfJ+SEBxr9gUSX9EpOl0dN1GUw==
X-Received: by 2002:a17:907:72ce:b0:6f4:5a57:320c with SMTP id
 du14-20020a17090772ce00b006f45a57320cmr14746858ejc.75.1651697753846; 
 Wed, 04 May 2022 13:55:53 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a170907271100b006f3ef214e43sm6066313ejk.169.2022.05.04.13.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:55:53 -0700 (PDT)
Message-ID: <6272e859.1c69fb81.bbe18.742f@mx.google.com>
X-Google-Original-Message-ID: <YnLoV9IliQuJAz/7@Ansuel-xps.>
Date: Wed, 4 May 2022 22:55:51 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 0/2] Add nvmem support for dynamic partitions
References: <20220429124825.21477-1-ansuelsmth@gmail.com>
 <f511426e-47cd-7139-baab-ff31c9be2ba3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f511426e-47cd-7139-baab-ff31c9be2ba3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_135556_687671_970D6ED1 
X-CRM114-Status: GOOD (  37.04  )
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

T24gV2VkLCBNYXkgMDQsIDIwMjIgYXQgMTA6MjM6MTZQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDI5LjA0LjIwMjIgMTQ6NDgsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IFRo
aXMgdmVyeSBzbWFsbCBzZXJpZXMgY29tZXMgdG8gZml4IHRoZSB2ZXJ5IGFubnlvaW5nIHByb2Js
ZW0gb2YKPiA+IHBhcnRpdGlvbnMgZGVjbGFyZWQgYnkgcGFyc2VyIGF0IHJ1bnRpbWUgTk9UIHN1
cHBvcnRpbmcgbnZtZW0gY2VsbHMKPiA+IGRlZmluaXRpb24uCj4gPiAKPiA+IFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIGlzIHZlcnkgZ2VuZXJpYy4gVGhlIGlkZWEgaXMgdG8gcHJvdmlkZSBh
biBvZgo+ID4gbm9kZSBpZiBkZWZpbmVkIGZvciBldmVyeW9uZSBhbmQgbm90IHN0cmljdGx5IGxp
bWl0IHRoaXMgdG8gbnZtZW0gc3R1ZmYuCj4gPiBCdXQgc3RpbGwgdGhlIGFjdHVhbCBjaGFuZ2Ug
aXMgZG9uZSBvbmx5IGZvciBudm1lbS1jZWxscyBtdGQuIChqdXN0IHRvCj4gPiBtYWtlIHN1cmUp
IFRoaXMgY2FuIHRvdGFsbHkgY2hhbmdlIGJ5IHJlbW92aW5nIHRoZSBjb21wYXRpYmxlIGNoZWNr
Lgo+ID4gCj4gPiBUaGUgaWRlYSBoZXJlIGlzIHRoYXQgYSB1c2VyIGNhbiBzdGlsbCB1c2UgdGhl
c2UgZHluYW1pYyBwYXJzZXJzCj4gPiBpbnN0ZWFkIG9mIGRlY2xhcmluZyBhIGZpeGVkLXBhcnRp
dGlvbiBhbmQgYWxzbyBkZWNsYXJlIGhvdyBudm1lbS1jZWxscwo+ID4gYXJlIGRlZmluZWQgZm9y
IHRoZSBwYXJ0aXRpb24uCj4gPiBUaGlzIGxpdmUgd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IGR5
bmFtaWMgcGFydGl0aW9uIGhhdmUgYWx3YXlzIHRoZQo+ID4gc2FtZSBuYW1lIGFuZCB0aGV5IGFy
ZSBrbm93bi4gKHRoaXMgaXMgdGhlIGNhc2UgZm9yIHNtZW0tcGFydCBwYXJ0aXRpb24KPiA+IHRo
YXQgd291bGQgcmVxdWlyZSBhIGJvb3Rsb2FkZXIgcmVmbGFzaCB0byBjaGFuZ2UgYW5kIGZvciBw
YXJzZXJzIGxpa2UKPiA+IGNtZGxpbmVwYXJ0IHdoZXJlIHRoZSBuYW1lIGlzIGFsd2F5cyB0aGUg
c2FtZS4pCj4gPiBXaXRoIHRoaXMgYXNzdW1wdGlvbiwgaXQncyBlYXN5IHRvIGZpeCB0aGlzIHBy
b2JsZW0uIEp1c3QgaW50cm9kdWNlIGEKPiA+IG5ldyBwYXJ0aXRpb24gbm9kZSB0aGF0IHdpbGwg
ZGVjbGFyZSBqdXN0IHRoZXNlIHNwZWNpYWwgcGFydGl0aW9uLgo+ID4gTXRkY29yZSB0aGVuIHdp
bGwgY2hlY2sgaWYgdGhlc2Ugc3BlY2lhbCBkZWNsYXJhdGlvbiBhcmUgcHJlc2VudCBhbmQKPiA+
IGNvbm5lY3QgdGhlIGR5bmFtaWMgcGFydGl0aW9uIHdpdGggdGhlIE9GIG5vZGUgcHJlc2VudCBp
biB0aGUgZHRzLiBOdm1lbQo+ID4gd2lsbCBhdXRvbWFnaWNhbGx5IGZpbiB0aGUgT0Ygbm9kZSBh
bmQgY2VsbHMgd2lsbCBiZSB3b3JrcyBiYXNlZCBvbiB0aGUKPiA+IGRhdGEgcHJvdmlkZWQgYnkg
dGhlIHBhcnNlci4KPiA+IAo+ID4gVGhlIGluaXRpYWwgaWRlYSB3YXMgdG8gY3JlYXRlIGEgc3Bl
Y2lhbCBudm1lbSBkcml2ZXIgd2l0aCBhIHNwZWNpYWwKPiA+IGNvbXBhdGlibGUgd2hlcmUgYSB1
c2VyIHdvdWxkIGRlY2xhcmUgdGhlIG10ZCBwYXJ0aXRpb24gbmFtZSBhbmQgdGhpcwo+ID4gZHJp
dmVyIHdvdWxkIHNlYXJjaCBpdCBhbmQgcmVnaXN0ZXIgdGhlIG52bWVtIGNlbGxzIGJ1dCB0aGF0
IGJlY2FtZQo+ID4gZGlmZmljdWx0IHJlYWxseSBmYXN0LCBtdGQgbm90aWZpZXIgc3lzdGVtIGlz
IHByb2JsZW1hdGljIGZvciB0aGlzIGtpbmQKPiA+IG9mIHN0dWZmLiBTbyBoZXJlIGlzIHRoZSBi
ZXR0ZXIgaW1wbGVtZW50YXRpb24uIEEgdmFyaWFudCBvZiB0aGlzIGlzCj4gPiBhbHJlYWR5IHRl
c3RlZCBvbiBvcGVud3J0IHdoZXJlIHdlIGhhdmUgZGV2aWNlcyB0aGF0IHVzZSBjbWRsaW5lcGFy
dC4KPiA+ICh0aGF0IGN1cnJlbnQgdmFyaWFudCBoYXZlIGRlZmluZWQgaW4gdGhlIGR0cyB0aGUg
ZXhhY3QgY29weSBvZgo+ID4gY21kbGluZXBhcnQgaW4gdGhlIGZpeGVkLXBhcnRpdGlvbiBzY2hl
bWUgYW5kIHdlIHBhdGNoZWQgdGhlIGNtZGxpbmVwYXJ0Cj4gPiBwYXJzZXIgdG8gc2NhbiB0aGlz
IGZpeGVkLXBhcnRpdGlvbiBub2RlICh0aGF0IGlzIGlnbm9yZWQgYXMgY21kbGluZXBhcnQKPiA+
IGhhdmUgcHJpb3JpdHkpIGFuZCBjb25uZWN0IHRoZSBkeW5hbWljIHBhcnRpdGlvbiB3aXRoIHRo
ZSBkdHMgbm9kZSkKPiA+IAo+ID4gSSBwcm92aWRlZCBhbiBleGFtcGxlIG9mIHRoaXMgaW4gdGhl
IGRvY3VtZW50YXRpb24gY29tbWl0Lgo+ID4gSW4gc2hvcnQgaXQncyBuZWVkZWQgdG8gYWRkIHRv
IHRoZSBwYXJ0aXRpb25zIHdoZXJlIHRoZSBjb21wYXRpYmxlIHBhcnNlcgo+ID4gaXMgZGVjbGFy
ZWQsIGEgcGFydGl0aW9uIHdpdGgganVzdCB0aGUgbGFiZWwgZGVjbGFyZWQgKGluc3RlYWQgb2Yg
dGhlIHJlZykuCj4gPiBUaGVuIGRlY2xhcmUgc29tZSBudm1lbS1jZWxscyBhbmQgaXQgd2lsbCBh
bGwgd29yayBhdCBydW50aW1lLgo+ID4gTXRkY29yZSB3aWxsIGNoZWNrIGlmIGEgbm9kZSB3aXRo
IHRoZSBzYW1lIGxhYmVsIGlzIHByZXNlbnQgYW5kIGFzc2lnbiBhbgo+ID4gT0Ygbm9kZSB0byB0
aGUgTVRELgo+ID4gCj4gPiBJIGN1cnJlbnRseSB0ZXN0ZWQgdGhpcyBvbiBteSBkZXZpY2UgdGhh
dCBoYXZlIHNtZW0tcGFydCBhbmQgdGhlCj4gPiBnbWFjIGRyaXZlciB1c2UgbnZtZW0gdG8gZ2V0
IHRoZSBtYWMtYWRkcmVzcy4gVGhpcyB3b3JrcyBjb3JyZWN0bHkgYW5kCj4gPiB0aGUgc2FtZSBh
ZGRyZXNzIGlzIHByb3ZpZGVkLgo+IAo+IFRoYW5rcyBhIGxvdCBmb3Igd29ya2luZyBvbiB0aGlz
Lgo+IAo+IEFub3RoZXIgY2FzZSAodGhhdCBJIG5lZWQgdGhpcyB3b3JrIGZvcikgaXMgY21kbGlu
ZSBwYXJzZXIuIFNvbWUKPiBwYXJ0aXRpb25zIHBhc3NlZCBieSBVLUJvb3QgbWF5IHJlcXVpcmUg
ZXh0cmEgaGFuZGxpbmcgYW5kIHRoYXQgbmVlZHMgdG8KPiBiZSBkZXNjcmliZWQgaW4gRFQuCgpJ
IHNlZSBtb3JlIGFuZCBtb3JlIE9FTXMgYW5kIFNvQyB1c2luZyBzcGVjaWFsIHBhcnNlciB0byBk
ZWNsYXJlCnBhcnRpdGlvbiBzbyB0aGlzIGlzIHN0YXJ0aW5nIHRvIGJlY29tZSBuZWNlc3Nhcnku
CgotLSAKCUFuc3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
