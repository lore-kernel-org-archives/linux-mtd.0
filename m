Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38FFD49205
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjvAxZ7pfpor+5vNseit08BQYwdCW1zzVRvqREJ3wfs=; b=zI3nly0FCxU2pu
	wjOYj6ddCU7ANmrho3jek0c8UenmMM3dea02cA5Ku20g/1a35VzD4oo0ME3ntOjWuthU1XUQ2LusF
	9VL2NYqErzf0Bq44VNMBb8LZau7EdVs7WuUxOTWkJvMua1lw/ykumfMgDMkN/3EjbYpDCYnFqzAAl
	WY55EvcxE1T1N0kLWb34W3hJvSnQLvCoER/tYuV5YIUQbHz4x9RPKL8k58hpDKFpnLSwFuXZk1Xq6
	gMmCn4lwcZV1Q4rfFAYwUYDObs4ihM7V+2nm4DV+N4QV7hmhzPmXOFmms9Uc/rLFKEwKuQvFHT9mr
	AS/YDeAnhkL1zVTG/a4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyIk-00000008xDR-1ogF;
	Mon, 18 Nov 2024 09:44:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyIC-00000008xAA-1Npb
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 09:43:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20ce65c8e13so29170705ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2024 01:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731923015; x=1732527815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dABOS7MMpmaw7qL20FVWIcKO5UKZAQPhRyICIgyf8DE=;
        b=HvMGnOHdVOEHEF5LWynyb7IUCImPe+BYl+s6n/ft09jj10MFVZbq5JFdvr1Mv4HWNk
         mfZRTZwxqpbUcYg3Y/A7mP7SPfnVkFI05CovaknnNoIpTf/xIzTz+kaBhvtgqRICmDU7
         2asFPPltybH/N/hA9qk8pvNgPhEREtetSEqoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923015; x=1732527815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dABOS7MMpmaw7qL20FVWIcKO5UKZAQPhRyICIgyf8DE=;
        b=Oqn+231oLivrR/WFFV7eEzhiAhCK2eSfCLG1qoHrJkS53uFHZFof8MzHoih7FD8EZm
         LNw7/W2LNgtO4l8bmvF6CSjLHa19SudZ6dWJAAY8Y9i8lWr6Fz8ELj5LfQrpnLKC3LQA
         4DgOwKsrAm57JlqkmTpJtHdBwUbXXoHSQpGCSrVW8EGp+W4hXqEbTtUok3/tZILrh7fp
         5UDyj+DlcEPCI0GblyioZbJrQuptMZhyLvJ6L3/Qzfb5OdiVG/kk3KJ9KvTHULQ7uaZW
         qzUDJvR1EQyZDTw5HpWTQu+LqMZ4xvTweG+K/F9AAHVPhXbbAdBJ/8xwUhpFckmfAq6v
         sX+A==
X-Gm-Message-State: AOJu0Yy+gY3f6a/cO9DHmhFhHUSP16WM8hTKmsowb8o7IWchjwtoofme
	celN5wK7WILy+7Q4AMMpYwjg6E7umVHnqSdRPbuVXjaCe66y9uNqHie8YsfI5udwYuVwkaw7HRx
	1IkUrGgPJHcEV65fl8dt/HnaY8IVxZFLfNPOuMZ+a/YROGL1KL5I=
X-Google-Smtp-Source: AGHT+IF7Nqn749N1gB2t92ROwYzh38MyFgGEHPKWqWvu+MBfE6HAtHbS+1n4DMQHvmymC2dxe4YqHzPDUvJU5VOrIvs=
X-Received: by 2002:a05:6a20:2446:b0:1db:dfe4:daa4 with SMTP id
 adf61e73a8af0-1dc90afc698mr15733748637.9.1731923014912; Mon, 18 Nov 2024
 01:43:34 -0800 (PST)
MIME-Version: 1.0
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
 <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com> <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com>
 <8df70e11-3278-06ed-5952-c808035bb679@huawei.com>
In-Reply-To: <8df70e11-3278-06ed-5952-c808035bb679@huawei.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 18 Nov 2024 10:43:24 +0100
Message-ID: <CAOf5uwkhgDxUprK+fp09dWh1aXMNPJC7YPjFNChT2Qj86do4hQ@mail.gmail.com>
Subject: Re: Some information about direct-io support on ubifs
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_014336_395944_4CE45C1C 
X-CRM114-Status: GOOD (  32.76  )
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

