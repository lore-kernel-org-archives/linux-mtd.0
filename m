Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F56AE7716E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 01:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TIAjKwgcTW2Zgt6by0o+l32MDTnpIt8VqeFNNPUrPI=; b=UO9Sx1hQ0zKAO4
	uPxnalO+PyXPLRwH+SUuidj3gI2U6iJlUqtsfKUFMAfE51Df/YwhH7oVzXHtEsB4xXHv3VdQXXTdT
	HIyeA8ZnnqGPNNFUuL4dyXOS+Qo14Qk1c8iBiRxPoLLCzar9zDMZaUR/TNdlGVOvWktAD4IVlVJUx
	RR+2GGCs8ektouIRS5K80hLXs9ackuIhDusmRTcBZcaK2u/Yqu6VofootEROqQVScEV+LfFH/Jhw6
	t+tN9pfJ+DPoPVfGYWcXU/SOLP1IgK5h2iNjwO4ZSzgJ/8D4tXyqCU8/3/PQAdDdPW7Tzplkf+w87
	1JzWB9G/VoFCq51dLbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNOp-00000000Dpx-3Pv1;
	Fri, 06 Dec 2024 01:44:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNNm-00000000Djf-3vUE;
	Fri, 06 Dec 2024 01:43:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-215ac560292so15648065ad.2;
        Thu, 05 Dec 2024 17:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733449429; x=1734054229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvMuO2LzOEcK6bZJDOQK5xJYTAbXjx0HM3xx7EXHDhI=;
        b=Or1o7xMGZp87FV9pDcDZlmOAXeHdeB5KMwaByyM0bXtHmTiaS3M8cQ6EitNZXgR/po
         E8L0D+hqhppC6lJ1f9vpMx/gjioR+UF99cBn7kXq5NUqa+RSBeyW9Ar6m3g585LWm+V4
         x5edPHieOow30XMmfOOVCkVcyGPPUgX/txXAng+0BGwwPjz95T141RdZ3SDPVrSNqlwy
         WwekDD7ganW0NqmrAEPnoSX9u6jhhPZtWNKbtGlATP8tqBgpgpqyygkQFbWU2excOVM2
         nOI/UepRsdI2ATnDWKTpeQ7JXfDjoW54mA3Z2SDQZpxmGFW0IzV0SjiqcHCbj9XGdI4x
         hMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733449429; x=1734054229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvMuO2LzOEcK6bZJDOQK5xJYTAbXjx0HM3xx7EXHDhI=;
        b=cNvkVTgCT+WNUDG6RejrNrZZw5sh+KjWJxC1cReSkduedGamuGobxPh2jKeUVTbRq1
         wgiiZ1x0Go+Ehykdfk5qT/wmwshHAK4snrsR0W/77keTltO0d1ImclrDDhNwKEWV3Ymq
         Qa+iWibqWTIyfgrNw5NeNm6gBXjbT81CcGY42PF95FGexVo66y3jZweYHQYUQ5VmTlVJ
         CaWu8GNEt2k7n8COGyBsJEDiZRWofa+ArZZ2BWkB3gKZsQY3/2hiEkY4PKY+qQUKpoAR
         VIR3cFS3MpkIvhG29cKkemOjZGXPFTX2ljqZqmR4X3cyICPQLKXDDYzcztEX/+bi0gdc
         ANVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2lhM0nxgTomg/+hXM9X1tGnri66y5GRITUSVx8c3c559lt6DvFRH7wD2M9DuqUztfmx9rEanUych1bGoOnn9J@lists.infradead.org, AJvYcCXOz6hRjasaamvPLrqU50Zw7l7aV2va3lEqAQCr30xcwtlkAckP49IN/V8wCZtTqTxGF16dpjgR5FyK@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZWV0n0TQ+ZnapNVEH73vrGf9/shy4iCfk/6HmkkMLW5UiDl1
	Z6fr6zKAQ5A06z5vMSB3FuFmJQoiMWdI372MqubT/HInMoHWxAFy2G0IkA==
