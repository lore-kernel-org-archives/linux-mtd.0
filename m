Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B813C54753
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K78r9ywmrPSleMt2vy75AQLUlU4aW6npcZ8ok58jw8w=; b=yKTkZZXD4kKThN
	27vRMn8f2i41xhglyZ3/46+xi9grS1ft2iZg82fPW7TKHohyeM/WdUtJuOTw3sxdfKBrtHS4DQNNi
	EBXjzQgSaHW21ESjMRuKq21u1dnF2iFAdrg+i344/re52il1WUXYOQjDBwbDFM57nU/9NoguzDigC
	IDX8arQguiuedhNLtTv0uG+jmQZqZoLNN+xyezU/IsLLbYvHBxUQP2KhosbYV6NkJ8VVgvBmZjcGA
	Kx2iCpDp1qfV79AbQ/w0oYN6unJToWh4X5pQonJHF8/fZGuAcVfSC217xCbwR5ykJPp1VDj1gquAa
	02m94luomZ0K9QHQrCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEai-0000000EdPg-2R4L;
	Wed, 28 Aug 2024 09:03:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEaf-0000000EdOy-1TP8
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 09:03:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2d1daa2577bso4993035a91.2
        for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2024 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724835824; x=1725440624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i94WsKk6MedQ8JayPsW/OLsnb+/nfJjq4thy0b3EO/E=;
        b=cxgJrqOT3YeggMdbznh4f66Wxv4BPn+DbJOeDGnsCyhW+7MT4y3ZpWz59Gcuf5QbEu
         dHNrMtB0KXe2Sf8Cr5EwadPl+o3ZkStttbvAgJpKulJF0XeKEL0tTYovmpIJGBNMTyX6
         gCnV3rKvtSnmpRWE+iyt7MYFkrLEQm7akieq50oW1EwebN/YVYPoYhlQIz7XBgOQ/e23
         UDezcBUa52xtQTS3M6kFJvW0MZawqyh/8XLYvE9ym9YqABfgFKkVWTWhvtcsPKoYIgbT
         8zfQhuIPZ8tqmo2RkYih9U+klpbUAci1Bip/1xWOAAkGmvwcCtZbdu6kv9S27Xhti5EO
         HqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724835824; x=1725440624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i94WsKk6MedQ8JayPsW/OLsnb+/nfJjq4thy0b3EO/E=;
        b=Boc2Sr28BZyIcaSycjDGF8jLMu9eWAiMbTzQVnx5vsPwrspr9Uqu4/waYJ1ISPl4Sl
         +0bxCoPgxLZQ+xMe60u1Uyy2HOOr/Lpw1dsWwF1eoPEwkY7qZQN9/RoLQCx2e5cFTuLC
         MWdAdnBYmVTV0GosAeZ9NdhQp1XorqRHifIkMgdhR4h+6DiYC2amdC9emXkZhuqMGjaY
         QRuEpGnB5xbmcBe6EQUNqjwT93IaZuIHg1VKovLWkEzz9uJxm9FGTx6ND2lJHHVkcp24
         XLbYjbgM2W87UVuCF5QJYjGGCQHR0qQflpeqrJqSsi76UI4X+zfLLrT6TAle8xIG32gw
         wiWg==
X-Forwarded-Encrypted: i=1; AJvYcCWNCBU2/cCDHS6ZZqQMNqFHYf0XJpexUhWGJqfMRLWiJ6dmEIXXdbq5QDIqQ/yWPEXPf7jBdXSxt+U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrIbRrzYkMuaYF0eGnZ/JX5IGdBHKQwBZ7kn6lRfM4RPCFcV6N
	0qNASi7XxIqA9OsZ6qvnCFELwa9ymkPotOxg0gqeySy67G7lC8dYx3hkX6PeVuJSHobqZUxl6AD
	55V5wycCG9mr+QVebQEj8S/jvWpI=
X-Google-Smtp-Source: AGHT+IG8iEu6p8uDrVQT0s7Hud8PluofYnn0fsVVn49eDz7N1cecDbzVmTiH8gkamvBhZlH41DmEqh+wfO3QLKofAtM=
X-Received: by 2002:a17:90a:c696:b0:2d3:9137:2375 with SMTP id
 98e67ed59e1d1-2d646bcd374mr16789705a91.4.1724835824188; Wed, 28 Aug 2024
 02:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240828062131.1491580-1-linchengming884@gmail.com>
 <20240828062131.1491580-2-linchengming884@gmail.com> <20240828094728.583dc7c5@xps-13>
