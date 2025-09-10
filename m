Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43228CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxBh5/hpI7QOownec7CFyQu8iJa0k1mT1wputDXqteU=; b=XQ2oKF+QkHrPFT
	VVKTzBKnukvpr7WuSQ8e5MoS3UBzgsvfpKP/s3hSK1I/XN+pnS27WSXc7E/l7YrZ5Q3uOl6zORqNu
	nLyOzIELWeite60OE2aPYsYnSFEzOj1iU3gumlH+CrEeh1FhMlFJcLFrEmJKEQ1wlA7VvTNn68nAW
	Y6yvLw6Vb5NvtnHG8seThvseF5DXuVOmhz3LGpauSKP6ZS07kHuFfzDPVl4AskWzWa4NSlhYQsNLO
	FrOL6EvjG8wt22zxZuG60G0/BF273jdX/AN2ZCHsuRsJOf7HopN7THitaUTOJ07GMs9hQ/XMsqhIO
	KQTRkccKKWzoWj+7TvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMJ6-0000000EvgJ-0BEo;
	Wed, 10 Sep 2025 15:00:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMIx-0000000EvUL-17bW
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 15:00:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo3207389f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757516413; x=1758121213; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qm4BnuN4F+PgUIqciwrBi4SGMbZAHGuiuhtIXw7Lc+Y=;
        b=QLDQVk27hApNHN89FjL6zLAX9ApmXBu0B7AWxTdCIDoThd9YM2WFkoA/ckfvi3lPts
         0qcZGu5Qkc4TXeQgl61L6bMPFJrCX9JTeoAuQPSA3K+0ZVpzj0c8ttEWXLNNBNoXFuzc
         xs3SABIQBoY7vseWfVOa4tgkw59URPVyAJGfOYvEfm2PxxBz6bJ6ZNV0+svsJRjr/HbW
         jK7/EMm/iMR0w6GQMotqI0YqWDGb15bnPSnq4lqxP9unXzxQ4R7hx1MWL7f5EPS13eyI
         YhZ4c5BSHseeMb6BdN2R7VDhMewAXAIVhY/UsiaBq7WjnBd528CnWQTX3OiuO0Qx+PfH
         6rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516413; x=1758121213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm4BnuN4F+PgUIqciwrBi4SGMbZAHGuiuhtIXw7Lc+Y=;
        b=FfePZK/BCUPY47muC7xycx/P0PZ2QIuqcmfAy0wXzysslQJSxSjwvcS59xP2XLWxCQ
         Aetg4kHnywbtScLFbB3x23up8i294HVkGPg9KvwlyZrUEZV4iiMnGwX29sL5Ww2AfyZ2
         3SM1eAhFTZCSGqKDxEQgIJTaR4d92JH0PJWCW6CfscL9zq0OniP6BdynaoEVOQh/kBBi
         8p1MssFGvy7DsgaHRChocsWuMINcF2wD0W/cFHKPoshYPBjMn8YVftG/36fhVK+kz49l
         30B8x081iXIsxdiRdU2wIDaLVsd3z6U6VB5Ami2FdOPKUkDs2VDl4EKfZGV8QVFGhG3c
         IcgA==
X-Forwarded-Encrypted: i=1; AJvYcCVt3Hdfl9N6DyWp3Wg3/PTgb1Z3RJxBuiX2QICLkfsJ1QQhUAPpHuG7o/AGm4Ml/1mUkQSM2h6+2kA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAMxz9r5qk204phtYNhYwbPHRt/g8inPp/Xxza0COpYpyaKkhI
	W6h2AboaoFHFckOHvqyeIAHR0BHqY8T5Mm6QFFHgngcJGxYw367LGWsJroEgMvcU2oI=
