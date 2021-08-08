Return-Path: <SRS0=c9LV=M7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F319C4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Aug 2021 06:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6AC760F4B
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Aug 2021 06:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6AC760F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQH5Wvql/plsK+vdDobrm8FfiJwiYhiVcud+FsJ+dgM=; b=4DrwLPuu2N/KKx
	ofAJQTzUxRPXkwQK7O5YltjPxUlQaSJiRy+JKonDnuNbtsswiPUyV2zQq/aWmtUyiEqZEuGAftHGF
	zOgnjMu8dTq3HW1qZBnZ5zM/07CzRdkaiWjZToWnsKPyzOdDAcB8psM6EX4F5BIQCVex1Nw2me/V/
	RDzKOXImyzeO0jIoDLf4Ck93ZfDeFv2fQUOCQuEKDfY8yqUtzcJ8wXU6OfDOSvI0U7d4OtaLedRwv
	wjQ+2X5tl3FGeI+HH8oKYoIg9SrngtN86hS3qQgTbq737ZQa8FhwR5NMbY/cQWwEP1MJyHJF4Xevd
	0oK92/xm5Jk9jTsUct0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCcZG-00FaZO-0s; Sun, 08 Aug 2021 06:45:54 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCcZD-00FaZ3-1V
 for linux-mtd@lists.infradead.org; Sun, 08 Aug 2021 06:45:52 +0000
Received: by mail-qv1-xf29.google.com with SMTP id x12so7364252qvo.12
 for <linux-mtd@lists.infradead.org>; Sat, 07 Aug 2021 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tTr7bym8tUrpPCFwduAaM979B5G/RgeBTkS/tlZUYrQ=;
 b=UyNkXQUQbMTasRGQCxSCdaQh7zIytVMM5l4RO4u+6fP9K3A+Y3s1FY0aOPhr/Xk0HL
 6jmkiOnSO8LreNFeRfuh17Xc8sgotFMS+Nn18K6iQHZacWNrTv+87nhNxujTgW78rTbI
 QWMa4qr6AN3StATPs1BW/ocjbMiddPFnAUAnHJISuFWlRbAt+ANft8fRHkRtM8619XE5
 copfnMRlG86eFUTryLnLP/xf4aRVqz+feJ7Tfe5AdiKGD5z96TXgSl/AAgZybcXrKSTM
 O9t+6a0G3QgoK2n3TtlwQYEanWHOIolZMPgcKTm1FH06kq1aAnGJiXalZfC7829P2GLK
 Kx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tTr7bym8tUrpPCFwduAaM979B5G/RgeBTkS/tlZUYrQ=;
 b=IlXIuZtyNOxHO6uEqxCbKSNEQiKbGG0aZsrF0OHuoJTqpxmppCX/a67Pt4opogs3w8
 lzaCHGpJZwiz941EkmDGwH5kwKIEapT/wMI4BfDQ5I+TNgOpX/YRWKGjqDGWYCERr9qF
 jfqweYgxH09pzsn1+NEjJKRamza2AljHUU2/9Px9T0JTUzSLn8qsEjYXVyvJL1SMw/fj
 AhKRgOcrMRwLd2aafOFi/hZ0fs8b5ojiEn6zz7SnuzbIM9crrp808b7WhfnKca6jHoeX
 v7wKcmmPDSkW5WH58Ef/hsa8xbgToI79s8FmHJ9CDtp27e/0RCqvmvGVJq/4hkqevaZz
 sJAA==
X-Gm-Message-State: AOAM5302EWl+s+C0/neTrPad0jDEXhcdr9iX2kiBmYnj/2JZw3ey+EdW
 FbnVyRGvrfkPbedQNvor8KZXb108LBv9/PFFgnE=
X-Google-Smtp-Source: ABdhPJzgC9AzpSlrwHQDqaq4seYKiFp5V+Jcw4MbumfjR9I99XshG67RT3pWb1yXTNysO9sh9MQbwc9ZgqBQvGDBouw=
X-Received: by 2002:ad4:44aa:: with SMTP id n10mr18513329qvt.18.1628405149339; 
 Sat, 07 Aug 2021 23:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210803143256.GA5209@ubuntu> <20210806185658.5b4772a7@xps13>
