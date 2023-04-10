Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539F5C76196
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Apr 2023 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWRL5RUnx9e4h4cV81hSjdNexz1gnJnRhJnqbtXcn7k=; b=dbQyACzPjWboFV
	gMDc07f7ygi9/n6OfR42J0n0o3ZTh2mmoW0nqmbh7RFifv+KNawRcRnCkBHJE0kIrXWvYAsKcg+LR
	LPAFLbFp4Quw4UOJlMzA5hTVQHKb2aF27nACmWAdQQk2tN5/GRFxsZlP2DdwM/ESnz9Lw+5FFiS2G
	dcUy+qr2Axzz2vcEESBGBTu+MTN6r/Z7Txtc1t5nuFBj4aU3caVJ4PNlQ1BIR8dZlA50usueyfCX3
	2T6iU6/d6Vjiawc0BWD+YE4TRH3sOI5rm+WvuoGbt8yW7KwzHZdvlhtX31J+8pPj66Qh41tffmmd4
	mVAd8C2sZr7cfWoNjT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plnmB-00EsOQ-23;
	Mon, 10 Apr 2023 09:25:27 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plnm7-00EsNd-0j;
	Mon, 10 Apr 2023 09:25:24 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54ef6ca60ceso76971867b3.3;
        Mon, 10 Apr 2023 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681118720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfFwcjvB6U/5N6JNSZwLTOh0Jzr0gq70ZwwmKsIUDA8=;
        b=Sl/xTMYuMsetnbe39ltmQMpf8n7qw/r3oO/f3KXBTCoLhTgaFl69aISqq7rPRzI0Nu
         UvBtCH2TlQGH289w0bApMbLO+9BbD363eyyyS92j52Pdmlb4AronrrfpOWKE1VPsjz1o
         Na4Az8UuFqpbObFfKKTVwIs6nq/vrmnhRDZAWBkglj2/wGLOfL17axtnpkBMkDk5fg+a
         KL0H/ZulTkulrbtHgLLg+IWDAzMDLrGM1xYwGLsPNUsLel8/ZALHNzGKZaNJun9AGgkh
         E6GMvdwIlSmd9RWrR3GzHCl8+rBTIklhGvA8CgAHWePY/aargEplTwNwpYdwAKXBwS2/
         k1tQ==
X-Gm-Message-State: AAQBX9eqCJHHCItrjyDn0sHRV6sBXHefY7xwhKaN6o9ifvSvhJ722JbS
	U+/vOeck0QIq1FEyBuAQtUTndcnKDLwAxA==
X-Google-Smtp-Source: AKy350YDQ8L6c63VW1BpMsqZgAR5w3PQfMlPUbx0QhWN1hTCxdJOmj7o8cC3oGO/pCIzycE6DpgHKQ==
X-Received: by 2002:a81:4f4d:0:b0:54c:eb8:5a5b with SMTP id d74-20020a814f4d000000b0054c0eb85a5bmr4547698ywb.13.1681118719889;
        Mon, 10 Apr 2023 02:25:19 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id n127-20020a25d685000000b00b8ec81d8d90sm1895050ybg.37.2023.04.10.02.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 02:25:19 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id h198so10468951ybg.12;
        Mon, 10 Apr 2023 02:25:19 -0700 (PDT)
X-Received: by 2002:a25:7182:0:b0:b8c:ad5:6b4e with SMTP id
 m124-20020a257182000000b00b8c0ad56b4emr6546708ybc.12.1681118718954; Mon, 10
 Apr 2023 02:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
 <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com> <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org>
In-Reply-To: <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Apr 2023 11:25:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
Message-ID: <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_022523_262564_AE8F206F 
X-CRM114-Status: GOOD (  39.10  )
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

