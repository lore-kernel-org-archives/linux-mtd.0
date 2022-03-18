Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30273C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JutXCvEeovbN6GOK6g7wiqJfw2EnD7eA5DhZ/iKOTu8=; b=RqHhOIVUwJNy0Q
	ytfk+eFM6uSQJWWmCng4O6Ep6xA1mpdV7ZSAXqTYmEcSTWu3Q/hFyRitA6wp5xcBwBpxB83Lj59IT
	EkOi0nvw0rAVSizgfPSfH0I2abgT+F9NC/M0wJNC6OgN6Pv8wXHLGqcMrDHRCK/1EXz+wOfMBd+Vi
	X8LLLiF9RV5CNAKA3wVVG4oTXs3o8o0gmVhpUaT7dTFMfgLSs4suSSGCUupazXIyHRTRBTMR/ZNIV
	kHZyNqWZ9pPf+Flmzh2dxeROD2C+qGqtkYXiJNy2Vyf2c5tF6jlfQh/PQNKprh1ub8N0tfTaIVXTJ
	KyDfEGjwIdZqqt4jKt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVEzf-002KM4-Ry; Fri, 18 Mar 2022 15:58:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVEzc-002KL4-Ff
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 15:58:22 +0000
Received: by mail-lj1-x236.google.com with SMTP id r22so11852037ljd.4
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2022 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=YJZZJpCGb19xtb+fy5D48tlD2OjLMHD75pIGHFGBWAM=;
 b=gdf6XA8pPDmJzwmJxdIEZyMkArCIj4Qpvf949aD0sZvpJJXXYr/Dxqz/iYX0Yjg4NI
 YQfoyW8ic/fiL3q1zs/oQVcfjAfj1tuHXDqFkxe6jeUtV8gswr+HnNQ2I9gfJbr77C6l
 bv0pW/LEnU/Tz/X+8xLtTp/i2r/uLbZta8+3uhiU4kYCMl92OL1UALj2yZNpoX9jp2Mp
 CrZzvgGzyQoYEzVUUMLXFFxxikQ8rCZBK82IcrpkQPcwTC+jMa6GokI3/x8XxMQsAAPL
 CHoRyW6sq7alX5j6g7+xQQfL87TeFxjk7+qrxYE9jQFYEmPthUrtj7hIVmUHceLpSIcw
 YH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YJZZJpCGb19xtb+fy5D48tlD2OjLMHD75pIGHFGBWAM=;
 b=fpgSXExvTdaXXqSjxIklpkHnSCG9pshVw9V9h/eQnPp4OjM1D7jURayxZIy1E7url0
 XCS/saVqT+gYz3qa8yPLgFwXtj6TjB1WX6dhYvTvUHT23J8bUdhTQ7JCckMUC4nPiVza
 NC1EiJjWhL8CRRcEtr9a7AsGeJYR8OwhylRPQoZfA81jS82EebyN87pyXpoWAQXNQC65
 ZEgxZ6boRh2KXNFeOX3JiBBuOfTks6zK87//4d6SRSSxMNoWG5Hvy/2ScsSxbwmOF41s
 40bPwBW3OhqMUPcfl1CuZ3SDV8YWu2H977SeO1540aiuOujsNwRN7Wh5qTemRIg9ppyV
 32hQ==
X-Gm-Message-State: AOAM530FBgZZLDtxHk6cNTLjkF4EXpvE6bB7VX+eH8IlskPmA7H5uDrj
 fOY/orKg3vEGD7Xy3lASapwBJcV8QCo=
X-Google-Smtp-Source: ABdhPJzsJZrxGg0ZjWIKpopoNgArjArUiD8CIfG/oumfI3rynPf0za7wot6erHKxAf04I5k3i1sG4w==
X-Received: by 2002:a2e:834f:0:b0:249:357c:bf28 with SMTP id
 l15-20020a2e834f000000b00249357cbf28mr6434746ljh.102.1647619098272; 
 Fri, 18 Mar 2022 08:58:18 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 i1-20020a2e8641000000b00247d94a6ac5sm1045750ljj.2.2022.03.18.08.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 08:58:17 -0700 (PDT)