X-Gm-Gg: ASbGnctK/tAHugcPatMm6dXgjA5OhFjQo5mn/3nUKgLI4Aa7Zbp+Qf1JglMDXiN4Evu
	m7nKRllSbMSEM/nWmcDuQfOx+d4+t3wppkF/tZh311GMOh/WRyc6PyB11CKW9LJBaCSs8GeWPxt
	GNrcOvUqIO9g7VhriMqma3O9HuevEf8FASswcEfm6DsPEQWsbGd0RmB4ekVpk9130rDiEJYckgX
	ey7zsbejd8ir2fjgzdCyxymlteBEgKW76FeHkQsDWrjcdxeLNtiREBiJZB17LY2IqzQhyytBeYn
	ba9B0AbSiwHVxGZkbP085bFO7A5pWon/3fo65KyZzX0E1wG222wObtQNk7U+iTjH69z9YORmBhX
	SCCF3QRS3mGroiU7suiECkXqMW7wjNRVnsMdsSPRydw==
X-Google-Smtp-Source: AGHT+IGZmk0FhRSVP3L+RvTwmEjLMIw0vFrPN+Kvpj28uGK1L2407qxDNR0B3/KgO9wxczRbTJMp6A==
X-Received: by 2002:a05:6000:200c:b0:3df:d8ea:1f7b with SMTP id ffacd0b85a97d-3e64c87e42dmr11763123f8f.51.1757516413111;
        Wed, 10 Sep 2025 08:00:13 -0700 (PDT)