In-Reply-To: <20240828094728.583dc7c5@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 28 Aug 2024 17:01:41 +0800
Message-ID: <CAAyq3SbLATwXbDN6icx44cm8-PX+DrUvq2xiYor7bLn4wmfVrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] mtd: spinand: Add flags for the Plane Select bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_020345_416232_BF69F81E 
X-CRM114-Status: GOOD (  28.48  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQ45pyIMjjml6Ug6YCx5LiJIOS4i+WNiDM6NDflr6vpgZPvvJoKPgo+IEhpIENoZW5n
LAo+Cj4gbGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDI4IEF1ZyAyMDI0
IDE0OjIxOjMxICswODAwOgo+Cj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGlu
QG14aWMuY29tLnR3Pgo+ID4KPiA+IEFkZCBzdXBwb3J0IGZvciBNYWNyb25peCBzZXJpYWwgTkFO
RCBmbGFzaCB3aXRoIGEgdHdvLXBsYW5lIHN0cnVjdHVyZS4KPiA+Cj4gPiBBZGQgdGhlIFNQSU5B
TkRfSEFTX1BQX1BMQU5FX1NFTEVDVF9CSVQgZmxhZyBmb3Igc2VyaWFsIE5BTkQgZmxhc2gKPiA+
IHRoYXQgcmVxdWlyZSBpbnNlcnRpbmcgdGhlIFBsYW5lIFNlbGVjdCBiaXQgaW50byB0aGUgY29s
dW1uIGFkZHJlc3MKPiA+IGR1cmluZyB0aGUgd3JpdGVfdG9fY2FjaGUgb3BlcmF0aW9uLgo+ID4K
PiA+IEFkZCB0aGUgU1BJTkFORF9IQVNfUkVBRF9QTEFORV9TRUxFQ1RfQklUIGZsYWcgZm9yIHNl
cmlhbCBOQU5EIGZsYXNoCj4gPiB0aGF0IHJlcXVpcmUgaW5zZXJ0aW5nIHRoZSBQbGFuZSBTZWxl
Y3QgYml0IGludG8gdGhlIGNvbHVtbiBhZGRyZXNzCj4gPiBkdXJpbmcgdGhlIHJlYWRfZnJvbV9j
YWNoZSBvcGVyYXRpb24uCj4gPgo+ID4gTWFjcm9uaXggc2VyaWFsIE5BTkQgZmxhc2ggd2l0aCBh
IHR3by1wbGFuZSBzdHJ1Y3R1cmUgcmVxdWlyZXMgaW5zZXJ0aW9uCj4gPiBvZiB0aGUgUGxhbmUg
U2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcyBkdXJpbmcgdGhlIHdyaXRlX3RvX2Nh
Y2hlCj4gPiBvcGVyYXRpb24uCj4gPgo+ID4gQWRkaXRpb25hbGx5LCBmb3IgTVgzNXtVLEZ9Mkcx
NEFDIGFuZCBNWDM1TEYyR0U0QUIsIGluc2VydGlvbiBvZiB0aGUKPiA+IFBsYW5lIFNlbGVjdCBi
aXQgaW50byB0aGUgY29sdW1uIGFkZHJlc3MgaXMgcmVxdWlyZWQgZHVyaW5nIHRoZQo+ID4gcmVh
ZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5n
IExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jICAgICB8ICA2ICsrKysrKwo+ID4gIGRyaXZlcnMvbXRkL25hbmQvc3Bp
L21hY3Jvbml4LmMgfCAxNyArKysrKysrKysrLS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvbXRk
L3NwaW5hbmQuaCAgICAgfCAgMiArKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPiBpbmRleCBlMGI2
NzE1ZTVkZmUuLjQ5ZjJkNjZjM2E5YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPiBAQCAt
Mzg2LDYgKzM4Niw5IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9yZWFkX2Zyb21fY2FjaGVfb3Aoc3Ry
dWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4gICAgICAgZWxzZQo+ID4gICAgICAgICAg
ICAgICByZGVzYyA9IHNwaW5hbmQtPmRpcm1hcHNbcmVxLT5wb3MucGxhbmVdLnJkZXNjX2VjYzsK
PiA+Cj4gPiArICAgICBpZiAoc3BpbmFuZC0+ZmxhZ3MgJiBTUElOQU5EX0hBU19SRUFEX1BMQU5F
X1NFTEVDVF9CSVQpCj4gPiArICAgICAgICAgICAgIGNvbHVtbiB8PSByZXEtPnBvcy5wbGFuZSA8
PCBmbHMobmFuZGRldl9wYWdlX3NpemUobmFuZCkpOwo+ID4gKwo+ID4gICAgICAgd2hpbGUgKG5i
eXRlcykgewo+ID4gICAgICAgICAgICAgICByZXQgPSBzcGlfbWVtX2Rpcm1hcF9yZWFkKHJkZXNj
LCBjb2x1bW4sIG5ieXRlcywgYnVmKTsKPiA+ICAgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4g
PiBAQCAtNDYwLDYgKzQ2Myw5IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF93cml0ZV90b19jYWNoZV9v
cChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gPiAgICAgICBlbHNlCj4gPiAgICAg
ICAgICAgICAgIHdkZXNjID0gc3BpbmFuZC0+ZGlybWFwc1tyZXEtPnBvcy5wbGFuZV0ud2Rlc2Nf
ZWNjOwo+ID4KPiA+ICsgICAgIGlmIChzcGluYW5kLT5mbGFncyAmIFNQSU5BTkRfSEFTX1BQX1BM
QU5FX1NFTEVDVF9CSVQpCj4gPiArICAgICAgICAgICAgIGNvbHVtbiB8PSByZXEtPnBvcy5wbGFu
ZSA8PCBmbHMobmFuZGRldl9wYWdlX3NpemUobmFuZCkpOwo+Cj4gUGxlYXNlIHNlcGFyYXRlIHRo
ZSBjb3JlIGNoYW5nZXMgYW5kIHRoZSBtYWNyb25peCBjaGFuZ2VzLgo+IDEuIEFkZCBzdXBwb3J0
IGZvciB0aGUgZmxhZyBpbiB0aGUgY29yZSAoYW5kIHRoZSBpbmNsdWRlKQo+IDIuIFVzZSB0aGUg
ZmxhZyBpbiBNYWNyb25peCBkcml2ZXIuCj4KClN1cmUsIEkgd2lsbCBzZXBhcmF0ZSB0aGVtIGlu
IHRoZSBuZXh0IHZlcnNpb24uCgo+ID4gKwo+ID4gICAgICAgd2hpbGUgKG5ieXRlcykgewo+ID4g
ICAgICAgICAgICAgICByZXQgPSBzcGlfbWVtX2Rpcm1hcF93cml0ZSh3ZGVzYywgY29sdW1uLCBu
Ynl0ZXMsIGJ1Zik7Cj4gPiAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9tYWNyb25peC5jCj4gPiBpbmRleCAzZjllOWM1NzI4NTQuLmE1MzFjYzgxMjFmZiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMKPiA+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMKPiA+IEBAIC0xMTgsNyArMTE4LDggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gbWFjcm9uaXhfc3BpbmFuZF90YWJsZVtdID0gewo+
ID4gICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNo
ZV92YXJpYW50cywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJndyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiA+IC0gICAgICAgICAg
ICAgICAgICBTUElOQU5EX0hBU19RRV9CSVQsCj4gPiArICAgICAgICAgICAgICAgICAgU1BJTkFO
RF9IQVNfUUVfQklUIHwgU1BJTkFORF9IQVNfUFBfUExBTkVfU0VMRUNUX0JJVCB8Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfSEFTX1JFQURfUExBTkVfU0VMRUNUX0JJVCwKPgo+
IEFsaWdubWVudDogICAgICAgICAgIF4KPgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dDsg
SSdsbCB0YWtlIGNhcmUgb2YgaXQuCgo+Cj4KPiAuLi4KPgo+ID4gQEAgLTI2Myw3ICsyNjYsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxl
W10gPSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZy
ZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAo+ID4gLSAg
ICAgICAgICAgICAgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiA+ICsgICAgICAgICAgICAgICAg
ICBTUElOQU5EX0hBU19RRV9CSVQgfCBTUElOQU5EX0hBU19QUF9QTEFORV9TRUxFQ1RfQklULAo+
ID4gICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxh
eW91dCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXgzNWxmMWdlNGFi
X2VjY19nZXRfc3RhdHVzKSksCj4gPiAgICAgICBTUElOQU5EX0lORk8oIk1YMzVVRjJHMjRBRC1a
NEk4IiwKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggYi9pbmNs
dWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiA+IGluZGV4IDVjMTllYWQ2MDQ5OS4uY2VjNDUxZTdj
NzFjIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiA+IEBAIC0zMTIsNiArMzEyLDggQEAgc3Ry
dWN0IHNwaW5hbmRfZWNjX2luZm8gewo+ID4KPiA+ICAjZGVmaW5lIFNQSU5BTkRfSEFTX1FFX0JJ
VCAgICAgICAgICAgQklUKDApCj4gPiAgI2RlZmluZSBTUElOQU5EX0hBU19DUl9GRUFUX0JJVCAg
ICAgICAgICAgICAgQklUKDEpCj4gPiArI2RlZmluZSBTUElOQU5EX0hBU19QUF9QTEFORV9TRUxF
Q1RfQklUICAgICAgICAgICAgICBCSVQoMikKPiA+ICsjZGVmaW5lIFNQSU5BTkRfSEFTX1JFQURf
UExBTkVfU0VMRUNUX0JJVCAgICAgICAgICAgIEJJVCgzKQo+Cj4gRG8geW91IHRoaW5rIHdlIGNh
biBoYXZlIHRoZSBQUCBwbGFuZSBzZWxlY3QgYml0IHdpdGhvdXQgdGhlIHJlYWQgcGxhbmUKPiBz
ZWxlY3QgYml0PyBJJ2QgdXNlIGEgc2luZ2xlIGZsYWcgZm9yIG5vdy4KCk1hY3Jvbml4IHNlcmlh
bCBOQU5EIGZsYXNoIHdpdGggYSB0d28tcGxhbmUgc3RydWN0dXJlIGFsd2F5cyByZXF1aXJlcwp0
aGUgaW5zZXJ0aW9uIG9mIHRoZSBQbGFuZSBTZWxlY3QgYml0IGluIHRoZSB3cml0ZV90b19jYWNo
ZSBmdW5jdGlvbi4gSG93ZXZlciwKb25seSB0aGUgTVgzNXtVLEZ9MkcxNEFDIGFuZCBNWDM1TEYy
R0U0QUIgcmVxdWlyZSB0aGUgaW5zZXJ0aW9uIG9mIHRoZQpQbGFuZSBTZWxlY3QgYml0IGluIHRo
ZSByZWFkX2Zyb21fY2FjaGUgZnVuY3Rpb24uCgpIb3dldmVyLCBJIGhhdmUgb2JzZXJ2ZWQgdGhh
dCBmb3IgZmxhc2ggcmVxdWlyaW5nIHRoZSBpbnNlcnRpb24gb2YgdGhlClBsYW5lIFNlbGVjdApi
aXQgZHVyaW5nIHRoZSByZWFkX2Zyb21fY2FjaGUgb3BlcmF0aW9uLCB0aGUgRUNDIHN0cmVuZ3Ro
IGlzIDQuCgpDYW4gd2UgdXNlIHRoZSBFQ0Mgc3RyZW5ndGggaW4gY29uanVuY3Rpb24gd2l0aCB0
aGUKU1BJTkFORF9IQVNfUFBfUExBTkVfU0VMRUNUX0JJVCBmbGFnIHRvIGRldGVybWluZQp3aGV0
aGVyIHRoZSBQbGFuZSBTZWxlY3QgYml0IG5lZWRzIHRvIGJlIGluc2VydGVkIGR1cmluZyB0aGUK
cmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbj8KClRoaXMgbWV0aG9kIGNhbm5vdCBndWFyYW50ZWUg
dGhhdCBhIG5ldyBmbGFzaCB3aXRoYSB0d28tcGxhbmUKc3RydWN0dXJlIHJlcXVpcmluZyB0aGUg
aW5zZXJ0aW9uIG9mIHRoZSBQbGFuZSBTZWxlY3QgYml0IHdpbGwgaGF2ZQphbiBFQ0Mgc3RyZW5n
dGggb2YgNC4KCkJhc2VkIG9uIHRoZSBhYm92ZSBwb2ludHMsIEkgdGhpbmsgd2UgbmVlZCB0byB1
c2UgdHdvIHNlcGFyYXRlIGZsYWdzCnRvIGhhbmRsZSB0aGVzZSByZXF1aXJlbWVudHMgZWZmZWN0
aXZlbHkuCgo+Cj4gPgo+ID4gIC8qKgo+ID4gICAqIHN0cnVjdCBzcGluYW5kX29uZGllX2VjY19j
b25mIC0gcHJpdmF0ZSBTUEktTkFORCBvbi1kaWUgRUNDIGVuZ2luZSBzdHJ1Y3R1cmUKPgo+Cj4g
VGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcgTWluZyBMaW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