Message-ID: <085c994f-1362-8757-0432-fd612a38430c@gmail.com>
Date: Fri, 18 Mar 2022 16:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] UBI: support EOF block marking end of ubinized image
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20220318155304.14916-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220318155304.14916-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_085820_555125_B3387B11 
X-CRM114-Status: GOOD (  17.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTguMDMuMjAyMiAxNjo1MywgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBPbiBob21lIHJvdXRlcnMgVUJJIGlz
IG9mdGVuIHVzZWQgd2l0aCBVQkkgdW5hd2FyZSBib290bG9hZGVycy4gSW4gc3VjaAo+IGNhc2Ug
YW4gdWJpbml6ZWQgaW1hZ2UgbmVlZHMgdG8gYmUgY3JlYXRlZCAmIGZsYXNoZWQuCj4gCj4gVGhl
IHByb2JsZW0gaXMgbWFueSBzdWNoIGJvb3Rsb2FkZXJzIGFyZSBwb29ybHkgd3JpdHRlbiBhbmQg
dGhleSBkb24ndAo+IGVyYXNlIHdob2xlIGZsYXNoIChwYXJ0aXRpb24pIGJlZm9yZSB3cml0aW5n
IGFuIGltYWdlLiBPbmx5IHBhcnQgb2YKPiBmbGFzaCByZXF1aXJlZCB0byBmaXQgbmV3IGltYWdl
IGdldHMgZXJhc2VkLiBJdCByZXN1bHRzIGluIFVCSQo+IGNvbXBsYWluaW5nIGFib3V0IGZsYXNo
IGdhcmJhZ2UgY29udGVudCwgZS5nLjoKPiAKPiB1YmkwOiBhdHRhY2hpbmcgbXRkMgo+IHViaTAg
ZXJyb3I6IHViaV9hdHRhY2g6IGJhZCBpbWFnZSBzZXF1ZW5jZSBudW1iZXIgMTY0NjE2MTk5OCBp
biBQRUIgMTE5LCBleHBlY3RlZCA1MjQ1MDM5ODMKPiBFcmFzZSBjb3VudGVyIGhlYWRlciBkdW1w
Ogo+ICAgICAgICAgICBtYWdpYyAgICAgICAgICAweDU1NDI0OTIzCj4gICAgICAgICAgIHZlcnNp
b24gICAgICAgIDEKPiAgICAgICAgICAgZWMgICAgICAgICAgICAgMQo+ICAgICAgICAgICB2aWRf
aGRyX29mZnNldCAyMDQ4Cj4gICAgICAgICAgIGRhdGFfb2Zmc2V0ICAgIDQwOTYKPiAgICAgICAg
ICAgaW1hZ2Vfc2VxICAgICAgMTY0NjE2MTk5OAo+ICAgICAgICAgICBoZHJfY3JjICAgICAgICAw
eDFlYjI4OTk0Cj4gZXJhc2UgY291bnRlciBoZWFkZXIgaGV4ZHVtcDoKPiB1YmkwIGVycm9yOiB1
YmlfYXR0YWNoX210ZF9kZXY6IGZhaWxlZCB0byBhdHRhY2ggbXRkMiwgZXJyb3IgLTIyCj4gVUJJ
IGVycm9yOiBjYW5ub3QgYXR0YWNoIG10ZDIKPiAKPiBUbyBmaXggdXAgc3VjaCBmbGFzaGVkIGlt
YWdlcyBpdCdzIHJlcXVpcmVkIHRvIGlkZW50aWZ5IHRoZSBlbmQgb2YKPiB1YmluaXplZCBpbWFn
ZSBvbiBmbGFzaCBhbmQgZXJhc2UgcmVtYWluaW5nIGJsb2Nrcy4KPiAKPiBJZGVhIG9mIGV4dGVu
ZGluZyBvbi1kaXNrIFVCSSBmb3JtYXQgdG8gbWFyayBlbmQgb2YgdWJpbml6ZWQgaW1hZ2Ugd2Fz
Cj4gcmVqZWN0ZWQsIHNlZToKPiBbUEFUQ0ggUkZDIDIvMl0gdWJpOiBhZGQgc3VwcG9ydCBmb3Ig
VUJJX0VDX0ZMQUdfRVJBU0VfRlJPTV9IRVJFCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8yMDE2MTIzMDE3MTE1MS4xMzQ0OC0yLXphamVjNUBn
bWFpbC5jb20vCj4gCj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIGEgc2ltcGxl
ICJFT0YiIHRleHQgY29udGVudCAoYmxvY2spCj4gYXBwZW5kZWQgdG8gdGhlIHViaW5pemVkIGlt
YWdlIGluc3RlYWQuIEl0IGRvZXNuJ3QgcmVxdWlyZSBjaGFuZ2luZwo+IG9uLWRpc2sgZm9ybWF0
IGFuZCBzdGlsbCBhbGxvd3Mgc2ltcGxlIGludGVncmF0aW9uIGludG8gdWJpIGNvZGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKV2hpbGUg
SSBwZXJzb25hbGx5IHRoaW5rIHRoYXQgVUJJIHNob3VsZCBwcm92aWRlICphbnkqIHNvbHV0aW9u
IGZvciBzdWNoCnBvb3IgYm9vdGxvYWRlcnMgaXQgaGFzIGJlZW4gc3RhdGVkIHVwc3RyZWFtIHdv
bid0IGFjY2VwdCB0aGlzIGhhY2suClRoZXJlIGlzIG5vIGlkZWEgZm9yIGFueSBvdGhlciAvIGNs
ZWFuZXIgc29sdXRpb24gbmVpdGhlci4KCkZvciBkZXRhaWxzIHNlZSBlLW1haWwgdGhyZWFkOgpI
YW5kbGluZyB1YmluaXplZCBpbWFnZSBmbGFzaGVkIG9uIG5vdCBlcmFzZWQgZmxhc2ggc3BhY2UK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDIyLU1hcmNo
LzA5MTk5My5odG1sCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1t
dGQvMjAyMi1NYXJjaC8wOTIwODEuaHRtbAoKVGhpcyBwYXRjaCBpcyBtZWFudCBmb3IgZG93bnN0
cmVhbSB1c2FnZSBpbiBwcm9qZWN0cyBsaWtlIE9wZW5XcnQgLwpCdWlsZHJvb3QgLyBZb2N0byAv
IGZvby4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
