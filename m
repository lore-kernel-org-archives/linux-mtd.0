Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21673C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eQDVS0rozmXP8gZ+cwWskeLOJvccV6fObYc6CA3XMs=; b=SGfJ4aQmLD9a+/
	dmLVyST/pVDd+6OIZOJiAiK7tq2De0vTcrXCwQJBeOyi9dPsaIuwZSzteVHjZH2EGKhryoef3/x7E
	J2NMnK/LLQi8he+L2NugwJPwSMVhuPltXCRpINGDRbCxkXmUGMy7rGksyAG+q851qesmBsPkjhW4+
	hIcYtwnvfG6lfP6Bpf34de2gkmVSWpc1AqOiXqvKcqed+T/SwXMAe97qiw+KnbN70WoX3J9uPm1x8
	38VxI3qidNXcKYBmE2E4qmM4/wKeCmr8K2/Ztk0xMhFCvEHY1fOlARuFmIk8mUKHX+AcQ77tRvwX+
	6/4b4KbBesaNil9JBsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzOI9-003sEs-6d; Thu, 09 Jun 2022 19:58:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzOI6-003sCv-9v
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 19:58:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id s1so10703386wra.9
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 12:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qlJmCHU8eZPRqNcWDT80iV/TI1GQeD6B8X83HWoJ/vg=;
        b=glIR/xYU9IlYUCGGKtA6RNjCXBcZLYM2M7nAGqFfXS+3DLCz/yMncz2ahJj19O1UJG
         mLP5ISm4mDCAbv1Ki/0eUhj/HEEMQIKna0ypqpsOcM6phSJl/hjSm/p95TJOscXO3DHL
         FM/Fgle18gBD8vQL0G2quEWusnY15UTOgn9O2H8pDWr9BbVsDYkwrno3elqXDUTnf9AF
         7jSqNBP4KRohOYLEhua3GfUYnbwORMo9EbMTrVQAY/ZctdcFhTEMEhr80/uv729+tnpM
         GmJmrAqrFw20eBb+hVRkKkRU53wuKS7vtrEU8mTVjHiZ54WBWvGqy2f9PRIgY1V6zHML
         dYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qlJmCHU8eZPRqNcWDT80iV/TI1GQeD6B8X83HWoJ/vg=;
        b=1Ujv/Dgl65zs6YyOBr3EZ3xt1V32nNydGOIc4J0cUyZ8qdi/p3hxh2AOd/n7KOs2FA
         Y29PeBfKNPOBGa4EqQBsaap6hfPNR6L8i2PkxP1jPDwbenfGnq03w/5HRCz9uaSDgRn+
         uobz5Ck1uRvW5yYlTJ7our2Viji7BNiAUqiLVhPWmsKeq8P6FG5LL8uQCCjlISErsrgs
         N/mKh2kDWL2nPLqH9AMq6wmrDJA1KbxYLvNpyxP+BpBCCOYp7aLdsmV8hdKImPZ4x+Rz
         vH3b3TsZyflRStSQ/gpmXTxkeDcfr5xpQq0QM6I5mw4e36bCCoUjOz6RCIoW2EVOYGXP
         d29w==
X-Gm-Message-State: AOAM531EqitqV31whoQLxRIuUMRRbrOoCdn40lv0OeepTZ8QZR/dKb3u
	bglQkfgSaWeFfrQESzqODA8=
X-Google-Smtp-Source: ABdhPJwcgQHKiuHlpzcYVAwdddTtbeDElPmTomf/uUKSy/+mCKMqS1iu/CqQlQr4eKf/LDdYtxubVg==
X-Received: by 2002:a5d:4a4c:0:b0:210:27dd:e57 with SMTP id v12-20020a5d4a4c000000b0021027dd0e57mr39235685wrs.655.1654804677269;
        Thu, 09 Jun 2022 12:57:57 -0700 (PDT)
Received: from Ansuel-xps. ([5.171.80.117])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0039c362311d2sm406306wmq.9.2022.06.09.12.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 12:57:56 -0700 (PDT)
Message-ID: <62a250c4.1c69fb81.addd2.0eae@mx.google.com>
X-Google-Original-Message-ID: <YqJQwEoTzgdscpcX@Ansuel-xps.>
Date: Thu, 9 Jun 2022 21:57:52 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: partitions: Support label only
 partition
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-2-ansuelsmth@gmail.com>
 <20220609183252.GA4072951-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609183252.GA4072951-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_125802_419844_F77DC4E3 
