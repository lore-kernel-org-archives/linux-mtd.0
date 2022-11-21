Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33BEC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkDJOIj4kc0DLUsdRz3HwOqjgMjrCYYAJJkYy4pZ3HY=; b=GB28cBDYdAxlU8
	1KS43pSTUGF+6fan6yOll+3d+T2aAGUPd2vS0EUj+Y5eGxnXREMLZq/dibglrypAJMsvtbGhUuouf
	WiozdYMLBZh5VdonsQSZQpHapHPXjZlT0ywMaEH63RKBJkuLG0NqT0ysoRpYnvY36gkA1P/IMpPjE
	/RyT3d3kbpACfShqLh5iNC5FzF4sVKZKyRa1uuRu6a/NHJrRRvKyEWovbr0jK6w1D166Yv8LR4IlI
	mS4xLzXt5L8niR+f86kP5uQsr1UlAe2MuhV5uhfb9at9Joj8utxlC29RVv2gbtozUjfy+hsMZ2K7b
	mj4HtltRrZrguuaZRF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4w0-00CuM0-5d; Mon, 21 Nov 2022 11:25:56 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4vp-00CuJY-SY
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 11:25:47 +0000
Received: by mail-lj1-x22f.google.com with SMTP id s24so14111992ljs.11
        for <linux-mtd@lists.infradead.org>; Mon, 21 Nov 2022 03:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVDTaihieHQletiACBV4ZG6LRAsVDgCwKqVNhlyzBKQ=;
        b=BswMM7GbaH9e9T8WrNTV2GfQ7T204jYhwzSzfZVqu/vOhcEwTQ5S6cTVJUWolF4oT+
         pGPw7QB+Zakp9bB36dGLnQq8iTuIK/FgYnz9PZguxtbKzIjcTZha+8jRlufW9ECXiG5A
         mDh19CNy9kExm7tCQ+AMdtN8CGGty6/oEWhb+GllGhdk1FSYuGxy0dsqIsK+ey7+M8R1
         x7nKXGHIwpg/BdDGAJSgKZl1jZOanF7nObt5KYnCQJf9a8vZ9OMtblwxwQW58NiNItpT
         MQpwP8VZ04dZM4jrXpv5/JKbDnH1k+PJSSVc/YLeGYh1Ills+hyoNoNW0Sb/9clCVzeU
         sLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVDTaihieHQletiACBV4ZG6LRAsVDgCwKqVNhlyzBKQ=;
        b=FOc0vclAeS/Ryzwz0bbk2nlDv4MNf0T4QibWlLJfSeqkqfh1uE2osmMlAmWKQf8Zqd
         DOqvlXOhaVBbhUV6+RJQFcKkns4raHkVgCTUAjSqkEPZyYx1zOniNXb2FdJJBKt8K+LJ
         1nTOtOnX/uG1ZTgo6BByvlIU1E15ddhNbqlPTqzBk6Nv1E35/x5DIE34ADghxcPTqCvo
         2I/GqLERlc1puWrsGmKJKrMwDE+88dDNNliwItkAyQCERX7KCugI7f0OuJZTnEezmQ+l
         FKNkH1oekbxFyL/mI33uSTUC3Z0BwrHh2TL6GZlZ8fhH5VGX4fiaVKWR1tBdj4fNJ99v
         Wp5w==
X-Gm-Message-State: ANoB5plfoOVN0sgwOsroJX13U/g1LH5ev5OPRsLMGvbTDkmeoisotK6t
	KVPKdFH+g1bELJvpMYFvbziY3A==
X-Google-Smtp-Source: AA0mqf4X+9qX44KXcgmzIJ5dTRVkjYSGgPQ1xzoRs9+wK/v1cF/aseBXifGyeRqDHLJyuD6+JFNl0g==
X-Received: by 2002:a2e:a238:0:b0:277:99b:3826 with SMTP id i24-20020a2ea238000000b00277099b3826mr5108664ljm.412.1669029941379;
        Mon, 21 Nov 2022 03:25:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v8-20020ac25608000000b004afd23cf7eesm1968241lfd.168.2022.11.21.03.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:25:41 -0800 (PST)
Message-ID: <259ad74e-ec86-34e6-661f-7b7b172c4ddd@linaro.org>
Date: Mon, 21 Nov 2022 12:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH dt-schema.git] schemas: add NVMEM cell with
 #nvmem-cell-cells
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Walle <michael@walle.cc>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20221121105830.7411-1-zajec5@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121105830.7411-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_032545_930188_9A4FC4EB 
X-CRM114-Status: GOOD (  22.39  )
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

