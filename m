Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FABC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 22:24:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3F965079
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 22:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3F965079
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YacQc6ehsnA/5+wJPtBYDygAOUHcTmpeZD7ZsbJdgoQ=; b=Z0+mhU6N8yI7ks6YZp3np8vdP
	ZbFw9tC2IsRNxx+iR68LExWnAoqEXIanMD5pxu9emF4+z+7Hu4cMt9RTvUkav4ZcRXMhn1HWM0dVh
	y+YUMkVJbCr0OuDA+nvCXm/n6DJx2W0CBE6T+QveQj3cDy7LehaAM6QIbFWLvb+9op1QLX9cFyu20
	RTUko94yRf0EsQ6sF2ss3PeWrJjWqWXQVpbLxidrfqX7AYtdcAwQiKQ1dJXYjszKXQoywyBwrikB5
	gJyKGnnpqIpxzi/32X5Yhj02JGRrBmScvvTysIUwdSMVNwBCrGdU7RXFScQdru7m2BVwCl9VL27ML
	WkWDgP+Pw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIIqo-00Gnaq-3F; Fri, 05 Mar 2021 22:23:15 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIIqe-00GnZH-GN
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 22:23:06 +0000
Received: by mail-oo1-f43.google.com with SMTP id e17so805885oow.4
 for <linux-mtd@lists.infradead.org>; Fri, 05 Mar 2021 14:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b8P+vy/tLdxvp5/ToJi80Q/DHBxXI6Ot1Z2gtZWpXw8=;
 b=LzYqCWbHolNn2xZnKFbpWMsbPZQssJar7XZipwExED+5oL+zYj8DgxyiaEEflsWBxI
 2IDQZgfjUXIQdJYOUN31IOkjqe5QTS6xO56rqrO/8UVNabOmQWhFDdDYfvw3b/JzMi9z
 MgnR0ndSCXmphrclxrkTcTGFMKpWt3jYdAytAgts3Vl3LKNB15KzzEM668Zs0vA0JWAi
 1LFM5vWpNflWrFDWPf9HToFrDQgQBbFpPIoXZPSt6nZAN1TRFddcQR4CXgy1za0oV6ua
 iwueh/g2FO21h6AsPN2w6LBEVLjPg12ikGJOl5k0FJmiqF8b7VGEpmPNnLYvw7r554G3
 Yzuw==
X-Gm-Message-State: AOAM5326tb8mS3N23gJi4uOZBjEOMKGbD4qF7X3rme0zXqSW5OAGgQMo
 1TrRfuUcSo4j55LraGWr9A==
X-Google-Smtp-Source: ABdhPJyOKMFlHRvt9nZGqAzqrlWl3iV1hED2sgZuiivhtD5q9gLMMzNY/ECHThZmidDO6Y8cIe1wLQ==
X-Received: by 2002:a4a:3012:: with SMTP id q18mr9540216oof.21.1614982982146; 
 Fri, 05 Mar 2021 14:23:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s73sm818019oih.36.2021.03.05.14.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:23:01 -0800 (PST)
Received: (nullmailer pid 750912 invoked by uid 1000);
 Fri, 05 Mar 2021 22:23:00 -0000
Date: Fri, 5 Mar 2021 16:23:00 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Richard Weinberger <richard@nod.at>,
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of
 nvmem-partitions compatible
Message-ID: <20210305222300.GA718014@robh.at.kernel.org>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
 <1cf374f1-09d5-9fa9-9b0d-d8079f2f6fbc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cf374f1-09d5-9fa9-9b0d-d8079f2f6fbc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_222305_014553_E3A2EEC9 
X-CRM114-Status: GOOD (  15.21  )
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

