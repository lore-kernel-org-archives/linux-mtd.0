Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0485C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 14 May 2022 03:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJsSJvsQ3wiv4AYdTfHKHGT9B3EQPH0u8ZwAgFDxiDg=; b=n+wyRAJPeKquGf
	m0ctZIdK02D3Vnf1hl5ryxI61QvjC7hw46sFKjYClI/Qk2GIrpb65udbrxF3GHd/UsBRNMY7WHaLG
	sk50fW8PpIkZAMMPWEYnLOOI/KH6OtRN8gIpqNKO3NEQ9vhg/kf8qgHUzMI+qxxX54d0TdflA3DAa
	Cd8QLYEyZUqvWH76wlKtoApu3P/g1MEaawMYpu1CAHtY4zCQUi5rtUPRHyVe2ooU5Z2aUPUL4X+gu
	kAwq5zqKOoQ+KorFuyfdwjP2C5AVn8TyhjbqtvdJE/p1UWtmReYqrnyx3bZ/X5GJADlTHuvYWRjev
	INOvkvo3WMgpeOrCuBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npiou-000iLS-D0; Sat, 14 May 2022 03:51:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npior-000iKt-Fg
 for linux-mtd@lists.infradead.org; Sat, 14 May 2022 03:51:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so9464697pjq.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2022 20:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AI+rbtD3Gyipe4x9DlExr1UfFXG9HNnQhjT9C4CZAlg=;
 b=A7pU5RpSJYOft7KZAZTIJXVF21+r9rB6uZhwSmciThTNLsheWw+mjJlr/l5bvh2Fho
 odu00C8T5mzq4fEN7iGFjYKUr7FmdzJ8Nq2NGwGvdlpvmhYPnH9N8VjZOqzDWI7TEH6F
 uAyRS4lAPmdnkmHbzjW+0UzxxkVKrGR9QmpBGjjkkdgjplpI8h734B55N/IvjkgnWsSY
 9XGst/eUnc2MFAZGRrPvAixFD0xdg1Q5PobdGlO3xsD2pKR6YHVlw8k5hZWkEc2QDAdJ
 L3ITNQa1qFGBrd5hpcq+MIVcYAbkzfzcqgjU/Z9yYjtjM6PjMc5e2aSOS77EPRfU5L8R
 40DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AI+rbtD3Gyipe4x9DlExr1UfFXG9HNnQhjT9C4CZAlg=;
 b=0z/5SVtBRC+gAOXzRLSkcnnKSgfBSMq6YMP6zM0bM4XRW/U4EICqoHkAdLm87U2Hs9
 pC7kZbxYY9ZjcVl6lNJcm7w76RBHfcHFwl18QbuPLJ6F2h+d4yROg+1gmSGxzJc7/N/V
 30zLzoR+Om5dSwoCI8LB9sb0hyO+TQf7ifo0Xs1zBDbTmDAnnhkkbmqYtqnEkiu4tGW5
 W28C2B4GI2pOWJ5mdF3FT4G1SBzjGYgfSelBGo+qqYva2StY7buNHB7XICk4ZA8WNpmo
 w/zkLtFX6GeL9ObxkatcMexG2DfQ4lqZ/+04p66c2D7YmNkkysmzZ/h5LFKXqDRNLJ0l
 3TDg==
X-Gm-Message-State: AOAM531udNvxMKV4cRQDliGDPDuVTRUBxLoHHjXrQC5f64hZ/lKQmyUy
 RLfeHNuqdHb4ajjC1VO6Ow0=
X-Google-Smtp-Source: ABdhPJwGhRuvZ9fktMhS5sH1XPXay8E5KY7p9bYNxtMB50sHslZAlp8qpQR1a3MVFnu4WXvS67Kq9Q==
X-Received: by 2002:a17:90a:a410:b0:1dc:d03b:5623 with SMTP id
 y16-20020a17090aa41000b001dcd03b5623mr8169028pjp.95.1652500310435; 
 Fri, 13 May 2022 20:51:50 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 cu5-20020a056a00448500b0050dc76281b2sm2550015pfb.140.2022.05.13.20.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 20:51:50 -0700 (PDT)
Message-ID: <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
Date: Sat, 14 May 2022 12:51:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <0eea594f72858ec0ee099d45da71bc96@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_205153_585659_A009B6DB 
X-CRM114-Status: GOOD (  22.33  )
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