SGkgVHVkb3IsCgpPbiBGcmksIEFwciA3LCAyMDIzIGF0IDk6MTbigK9BTSBUdWRvciBBbWJhcnVz
IDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIDQvMy8yMyAxNzoyOSwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNDowMeKA
r1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4+
IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDc6NTfigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+Pj4gT24gTW9uLCBNYXIgMjAsIDIwMjMgYXQg
NjowNOKAr1BNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPj4+PiBWaWduZXNoIHVzZWQgdG8gcmV2aWV3IENGSSBjb2RlLCBtYXliZSBoZSBjYW4gaW50
ZXJ2ZW5lLiBJJ3ZlIG5ldmVyCj4gPj4+PiB3b3JrZWQgd2l0aCBDRkksIGJ1dCBJIGNhbiB0cnkg
dG8gaGVscC4gSSdsbCBuZWVkIG1vcmUgZGVidWcgZGF0YSB0aG91Z2guCj4gPj4+Pgo+ID4+Pj4g
T24gMy8yMC8yMyAxNjo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4+Pj4+IEFkZCBh
IGRldmljZSBub2RlIGZvciB0aGUgU3BhbnNpb24gUzI5R0w1MTJOIE5PUiBGTEFTSCBvbiB0aGUg
TWFyemVuCj4gPj4+Pj4gZGV2ZWxvcG1lbnQgYm9hcmQuCj4gPj4+Pj4KPiA+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4+
Pj4+IC0tLQo+ID4+Pj4+IEFsdGhvdWdoIHRoZSBTMjlHTDUxMk4gaXMgYSBDRkkgRkxBU0gsIHVz
aW5nICJjZmktZmxhc2giIGluc3RlYWQgb2YKPiA+Pj4+PiAibXRkLXJvbSIgZG9lcyBub3Qgd29y
azoKPiA+Pj4+PiAgIDEuIFByb2JpbmcgZmFpbHMgd2l0aCAicGh5c21hcC1mbGFzaCAwLmZsYXNo
OiBtYXBfcHJvYmUgZmFpbGVkIiwKPiA+Pj4+Cj4gPj4+PiBJIHdvdWxkIGZpcnN0IHRyeSB0byB1
bmRlcnN0YW5kIHdoeSB0aGUgcHJvYmUgZmFpbHMuCj4gPgo+ID4+IEkgc3VkZGVubHkgcmVtZW1i
ZXJlZCBJIGhhdmUgYSBkaWZmZXJlbnQgYm9hcmQgKEFQRTYtRVZNKSwgd2hlcmUKPiA+PiB0aGUg
Q0ZJLUZMQVNIIHN0b3BwZWQgd29ya2luZyBhZnRlciBhZGRpbmcgc3VwcG9ydCBmb3Igc2Vjb25k
YXJ5Cj4gPj4gQ1BVcy4gSSBhbHdheXMgdGhvdWdodCB0aGF0IHdhcyBhIGhhcmR3YXJlIHF1aXJr
Li4uCj4gPj4KPiA+PiBUdXJucyBvdXQgdGhlIENGSS1GTEFTSCBvbiBNYXJ6ZW4gKHF1YWQgQ29y
dGV4LUE5KSBpcyBkZXRlY3RlZCB3aGVuCj4gPj4gYm9vdGluZyB3aXRoICJub3NtcCI6Cj4gPgo+
ID4+IE15IGZpcnN0IGd1ZXNzIHdhcyB0aGF0IHRoZSBwcm9iaW5nIHByb2Nlc3MgaXMgbWlncmF0
ZWQgdG8gYSBkaWZmZXJlbnQKPiA+PiBDUFUgY29yZSBkdXJpbmcgcHJvYmluZywgYnV0IHByaW50
aW5nIHNtcF9wcm9jZXNzb3JfaWQoKSBkaWRuJ3QKPiA+PiBjb25maXJtIHRoYXQ7IGl0J3MganVz
dCBydW5uaW5nIG9uIGEgZGlmZmVyZW50IENQVSBjb3JlIHRoYW4gQ1BVMC4KPiA+PiBXcmFwcGlu
ZyB0aGUgYm9keSBvZiBjZmlfcXJ5X21vZGVfb24oKSBpbnNpZGUgYSBnZXRfY3B1KCkvcHV0X2Nw
dSgpCj4gPj4gcGFpciB0byBwcmV2ZW50IG1pZ3JhdGlvbiBhbHNvIGRpZG4ndCBmaXggaXQuCj4g
Pj4KPiA+PiBJcyBDRkktRkxBU0gga25vd24tYnJva2VuIG9uIFNNUD8KPiA+Cj4gPiBBZnRlciBh
Y3RpdmVseSBsb29raW5nIGZvciBtb3JlIGJvYXJkcyB3aXRoIENGSSBGTEFTSGVzLCBhbmQgZmlu
ZGluZyBvbmUKPiA+IG1vcmUgYm9hcmQgd2hlcmUgRkxBU0ggcHJvYmluZyBmYWlscyBvbiBTTVAs
IEkgZHVnIGRlZXBlci4KPiA+IFR1cm5zIG91dCB0aGV5IGFsbCBoYXZlIGluIGNvbW1vbiB0aGF0
IChhKSB0aGUgQ0ZJIEZMQVNIIGlzIGxvY2F0ZWQgYXQKPiA+IHBoeXNpY2FsIGFkZHJlc3MgemVy
bywgYW5kIChiKSB0aGUgc2Vjb25kYXJ5IENQVSBicmluZ3VwIGNvZGUgcmVsaWVzCj4gPiBvbiBt
YXBwaW5nIChieSBzcGVjaWFsIGhhcmR3YXJlKSB0aGUgcmVnaW9uIGF0IGFkZHJlc3MgemVybyB0
byB0aGUKPiA+IENQVSBib290IGNvZGUuLi4KPiA+Cj4gPiBIZW5jZSBmaXhpbmcgdGhpcyBpbnZv
bHZlcyBtYWtpbmcgc3VyZSB0aGF0IGFjY2Vzc2luZyBGTEFTSCBhbmQgYnJpbmdpbmcKPiA+IENQ
VSBjb3JlcyBvbmxpbmUgZG8gbm90IGhhcHBlbiBjb25jdXJyZW50bHkuLi4KPgo+IFdvdWxkIGRl
ZmVycmluZyBwcm9iZSBmb3IgQ0ZJIHdvcms/CgpQcm9iZSBkZWZlcnJhbCBvZiBDRkkgRkxBU0gg
d291bGQgbm90IGhlbHAsIGFzIHRoZSBGTEFTSCBpcyBhbHJlYWR5CnByb2JlZCBhZnRlciBzZWNv
bmRhcnkgQ1BVIHN0YXJ0dXAuCgpTZXF1ZW5jZSBvZiBvcGVyYXRpb25zIGlzOgogIDEuIE1hcCBm
aXJzdCBwYWdlKHMpIG9mIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgdG8gUkFNIGNvbnRhaW5pbmcK
ICAgICBDUFUgc3RhcnR1cCBjb2RlIChub3QgdXNpbmcgdGhlIE1NVSwgYnV0IHVzaW5nIGEgc3Bl
Y2lhbAogICAgIHJlZ2lzdGVyIGluIHRoZSBTb0MpLAogIDIuIEJvb3Qgc2Vjb25kYXJ5IENQVSBj
b3JlcywKICAzLiBQcm9iZSBDRkktRkxBU0g6IGZhaWxzLCBhcyBhY2Nlc3NlcyB0byB0aGUgZmly
c3QgcGFnZShzKSBvZgogICAgIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgZG8gbm90IGFkZHJlc3Mg
dGhlIEZMQVNILCBidXQgdGhlIENQVQogICAgIHN0YXJ0dXAgY29kZSBpbiBSQU0uCiAgNC4gQWZ0
ZXIgYm9vdCwgQ1BVIGNvcmVzIGNhbiBiZSBvZmZsaW5lZCBhbmQgb25saW5lZCB1c2luZyBDUFUK
ICAgICAgaG90cGx1ZyB0aHJvdWdoIHN5c2ZzLgoKV2hlbiB1c2luZyAibXRkLXJvbSIgaW5zdGVh
ZCBvZiAiY2ZpLWZsYXNoIiwgdGhlIHN5c3RlbSBib290cyBmaW5lLApidXQgdGhlIGZpcnN0IHBh
Z2Ugb2YgL2Rldi9tdGQwIGRvZXMgbm90IGNvbnRhaW4gdGhlIEZMQVNIIGNvbnRlbnRzLApidXQg
dGhlIENQVSBzdGFydHVwIGNvZGUsIHdoaWNoIEkgaGFkbid0IG5vdGljZWQgb3JpZ2luYWxseS4u
LgoKRGlzYWJsaW5nIHRoZSBzcGVjaWFsIG1hcHBpbmcgZm9yIHRoZSBDUFUgc3RhcnR1cCBjb2Rl
IGFmdGVyIGFsbCBjb3JlcwpoYXZlIGJlZW4gYnJvdWdodCB1cCAoaW4gYmV0d2VlbiBzdGVwcyAy
IGFuZCAzKSBmaXhlcyB0aGUgQ0ZJLUZMQVNILgpIb3dldmVyLCBpZiBhIENQVSBjb3JlIGlzIG9m
ZmxpbmVkIGFuZCBvbmxpbmVkIGF0IHJ1bi10aW1lLCB0aGUgc3BlY2lhbAptYXBwaW5nIGhhcyB0
byBiZSByZWluc3RhbnRpYXRlZCB0ZW1wb3JhcmlseSBhZ2FpbiwgdGh1cyBhbnkgRkxBU0gKYWNj
ZXNzZXMgKGJ5IG90aGVyIENQVXMpIG11c3QgYmUgcHJldmVudGVkIHRlbXBvcmFyaWx5LCB0b28u
CgpUaGlzIGlzc3VlIGlzIHByZXNlbnQgb24gYWxsIFJlbmVzYXMgU0gvUi1Nb2JpbGUgYW5kIFIt
Q2FyIFNvQ3MKdGhhdCBzdXBwb3J0IFNNUC4gSSBhbSB3b25kZXJpbmcgaWYgdGhlcmUgYXJlIGFu
eSBvdGhlciBTTVAgU29DUyB0aGF0CnN1ZmZlciBmcm9tIHNpbWlsYXIgaXNzdWVzLCBhbmQgdGhh
dCBoYXZlIHNvbHZlZCB0aGVtPyBJIGNvdWxkbid0IGZpbmQKYW55IGluLXRyZWUgRFRTIGZvciBh
IGJvYXJkIHdpdGggQ0ZJLUZMQVNIIG9yIG10ZC1yb20gYXQgYWRkcmVzcyB6ZXJvCnVzaW5nIGFu
IFNNUCBBUk0gU29DLi4uCgpJIGd1ZXNzIHRoZSBzaW1wbGVzdCAic29sdXRpb24iIGlzIHRvIGRp
c2FibGUgaW4gRFQgYW55IGRldmljZSBhdCBhZGRyZXNzIHplcm8Kd2hlbiBTTVAgaXMgdXNlZCAo
d2hlbiBzdGVwIDEgaXMgZXhlY3V0ZWQpLi4uCgpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMgYW5k
IHN1Z2dlc3Rpb25zIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
