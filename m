Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31D9C388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 17:13:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B83D21D91
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 17:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QmLKQIVF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdryO2LB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B83D21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DDD3OsX+17PQHs7AgqdVMU1jp8GNQh2L+0rqHl1B76g=; b=QmLKQIVFgEho+tDNtkmBzmun2
	JDyJ8aTCaRGJDwgX55zRVCeL6uDMihG30AUkWViCa9XdzzutjVadcF0m+kw846wSCYQX4CB41KI/P
	vhVlIhXiiEFeUC1pPQuo+8uScN819ko+wl0Khr/XVGRIE9pwvAYhbnfBQLc++SLSYgFJSS+eOfRpn
	NCYfMiVXr8BPodbqj0w1HfK1xd6JAjvEOe5wt7hLmkqZdTVtiwRM81B0fBxtvwYfkOTl0VZvSwIYR
	9xPOuqlbLC5ZV/0ZylXBFjf6nSVAusymDmgixQPtq1rWzdy2XCKuMAQKNgmz/tGCKhzKlnc2Y6WBC
	1TpnFe4bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZdNE-0004Cg-FY; Mon, 02 Nov 2020 17:12:04 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZdN6-00049L-Fr; Mon, 02 Nov 2020 17:11:58 +0000
Received: by mail-ed1-x541.google.com with SMTP id a71so9735627edf.9;
 Mon, 02 Nov 2020 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UDsVWn4E2MasI/jljtk38Wk49KhSUU+c+WkmrZoymUA=;
 b=JdryO2LBa69B5Z1yfJ8xP1QMzeLwOBKBVduKKsX5ZfldhdqNSFevqa/l0+6rw0tb8p
 z328dJrsyHglYerX+8jGqgRYmjT2MJvlKwThlkQsQCvptHSbLajvph/JJJOl7UPIVCzQ
 69qHNZfloYeV++cOSiWnR+Uw4wLRJF3sd4bPEURUW+04pMxYxjGwV/G4n85BlAsxDINp
 bSJRXgcVsWMhbWPL1HN63C5zSBzUBqci3cru3Ttt4yQ0FfMTDOEMyneQDz3rOIlzMwuh
 7iwXhrJ4no+e6rzywAK+Bt5Q1loZ5WvYCkxjuHYE0tlUfQY0EbE0IporoD40c5b2tMw8
 /jjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UDsVWn4E2MasI/jljtk38Wk49KhSUU+c+WkmrZoymUA=;
 b=nRBrl9wMBWSzTCBN5h20v9A9JfnvkCyPouSq4BVVQQjKmNsAQRuFC0w2OinMMubLfw
 GowOInzyYYekygvy2KGTcS2z6+HhPQjq3G1tVnL3u/uPY/MYbI9PNikj28L3+HoHGnjI
 rJco1k0uM7/8ICDxcC3ioSQakDloK5S0rNug+fa7DhGMyffpn87SpJJ6yj36v5/nVDOd
 NdfYd6E5daaqwo1QfJ/ieOEjInkA+fYzxiBxj7pqr1mi/7HtimH/a5K+ZPDjhExbWBsB
 c2aJ1IHqzE+qTiV2TECs+lrTGa0WYe/ogMTFg0O1Wesc8evbftwewfLHgGB/uu3t7sRv
 gLbQ==
X-Gm-Message-State: AOAM533IfTAxcg4TM8ZR8h1OK1G4Y2xOvEYFjzk2ydLkfQwqCtwR6ICG
 09ISu01tVeBkmLHE6VMc2spXORgbZaPRWA==
X-Google-Smtp-Source: ABdhPJxy8egjrPYM8QyvbDqSYMiE4M0MTlh3z+5zxkzuEWmJX/3AKyXY6VLzEBi4sE0mU7wlirqLHA==
X-Received: by 2002:a05:6402:1d13:: with SMTP id
 dg19mr17902988edb.217.1604337114670; 
 Mon, 02 Nov 2020 09:11:54 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 pw17sm9811284ejb.116.2020.11.02.09.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 09:11:54 -0800 (PST)
Subject: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>
 <e02e13a0-769d-6b73-c87e-5b7d75fd4254@rock-chips.com>
 <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>
 <20201102140725.66e7dcb1@xps13>
 <5ad70fa0-05a9-e1e7-32cc-32933ff25ae9@gmail.com>
 <803e291f-67e0-f66c-6c9e-041db1b3847c@gmail.com>
 <20201102180039.757d3234@xps13>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <cd349a1f-773d-096a-f0ae-90c5eb847769@gmail.com>
