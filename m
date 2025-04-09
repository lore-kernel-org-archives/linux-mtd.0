Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54BC36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 06:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeJqE9nSx1RbMDLOd9qfbkPiDZYT4UG9/m2IALjNfIk=; b=uUM+xLaSelgrCc
	PrUetH/9tjI6VWElw0y+olLQAyyFiAmErZNQvCvoJNl32k0BT5QM8jmicAYiC5MxID3XAwHy/s7ex
	bUFl0AJg7XvGEP9X5KwEOxu0phWdbYfW7pKrM8tXCNTpSLADpnvaokrX8e2Ac7PoZ9vSjlexq4PFc
	ou/eJP5Kxad+lagIAJITiR0xFp09zNNX0+7jMgJY1k4/aTRvMfiwK8OwPbFR17MpyPZMVEq3qD3kb
	7MiVqzroTLOf6KrcfII3TS+TGGFzzYsvKWzf11nEwfvuvdlhQ37JjTRUSzLGAKENs7XVhmSs/cjHt
	h6/UksrNetgOYDfkEDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PEp-00000006K6G-3tCB;
	Wed, 09 Apr 2025 06:48:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2P6V-00000006Iev-1uV1
	for linux-mtd@lists.infradead.org;
	Wed, 09 Apr 2025 06:40:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3895599f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2025 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744180805; x=1744785605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0/jrC7FZZ98ygzWU8GAHQggpQ/PREzbQQ0mhaLXRTE=;
        b=DXNnTgImyliXzXkHjlzMBbm0eFWkX4+fgbUkV9u4Wb/7luByWyELY95YwJ+aJ+rEhD
         sYthiPuRR7nyM/GpvNiuz1wEgSCpl6Jt2eia+qwRDi/eouYvaabLZ73Qs0UxXKkV2pC3
         JGiPXuC36ifNrMf+K96hL88kXoKplZlQeUwOwECDsd7JBD4uyiLAd2h6DPtyD1/tnEvm
         qGTPx24GxrmdYO19i2Fe9ELRLGuWwGpjtbu+tDOTgu+n1nUHYaqsTtBW4EIPkhXmnxgQ
         cJphr+PvTILnY53zRSq6yniN10lvWTNkXF36gqSKY8i8xxbN6qIbrUydgxPlzc2QrJ6f
         5G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180805; x=1744785605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0/jrC7FZZ98ygzWU8GAHQggpQ/PREzbQQ0mhaLXRTE=;
        b=q0q1JFgZYkn+xzLzf2jRUI/HtLdhgH47ifoDj9UFR/sI9iNVXNEu5xwpNPLITmTDxB
         CvZMrgMT/Y7HD3jeuBCpTG2vQTB8R7+VYGagQ7m9s97jW27oyUBgN38XnQDJLU1s+EEG
         gRlHYonUvQ/qDWMneT+jSL1Ixbb0+6lMqWJUpdmG60dDcZvFU3LWHoRJrbc/tnQYdyHZ
         A1nfm72V1bGonsQVjTj4fWy3s5snRvwagP5KnvYFWR3wtv8UCZNc9nQFPSmt2EXm5FQH
         HYvC6OrtcL76WJp0kAG/zZkD2N8Wsqf7PhgR9vTfqiOozxhaQ0i3AHuJuGO2wQauvN3D
         irSg==
X-Forwarded-Encrypted: i=1; AJvYcCVB5SFRWoPJCjSDnDm74ZObFrZNCorE6JJpXsrqIA9l9YXz+O7HUde7kXx7gnAF3vflj3/xHNkhVW4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzswOvSTRtfoo7S1+EcYDuzDkEp9jDIqGJt23eDvQH6yf/6CH3j
	sqCYKLK1KScxAIzF1VKEPUsZS/iX2uAIcnjmeNhjjrp3LuKHsTizpl7t27xOgXs=
X-Gm-Gg: ASbGncv6/cNcvyNSVLpPmDD3AV7um7uXxUt6QkoM2tjkl0gvz5U/QTuYJ3fmiWHdptd
	1EHhHqhay4o9rl0dsAW7D0K8rLTaSTTacqPdhFShu0OeIOENx6Nmckkx0fIIkCFj18C4/tLWkO0
	zj9dK3bRLi4nvIStS9+vqKzsjh4yQHrvLBuUJrZAf2RkyBZJj2SmV2Ysoteh5H9aYKeHHrSpzu4
	eH4RY4ms/14NiCBzwUrZy4pbzdsnjOpN/5o8UUgZPIcpd/XkZneWoUpJNkJ1Ujt4BYJsR8uWwKg
	wxH04Oiaedt8xn4h58CynwuU3V7VBIz3VWDEU8xmn8iMgY1w6g==
X-Google-Smtp-Source: AGHT+IHCjOF2n7U6I7R2utWFFOdC4xw3Tp0UOai+Gccs70xrtthldzaitRhsqdFKtmXADIH6VPcoAQ==
X-Received: by 2002:a05:6000:2204:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-39d885313bamr1150097f8f.14.1744180805462;
        Tue, 08 Apr 2025 23:40:05 -0700 (PDT)