T24gV2VkLCBNYXIgMDMsIDIwMjEgYXQgMTE6MDE6NTVBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IFtSb2I6IHBsZWFzZSBhZHZpc2VdCj4gCj4gT24gMTYuMDIuMjAyMSAyMjoyNiwg
QW5zdWVsIFNtaXRoIHdyb3RlOgo+ID4gRG9jdW1lbnQgbnZtZW0tcGFydGl0aW9ucyBjb21wYXRp
YmxlIHVzZWQgdG8gdHJlYXQgbXRkIHBhcnRpdGlvbnMgYXMgYQo+ID4gbnZtZW0gcHJvdmlkZXIu
Cj4gCj4gVW50aWwgbm93IHdlIHdlcmUgdXNpbmcgImNvbXBhdGlibGUiIHN0cmluZyBpbiBwYXJ0
aXRpb24gbm9kZSBvbmx5IGZvcgo+IHBhcnNlcnMgKGxvb2tpbmcgZm9yIHN1YnBhcnRpdGlvbnMp
LiBXZSBuZWVkIHRvIHRoaW5rIGlmIHRoaXMgY2hhbmdlIGNhbgo+IGJyZWFrIGFueXRoaW5nIGZy
b20gRFQgLyBMaW51eCBwZXJzcGVjdGl2ZS4KPiAKPiBDb21wYXRpYmxlIHN0cmluZ3Mgc2hvdWxk
IGJlIHVuaXF1ZSwgc28gdGhlcmUgaXMgbm8gcmlzayBvZiBjb25mbGljdAo+IGJldHdlZW4gTlZN
RU0gYW5kIHBhcnNlcnMuCj4gCj4gTm93OiBjYW4gd2UgZXZlciBuZWVkIG10ZCBwYXJ0aXRpb24g
dG86Cj4gMS4gQ29udGFpbiBzdWJwYXJ0aXRpb25zCj4gMi4gUHJvdmlkZSBOVk1FTQo+IGF0IHRo
ZSBzYW1lIHRpbWU/Cj4gCj4gTGV0J3Mgc2F5Ogo+IAo+IHBhcnRpdGlvbkAwIHsKPiAJY29tcGF0
aWJsZSA9ICJ2ZW5kb3IsZHluYW1pYy1maXJtd2FyZS1wYXJ0aXRpb25zIiwgIm52bWVtLXBhcnRp
dGlvbnMiOwoKSSB0aGluayB5b3UnZCB3YW50IHRoZSAidmVuZG9yLGR5bmFtaWMtZmlybXdhcmUt
cGFydGl0aW9ucyIgcGFyc2VyL2NvZGUgCnRvIHNlcnZlIHVwIGFueSBudm1lbSByZWdpb25zLiBX
aGV0aGVyIHlvdSBoYXZlIGEgZmFsbGJhY2sgaGVyZSBkZXBlbmRzIAppZiBhbiBPUyBjb3VsZCBt
YWtlIHVzZSBvZiB0aGUgcmVnaW9ucyBrbm93aW5nIG5vdGhpbmcgYWJvdXQgCiJ2ZW5kb3IsZHlu
YW1pYy1maXJtd2FyZS1wYXJ0aXRpb25zIi4KCj4gCWxhYmVsID0gImZpcm13YXJlIjsKPiAJcmVn
ID0gPDB4MCAweDEwMDAwMD47Cj4gCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+IAkjc2l6ZS1jZWxs
cyA9IDwxPjsKPiAJcmFuZ2VzID0gPDAgMHgwIDB4MTAwMDAwPjsKPiAKPiAJZmlybXdhcmUtdmVy
c2lvbkAxMCB7Cj4gCQlyZWcgPSA8MHgxMCAweDQ+Owo+IAl9Owo+IAo+IAlmaXJtd2FyZS1kYXRl
QDEwIHsKPiAJCXJlZyA9IDwweDIwIDB4ND47Cj4gCX07Cj4gfTsKPiAKPiBJcyB0aGF0IGFsbG93
ZWQgdG8gcmVzcGVjdCBib3RoICJjb21wYXRpYmxlIiBzdHJpbmdzIGFuZCBoYXZlOgo+IDEuIExp
bnV4IHBhcnNlciBwYXJzZSAiZmlybXdhcmUiIGZvciBzdWJwYXJ0aXRpb25zCj4gMi4gTGludXgg
TVREIHJlZ2lzdGVyICJmaXJtd2FyZSIgYXMgTlZNRU0gZGV2aWNlCj4gPwo+IAo+IElmIG5vdCwg
d2hhdCBvdGhlciBvcHRpb25zIGRvIHdlIGhhdmU/IElzIHRoYXQgYWxsb3dlZCB0byBoYXZlIGEK
PiBkYW5nbGluZyBNVEQgTlZNRU0gbm9kZSB3aXRoIHBoYW5kbGUgdG8gTVREIHBhcnRpdGlvbj8K
PiAKPiBmaXJtd2FyZTogcGFydGl0aW9uQDAgewo+IAljb21wYXRpYmxlID0gInZlbmRvcixkeW5h
bWljLWZpcm13YXJlLXBhcnRpdGlvbnMiOwo+IAlsYWJlbCA9ICJmaXJtd2FyZSI7Cj4gCXJlZyA9
IDwweDAgMHgxMDAwMDA+Owo+IH07Cj4gCj4gKC4uLikKPiAKPiBmaXJtd2FyZS12ZXJzaW9uQDEw
IHsKPiAJY29tcGF0aWJsZSA9ICJtdGQtbnZtZW0iOwo+IAlyZWcgPSA8MHgxMCAweDQ+Owo+IAlt
dGQgPSA8JmZpcm13YXJlPjsKPiB9Owo+IAo+IGZpcm13YXJlLWRhdGVAMTAgewo+IAljb21wYXRp
YmxlID0gIm10ZC1udm1lbSI7Cj4gCXJlZyA9IDwweDIwIDB4ND47Cj4gCW10ZCA9IDwmZmlybXdh
cmU+Owo+IH07CgpUaGlzLCBJIHdvdWxkIG5vdCBsaWtlIHRvIHNlZS4KClJvYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