Date: Mon, 2 Nov 2020 18:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201102180039.757d3234@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_121156_595979_525A7FBA 
X-CRM114-Status: GOOD (  21.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 Yifeng <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMi8yMCA2OjAwIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEpvaGFuLAo+IAo+
IEpvaGFuIEpvbmtlciA8amJ4NjI0NEBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMiBOb3YgMjAy
MCAxNzozMToxOAo+ICswMTAwOgo+IAo+PiBPbiAxMS8yLzIwIDI6MTEgUE0sIEpvaGFuIEpvbmtl
ciB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDExLzIvMjAgMjowNyBQTSwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4+PiBIaSBKb2hhbiwgWWlmZW5nCj4+Pj4KPj4+PiBKb2hhbiBKb25rZXIgPGpi
eDYyNDRAZ21haWwuY29tPiB3cm90ZSBvbiBNb24sIDIgTm92IDIwMjAgMTM6NTc6NTYKPj4+PiAr
MDEwMDoKPj4+Pgo+Pj4+PiBIaSBZaWZlbmcsCj4+Pj4+Cj4+Pj4+IERvbid0IHBva2Ugd2l0aCAi
ZWNjLT5ieXRlcyIgb25lcyBpdCBpcyBzZXQgaW4gcmtfbmZjX2VjY19pbml0KCkuIEl0Cj4+Pj4+
IHdpbGwgbm90IGJlIG5vdGVkIGJ5IHRoZSBNVEQgZnJhbWUgd29yayBvciB1c2Vyc3BhY2UuIEkg
dGhpbmsgdGhlcmUncwo+Pj4+PiBjdXJyZW50bHkgbm8gd2F5IHRvIGxldCB0aGUgdXNlciBrbm93
IHRoYXQgYSBkaWZmZXJlbnQgRUNDIG11c3QgYmUgdXNlZC4KPj4+Pj4gTmVpdGhlciBjYW4gdGhl
IHVzZXIgc2V0IEVDQyBvbiB0aGUgZmx5Lgo+Pj4+Pgo+Pj4+PiBFeGFtcGxlIFIvVyBmbG93Ogo+
Pj4+Pgo+Pj4+PiAgICAgICAgIG5hbmRfc2VsZWN0X3RhcmdldCgpCj4+Pj4+IAljaGlwLT5lY2Mu
d3JpdGVfcGFnZV9yYXcoKQo+Pj4+PiAJY2hpcC0+ZWNjLndyaXRlX3BhZ2UoKQo+Pj4+Pgo+Pj4+
PiBbLi5dCj4+Pj4+Cj4+Pj4+IAljaGlwLT5lY2MucmVhZF9wYWdlX3JhdygpCj4+Pj4+IAljaGlw
LT5lY2MucmVhZF9wYWdlKCkKPj4+Pj4gICAgICAgICBuYW5kX2Rlc2VsZWN0X3RhcmdldCgpCj4+
Pj4+Cj4+Pj4+IEEgd3JpdGUvcmVhZCB3aXRoOgo+Pj4+Pgo+Pj4+PiBya19uZmNfcmVhZF9wYWdl
X2h3ZWNjKCkKPj4+Pj4gcmtfbmZjX3dyaXRlX3BhZ2VfaHdlY2MoKQo+Pj4+Pgo+Pj4+PiBvcgo+
Pj4+Pgo+Pj4+PiBya19uZmNfcmVhZF9wYWdlX3JhdygpCj4+Pj4+IHJrX25mY193cml0ZV9wYWdl
X3JhdygpCj4+Pj4+Cj4+Pj4+IG11c3QgZW5kIHVwIHdpdGggdGhlIHNhbWUgcmVzdWx0LiBJZiB3
ZSBjYW4ndCBhcmNoaXZlIHRoYXQsIHRoZW4gd2UKPj4+Pj4gc2hvdWxkbid0IG9mZmVyIFJBVyBt
b2RlIHRvIHRoZSB1c2VyIGZvciBub3cuIElmIE1pcXVlbCBhZ3JlZXMgeW91Cj4+Pj4+IHNob3Vs
ZCBqdXN0IGdldCB0aGUgZHJpdmVyIHJlYWR5IG5vdyB3aXRob3V0IHRoZXNlIDIgZnVuY3Rpb25z
IGFuZCByb3VuZAo+Pj4+PiB0aGluZ3MgdXAuCj4+Pj4KPj4+PiBXaGF0IGFib3V0IGp1c3Qgbm90
IHN1cHBvcnRpbmcgdGhlIEJvb3RST00gYXJlYSBpZiBpdCB3YXMgbWFya2VkCj4+Pj4gInJlc2Vy
dmVkIiBieSB0aGUgQlJvbSBpbiB0aGUgRFQ/Cj4+Pgo+Pj4gU2hvdWxkIHdlIGp1c3QgZmlsbCB0
aGUgYnVmZmVycyB3aXRoICcweGZmJyBmb3IgYm9vdCBibG9ja3M/Cj4+Cj4+IChwYXJ0IDIpIDsp
Cj4+IE15IGZhdWx0Li4uLgo+PiBCZXR0ZXIgdXNlOgo+Pgo+PiAgICAgaWYgKChjaGlwLT5vcHRp
b25zICYgTkFORF9JU19CT09UX01FRElVTSkgJiYKPj4gICAgICAgICAocGFnZSA8IChwYWdlc19w
ZXJfYmxrICogcmtuYW5kLT5ib290X2Jsa3MpKSkgewo+Pgo+PiAJcmV0dXJuIC1FSU87Cj4+Cj4+
ICAgICB9Cj4gCj4gWXVwLCBJIHdhcyBhYm91dCB0byB0ZWxsIHlvdSB0aGF0IEkgd291bGQgcHJl
ZmVyIHJldHVybmluZyBhIG5pY2UKPiBlcnJvciwgdGhpcyBpcyBmaW5lIEkgZ3Vlc3MuCj4gCj4g
QW55d2F5LCBJIHRoaW5rIHJlYWRpbmcgYmFkIGJsb2NrIG1hcmtlcnMgaXMgZG9uZSBpbiByYXcg
bW9kZSwgc28gaWYKPiByYXcgYWNjZXNzb3JzIHJlZnVzZSB0byByZXR1cm4gdmFsaWQgdmFsdWVz
IGZvciBib290IGJsb2NrcywgeW91IHdvbid0Cj4gYmUgYWJsZSB0byBhY2Nlc3MgaXQgbmVpdGhl
ciB3aXRoIHJhdyBub3IgY29ycmVjdGVkIGhvb2tzLgo+IAo+IFBlcmhhcHMgcmVmdXNpbmcgdGhl
IGFjY2VzcyB0byB0aGUgcmVndWxhciBwYWdlIGFjY2VzcyBpcyBvaywgYnV0IG1heWJlCj4gd2Ug
c2hvdWxkIGJlIGFibGUgdG8gYXQgbGVhc3QgcmVhZCB0aGVzZSBwYWdlcyBpbiByYXcgbW9kZQo+
IChhbmQgbW92ZSB0aGUgQkJNIHRvIGl0cyByaWdodCBsb2NhdGlvbikuIFdoYXQgZG8geW91IHRo
aW5rPwoKSSB0aGluayB0aGF0IHRoZSBwcm9ibGVtIHdpdGggYXN5bW1ldHJpYyByZWFkIGFuZCB3
cml0ZSBhY2Nlc3MgaXMgdGhhdCBhCnVzZXIgcmVhZHMgZGF0YSBzdWNjZXNzZnVsLCBidXQgdGhh
dCBpdCBjYW4ndCB3cml0ZSBpdCBiYWNrIGFmdGVyIGl0J3MKYmxvY2sgaXMgZXJhc2VkLiBZb3Ug
c2hvdWxkbid0IGdpdmUgdGhlIGlsbHVzaW9uIHRoYXQgdGhlIGJvb3QgUk9NCmJsb2NrcyBjYW4g
YmUgYWNjZXNzZWQgaW4gUkFXIG1vZGUuIFNvbWV0aGluZyB3aXRoIHBlcmNlcHRpb24uLi5kb2Vz
CnVzZXIgc3BhY2Uga25vd24gdGhhdCBSb2NrY2hpcCdzIE5GQyBpcyBzcGVjaWFsLi4uCgoKPiAK
PiBUaGFua3MsCj4gTWlxdcOobAo+IAo+Pgo+Pgo+Pj4KPj4+Pgo+Pj4+IFJhdyBhY2Nlc3NvcnMg
aXMgcmVhbGx5IGEgbmljZSBhbmQgYmFzaWMgZmVhdHVyZSB0aGF0IEkgd291bGQgbGlrZSB0bwo+
Pj4+IGhhdmUgaW4gZXZlcnkgbmV3IGRyaXZlci4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBNaXF1
w6hsCj4+Pj4KPj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