X-Gm-Gg: ASbGncupCjV4WiOUi13XoELunodWpVgcYJuXWTwzkEqmbwe3jA1JOtDmCLc5Vmtjj+4
	TXF3bHpFzWtAwNkZKfPkJJ/UPDpCUsKMes/Bk7aHMOfpWYOuOWzeX9stK6KJ7a31X3ofkA/BOcN
	Wy0nNSWVyi8DK97zaoZ9yHF8kLOUGB3sR8x479WLeoLbzD0UZP5kvbhgRhDkoG7J2GY6WmhoDl5
	Z/tN8/FF1TqC03qp0aN/ulI+ewATCnlpKbNjn26XJlku/F4M4bkljfzGYdM6PMSzNJV/2Gxr6ki
	2rsajMHB4xFHT8LI5ZCLlSJN
X-Google-Smtp-Source: AGHT+IFYW2PobbERX0J/R0MGurhl+mv/yjucHbwp3t0d/Vn3DANq7WcMduBahQARhzIKRTXGHQSXBQ==
X-Received: by 2002:a17:903:188:b0:215:5935:7eef with SMTP id d9443c01a7336-21614d68778mr17893035ad.22.1733449429330;
        Thu, 05 Dec 2024 17:43:49 -0800 (PST)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f30fsm18793305ad.74.2024.12.05.17.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 17:43:49 -0800 (PST)
Message-ID: <d41c9484-6192-462d-92e8-c200192d37f8@gmail.com>
Date: Fri, 6 Dec 2024 09:43:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] Add support for nuvoton ma35 nand controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241204025129.150525-1-hpchen0nvt@gmail.com>
 <878qsuwhm1.fsf@bootlin.com>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <878qsuwhm1.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_174350_980582_E7D233EC 
X-CRM114-Status: GOOD (  11.67  )
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