T24gMjEvMTEvMjAyMiAxMTo1OCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBTb21lIE5WTUVNIGNlbGxzIG1heSBw
cm92aWRlIG1vcmUgdGhhbiAxIHZhbHVlLiBBbiBleGFtcGxlIGNhbiBiZSBiYXNlCj4gTUFDIGFk
ZHJlc3MgdGhhdCBpcyB1c2VkIGZvciBjYWxjdWxhdGluZyBtdWx0aXBsZSBNQUNzIChmb3IgZmV3
Cj4gZGlmZmVyZW50IGRldmljZXMpLiBGb3Igc3BlY2lmeWluZyB2YWx1ZSB0byByZWFkIHBoYW5k
bGUgbmVlZHMgdG8gYmUKPiB1c2VkIHdpdGggYW4gYXJndW1lbnQuCj4gCj4gQ2M6IFNyaW5pdmFz
IEthbmRhZ2F0bGEiIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4gQ2M6IE1pY2hh
ZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFRoaXMgYml0IGlzIHJlcXVpcmVkIGZvciBt
b3ZpbmcgZm9yd2FyZCB3aXRoIHRoZQo+IFtQQVRDSCB2MiAwMC8yMF0gbnZtZW06IGNvcmU6IGlu
dHJvZHVjZSBOVk1FTSBsYXlvdXRzCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDIyMDkwMTIyMTg1Ny4yNjAwMzQwLTEtbWljaGFlbEB3YWxsZS5jYy8KPiAKPiBB
cyBwb2ludGVkIG91dCBieSBSb2IgI252bWVtLWNlbGwtY2VsbHMgc2hvdWxkIGJlIGFkZGVkIHRv
IHRoZSBkdC1zY2hlbWEKPiBhbmQgbm90IGEgTGludXggYmluZGluZzoKPiBSZTogW1BBVENIIHYy
IDE1LzIwXSBkdC1iaW5kaW5nczogbnZtZW06IGFkZCBZQU1MIHNjaGVtYSBmb3IgdGhlIHNsMjgg
dnBkIGxheW91dAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAy
MjA5MTIxOTIwMzguR0ExNjYxNTUwLXJvYmhAa2VybmVsLm9yZy8KPiAKPiBzbDI4IGlzIG9uZSBl
eGFtcGxlIHRoYXQgbmVlZHMgI252bWVtLWNlbGwtY2VsbHMKPiB1LWJvb3QsZW52IGlzIGFub3Ro
ZXIgb25lCj4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgZ290IHRoaXMgYmluZGluZyByaWdo
dCBhdCBhbGwuCj4gLS0tCj4gIGR0c2NoZW1hL3NjaGVtYXMvbnZtZW0vbnZtZW0tY2VsbC55YW1s
IHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGR0c2NoZW1hL3NjaGVtYXMvbnZtZW0vbnZt
ZW0tY2VsbC55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL2R0c2NoZW1hL3NjaGVtYXMvbnZtZW0vbnZt
ZW0tY2VsbC55YW1sIGIvZHRzY2hlbWEvc2NoZW1hcy9udm1lbS9udm1lbS1jZWxsLnlhbWwKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAuLmRmYTk5YjgKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvZHRzY2hlbWEvc2NoZW1hcy9udm1lbS9udm1lbS1jZWxsLnlhbWwKPiBAQCAt
MCwwICsxLDIzIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+
ICskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1lbS9udm1lbS1jZWxsLnlh
bWwjIgo+ICskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9iYXNl
LnlhbWwjIgoKRHJvcCBxdW90ZXMgZnJvbSBib3RoLgoKPiArCj4gK3RpdGxlOiBOVk1FTSBDZWxs
IENvbW1vbiBQcm9wZXJ0aWVzCj4gK2Rlc2NyaXB0aW9uOiAiU2NoZW1hIGZvciBOVk1FTSBjZWxs
IGRldmljZXRyZWUgYmluZGluZ3MiCgpEcm9wIHF1b3Rlcy4KCj4gK21haW50YWluZXJzOgo+ICsg
IC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ICsgIC0gU3Jpbml2YXMgS2Fu
ZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+ICsKPiArIyBhbHdheXMg
c2VsZWN0IHRoZSBjb3JlIHNjaGVtYQo+ICtzZWxlY3Q6IHRydWUKPiArCj4gK3Byb3BlcnRpZXM6
Cj4gKyAgIiNudm1lbS1jZWxsLWNlbGxzIjoKPiArICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzIiCgpEcm9wIHF1b3Rlcy4KClJlc3QgbG9va3MgZmluZSB0
byBtZSwgZXhjZXB0IGEgYml0IGZ1bm55IGNlbGwtY2VsbCBuYW1lLCBidXQgdGhhdCdzCmp1c3Qg
bGlmZS4gOikKCj4gKyAgICBkZXNjcmlwdGlvbjogPgo+ICsgICAgICBTb21lIE5WTUVNIGNlbGxz
IG1heSBjb25zaXN0IG9mIHJhdyBkYXRhIHRoYXQgcmVxdWlyZXMgc29tZSBleHRyYQo+ICsgICAg
ICBwcm9jZXNzaW5nLiBUaGV5IG1heSBwcm92aWRlIG1vcmUgdGhhbiAxIHZhbHVlLgo+ICsKPiAr
ICAgICAgUGFzc2luZyBleHRyYSBhcmd1bWVudChzKSBhbGxvd3Mgc2VsZWN0aW5nIGRhdGEgdG8g
YWNjZXNzLgo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