Received: from [10.11.12.107] ([82.76.212.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223898csm7663993f8f.39.2025.09.10.08.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 08:00:12 -0700 (PDT)
Message-ID: <4991cd24-c549-4f4c-a7cb-c9f0e331c4bc@linaro.org>
Date: Wed, 10 Sep 2025 16:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Check read CR support
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Jakub \"Kuba\" Czapiga" <czapiga@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konrad Adamczyk <konrada@google.com>, Adeel Arshad <adeel.arshad@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250910103355.629421-1-czapiga@google.com>
 <87frcucy3p.fsf@bootlin.com>
 <CABkukdpRxHFg9FbaV1GnS5UG3-ZxdxPbjKYdUpdmvOcLs5phKA@mail.gmail.com>
 <87a532cqnr.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87a532cqnr.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_080015_358555_AFF41AF7 
X-CRM114-Status: GOOD (  19.64  )
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

CgpPbiA5LzEwLzI1IDM6NDUgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
T24gMTAvMDkvMjAyNSBhdCAxNjozMDo0MyArMDIsICJKYWt1YiBcIkt1YmFcIiBDemFwaWdhIiA8
Y3phcGlnYUBnb29nbGUuY29tPiB3cm90ZToKPiAKPj4gSGkgTWlxdcOobCwKPj4KPj4gT24gV2Vk
LCBTZXAgMTAsIDIwMjUgYXQgMjowNeKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+Pj4KPj4+IEhpIEpha3ViLAo+Pj4KPj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+Pj4+IGluZGV4IGFjNGI5NjAxMDFjYy4uNzlkZWVlM2E1MGQzIDEwMDY0NAo+Pj4+IC0tLSBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMKPj4+PiBAQCAtMjYwOCw2ICsyNjA4LDEwIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9z
ZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+Pj4+ICAgICAgICAgICAgICAgfQo+Pj4+ICAgICAg
IH0KPj4+Pgo+Pj4+ICsgICAgIC8qIFNvbWUgU1BJIGNvbnRyb2xsZXJzIG1pZ2h0IG5vdCBzdXBw
b3J0IENSIHJlYWQgb3Bjb2RlLiAqLwo+Pj4+ICsgICAgIGlmIChzcGlfbm9yX3JlYWRfY3Iobm9y
LCBub3ItPmJvdW5jZWJ1ZikgPT0gLUVPUE5PVFNVUFApCj4+Pgo+Pj4gVGhlcmUgaXMgYSBzcGlf
bm9yX3NwaW1lbV9jaGVja19vcCgpIGhlbHBlciB3aGljaCBtaWdodCBiZSBiZXR0ZXIgc3VpdGVk
Cj4+PiBmb3IgdGhpcyBwdXJwb3NlPwo+Pgo+PiBzcGlfbm9yX3NwaW1lbV9jaGVja19vcCgpIHdv
cmtzIG9ubHkgZm9yIHNwaS1tZW0gZGV2aWNlcy4gc3BpX25vcl9yZWFkX2NyKCkKPj4gaGFuZGxl
cyBib3RoIHNwaS1tZW0gYW5kIHNwaS1ub3IgY29udHJvbGxlci4gVXNpbmcgc3BpX25vcl9zcGlt
ZW1fY2hlY2tfb3AoKQo+PiB3b3VsZCByZXF1aXJlIGFkZGluZyBhIHZhcmlhdGlvbiBvZiBzcGlf
bm9yX3JlYWRfY3IoKSB0aGF0IHdvdWxkIHVzZQo+PiBzcGlfbm9yX3NwaW1lbV9jaGVja19vcCgp
IGZvciBzcGktbWVtIGFuZCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzX3JlYWRfcmVnKCkKPj4gZm9y
IHNwaS1ub3IgY29udHJvbGxlci4KPj4gQW5vdGhlciB3YXkgd291bGQgYmUgdG8gZG8gdGhpcyBj
aGVjayBvbmx5IGZvciB0aGUgc3BpLW1lbSBhcyBzcGktbm9yCj4+IGNvbnRyb2xsZXJzIHNlZW0g
dG8gYmUgZGVwcmVjYXRlZCBpbiBmYXZvdXIgb2Ygc3BpLW1lbS4KPiAKPiBJJ2xsIGxldCB0aGF0
IGNob2ljZSB0byBTUEkgTk9SIG1haW50YWluZXJzIGJ1dCB3ZSd2ZSBjb2xsZWN0aXZlbHkgYXNr
ZWQKPiB0byBzd2l0Y2ggaW4gZmF2b3Igb2YgdGhlIHNwaSBtZW1vcnkgQVBJIGZvciBxdWl0ZSBz
b21lIHRpbWUsIEkgd291bGQKPiBub3QgY2FyZSB0b28gbXVjaCBhYm91dCBjb21wYXRpYmlsaXR5
IHdpdGggdGhlIHR3byByZW1haW5pbmcgY29udHJvbGxlcnMKPiB0aGF0IGhhdmUgbm90IHlldCBi
ZWVuIGNvbnZlcnRlZC4KPiAKClRoYXQncyBjb3JyZWN0LiBJdCdzIGJlZW4gYSBmZXcgeWVhcnMg
bm93IHNpbmNlIHdlIHN0b3BwZWQgYWRkaW5nIG5ldwpzdXBwb3J0IGZvciB0aGUgU1BJIE5PUiBj
b250cm9sbGVycywgc28gZmVlbCBmcmVlIHRvIGlnbm9yZSB0aGF0IHBhcnQuCkFsbCB3ZSBkaWQg
b24gdGhhdCBmcm9udCB3YXMgdG8gbWFrZSBzdXJlIHdlIGRvbid0IGJyZWFrIGFueXRoaW5nLgoK
PiBCdXQgaGVyZSBpcyBhIHByb3BlciBpbGx1c3RyYXRpb24gd2h5IHNwaS1tZW0gcm9ja3MgYW5k
IHdoeSBTUEkgTk9SCj4gY29udHJvbGxlcnMsIGJlc2lkZXMgbWFraW5nIG5vIHNlbnNlIChiZWNh
dXNlIHdlIGFsc28gaGF2ZSBTUEkgTkFORHMKPiBub3cpIGhhdmUgYSBmbGFja3kgQVBJIGFzIG9m
IHRvZGF5J3Mgc3RhbmRhcmRzLgoKUmlnaHQuIEknZCB2ZXJ5IG11Y2ggbGlrZSB0byBzZWUgdGhl
IFNQSSBOT1IgY29udHJvbGxlcnMgY29udmVydGVkIHRvCnNwaW1lbSBvciByZW1vdmVkIGFsdG9n
ZXRoZXIuCgpDaGVlcnMsCnRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