RGVhciBNaXF1ZWwsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKT24gMjAyNC8xMi81IOS4
i+WNiCAwNjoyNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPgo+IE9uIDA0LzEyLzIwMjQg
YXQgMDI6NTE6MjcgR01ULCBIdWktUGluZyBDaGVuIDxocGNoZW4wbnZ0QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyB0aGUgbXRkIG5hbmQgZHJpdmVyIGZvciB0
aGUgbnV2b3RvbiBtYTM1IEFSTXY4IFNvQy4KPj4gSXQgaW5jbHVkZXMgRFQgYmluZGluZyBkb2N1
bWVudGF0aW9uIGFuZCB0aGUgbWEzNSBtdGQgbmFuZCBkcml2ZXIuCj4+Cj4+IHYxMDoKPj4gICAg
LSBVcGRhdGUgbWEzNWQxIG10ZCBuYW5kIGRyaXZlcgo+PiAgICAgIC0gQWRkIHVuc3VwcG9ydGVk
IHdyaXRlIHBhZ2UgaGFuZGxpbmcuCj4gSSB3YXMgYWJvdXQgdG8gYXBwbHkgaXQgYnV0Li4uCj4K
PiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogMTE3OiBXQVJOSU5HOiBwbGVhc2Ugd3Jp
dGUgYSBoZWxwIHBhcmFncmFwaCB0aGF0IGZ1bGx5IGRlc2NyaWJlcyB0aGUgY29uZmlnIHN5bWJv
bAo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAxNDE6IFdBUk5JTkc6IGFkZGVkLCBt
b3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8K
PiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogMzQ4OiBDSEVDSzogc3BhY2VzIHByZWZl
cnJlZCBhcm91bmQgdGhhdCAnKycgKGN0eDpWeFYpCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0
Y2gucGw6IDM1MjogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJvdW5kIHRoYXQgJysnIChjdHg6
VnhWKQo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAzNTI6IENIRUNLOiBzcGFjZXMg
cHJlZmVycmVkIGFyb3VuZCB0aGF0ICcrJyAoY3R4OlZ4VikKPiAgICAgIFszMW3il49bMG0gY2hl
Y2twYXRjaC5wbDogNDI5OiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVu
dGhlc2lzCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ2NTogQ0hFQ0s6IHNwYWNl
cyBwcmVmZXJyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6VnhWKQo+ICAgICAgWzMxbeKXj1swbSBj
aGVja3BhdGNoLnBsOiA0NjU6IENIRUNLOiBzcGFjZXMgcHJlZmVycmVkIGFyb3VuZCB0aGF0ICcr
JyAoY3R4OlZ4VikKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNDY2OiBDSEVDSzog
c3BhY2VzIHByZWZlcnJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCj4gICAgICBbMzFt4peP
WzBtIGNoZWNrcGF0Y2gucGw6IDQ2NjogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJvdW5kIHRo
YXQgJysnIChjdHg6VnhWKQo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA0Njc6IENI
RUNLOiBzcGFjZXMgcHJlZmVycmVkIGFyb3VuZCB0aGF0ICcqJyAoY3R4OlZ4VikKPiAgICAgIFsz
MW3il49bMG0gY2hlY2twYXRjaC5wbDogNDY3OiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91
bmQgdGhhdCAnKycgKGN0eDpWeFYpCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ2
ODogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6VnhWKQo+ICAg
ICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA0Njg6IENIRUNLOiBzcGFjZXMgcHJlZmVycmVk
IGFyb3VuZCB0aGF0ICcrJyAoY3R4OlZ4VikKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5w
bDogNDc5OiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpWeFYp
Cj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ3OTogQ0hFQ0s6IHNwYWNlcyBwcmVm
ZXJyZWQgYXJvdW5kIHRoYXQgJysnIChjdHg6VnhWKQo+ICAgICAgWzMxbeKXj1swbSBjaGVja3Bh
dGNoLnBsOiA0ODE6IENIRUNLOiBzcGFjZXMgcHJlZmVycmVkIGFyb3VuZCB0aGF0ICcqJyAoY3R4
OlZ4VikKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNDgxOiBDSEVDSzogc3BhY2Vz
IHByZWZlcnJlZCBhcm91bmQgdGhhdCAnKycgKGN0eDpWeFYpCj4gICAgICBbMzFt4pePWzBtIGNo
ZWNrcGF0Y2gucGw6IDUxNDogQ0hFQ0s6IFVuYmFsYW5jZWQgYnJhY2VzIGFyb3VuZCBlbHNlIHN0
YXRlbWVudAo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA2MTE6IENIRUNLOiBBbGln
bm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKPiAgICAgIFszMW3il49bMG0gY2hl
Y2twYXRjaC5wbDogNjUwOiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVu
dGhlc2lzCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDY2NTogQ0hFQ0s6IEFsaWdu
bWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwo+ICAgICAgWzMxbeKXj1swbSBjaGVj
a3BhdGNoLnBsOiA2NzU6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50
aGVzaXMKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNjg5OiBDSEVDSzogQWxpZ25t
ZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCj4gICAgICBbMzFt4pePWzBtIGNoZWNr
cGF0Y2gucGw6IDY5OTogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRo
ZXNpcwo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA3MTU6IENIRUNLOiBBbGlnbm1l
bnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKPiAgICAgIFszMW3il49bMG0gY2hlY2tw
YXRjaC5wbDogNzU2OiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhl
c2lzCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDgwNTogQ0hFQ0s6IEFsaWdubWVu
dCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwo+ICAgICAgWzMxbeKXj1swbSBjaGVja3Bh
dGNoLnBsOiA5MzU6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVz
aXMKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogOTUwOiBDSEVDSzogQWxpZ25tZW50
IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0
Y2gucGw6IDk1MzogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNp
cwo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA5NzU6IENIRUNLOiBBbGlnbm1lbnQg
c2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRj
aC5wbDogMTAwMTogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNp
cwo+ICAgICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAxMDE4OiBDSEVDSzogQWxpZ25tZW50
IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCj4gICAgICBbMzFt4pePWzBtIGNoZWNrcGF0
Y2gucGw6IDExMzE6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVz
aXMKPiAgICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogMTE1OTogV0FSTklORzogRFQgY29t
cGF0aWJsZSBzdHJpbmcgIm51dm90b24sbWEzNWQxLW5hbmQiIGFwcGVhcnMgdW4tZG9jdW1lbnRl
ZCAtLSBjaGVjayAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy8KPgo+IFBsZWFz
ZSBmaXggdGhlc2Ugd2FybmluZ3MgYW5kIGNoZWNrcy4KPgo+IFlvdSBtaWdodCB3YW50IHRvIHVz
ZSAtLXN0cmljdCBieSBkZWZhdWx0LgoKSSB3aWxsIGZpeCBpdC4KCgo+Cj4gVGhhbmtzLAo+IE1p
cXXDqGwKCgpCZXN0IHJlZ2FyZHMsCgpIdWktUGluZyBDaGVuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