T24gNS8xMy8yMDIyIDY6NDAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gW2J0dyB0aGUgc3Vi
amVjdCBzdGlsbCBoYXMgdGhlIG9sZCBuYW1lIG9mIHRoZSBhZGRyX3dpZHRoXQo+IApZZXMsIGl0
IG11c3QgYmUgZml4ZWQgaW4gbmV4dCByZXYuCgo+IEFtIDIwMjItMDUtMTMgMDM6MjYsIHNjaHJp
ZWIgVGFrYWhpcm8gS3V3YW5vOgo+PiBPbiA1LzEzLzIwMjIgNzoxNCBBTSwgTWljaGFlbCBXYWxs
ZSB3cm90ZToKPj4+IEFtIDIwMjItMDUtMTAgMDA6MTAsIHNjaHJpZWIgdGt1dzU4NDkyNEBnbWFp
bC5jb206Cj4+Pj4gRnJvbTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5l
b24uY29tPgo+Pj4+Cj4+Pj4gSW4gNEJBSVQgcGFyc2UsIGtlZXAgbm9yLT5wYXJhbXMtPmFkZHJf
d2lkdGggYmVjYXVzZSBpdCBtYXkgYmUgdXNlZCBhcwo+Pj4+IGN1cnJlbnQgYWRkcmVzcyBtb2Rl
IGluIFNNUFQgcGFyc2UgbGF0ZXIgb24uCj4+Pgo+Pj4gTWggSSdtIG5vdCBzdXJlIHRoaXMgaXMg
bmVlZGVkIGF0IGFsbC4KPj4+Cj4+PiBTRkRQIHNwZWMgc2F5cwo+Pj4gwqAgVmFyaWFibGUgYWRk
cmVzcyBsZW5ndGggKHRoZSBjdXJyZW50IHNldHRpbmcgb2YgdGhlIGFkZHJlc3MKPj4+IMKgIGxl
bmd0aCBtb2RlIGRlZmluZXMgdGhlIGFkZHJlc3MgbGVuZ3RoKQo+Pj4KPj4+IGFuZAo+Pj4gwqAg
V2hlbiB0aGUgbGVuZ3RoIGlzIGRlZmluZWQgYXMgdmFyaWFibGUsIHRoZSBzb2Z0d2FyZSBvciBo
YXJkd2FyZQo+Pj4gwqAgY29udHJvbGxpbmcgdGhlIG1lbW9yeSBpcyBhd2FyZSBvZiB0aGUgYWRk
cmVzcyBsZW5ndGggbW9kZSBsYXN0Cj4+PiDCoCBzZXQgaW4gdGhlIG1lbW9yeSBkZXZpY2UgYW5k
IHRoaXMgc2FtZSBsZW5ndGggb2YgYWRkcmVzcy4KPj4+Cj4+PiBXZSBkb24ndCBzZXQgYW55IGFk
ZHJlc3MgbW9kZSB1bnRpbCBhbGwgdGhlIFNGRFAgcGFyc2luZyBpcwo+Pj4gb3Zlci4gVGhlcmVm
b3JlIHdlIHNob3VsZCBhbHdheXMgYmUgaW4gMyBieXRlIG1vZGUsIG5vPwo+Pj4KPj4gQWN0dWFs
bHkgdGhlcmUgYXJlIHNvbWUgZGV2aWNlcyB0aGF0IGhhdmUgdmFyaWFibGUgYWRkcmVzcyBsZW5n
dGggYnV0Cj4+IDQgYnl0ZSBtb2RlIGJ5IGRlZmF1bHQgKEkgd2lsbCB3b3JrIG9uIHRob3NlIGRl
dmljZXMgYWZ0ZXIgdGhpcyBzZXJpZXMKPj4gaXMgc2V0dGxlZCkuIFRvIHN1cHBvcnQgc3VjaCBj
YXNlLCBJIHByZWZlciB0byB1c2UgcGFyYW1zLT5hZGRyX25ieXRlcwo+PiBhcyBjdXJyZW50IGFk
ZHJlc3MgbW9kZSBzbyB0aGF0IEkgY2FuIGZpeCBpdCBpbiBwb3N0X2JmcHRfZml4dXAoKSBob29r
Lgo+IAo+IEFyZSB0aGVyZSBwdWJsaWMgZGF0YXNoZWV0cyBhdmFpbGFibGU/IFNvIHRoZXNlIGRl
dmljZXMgaGF2ZSBhIDMgYnl0ZQpJIHdpbGwgc2VuZCBkYXRhc2hlZXRzIHRvIHlvdSBpbiBhbm90
aGVyIGVtYWlsLiBBdCB0aGlzIHBvaW50LCBvbmx5CnN1bW1hcnkgZGF0YXNoZWV0IGlzIGF2YWls
YWJsZSBpbiB3ZWJzaXRlLgoKPiBhbmQgYSA0IGJ5dGUgbW9kZSwgYnV0IGFmdGVyIHJlc2V0LCB0
aGV5IGFyZSBpbiB0aGUgNCBieXRlIG1vZGU/IExvb2tzClllcy4KCj4gbGlrZSBpdCBzaG91bGQg
YmUgZml4ZWQgaW4gYSBkaWZmZXJlbnQgd2F5LiBJJ20gbm90IHN1cmUgdGhlICJjdXJyZW50Cj4g
bW9kZSIgaGFuZGxpbmcgaXMgY29ycmVjdC4KPiAKWWVzLCB3ZSBtYXkgd2FudCB0byBpbnRyb2R1
Y2UgYSBuZXcgZmxhZyBsaWtlIFNQSV9OT1JfNEJBTV9ERUZBVUxUIGFuZCBjaGVjawp0aGUgZmxh
ZyBpbiBCRlBUIHBhcnNlLiBPbmNlIEkgc2VuZCBhbm90aGVyIHNlcmllcywgcGxlYXNlIHJldmll
dy4KCj4gV2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIG1vZGUgdGhlIGZsYXNo
IGN1cnJlbnRseSBpcyB1c2luZwo+IChub3ItPmFkZHJfbmJ5dGVzKSBhbmQgdGhlIG1vZGUgcGFy
c2VkIGJ5IFNGRFAgKHBhcmFtcy0+YWRkcl9uYnl0ZXMpLgo+IApUaGUgZmxhc2gncyBhZGRyZXNz
IG1vZGUgYWZmZWN0cyB0aGUgYWRkcmVzcyBsZW5ndGggb2YgTm9uLTRCIG9wY29kZXMsCmluY2x1
ZGluZyByZWFkL3dyaXRlIGFueSByZWdpc3RlciBvcHMgdXNlZCBpbiBTTVBUIHBhcnNlIGFuZCBJ
bmZpbmVvbgooc3BhbnNpb24pIHNwZWNpZmljIGhvb2tzLgoKVGhlIDRCIG9wY29kZXMgYWx3YXlz
IHRha2UgYWRkcmVzcyBsZW5ndGggb2YgNCByZWdhcmRsZXNzIG9mIGZsYXNoJ3MKYWRkcmVzcyBt
b2RlLiBJbiB0aGVzZSBJbmZpbmVvbiBjaGlwcywgNEIgb3Bjb2RlcyBmb3IgcmVhZC9wcm9ncmFt
LwplcmFzZSBhcmUgYXZhaWxhYmxlIGFuZCA0QkFJVCBhZHZlcnRpc2VzIHRoZW0uIFdlIGRvbid0
IGhhdmUgdG8gZW50ZXIKNCBieXRlIGFkZHJlc3MgbW9kZSBmb3IgcmVhZC9wcm9ncmFtL2VyYXNl
LgoKU28sIEkgdGhpbmsgd2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gYWRkcmVzcyBs
ZW5ndGggZm9yCnJlYWQvcHJvZ3JhbS9lcmFzZSBhbmQgZmxhc2gncyBkZWZhdWx0IGFkZHJlc3Mg
bW9kZS4KCk9idmlvdXNseSB3ZSBhcmUgdXNpbmcgbm9yLT5hZGRyX25ieXRlcyBhcyBhZGRyZXNz
IGxlbmd0aCBmb3IgcmVhZC8KcHJvZ3JhbS9lcmFzZSBhbmQgc2hvdWxkIGtlZXAgdGhpcyB1c2Fn
ZS4KCkZvciBmbGFzaCdzIGRlZmF1bHQgYWRkcmVzcyBtb2RlLCBteSBwcmVmZXJlbmNlIGlzIHRv
IHVzZQpwYXJhbXMtPmFkZHJfbmJ5dGVzLCBidXQgSSBzaG91bGQgcmVuYW1lIGl0IHRvIHNvbWV0
aGluZyBsaWtlCnBhcmFtcy0+ZGVmX2FkZHJfbmJ5dGVzIGFuZCByZXdvcmsgc3BpX25vcl9zZXRf
YWRkcl9uYnl0ZXMoKS4KCiBzdGF0aWMgaW50IHNwaV9ub3Jfc2V0X2FkZHJfbmJ5dGVzKHN0cnVj
dCBzcGlfbm9yICpub3IpCiB7CglpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNfNEJBSVQpIHsK
CQlub3ItPmFkZHJfbmJ5dGVzID0gNDsKCX0gZWxzZSBpZiAobm9yLT5wYXJhbXMtPmRlZl9hZGRy
X25ieXRlcykgewogCQlub3ItPmFkZHJfbmJ5dGVzID0gbm9yLT5wYXJhbXMtPmRlZl9hZGRyX25i
eXRlczsKCj4gQXQgc29tZSBwb2ludCwgdGhlIG1vZGUgaXMgc3dpdGNoZWQgYW5kIG5vci0+YWRk
cl9uYnl0ZXMgYmVjb21lcwo+IHBhcmFtcy0+YWRkcl9uYnl0ZXMuIEl0IHNlZW1zIGluIHlvdXIg
Y2FzZSBub3ItPmFkZHJfbmJ5dGVzIHNob3VsZAo+IGJlIDQgcmlnaHQgZnJvbSB0aGUgYmVnaW5u
aW5nLiBXaGljaCBhbHNvIG1lYW5zIG5vci0+YWRkcl9uYnl0ZXMKPiBzaG91bGQgYmUgMyBmb3Ig
dGhlIG90aGVyIGNhc2VzIChhbmQgcHJvYmFibHkgbm90IDApLgo+IApXaXRoIHBhcmFtLT5kZWZf
YWRkcl9uYnl0ZXMsIEkgdGhpbmsgd2UgY2FuIGtlZXAgbm9yLT5hZGRyX25ieXRlcyA9IDAKZHVy
aW5nIFNGRFAgcGFyc2UuCgpUaGFua3MsClRha2FoaXJvCgoKIAoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
