Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4ED41C35
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c4TFzDQ4vCqzHI5Mn4LW41WQkz6nKgQC6iKLC9kOTs=; b=21EzIqTgwxwldR
	Auevc31jF670NgFCueTgqQA/949imo3Pqsl1ifBAvVu0CqjklZOiZII+nx37m3RU8yKPObrWGvJF0
	rml7z05qlVZKWJ6dgtOHjXxtM3pnHRLa7LW8bYwQLyAkakn8Qh2UswHKv/LaFIqc1DBTwuuhvC3Mi
	0cUxWOiHosWpcazlfNvudwe1m/3bryzl/VNEFpQjeJlXBafJuIZc4+daFIs8GZ++kJ93B+0w4gxkd
	GPl9IqjBlCSh5ikbur3EwJCD0958gJfGTtOhLdCWNhCKS43MpqukqUoNbLI4wPafjHY1GtEt3SPKu
	V2Vg0vdwh+JQU2a96oqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAxt-00000006VB4-3Xcf;
	Wed, 13 Nov 2024 10:51:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAxr-00000006VA3-3mOo
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 10:51:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-720d01caa66so6403527b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2024 02:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731495070; x=1732099870; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4V8MWOFJ/HH16zjgLs1hR8o3WmBmamvAKpmfe4OtQ7w=;
        b=MhJz8G1sgGhVxPw7tCzkAnk2Zn50WWf3ni/yqifoiqHecY1sujQMK4QJAczGRwOvea
         KKOwolbRYKHv+tf7/2wMRkJgDt3PYKKVrdKdiwf1rc38j/WAPYwsNnNSXInKtjJTSeHW
         /83yLrYbLqvEsCe/XgUVjNrRM8RQGRky1vK+ZMtVTKypGjWU3mO2ZbUszhPQsNlgEcgK
         y5ICAVnOstDYOnz5UPufptvQn/yaL79Y9KTl4SakJ8ZKH83IVtdM1vR0P23bmy5A8K9K
         gH6T9WNDxa1lHlU8GdnqRRquVwquhoO6r/t9b+zAA8bDZmBkiIuQVJJzdt0jc5n/HLV+
         5Scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731495070; x=1732099870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4V8MWOFJ/HH16zjgLs1hR8o3WmBmamvAKpmfe4OtQ7w=;
        b=XV1JOE0PAz0z/tWTyEsGBShGlF8ib6E2jK6f0FU8HDorbikHTLG84dwp1mgh/1G8yf
         Quml+/FecKmK2w4fOuifhdQJMsm5RbGv9PVAI52K0Odisi/D1bTbWBEw6J7mdhDVIdv+
         Xl3WFnXTTA7DKSkBwu2uJSRWVWFaUGtilGGSwZI5ArtN2Rjg+dSA9eytfzI/m8+JfTA5
         U+adIlp51upQ8llL7EDL4LmjMQGzn0eEB7SDQe75rfj3OFlyPQyMdSsTAQgxzW6Ds+fj
         AaTPsqLvCWksGugL+Sz0mM/uZQjlYu/evZyQoXzrEIDTo5ee7XEuSY5KI5cBQuU1FZkN
         ujbA==
X-Gm-Message-State: AOJu0YyO5rLtxngcgqwdezmh1zsPV2qBnKMn0USAkUsB6E+fm0AxavzE
	HBchJ8N7xXQvC/9dRltJNZPxR5f75GGAEfhDC/eqRV60Lgodfb9t
X-Google-Smtp-Source: AGHT+IFv7PFTJFc//oyamsX53LXYHgVPedPYotKGrFKropx2bXQH9mmBc+r6YAzs3rwANdY5eWMw4g==
X-Received: by 2002:a05:6a00:a0f:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-7245799e632mr3503429b3a.8.1731495070293;
        Wed, 13 Nov 2024 02:51:10 -0800 (PST)
Received: from [192.168.0.7] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a9ac8sm12856999b3a.79.2024.11.13.02.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 02:51:09 -0800 (PST)
Message-ID: <2351143e-5123-433b-ae1a-6c1cff2f41f5@gmail.com>
Date: Wed, 13 Nov 2024 19:51:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spinand: Introduce a way to avoid raw access
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
 kr.kim@skyhighmemory.com, zhi.feng@skyhighmemory.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
 <81c9caf04c94cba1a5ae4ba79dd09e0789583fcd.1730340421.git.Takahiro.Kuwano@infineon.com>
 <87bjylsirs.fsf@bootlin.com> <baeab3bf-fedf-4258-84d6-a0c53cb59ef0@gmail.com>
 <87zfm3qz17.fsf@bootlin.com>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <87zfm3qz17.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_025111_964666_8024A6D5 