SGkKCk9uIFRodSwgTm92IDE0LCAyMDI0IGF0IDM6MTDigK9QTSBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI0LzExLzExIDIzOjA4LCBNaWNo
YWVsIE5henphcmVubyBUcmltYXJjaGkg5YaZ6YGTOgo+ID4gSGkKPiA+Cj4gPiBPbiBNb24sIE5v
diAxMSwgMjAyNCBhdCAzOjE14oCvUE0gWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiDlnKggMjAyNC8xMS8xMSAxNzozNywgTWljaGFlbCBOYXp6
YXJlbm8gVHJpbWFyY2hpIOWGmemBkzoKPiA+Pj4gSGkgYWxsCj4gPj4+CgpGaXJzdCBvZiBhbGws
IHRoYW5rIHlvdSB2ZXJ5IG11Y2guCgo+ID4+PiBJIHdvdWxkIGxpa2UgdG8gaGF2ZSBzb21lIGlu
Zm9ybWF0aW9uIG9uIGhvdyB0byBpbXBsZW1lbnQgZGlyZWN0LWlvCj4gPj4+IHN1cHBvcnQgaW4g
dWJpZnMuIEkgaGF2ZSB0cmllZCB0byBtb3VudCBzcXVhc2hmcyBpbWFnZSBhcyBmaWxlIGluCj4g
Pj4+IHViaWZzIHVzaW5nIGxvb3BiYWNrIGFuZCBkaXJlY3QtaW8gYnV0IGl0IHNlZW1zIHRoYXQg
bG9vcCBjYW4gbm90Cj4gPj4+IGhhbmRsZSB3aGVuIHRoaXMgaXMgb24gdG9wIG9mIHViaWZzLiBG
cm9tIHdoYXQgSSB1bmRlcnN0YW5kIGZyb20gdGhlCj4gPj4+IGNvZGUgaXQgc2VlbXMgdGhhdCB0
aGUgcmVxdWlyZW1lbnQgaXMgdGhhdCB0aGUgZGlyZWN0LWlvIGlzCj4gPj4+IGltcGxlbWVudGVk
IGluIHRoZSBmaWxlc3lzdGVtIHdoZXJlIHRoZSBmaWxlIGlzIHN0b3JlZC4gSSBoYXZlCj4gPj4+
IHNpbXVsYXRlZCB1c2luZyBuYW5kIHNpbS4gVGhlIGlkZWEgaXMgdG8gcmVkdWNlIHRoZSBidWZm
ZXJpbmcuIEknbQo+ID4+PiBvcGVuIHRvIGhhdmUgb3RoZXIgc3VnZ2VzdGlvbnMgcmVnYXJkaW5n
IHRoaXMgdG9vLgo+ID4+Pgo+ID4+PiBNaWNoYWVsCj4gPj4+IC4KPiA+Pj4KPiA+PiBIaSBNaWNo
YWVsLAo+ID4+IFRoZXJlIGlzIGEgZGlzY3Vzc2lvbig5IHllYXJzIGFnbykgYWJvdXQgdWJpZnMg
ZGlvWzFdLCBvZiBjb3Vyc2Ugd2UKPiA+PiBjYW5ub3QgaW1wbGVtZW50IGl0IGFzIGEgZmFrZSBp
bnRlcmZhY2Ugbm93Lgo+ID4+IEJlZm9yZSB0YWxraW5nIGFib3V0IGFkZGluZyBkaW8gc3VwcG9y
dCBmb3IgVUJJRlMsIGxldCBtZSBrbm93IHNvbWUKPiA+PiBiYWNrZ3JvdW5kIGluZm9ybWF0aW9u
LiBXaGF0J3MgdGhlIHB1cnBvc2Ugb2YgdXNpbmcgZGlvIGZvciBvcGVuaW5nCj4gPj4gc3F1YXNo
ZnMgaW1hZ2UgZmlsZT8gV2hhdCdzIHRoZSBnb2FsIG9mIHJlZHVjaW5nIGJ1ZmZlciB5b3UgbWVu
dGlvbmVkCj4gPj4gYWJvdmUsIEJldHRlciBwZXJmb3JtYW5jZT8gTGVzcyBtZW1vcnkgdXNhZ2U/
Cj4gPj4KPiA+Pgo+ID4+IFsxXQo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTQ0
MDAxNjU1My0yNjQ4MS0yLWdpdC1zZW5kLWVtYWlsLXJpY2hhcmRAbm9kLmF0Lwo+ID4KPiA+Cj4g
PiBUaGUgZ29hbCBpcyBsZXNzIG1lbW9yeSB1c2FnZS4gRWFjaCBzcXVhc2hmcyBpcyBtb3VudGVk
IHVzaW5nIGxvb3BiYWNrCj4gPiBkZXZpY2UsIHNvIGFjY29yZGluZwo+ID4gdG8gc29tZSB0aHJl
YWQgb24gZGlyZWN0LWlvLCBJIHVuZGVyc3RhbmQgdGhhdCB3ZSB0aGVuIG5vdCBoYXZlCj4gPiBi
dWZmZXJpbmcgdHdvIHRpbWVzIG9uIHViaWZzIGxldmVsIGFuZCBsb29wCj4gPiBsZXZlbCwgYnV0
IHRoZSB0aHJlYWQgd2FzIG5vdCBjbGVhciB0byBtZS4gVGhlIGRldmljZSBoYXMgdmVyeSBsaW1p
dGVkCj4gPiBjYXBhYmlsaXR5IGFuZCBtZW1vcnkuIEkgaGF2ZSBkb25lIHNvbWUKPiA+IHRlc3Qg
d2l0aCBmdXNlICBidXQgSSBkaWQgbm90IGhhdmUgbnVtYmVycyB0byBjb21wYXJlIHRoZW0KPiA+
Cj4KPiBIaSBNaWNoYWVsLAo+Cj4gSSB0aGluayBpdCBpcyBwb3NzaWJsZSB0byBzdXBwb3J0IERJ
TyBmb3IgVUJJRlMgaW4gdGhlb3J5LCBidXQgaXQgaXMgbm90Cj4gYW4gZWFzeSB0YXNrLiBXZSBu
ZWVkIHRvIGltZXBsZW1lbnQgcmVhZC93cml0ZSBmdW5jdGlvbnMsIGFuZCB3ZSBzaG91bGQKPiBp
dGVyYXRlIHVzZXIgZGF0YSBieXRlcyBieSBVQklGU19CTE9DS19TSVpFIHVuaXQuCj4gMS4gVGhp
bmdzIHNob3VsZCBiZSBkb25lIGluIHdyaXRlIGZ1bmN0aW9uOgo+ICAgICAxKSBEbyBzcGFjZSBy
ZXNlcnZhdGlvbiwgcmVmZXIgdG8gdWJpZnNfd3JpdGVfYmVnaW4gLT4KPiBhbGxvY2F0ZV9idWRn
ZXQsIG9mIGNvdXJjZSB0aGUgb3JpZ2luICdyZXEubmV3X3BhZ2UnIGNhbm5vdCBiZSB1c2VkIGFu
ZAo+IHdlIHNob3VsZCBkZWZpbmUgYSBuZXcgYnVkZ2V0IHR5cGUgYmFzZWQgb24gVUJJRlNfQkxP
Q0tfU0laRS4KCkkgaGF2ZSBzZWVuIHRoYXQgYWxsb2NhdGUgYSBidWRnZXQgdXNpbmcgYW4gYWxs
b2NhdGVkIHJlcXVlc3QuIEhlcmUgeW91IG1lYW4KdG8gY2hhbmdlIHRoZSBpbnRlcmZhY2UgYSBi
aXQgdG8gcmVxdWlyZSB0aGUgYWxsb2NhdGVkIGJ1ZGdldCB0aGF0Cm11c3QgYmUgbXVsdGlwbGUg
b2YgQkxPQ0tfU0laRT8KCklmIHRoZSBxdWVzdGlvbiBsb29rcyBzaWxseSwgc29ycnkgZm9yIHRo
YXQuCgo+ICAgICAyKSByZWNvcmQgdXNlciBkYXRhIGluIGRhdGEgbm9kZSwgcmVmZXIgdG8gZG9f
d3JpdGVwYWdlIC0+Cj4gdWJpZnNfam5sX3dyaXRlX2RhdGEKPiAgICAgMykgaW52YWxpZGF0ZSBw
YWdlIGNhY2hlIGFmdGVyIGlvIGNvbXBsZXRlLCByZWZlciB0byBkaW9fY29tcGxldGUgLT4KPiBr
aW9jYl9pbnZhbGlkYXRlX3Bvc3RfZGlyZWN0X3dyaXRlCj4gICAgIDQpIHJlbGVhc2UgYnVkZ2V0
LCByZWZlciB0byBkb193cml0ZXBhZ2UgLT4KPiByZWxlYXNlX25ld19wYWdlX2J1ZGdldC9yZWxl
YXNlX2V4aXN0aW5nX3BhZ2VfYnVkZ2V0CgpPay4gTGV0IG1lIGdpdmUgbXlzZWxmIGEgZmV3IGRh
eXMgdG8gc3R1ZHkuCgo+IDIuIFRoaW5ncyBzaG91bGQgYmUgZG9uZSBpbiByZWFkIGZ1bmN0aW9u
Ogo+ICAgICAxKSBzeW5jIHBhZ2UgY2FjaGUgZGF0YSB0byBkaXNrLCBtYWtlIHN1cmUgdGhhdCBk
aW8gcmVhZGluZyBnZXQgdGhlCj4gbGF0ZXN0IHVzZXIgZGF0YSwgcmVmZXIgdG8gX19ibG9ja2Rl
dl9kaXJlY3RfSU8gLT4KPiBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlCj4gICAgIDIpIHJl
YWQgZGF0YSBmcm9tIFVISUZTLCByZWZlciB0byBkb19yZWFkcGFnZSAtPiByZWFkX2Jsb2NrCj4g
TWF5YmUgdGhlcmUgYXJlIG1hbnkgdHJpdmlhbCBkZXRhaWxzIGR1cmluZyBkZXZlbG9waW5nLgoK
SGVyZSB0aGUgbmljZSB0aGluZyBpcyB0byBrbm93IGhvdyB5b3UgdGVzdCBhdCB0aGUgbW9tZW50
IHRoZSB1YmlmcyBhbmQgZWFzeSB3YXkKdG8gZGV2ZWxvcG1lbnQgaXQuCgpNaWNoYWVsCgo+ID4K
PiA+IE1pY2hhZWwKPiA+IC4KPiA+Cj4KCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hp
CkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcw
Cm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBB
QiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRp
b25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