X-CRM114-Status: GOOD (  32.11  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTI6MzI6NTJQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gTW9uLCBKdW4gMDYsIDIwMjIgYXQgMDU6MTQ6MTVQTSArMDIwMCwgQW5zdWVsIFNt
aXRoIHdyb3RlOgo+ID4gRG9jdW1lbnQgbmV3IHBhcnRpdGlvbiBub2RlcyB0aGF0IGRlY2xhcmUg
b25seSB0aGUgbGFiZWwgaW5zdGVhZCBvZiB0aGUKPiA+IHJlZyB1c2VkIHRvIHByb3ZpZGUgYW4g
T0Ygbm9kZSBmb3IgcGFydGl0aW9uIHJlZ2lzdHJlZCBhdCBydW50aW1lIGJ5Cj4gPiBwYXJzZXJz
LiBUaGlzIGlzIHJlcXVpcmVkIGZvciBudm1lbSBzeXN0ZW0gdG8gZGVjbGFyZSBhbmQgZGV0ZWN0
Cj4gPiBudm1lbS1jZWxscy4KPiA+IAo+ID4gV2l0aCB0aGVzZSBzcGVjaWFsIHBhcnRpdGlvbnMs
IHRoZSByZWcgLyBvZmZzZXQgaXMgbm90IHJlcXVpcmVkLgo+ID4gVGhlIGxhYmVsIGJpbmRpbmcg
aXMgdXNlZCB0byBtYXRjaCB0aGUgcGFydGl0aW9uIGFsbG9jYXRlZCBieSB0aGUKPiA+IHBhcnNl
ciBhdCBydW50aW1lIGFuZCB0aGUgcGFyc2VyIHdpbGwgcHJvdmlkZSByZWcgYW5kIG9mZnNldCBv
ZiB0aGUgbXRkLgo+ID4gCj4gPiBOVk1FTSB3aWxsIHVzZSB0aGUgZGF0YSBmcm9tIHRoZSBwYXJz
ZXIgYW5kIHByb3ZpZGUgdGhlIE5WTUVNIGNlbGxzCj4gPiBkZWNsYXJlZCBpbiB0aGUgRFRTLCAi
Y29ubmVjdGluZyIgdGhlIGR5bmFtaWMgcGFydGl0aW9uIHdpdGggYQo+ID4gc3RhdGljIGRlY2xh
cmF0aW9uIG9mIGNlbGxzIGluIHRoZW0uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBT
bWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgICAgfCAxNiArKysrKysrKysrKysrKy0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKPiA+IGluZGV4IGUxYWMwODA2NDQyNS4u
YmZmNmZiOTgwZTZiIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKPiA+
IEBAIC0xMSw2ICsxMSwxMyBAQCBkZXNjcmlwdGlvbjogfAo+ID4gICAgcmVsYXRpdmUgb2Zmc2V0
IGFuZCBzaXplIHNwZWNpZmllZC4gRGVwZW5kaW5nIG9uIHBhcnRpdGlvbiBmdW5jdGlvbiBleHRy
YQo+ID4gICAgcHJvcGVydGllcyBjYW4gYmUgdXNlZC4KPiA+ICAKPiA+ICsgIEEgcGFydGl0aW9u
IG1heSBiZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQgYnkgYSBzcGVjaWZpYyBwYXJzZXIgYXQgcnVu
dGltZS4KPiA+ICsgIEluIHRoaXMgc3BlY2lmaWMgY2FzZSwgdGhlIGxhYmVsIGlzIHJlcXVpcmVk
IGluc3RlYWQgb2YgdGhlIHJlZy4KPiA+ICsgIFRoaXMgaXMgdXNlZCB0byBhc3NpZ24gYW4gT0Yg
bm9kZSB0byB0aGUgZHluYW1pY2NhbGx5IGFsbG9jYXRlZCBwYXJ0aXRpb24KPiA+ICsgIHNvIHRo
YXQgc3Vic3lzdGVtIGxpa2UgTlZNRU0gY2FuIHByb3ZpZGUgYW4gT0Ygbm9kZSBhbmQgZGVjbGFy
ZSBOVk1FTSBjZWxscy4KPiA+ICsgIFRoZSBPRiBub2RlIHdpbGwgYmUgYXNzaWduZWQgb25seSBp
ZiB0aGUgcGFydGl0aW9uIGxhYmVsIGRlY2xhcmVkIG1hdGNoIHRoZQo+ID4gKyAgb25lIGFzc2ln
bmVkIGJ5IHRoZSBwYXJzZXIgYXQgcnVudGltZS4KPiA+ICsKPiA+ICBtYWludGFpbmVyczoKPiA+
ICAgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gIAo+ID4gQEAgLTIy
LDYgKzI5LDggQEAgcHJvcGVydGllczoKPiA+ICAgIGxhYmVsOgo+ID4gICAgICBkZXNjcmlwdGlv
bjogVGhlIGxhYmVsIC8gbmFtZSBmb3IgdGhpcyBwYXJ0aXRpb24uIElmIG9taXR0ZWQsIHRoZSBs
YWJlbAo+ID4gICAgICAgIGlzIHRha2VuIGZyb20gdGhlIG5vZGUgbmFtZSAoZXhjbHVkaW5nIHRo
ZSB1bml0IGFkZHJlc3MpLgo+ID4gKyAgICAgIFdpdGggZHluYW1pY2FsbHkgYWxsb2NhdGVkIHBh
cnRpdGlvbiB0aGUgbGFiZWwgaXMgcmVxdWlyZWQgYW5kIHdvbid0Cj4gPiArICAgICAgZmFsbGJh
Y2sgdG8gdGhlIG5vZGUgbmFtZS4KPiAKPiBHZW5lcmFsbHksIGxhYmVsIGlzIG5ldmVyIHJlcXVp
cmVkIGJlaW5nIHNvbWV0aGluZyBmb3IgaHVtYW5zIHJhdGhlciAKPiB0aGFuIHRoZSBzL3cgdG8g
Y29uc3VtZS4gSSBkb24ndCBzZWUgYW55IHJlYXNvbiB3aHkgd2UgY2FuJ3Qgc3RpbGwgdXNlIAo+
IHRoZSBub2RlIG5hbWUgKHdpdGggJ3BhcnRpdGlvbi0nIHN0cmlwcGVkIG9mZikuCj4gCgpIb3cg
dG8gZW5mb3JjZSB0aGUgdXNlIG9mICdwYXJ0aXRpb24tJz8gU2hvdWxkIHRoZSBkcml2ZXIgdGhl
biBjaGVjayB0aGUKbm9kZSBuYW1lIGFuZCByZWplY3QgYW55IHdyb25nIG5vZGUgbmFtZSAoYW5k
IHJldHVybiBlcnJvcik/CgoKPiBJZiB0aGUgcHVycG9zZSBpcyB0byBkZWZpbmUgd2hhdCB0aGUg
cGFydGl0aW9uIGNvbnRhaW5zLCB0aGVuIAo+ICdjb21wYXRpYmxlJyBpcyB0aGUgcmlnaHQgdGhp
bmcgZm9yIHRoYXQuCj4KCkludHJvZHVjaW5nIGEgY29tcGF0aWJsZSBtZWFucyBjcmVhdGluZyBh
bm90aGVyIHNjaGVtZSBJIHRoaW5rIG9yIHdlIGNhbgphZGQgdGhhdCBzcGVjaWFsIGNvbXBhdGli
bGUgaW4gdGhlIHBhcnRpdGlvbiBzY2hlbWU/Cgo+ID4gIAo+ID4gICAgcmVhZC1vbmx5Ogo+ID4g
ICAgICBkZXNjcmlwdGlvbjogVGhpcyBwYXJhbWV0ZXIsIGlmIHByZXNlbnQsIGlzIGEgaGludCB0
aGF0IHRoaXMgcGFydGl0aW9uCj4gPiBAQCAtNDEsNyArNTAsMTAgQEAgcHJvcGVydGllczoKPiA+
ICAgICAgICBpbW11bmUgdG8gcGFpcmVkLXBhZ2VzIGNvcnJ1cHRpb25zCj4gPiAgICAgIHR5cGU6
IGJvb2xlYW4KPiA+ICAKPiA+IC1yZXF1aXJlZDoKPiA+IC0gIC0gcmVnCj4gPiAraWY6Cj4gPiAr
ICBub3Q6Cj4gPiArICAgIHJlcXVpcmVkOiBbIHJlZyBdCj4gPiArdGhlbjoKPiA+ICsgIHJlcXVp
cmVkOiBbIGxhYmVsIF0KPiA+ICAKPiA+ICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQo+ID4g
LS0gCj4gPiAyLjM2LjEKPiA+IAo+ID4gCgotLSAKCUFuc3VlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