X-CRM114-Status: GOOD (  21.19  )
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

T24gMTEvMTMvMjAyNCA2OjExIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIDEzLzExLzIw
MjQgYXQgMTE6MDY6MjEgKzA5LCBUYWthaGlybyBLdXdhbm8gPHRrdXc1ODQ5MjRAZ21haWwuY29t
PiB3cm90ZToKPiAKPj4gSGksCj4+Cj4+IE9uIDExLzEyLzIwMjQgMzo1NCBBTSwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDMxLzEwLzIwMjQgYXQgMTE6MjE6NTQgKzA5
LCB0a3V3NTg0OTI0QGdtYWlsLmNvbSB3cm90ZToKPj4+Cj4+Pj4gRnJvbTogVGFrYWhpcm8gS3V3
YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pj4+Cj4+Pj4gU2t5SGlnaCBzcGlu
YW5kIGRldmljZSBoYXMgRUNDIGVuYWJsZSBiaXQgaW4gY29uZmlndXJhdGlvbiByZWdpc3RlciBi
dXQKPj4+PiBpdCBtdXN0IGJlIGFsd2F5cyBlbmFibGVkLiBJZiBFQ0MgaXMgZGlzYWJsZWQsIHJl
YWQgYW5kIHdyaXRlIG9wcwo+Pj4+IHJlc3VsdHMgaW4gdW5kZXRlcm1pbmVkIHN0YXRlLiBGb3Ig
c3VjaCBkZXZpY2VzLCBhIHdheSB0byBhdm9pZCByYXcKPj4+PiBhY2Nlc3MgaXMgbmVlZGVkLgo+
Pj4+Cj4+Pj4gSW50cm9kdWNlIFNQSU5BTkRfTk9fUkFXX0FDQ0VTUyBmbGFnIHRvIGFkdmVydGlz
ZSB0aGUgZGV2aWNlIGRvZXMgbm90Cj4+Pj4gc3VwcG9ydCByYXcgYWNjZXNzLiBSZWFkIGFuZCB3
cml0ZSBwYWdlIGluIHJhdyBtb2RlIGZvciB0aGUgZGV2aWNlCj4+Pj4gcmV0dXJucyBlcnJvci4K
Pj4+Pgo+Pj4+IENoZWNraW5nIGFuZCBtYXJraW5nIEJCTSBuZWVkIHRvIGJlIHBlcmZvcm1lZCB3
aXRoIEVDQyBlbmFibGVkIHRvIHJlYWQKPj4+PiBhbmQgd3JpdGUgdGhlIEJCTSBjb3JyZWN0bHku
Cj4+Pgo+Pj4gSSBzZWUgeW91ciBwb2ludCBidXQgSSdtIGEgYml0IHB1enpsZWQgYnkgaG93IGl0
J3MgYmVpbmcgZG9uZS4KPj4+Cj4+PiBGaXJzdCwgeW91IGRpc3JlZ2FyZCBjb21wbGV0ZWx5IHRo
ZSBpc2JhZCgpIGFuZCBtYXJrYmFkKCkKPj4+IHNpdHVhdGlvbnMuIFBsZWFzZSBoYXZlIGxvb2sg
aW50byB0aGF0IGJlY2F1c2UgdGhlc2UgZnVuY3Rpb25zIGFyZQo+Pj4gYnJva2VuIHdpdGggeW91
ciBkZXZpY2VzLgo+Pj4KPj4gWWVzLi4uIG5vdyBJIHVuZGVyc3RhbmQgaG93IHRoZXkgYXJlIGJy
b2tlbi4KPj4KPj4+IFNlY29uZCwgd2hhdCBhYm91dCBhZGRpbmcgdGhpcyBkZXRhaWwgdG8gdGhl
IG9uZGllIEVDQyBlbmdpbmU/IFlvdSBjb3VsZAo+Pj4gc2ltcGx5IHJldHVybiBhbiBlcnJvciBm
cm9tIHRoZXJlLCBzbyBiYXNpY2FsbHkgYSBzaW5nbGUgKG9yIG1heWJlIHR3bykKPj4+IGNoYW5n
ZXMgb3ZlcmFsbC4KPj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uCj4+IEhvdyBh
Ym91dCBjaGFuZ2UgbGlrZSBiZWxvdyBpbiBwcmVwYXJlX2ZpbmlzaF9pb19yZXEoKT8KPj4KPj4g
c3RhdGljIGludCBzcGluYW5kX29uZGllX2VjY19wcmVwYXJlX2lvX3JlcShzdHJ1Y3QgbmFuZF9k
ZXZpY2UgKm5hbmQsCj4+IAkJCQkJICAgIHN0cnVjdCBuYW5kX3BhZ2VfaW9fcmVxICpyZXEpCj4+
IHsKPj4gCXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCA9IG5hbmRfdG9fc3BpbmFuZChu
YW5kKTsKPj4gCWJvb2wgZW5hYmxlID0gKHJlcS0+bW9kZSAhPSBNVERfT1BTX1JBVyk7Cj4+Cj4+
ICsJLyoKPj4gKwkgKiBGb3IgdGhlIGRldmljZXMgdGhhdCBwcm9oaWJpdCByYXcgYWNjZXNzIChv
bi1kaWUgRUNDIG11c3QgYmUgYWx3YXlzCj4+ICsJICogZW5hYmxlZCksIHJldHVybiBlcnJvciBp
biBjYXNlIG9mIHJhdyBkYXRhIGFjY2Vzcy4gQWNjZXNzaW5nIHRvIE9PQgo+PiArCSAqIG5lZWRz
IHRvIGJlIGFsbG93ZWQgd2l0aCBvbi1kaWUgRUNDIGVuYWJsZWQgdG8gc3VwcG9ydCBCQk0gY2hl
Y2tpbmcKPj4gKwkgKiBhbmQgbWFya2luZy4KPj4gKwkgKi8KPj4gKwlpZiAoIWVuYWJsZSAmJiBz
cGluYW5kLT5mbGFncyAmIFNQSU5BTkRfTk9fUkFXX0FDQ0VTUykgewo+PiArCQlpZiAocmVxLT5k
YXRhbGVuKQo+PiArCQkJcmV0dXJuIC1FTk9UU1VQUDsKPiAKPiBFT1BOT1RTVVBQCj4gCj4+ICsK
Pj4gKwkJZW5hYmxlID0gdHJ1ZTsKPj4gKwl9Cj4gCj4gTm8sIHRoaXMgaXMgbHlpbmcsIEkgZG9u
J3QgbGlrZSB0aGF0Lgo+IAo+IFdoYXQgYWJvdXQganVzdCByZXR1cm5pbnQgYW4gZXJyb3IgaGVy
ZSBpZiB5b3UgY2Fubm90IGRvIHdoYXQgdGhlIHVwcGVyCj4gbGF5ZXIgaGFzIGFza2VkIHlvdSB0
byBkby4gQW5kIGluIHRoZSB1cHBlciBsYXllciwgeW91IGNhbiBhZGQgdHdvCj4gc3BlY2lmaWMg
Y29uZGl0aW9ucyB0byBpc19iYWQvbWFya19iYWQoKSBhbGxvd2luZyB0byBmYWxsYmFjayB0byBh
ICJ3aXRoCj4gRUNDIiBvcGVyYXRpb24gaW4gdGhlIEVPUE5PVFNVUFAgY2FzZSAod2l0aCBhIHNo
b3J0IGNvbW1lbnQpLgo+IApPSywgSSB3aWxsIGRvIGl0IGluIG5leHQgcmV2aXNpb24uClRoYW5r
cyBhZ2Fpbi4KCkJUVywgc3BpbmFuZF93cml0ZV9lbmFibGVfb3AoKSBpbiBzcGluYW5kX21hcmti
YWQoKSBsb29rcyByZWR1bmRhbnQgYXMgaXQgaXMKY2FsbGVkIGluIHNwaW5hbmRfd3JpdGVfcGFn
ZSgpLiBMZXQgbWUgcmVtb3ZlIGl0IGJlZm9yZSBhZGRpbmcgZmFsbGJhY2suCgo+IFRoYW5rcywK
PiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