In-Reply-To: <20210806185658.5b4772a7@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Sun, 8 Aug 2021 08:45:38 +0200
Message-ID: <CAE9cyGQwQKp83y0cBoH1akRyHo9ipgBHaeWMjtCLVP77vRir=g@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: xway: No hardcoded ECC engine for Micron
 Chips
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Kestrel <kestrelseventyfour@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_234551_151854_406DBE7F 
X-CRM114-Status: GOOD (  34.87  )
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

QW0gRnIuLCA2LiBBdWcuIDIwMjEgdW0gMTg6NTcgVWhyIHNjaHJpZWIgTWlxdWVsIFJheW5hbAo8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4KPiBIaSBEYW5pZWwsCj4KPiBEYW5pZWwgS2Vz
dHJlbCA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNvbT4gd3JvdGUgb24gVHVlLCAzIEF1ZyAy
MDIxCj4gMTY6MzI6NTYgKzAyMDA6Cj4KPiA+IFNvbWUgbGFudGlxIHh3YXkgZGV2aWNlcyB1c2Ug
TWljcm9uIE5BTkQgY2hpcHMsIHdoaWNoIHVzZSBvbi1kaWUgRUNDLgo+ID4gVGhlIGhhcmRjb2Rl
ZCBzZXR0aW5nIG9mIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgbWFrZXMgdGhlbSB1bnVzYWJs
ZSwKPiA+IGJlY2F1c2UgdGhlIHNvZnR3YXJlIEVDQyBvbiB0b3Agb2YgdGhlIGhhcmR3YXJlIEVD
QyBwcm9kdWNlcyBlcnJvcnMgZm9yCj4gPiBldmVyeSByZWFkIGFuZCB3cml0ZSBhY2Nlc3MsIG5v
dCB0byBtZW50aW9uIHRoYXQgYm9vdGluZyBkb2VzIG5vdCB3b3JrLAo+ID4gYmVjYXVzZSB0aGUg
Ym9vdCBsb2FkZXIgdXNlcyB0aGUgY29ycmVjdCBFQ0Mgd2hlbiB0cnlpbmcgdG8gbG9hZCB0aGUK
PiA+IGtlcm5lbCBhbmQgc3RvcHMgbG9hZGluZyBvbiBzZXZlcmUgRUNDIGVycm9ycy4KPiA+IFJl
bW92aW5nIHRoZSBoYXJkY29kZWQgc2V0dGluZ3Mgd291bGQgYnJlYWsgYSBudW1iZXIgb2YgZGV2
aWNlcyB0aGF0Cj4gPiB3b3JrIHdpdGggdGhvc2Ugc2V0dGluZ3MuCj4gPiBBZGRpbmcgYSBEVEIg
cHJvcGVydHkgd2FzIGNvbnNpZGVyZWQsIGJ1dCBkaWQgbm90IHdvcmssIGJlY2F1c2UgZGV2aWNl
cwo+ID4gb2YgdGhlIHNhbWUgdHlwZSBidXQgZnJvbSBkaWZmZXJlbnQgbWFudWZhY3R1cmUgZGF0
ZXMgaGF2ZSBkaWZmZXJlbnQKPiA+IE5BTkQgY2hpcHMgYW5kIGFzIHN1Y2ggaXQgaXMgbm90IHBv
c3NpYmxlIHRvIGRldGVybWluZSB0aGUgTkFORCBjaGlwCj4gPiBpbiBhZHZhbmNlIG9yIGRldmlj
ZSBzcGVjaWZpYy4KPgo+IEkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSBhbmQgaXQgaXMgYSB2ZXJ5
IGNyYXBweSBzaXR1YXRpb24uCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2VzdHJl
bCA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3h3YXlfbmFuZC5jIHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5j
Cj4gPiBpbmRleCAyNjc1MTk3NmU1MDIuLjIwY2I1Y2UyZjNiMCAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy94d2F5X25hbmQuYwo+ID4gQEAgLTEwLDYgKzEwLDcgQEAKPiA+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfcGxhdGZvcm0uaD4KPiA+Cj4gPiAgI2luY2x1ZGUgPGxhbnRpcV9zb2MuaD4KPiA+ICsj
aW5jbHVkZSAiaW50ZXJuYWxzLmgiCj4gPgo+ID4gIC8qIG5hbmQgcmVnaXN0ZXJzICovCj4gPiAg
I2RlZmluZSBFQlVfQUREU0VMMSAgICAgICAgICAweDI0Cj4gPiBAQCAtMTQ4LDcgKzE0OSw4IEBA
IHN0YXRpYyB2b2lkIHh3YXlfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0
IHVfY2hhciAqYnVmLCBpbnQgbGVuKQo+ID4KPiA+ICBzdGF0aWMgaW50IHh3YXlfYXR0YWNoX2No
aXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ICB7Cj4gPiAtICAgICBjaGlwLT5lY2MuZW5n
aW5lX3R5cGUgPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUOwo+ID4gKyAgICAgaWYgKGNoaXAt
Pm1hbnVmYWN0dXJlci5kZXNjLT5pZCAhPSBOQU5EX01GUl9NSUNST04pCj4gPiArICAgICAgICAg
ICAgIGNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7Cj4K
PiBDb3VsZCB3ZSBtYWtlIHRoaXMgYSBsaXR0bGUgYml0IGNsZXZlciB3aXRoIHNvbWV0aGluZyBs
aWtlIHRoaXM6Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTMtcmM3L3Nv
dXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jI0w0MzQKPgo+IFRoaXMgaXMg
ZmFyIGZyb20gaWRlYWwsIHRoZXJlIHNob3VsZCBkZWZpbml0ZWx5IGJlIGEgY2hhbmdlIGluIHRo
ZSBEVC4KPiBCdXQgZ2l2ZW4geW91ciBpbml0aWFsIGNvbW1lbnRzIEkgZ3Vlc3MgaXQgaXMgbm90
IHBvc3NpYmxlLgo+Cj4gQW55d2F5IEkgZG9uJ3QgZmluZCBhIGJldHRlciB3YXkgYXMsIGR1cmlu
ZyB0aGUgYXR0YWNoKCkgY2FsbCwgd2UgZG9uJ3QKPiB5ZXQgcmFuIHRoZSBtYW51ZmFjdHVyZXIg
Y29kZSwgaGVuY2Ugd2UgZG9uJ3Qga25vdyBpZiBvbi1kaWUgRUNDIGlzCj4gYWN0dWFsbHkgYXZh
aWxhYmxlIG9yIG5vdC4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpIaSBNaXF1w6hsLAoKSSBoYXZl
IHdvcmtlZCB3aXRoIGFuIG90aGVyIG93bmVyIG9mIGxhbnRpcSBoYXJkd2FyZSBhbmQgaGUgaGFz
IHN1Y2Nlc3NmdWxseQp0ZXN0ZWQgYWRkaW5nIG5hbmQtZWNjLW1vZGUgPSAic29mdCIgaW4gdGhl
IGRldmljZSB0cmVlIGFuZCByZW1vdmluZyB0aGUgb25lCmxpbmUgb2YgY29kZSB0aGF0IHNldHMg
dGhlIGVuZ2luZSB0eXBlIHRvIHNvZnQuCkkgd2lsbCBzZW5kIGFub3RoZXIgcGF0Y2ggdmVyc2lv
biB0aGF0IGp1c3QgcmVtb3ZlcyB0aGlzIGxpbmUgb2YgY29kZS4KVGhpcyBjaGFuZ2UKaXMgcmVx
dWlyZWQgZm9yIGtlcm5lbCA1LjQgYXMgd2VsbCwgYnV0IHRoZSBzZXR0aW5nIGlzIGluIHRoZSB4
d2F5X25hbmRfcHJvYmUKbWV0aG9kIGF0IGxpbmUgMjM3LgoKVGhhbmtzLCBEYW5pZWwuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
