Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E885EB8FA5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfA48fhfTXVNQTKOwAfNNTGd+PHfPUrhmixDNtvjPRY=; b=a17W6NAvcEIGzu
	QNn69QtlwXd4N9ag5e+x+GgUhXOwbmxp7yNz6xcKGkeTz76s2xyuTzee8FHglufShBROQsIvOxQ0B
	SdtKJxRhQ/ltSJ/mojLSBBst9PSqikx/E1pLmeA4kZVFlvxSYQBZT6a/MqUE7hya3M6onUNR5N5eh
	68w0s3DuJDNaMFn/dNl8v37VNbWpAY903xNyVXu1rN6Oy0XXKbdP6N4iayPO1fSF88ncFnTXCbrpi
	INS1rMQ8Jt//6aMgh6FYDAWqMrp8ogDwfYqFZ3iW/x0Sd9zGg703Gl9SW4oN0jOkdPq9a3B+KAWJC
	znBcsKlrfCMvvXxPCGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmU8-007Q5j-1H;
	Wed, 06 Sep 2023 06:57:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmU4-007Q4i-39
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 06:57:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-317c3ac7339so2846111f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2023 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693983470; x=1694588270; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFULhwZOtuLXJVRalfZ82ZYjjqAYDEj4C71frmrg3RQ=;
        b=F/+oWXD030j6OrNr2eOz8/9N3e0RROGsvu1rj0C4ZX+nm8MeRKTYFX8ADU+QmunGa9
         MQaHqM8kQuArluohCxQcEhLjrM2FIEn2e/PPOYOPqyp4EyyBn6Pf6wbJCqeJ5MdJqo+n
         KA5CcV/8LRWqTKFxwqecvM+fB9xfxTXzptdttz5Tn4aUjkvMNS62K9vpmL+n4Hpf4fWr
         h+zRpQu/AAB310tg9TkV45dbZ+kB8BC07J/cAFGzD+PuOkvpzUsHcWCd/dajFwU1b21L
         q0iMvfLg9qQBYsw57Faob9njMzWMvU7l/t/knwWGoda4/rEowSfH8aRUzxDuQtQs/Hur
         cNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693983470; x=1694588270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFULhwZOtuLXJVRalfZ82ZYjjqAYDEj4C71frmrg3RQ=;
        b=VU8QvtAznojDoWbBR88pzYCcE3ysmdM8AQKbI/Fo8eE9mbLt6lYhHXJNblaaV0zsWo
         dLN8SQdAtFgDQ5xLYdUsMcGwZXka1rHbg+JdNpy+GsXIKKb6GoRn/krVUCnJsNyTTuWH
         REn+/BXa9xqhIr7895ZUIkJG2unDJuQPmOvMkR5vwbOBTWhWsTkqGPoO5I9hXiEWWbmW
         3D6znKul9YLxp+q876NNQcyq3pnDbys9XcnUqNSMi6y1gQ1qN6YNRJ4C5T8GRVpsA3Ix
         1yFdcBvOhY2R29FDGKrc6de85QORCTgrHP1QsdQdPQ/4CcBNNI4iFXFlwMS707JXcBdK
         6Wdg==
X-Gm-Message-State: AOJu0Yxlq57hI1U8lU87xaOOQxcQEmZWAtQ+SRJRKsiDhayW5yHs9pDQ
	DGrXR+n0FkYnK3zTcUZU5rGrmWTGqV/ZUolrLahSaoci3Eoukg==
X-Google-Smtp-Source: AGHT+IGZ4+i8EtNTrVY190bRQh394DYJF4Psr2TShHP8SjJMiQAGGZG7GTQ2yOy96Waw7z0HZUdvyJ3Ac9LY1ispKro=
X-Received: by 2002:a5d:6b01:0:b0:314:1270:8fc with SMTP id
 v1-20020a5d6b01000000b00314127008fcmr1848858wrw.0.1693983470151; Tue, 05 Sep
 2023 23:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
 <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com> <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
In-Reply-To: <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
From: Leon Pollak <leon.pollak@gmail.com>
Date: Wed, 6 Sep 2023 09:57:38 +0300
Message-ID: <CAM===sQ+-2A=R_Rn4iiLyaVsBh0Y1Dp8QDeT2fevEiWCfLtmnw@mail.gmail.com>
Subject: Re: Can't find correct configuration
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_235753_015577_92F7A67C 
X-CRM114-Status: GOOD (  24.80  )
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