Received: from [10.11.12.107] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8940e29csm661397f8f.101.2025.04.08.23.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 23:40:05 -0700 (PDT)
Message-ID: <76e3915a-e69c-4858-bc94-6eff64deeed5@linaro.org>
Date: Wed, 9 Apr 2025 07:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sama5d27_wlsom1_ek : Maximum QSPI frequency
To: Fabio Estevam <festevam@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, claudiu.beznea@tuxon.dev,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <CAOMZO5DyuMv7fQbTz33MvswfDKvpWsTCSX7FGJ4T7hkMsyX-Kg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAOMZO5DyuMv7fQbTz33MvswfDKvpWsTCSX7FGJ4T7hkMsyX-Kg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234007_498164_0855F253 
X-CRM114-Status: GOOD (  21.38  )
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

CgpPbiA0LzkvMjUgMzo1NiBBTSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBUdWRvciwKCkhp
LCBGYWJpbywKCj4gCj4gT24gYSBzYW1hNWQyN193bHNvbTFfZWsgcnVubmluZyA2LjEyIG9yIHRv
ZGF5J3MgbGludXgtbmV4dCB0aGUgUVNQSQo+IGZhaWxzIHRvIHByb2JlOgo+IAo+ICAjIGRtZXNn
IHwgZ3JlcCBzcGkKPiAgc3BpLW5vciBzcGkwLjA6IHVucmVjb2duaXplZCBKRURFQyBpZCBieXRl
czogZmYgZmYgZmYgZmYgZmYgZmYKCkl0IHNlZW1zIHRoZSByZWFkIGlkIG9wZXJhdGlvbiBmYWls
cy4KCj4gICMgY2F0IC9wcm9jL210ZAo+ICBkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5hbWUK
PiAgIwo+IAo+IElmIEkgcmV2ZXJ0IHlvdXIgY29tbWl0IDQxN2U1OGVhNDFhYiAoIkFSTTogZHRz
OiBhdDkxLXNhbWE1ZDI3X3dsc29tMToKPiBTZXQgc3N0MjZ2ZjA2NGIgU1BJIE5PUiBmbGFzaCBh
dCBpdHMgbWF4aW11bSBmcmVxdWVuY3kiKSB0aGVuIHRoZQo+IHByb2JlIHN1Y2NlZWRzOgo+IAo+
ICAjIGRtZXNnIHwgZ3JlcCBzcGkKPiAgNiBmaXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91
bmQgb24gTVREIGRldmljZSBzcGkwCj4gIENyZWF0aW5nIDYgTVREIHBhcnRpdGlvbnMgb24gInNw
aTAiOgo+ICAjIGNhdCAvcHJvYy9tdGQKPiAgZGV2OiAgICBzaXplICAgZXJhc2VzaXplICBuYW1l
Cj4gIG10ZDA6IDAwMDQwMDAwIDAwMDAxMDAwICJhdDkxYm9vdHN0cmFwIgo+ICBtdGQxOiAwMDBj
MDAwMCAwMDAwMTAwMCAiYm9vdGxvYWRlciIKPiAgbXRkMjogMDAwNDAwMDAgMDAwMDEwMDAgImJv
b3Rsb2FkZXIgZW52IHJlZHVuZGFudCIKPiAgbXRkMzogMDAwNDAwMDAgMDAwMDEwMDAgImJvb3Rs
b2FkZXIgZW52Igo+ICBtdGQ0OiAwMDA4MDAwMCAwMDAwMTAwMCAiZGV2aWNlIHRyZWUiCj4gIG10
ZDU6IDAwNjAwMDAwIDAwMDAxMDAwICJrZXJuZWwiCj4gCj4gSW4gVS1Cb290LCB0aGUgbWF4aW11
bSBzYW1hNWQyN193bHNvbTFfZWsgU1BJIGNsb2NrIGlzIDUwTUh6Lgo+IAo+IGF0OTEtc2FtYTVk
Ml94cGxhaW5lZCBpcyBwb3B1bGF0ZWQgd2l0aCBhbiBOMjVRMTI4QSBRU1BJIHRoYXQgY2FuIGJl
Cj4gY2xvY2tlZCB1cCB0byAxMDRNSHouIEhvd2V2ZXIsIGl0cyBkdHMgbGltaXRzIGl0IHRvIDgw
TUh6Lgo+IAo+IGF0OTEtYW1hNWQyOV9jdXJpb3NpdHkgaXMgYWxzbyBwb3B1bGF0ZWQgd2l0aCBh
biBTU1QyNlZGMDY0QiBRU1BJCj4gYW5kIGFsc28gcmVzdHJpY3QgdGhlIG1heGltdW0gU1BJIGNs
b2NrIHRvIDgwTUh6Lgo+IAo+IEFueSBzdWdnZXN0aW9ucz8KPiAKCkl0J3MgYmVlbiBhIHdoaWxl
IHNpbmNlIEkgZGlkIHRoYXQgcGF0Y2gsIGl0IHdhcyBicm91Z2h0IHRvIGxpZmUgZnJvbQpkb3du
c3RyZWFtIGJ5IE5pY29sYXMsIGJ1dCBJIHRydXN0IG15c2VsZiBJIHRlc3RlZCBpdC4gSSBkb24n
dCBoYXZlCmFjY2VzcyBlYXNpbHkgdG8gdGhlIGJvYXJkLCBidXQgSSBjYW4gZ2l2ZSBzb21lIGhp
bnRzOgoKMS8gZm9yIHRoZSBqZWRlYyxzcGktbm9yIGNvbXBhdGlibGUgb25lIHNoYWxsIHNldCB0
aGUgbWF4aW11bSBmcmVxdWVuY3kKc3VwcG9ydGVkIGJ5IHRoZSBmbGFzaC4gVGhlbiB0aGUgU1BJ
IGNvbnRyb2xsZXIgd2lsbCBnZXQgdGhhdCBhbmQgdXNlCnRoZSBtaW4oZmxhc2gtbWF4LXNwZWVk
LCBjb250cm9sbGVyLW1heC1zcGVlZCkuIEJlIGF3YXJlIHRoYXQgZXZlbiBpZgoxMDRNSHogaXMg
cGFzc2VkIHRvIHRoZSBjb250cm9sbGVyLCBiZWNhdXNlIG9mIHRoZSBhdG1lbC1xc3BpIGludGVy
bmFsCmNsb2NrIGRpdmlkZXIsIHlvdSBtYXkgc2V0IGluIHRoZSBTUEkgY29udHJvbGxlciBhIHNw
ZWVkIHNtYWxsZXIgdGhhbiB0aGF0LgoKTXkgYXNzdW1wdGlvbiBpcyB0aGF0IDgwIE1IeiB3YXMg
Y2hvc2VuIGZvciBvdGhlciBib2FyZHMgYmVjYXVzZSBpdCB3YXMKY2xvc2UgdG8gd2hhdCB0aGUg
aW50ZXJuYWwgY2xvY2sgZGl2aWRlciBjYW4gb3V0cHV0LiBFdmVuIHNvLApqZWRlYyxzcGktbm9y
IHNoYWxsIHNwZWNpZnkgaXRzIG1heGltdW0gc3VwcG9ydGVkIGZyZXF1ZW5jeSwgaXQKc2hvdWxk
bid0IGNhcmUgYWJvdXQgd2hhdCB0aGUgY29udHJvbGxlciB1c2VzIGluIHRoZSBlbmQuCgpVLWJv
b3QgYW5kIDUwIE1IeiBpcyBhIG1pc3Rha2UuIDUwTUh6IGlzIHRoZSByZWFkIFNGRFAgKHNlcmlh
bCBmbGFzaApkaXNjb3ZlcmFibGUgcGFyYW1ldGVycykgamVzZDIxNiBzdGFuZGFyZCByZXF1aXJl
bWVudCwgc28gbWF5YmUgdGhlCnNwaS1tYXgtZnJlcSA9IDUwIE1IeiBjb21lcyBmcm9tIHRoZXJl
LiBBbGwgdGhlIGZsYXNoZXMgdGhhdCBJJ3ZlIHNlZW4KdXAgdG8gbm93IHN1cHBvcnQgcmVhZCBT
RkRQIGF0IHRoZWlyIG1heCBzdXBwb3J0ZWQgZnJlcXVlbmN5LiBTbyB3aGF0CmxpbnV4IGFuZCB1
LWJvb3QgU1BJIE5PUiBkb2VzIGlzIHRvIGlzc3VlIHJlYWQgU0ZEUCBjb21tYW5kIGF0IHRoZQpm
bGFzaCdzIG1heCBmcmVxdWVuY3kuIEl0IHdvcmtlZCBmaW5lLiBJZGVhbGx5IHdlIHNoYWxsIGlu
dHJvZHVjZSBwZXIKb3BlcmF0aW9uIGZyZXF1ZW5jeSwgYnV0IG5vYm9keSB3b3JrZWQgb24gdGhh
dC4KCjIvIEknZCBjaGVjayB0aGUgc3RhdGVtZW50cyB0aGF0IEkgbWFkZSBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuCkZsYXNoJ3MgZGF0YXNoZWV0IHNheXMgdGhhdDoK4oCiIEhpZ2gtU3BlZWQgQ2xv
Y2sgRnJlcXVlbmN5OgotIDIuN1YtMy42VjogMTA0IE1IeiBtYXhpbXVtCi0gMi4zVi0zLjZWOiA4
MCBNSHogbWF4aW11bQoKSXMgdGhlIGZsYXNoIG9wZXJhdGVkIGF0IDMuM1Ygb24gd2xzb20xIGVr
IGFzIEkgbWVudGlvbmVkPwpEb2VzIGluY3JlYXNpbmcvZGVjcmVhc2luZyBvZiBzcGktY3Mtc2V0
dXAtbnMgaGVscD8KCkkgcmVseSBvbiBOaWNvbGFzIGZvciBmdXJ0aGVyIGludmVzdGlnYXRpb24u
IE9yIG1heWJlIGhlIGNhbiBhZGQgc29tZW9uZQppbiBjYyB0aGF0IGNhbiBoZWxwLgoKQ2hlZXJz
LAp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