VGhvdXNhbmRzIG9mIHRoYW5rcywgWmhpaGFvIENoZW5nISEhCkl0IHdvcmtlZCBleGFjdGx5IGFz
IHlvdSB3cm90ZS4KVGhlIG9ubHkgcXVlc3Rpb24gcmVtYWluZWQgaXM6Ck15IHBhcnRpdGlvbiBz
aXplIGlzIDI0OE1pQi4KSSB0aG91Z2h0IHRoYXQgbGVhdmluZyA4TWlCICJzcGFyZScgd2lsbCBi
ZSB1c2VkIGp1c3QgZm9yIHRoZXNlCnJlc2VydmVkIFBFQnMsIGJ1dCBub3cgSSB1bmRlcnN0YW5k
IHRoaXMgd2FzIGluY29ycmVjdC4KU28sIG1heSBJIHV0aWxpemUgdGhlc2UgOE1pQiBiYWNrIG9y
IHdpbGwgdGhleSBzdGlsbCBiZSB1c2VkIGJ5IFVCSQpmb3Igc29tZXRoaW5nPwoKT24gV2VkLCA2
IFNlcHQgMjAyMyBhdCAwNTo1MCwgWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4KPiDlnKggMjAyMy85LzYgMTA6NDIsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4g
PiDlnKggMjAyMy85LzUgMjI6NDUsIExlb24gUG9sbGFrIOWGmemBkzoKPiA+IEhpCj4gPj4gSGVs
bG8sIGFsbC4KPiA+PiBJIHdpbGwgYmUgdmVyeSB2ZXJ5IHRoYW5rZnVsIGZvciB0aGUgaGVscCB0
byBmaW5kIHRoZSBjb3JyZWN0Cj4gPj4gY29uZmlndXJhdGlvbiBmb3IgbXkgTkFORC4KPiA+PiBJ
IHBhc3NlZCB0aHJvdWdoIGEgbG90IG9mIG1haWxzIGluIHRoZSBsaXN0cyBhbmQgZ29vZ2xlIGFu
ZCBDaGF0R1BUIC0KPiA+PiBubyBzdWNjZXNzLgo+ID4+IEkgaGF2ZSAyNTZNQiBOQU5EIGFuZCAy
NDhNQiBwYXJ0aXRpb24gZm9yIFVCSUZTLiBJIHJ1bjoKPiA+PiBta2ZzLnViaWZzIC12IC1yIHJv
b3RmcyAtRiAtbSAyMDQ4IC1lIDEyNjk3NiAtYyAxOTgxIC1vIC4vdWJpZnMuaW1nCj4gPj4gdWJp
bml6ZSAtdiAtbyByb290ZnMuaW1nIC1tIDIwNDggLXAgMTI4S2lCIC1zIDUxMiAtTyAyMDQ4IHVi
aW5pemUuY2ZnCj4gPj4gLS0tLS0KPiA+PiBhbmQgdWJpbml6ZS5jZmcgbG9va3MgbGlrZToKPiA+
PiBbdWJpZnNdCj4gPj4gbW9kZT11YmkKPiA+PiBpbWFnZT0uL3ViaWZzLmltZwo+ID4+IHZvbF9p
ZD0wCj4gPj4gdm9sX3NpemU9MjQwTWlCCj4gPj4gdm9sX3R5cGU9ZHluYW1pYwo+ID4+IHZvbF9u
YW1lPXViaV9yb290ZnMKPiA+PiB2b2xfYWxpZ25tZW50PTEKPiA+PiB2b2xfZmxhZ3M9YXV0b3Jl
c2l6ZQo+ID4+IC0tLS0tLQo+ID4+IEtlcm5lbCBjb25maWd1cmF0aW9uICB3YXMgd2l0aCBDT05G
SUdfTVREX1VCSV9CRUJfTElNSVQ9MjAuCj4gPj4gYW5kIGhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6
Cj4gPj4gWyAgICAyLjY5NTY1OV0gdWJpMDogYXR0YWNoaW5nIG10ZDQKPiA+PiBbICAgIDMuMzcy
MzQzXSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hlZAo+ID4+IFsgICAgMy4zODMwNjZdIHViaTAg
d2FybmluZzogdWJpX2ViYV9pbml0OiBjYW5ub3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+ID4+IGZv
ciBiYWQgUEVCIGhhbmRsaW5nLCByZXNlcnZlZCA0LCBuZWVkIDQwCj4gPj4gWyAgICAzLjQwNDMy
MF0gdWJpMDogdm9sdW1lIDAgKCJ1Ymlfcm9vdGZzIikgcmUtc2l6ZWQgZnJvbSAxOTgyIHRvCj4g
Pj4gMTk4MiBMRUJzCj4gPj4gWyAgICAzLjQxMTY2N10gdWJpMDogYXR0YWNoZWQgbXRkNCAobmFt
ZSAiRlMiLCBzaXplIDI0OCBNaUIpCj4gPj4gWyAgICAzLjQxNzA5NV0gdWJpMDogUEVCIHNpemU6
IDEzMTA3MiBieXRlcyAoMTI4IEtpQiksIExFQiBzaXplOgo+ID4+IDEyNjk3NiBieXRlcwo+ID4+
IFsgICAgMy40MjQwMDZdIHViaTA6IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogMjA0OC8yMDQ4
LCBzdWItcGFnZQo+ID4+IHNpemUgNTEyCj4gPj4gWyAgICAzLjQzMDc0MF0gdWJpMDogVklEIGhl
YWRlciBvZmZzZXQ6IDIwNDggKGFsaWduZWQgMjA0OCksIGRhdGEKPiA+PiBvZmZzZXQ6IDQwOTYK
PiA+PiBbICAgIDMuNDM3NzM0XSB1YmkwOiBnb29kIFBFQnM6IDE5OTAsIGJhZCBQRUJzOiAwLCBj
b3JydXB0ZWQgUEVCczogMAo+ID4+IFsgICAgMy40NDM4NjBdIHViaTA6IHVzZXIgdm9sdW1lOiAx
LCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKPiA+PiBjb3VudDogMTI4Cj4gPj4g
WyAgICAzLjQ1MTExN10gdWJpMDogbWF4L21lYW4gZXJhc2UgY291bnRlcjogMS8wLCBXTCB0aHJl
c2hvbGQ6IDQwOTYsCj4gPj4gaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAxNTkwNTcwMDczCj4gPj4g
WyAgICAzLjQ2MDI5NV0gdWJpMDogYXZhaWxhYmxlIFBFQnM6IDAsIHRvdGFsIHJlc2VydmVkIFBF
QnM6IDE5OTAsCj4gPj4gUEVCcyByZXNlcnZlZCBmb3IgYmFkIFBFQiBoYW5kbGluZzogNAo+ID4+
IFsgICAgMy40Njk1NzVdIHViaTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0
ZWQsIFBJRCAxMzEKPiA+PiBbICAgIDQuNjQ4NzE4XSBVQklGUyAodWJpMDowKTogYmFja2dyb3Vu
ZCB0aHJlYWQgInViaWZzX2JndDBfMCIKPiA+PiBzdGFydGVkLCBQSUQgMTM2Cj4gPj4gWyAgICA0
LjY3NjY0MF0gVUJJRlMgKHViaTA6MCk6IHN0YXJ0IGZpeGluZyB1cCBmcmVlIHNwYWNlCj4gPj4g
WyAgIDEwLjI1MDA5OV0gVUJJRlMgKHViaTA6MCk6IGZyZWUgc3BhY2UgZml4dXAgY29tcGxldGUK
PiA+PiBbICAgMTAuMjY5MDQ2XSBVQklGUyAodWJpMDowKTogVUJJRlM6IG1vdW50ZWQgVUJJIGRl
dmljZSAwLCB2b2x1bWUgMCwKPiA+PiBuYW1lICJ1Ymlfcm9vdGZzIgo+ID4+IFsgICAxMC4yNzY4
MzBdIFVCSUZTICh1YmkwOjApOiBMRUIgc2l6ZTogMTI2OTc2IGJ5dGVzICgxMjQgS2lCKSwKPiA+
PiBtaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDIwNDggYnl0ZXMvMjA0OCBieXRlcwo+ID4+IFsg
ICAxMC4yODY3OTRdIFVCSUZTICh1YmkwOjApOiBGUyBzaXplOiAyNTAxNDI3MjAgYnl0ZXMgKDIz
OCBNaUIsIDE5NzAKPiA+PiBMRUJzKSwgam91cm5hbCBzaXplIDkwMjM0ODggYnl0ZXMgKDggTWlC
LCA3MiBMRUJzKQo+ID4+IFsgICAxMC4yOTc1NDBdIFVCSUZTICh1YmkwOjApOiByZXNlcnZlZCBm
b3Igcm9vdDogMCBieXRlcyAoMCBLaUIpCj4gPj4gWyAgIDEwLjMwMzQwNl0gVUJJRlMgKHViaTA6
MCk6IG1lZGlhIGZvcm1hdDogdzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksCj4gPj4gVVVJRCBBMTRE
NTg2QS0zMkUyLTQ1RDctQTA3RS1CREM0NzJGREYzMUQsIHNtYWxsIExQVCBtb2RlbAo+ID4+Cj4g
Pj4gTXkgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIHRoaXMgd2FybmluZyBhYm91dCByZXNlcnZlZCA0
LCBuZWVkZWQgNDAKPiA+PiBhcHBlYXI/IEhvdyBjYW4gSSBzb2x2ZSB0aGlzPwo+ID4+Cj4gPgo+
ID4gU29sdXRpb246IE1vZGlmeSB1YmluaXplLmNmZywgIHZvbF9zaXplPTI0ME1pQiAtPiB2b2xf
c2l6ZT0yMzVNaUIKPiA+Cj4gPiBXaHkgZG9lcyB0aGlzIHdhcm5pbmcgYWJvdXQgcmVzZXJ2ZWQg
NCwgbmVlZGVkIDQwIGFwcGVhcj8KPiA+IFRoZSBjb3VudCBvZiBiYWQgUEVCcyByZXNlcnZlZCBi
eSBVQkkgaXM6IHRvdGFsX3BlYnMobmFuZCBjaGlwKSAqCj4gPiBDT05GSUdfTVREX1VCSV9CRUJf
TElNSVQvMTAyNCA9IDIwNDggKiAgMjAgLyAxMDI0ID0gNDAKPiA+IFdoZW4gZmFzdG1hcCBpcyBu
b3QgZW5hYmxlZCwgdGhlIGNvdW50IG9mIGludGVybmFsIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJCj4g
PiBpczogVUJJX0xBWU9VVF9WT0xVTUVfRUJTWzJdICsgV0xfUkVTRVJWRURfUEVCU1sxXSArCj4g
PiBFQkFfUkVTRVJWRURfUEVCU1sxXSA9IDQKPiA+Cj4gPiBUb3RhbCBQRUJzIGZvciBVQkkgaXMg
MTk5MChnb29kIFBFQnM6IDE5OTApLCB0aGUgbWF4IGNvdW50IG9mIHVzZXIKPiA+IHZvbHVtZSBQ
RUJzIGlzIDE5OTAgLSA0MCAtIDQgPSAxOTQ2Cj4gPgo+ID4gSW4gdWJpbml6ZS5jZmcsIHZvbF9z
aXplPTI0ME1pQiwgdGhlIGNvdW50IG9mIHVzZXIgdm9sdW1lIFBFQnMgaXMoc2VlCj4gPiB1Ymlu
aXplLmMgaW4gbXRkdWl0bHMpOiB2aV9zaXplICsgKGxlYl9zaXplIC0gMSkgLyBsZWJfc2l6ZQo+
ID4gdmlfc2l6ZSA9IDI0ME0gPSAyNDAgKiAxMDI0ICogMTAyNAo+ID4gbGViX3NpemUgPSAxMjhL
IC0gMksoZWMpIC0gMksodmlkKSA9IDEyNCAqIDEwMjQKPiA+IHJlc3VsdCA9IDE5ODIKPiA+Cj4g
PiBTbyB0aGVyZSBhcmUgMTk5MCAtIDE5ODIgLSA0ID0gNCBQRUJzIHJlc2VydmVkIGZvciBiYWQg
UEVCIGhhbmRsaW5nLAo+ID4gd2hpY2ggaXMgbGVzcyB0aGFuIDQwLgo+ID4KPiA+IFdoZW4gd2Ug
c2V0ICB2b2xfc2l6ZT0yMzVNaUIsIHRoZSBjb3VudCBvZiB1c2VyIHZvbHVtZSBQRUJzIGlzOiAo
MjM1ICoKPiA+IDEwMjQgKiAxMDI0ICsgMTI0ICogMTAyNCAtIDEpIC8gKDEyNCAqIDEwMjQpID0g
MTk0MQo+ID4gMTk5MCAtIDQgLSA0MCA9IDE5NDYsIGZpbmFsbHkgbWF5YmUgdGhlcmUgaXMgbWVz
c2FnZSBmcm9tIGtlcm5lbCBsaWtlCj4gPiAiKCJ1Ymlfcm9vdGZzIikgcmUtc2l6ZWQgZnJvbSAx
OTQxIHRvIDE5NDYgTEVCcyIuCj4KPiBBY3V0YWxseSwgdGhlICd2b2xfc2l6ZScgaW4gdWJpbml6
ZS5jZmcgbWVhbnMgdGhlIHNpemUgb2YgZGF0YSBvbgo+IHZvbHVtZShleGNsdWRlIHZpZC9lYyks
IG5vdCB0aGUgc2l6ZSBvZiB2b2x1bWUoaW5jbHVkZSB2aWQvZWMpLgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
