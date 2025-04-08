Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E227EC369A2
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ESIEWLRYuWk3pJcwOXQ625s89/aEdgioB/P8ckzwTE=; b=YC6fDf8RYoCNwY
	wqSLgEHiQ1twuyjLCtE+oh9eVPwvDIPmyzWNu+TLakFoizZTOI/ygDykZswtqHJNcqAC8BB1Nows8
	QlNxQ25EOHlGXsis8oglcbTZTha+WlHzDm146JNrwWjFKguA49/NH0kZco5McZ0xkwwZDdQWlJIuk
	RcEP9S274XX0kI+GEm/p7nZJmN11kwfaeHhF12h2FuQVt9/hNPQD2UZTBKF7m6e8rErwjt+yBwAj2
	58MjKHrgBiU5yxLOcb+QW/g4Rqx8+igfT5M3TyX1u9oshJdzG4aImxfl8y1t65zqTTpQlcHpoWF+5
	nnA4E9BXix5d/Yrk6f5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29b6-00000004JjC-07zN;
	Tue, 08 Apr 2025 14:06:40 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29Sc-00000004I7n-1O4f
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 13:58:00 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6e8ff1b051dso9896966d6.1
        for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2025 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744120673; x=1744725473; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eLPJrXprM2M0bMGNsUFlKvKVg7bmQjnS+e4G6L38UU=;
        b=XNYaxAUl55j0LNkULrvI6h/VajnizO0PGPkJSPnkgRB/HPmVbsvpPtAcFcWUchy5sy
         ZmpEzyf1LCh2xqILYb6OeWX1rektg7BIbDSnZZZ2EOu3dl8TjHzUcJSeMUcAuBqHdOeS
         DRFSmGuWN9SrJIJ0rJlS2n8AcETPyAvV1VQk55IQYRp7PbsDOzAE/mEAXjPmbAhXcJob
         Xu52fREd8bhlMRxTmAyPeH6sVCyvj4jAxRs0xYrgGXwTaEep8b+7wb/buB+dGleUJx2k
         iQ+5UHx3RfpbPokIrKMoRhSLTgWNk3MrILdFOezE9WkvFf0Y0akn+h/xX2cOfLYtDcjT
         Mq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120673; x=1744725473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eLPJrXprM2M0bMGNsUFlKvKVg7bmQjnS+e4G6L38UU=;
        b=X25bQsgu3mzFiie53WY0q+u51uE6tI0EjofWZvXT6VwJI4Ix9moISfFs1EL/NyiYcF
         Cz8HJJfD3RxbIoxuIXVcFs2cg/jNBlccMkxuW8kARrjdx/xRin/aSYegEhyFcXblL0Gq
         HbPzbdglj160krXEegcjThL7jiHMIjQO45sBqP3Lv4Lgl0UBdLKgBGjxoXkQaFi8UTkv
         2fDOnsXHGMVISPHJ37EcOPq9TysGdSEIih4B/3lXimj2F1P/diFiMSRm7Tg631P5NYAg
         7GKA4v+zFMBtRoNw6VT+qeSl3whtKRVDuxVFP2GyEgZ0DDQzWbPfR7orOEGG5UPtkoWA
         J4nA==
X-Forwarded-Encrypted: i=1; AJvYcCXzBiVOr0GhlRFm2pihNI9rEki4emloKv6V9P5OG0HSlRAQ2kTRF3Y9O0WJcaTEF6UutNOM08reVMk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZAldF8RVAD0+vBU9ZK4524rh+MsuErawX9Aoso6aqA2X4+M4d
	kW81LVPPQ+j6Er7AVYz53foROgR8MCTXqj+I5kbOP+tXV9lfKGHWuqBWADEn
X-Gm-Gg: ASbGncvEf5ocsjDLHPf556Nm1ATW8ABJNtXJI+PZpwjApPF/5KvKygC71B/XJeDbrEA
	ZxGnkQ0+awh6DhValMVDQaLY3aH//6zJejMHu7itnt4Ru5Ywt74BCKnFID07Wl9qC5Tr6dTAC2Q
	lzYVrt137FSzQR4LkFD5Hj8LvDFwESCtW1mMljNJREjeoYtN595vAvmy1M3rBA0mBmLfnb+RuIw
	cOT1sit2aZwQQDb69WvcYtUCWJPlnWsHs+qI/R6fx3S0TMdzLp6OTgxGMLGJfcPhyEByHzrdzns
	tWWKukKWB59ya7KgJdcWxqQddFzANsxIgYT6ygOtvRCh8cKUmxBwBjP7NrF1iKIyiI1L9iczzho
	OPTxcX9PFGQcrn1FLxSZX
X-Google-Smtp-Source: AGHT+IEF0BAK7waavu4eeZ2kovhqT0j6efzE6PujE1HHSsq1l+s4f3Uj0huwtdFotlBVCLmUHqL8yQ==
X-Received: by 2002:a05:6214:e61:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6f01e7a1f77mr83556006d6.9.1744120672422;
        Tue, 08 Apr 2025 06:57:52 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-176-137.washdc.fios.verizon.net. [108.48.176.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0ee7565bsm74841946d6.0.2025.04.08.06.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 06:57:51 -0700 (PDT)
Message-ID: <25e201d2-aa80-1f1c-12fd-3b3f9c774e59@gmail.com>
Date: Tue, 8 Apr 2025 09:57:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: bio segment constraints
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <8a232716-74f8-4bba-a514-d0f766492344@suse.de>
 <a0ffa9b9-8649-1b63-3d56-3fc45fdfda83@gmail.com>
 <7b8c4805-a91f-4455-a021-e5d8b6078d8b@suse.de>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <7b8c4805-a91f-4455-a021-e5d8b6078d8b@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_065754_369082_F1909968 
X-CRM114-Status: GOOD (  22.82  )
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

T24gNC84LzI1IDAyOjEwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6DQo+IE9uIDQvNy8yNSAxNjox
NCwgU2VhbiBBbmRlcnNvbiB3cm90ZToNCj4+IE9uIDQvNy8yNSAwMzoxMCwgSGFubmVzIFJlaW5l
Y2tlIHdyb3RlOg0KPj4+IE9uIDQvNi8yNSAyMTo0MCwgU2VhbiBBbmRlcnNvbiB3cm90ZToNCj4+
Pj4gSGkgYWxsLA0KPj4+Pg0KPj4+PiBJJ20gbm90IHJlYWxseSBzdXJlIHdoYXQgZ3VhcmFudGVl
cyB0aGUgYmxvY2sgbGF5ZXIgbWFrZXMgcmVnYXJkaW5nIHRoZQ0KPj4+PiBzZWdtZW50cyBpbiBh
IGJpbyBhcyBwYXJ0IG9mIGEgcmVxdWVzdCBzdWJtaXR0ZWQgdG8gYSBibG9jayBkcml2ZXIuIEFz
DQo+Pj4+IGZhciBhcyBJIGNhbiB0ZWxsIHRoaXMgaXMgbm90IGRvY3VtZW50ZWQgYW55d2hlcmUu
IEluIHBhcnRpY3VsYXIsDQo+Pj4+DQo+Pj4+IC0gSXMgYnZfbGVuIGFsaWduZWQgdG8gU0VDVE9S
X1NJWkU/DQo+Pj4NCj4+PiBUaGUgYmxvY2sgbGF5ZXIgYWx3YXlzIHVzZXMgYSA1MTIgYnl0ZSBz
ZWN0b3Igc2l6ZSwgc28geWVzLg0KPj4+DQo+Pj4+IC0gVG8gbG9naWNhbF9zZWN0b3Jfc2l6ZT8N
Cj4+Pg0KPj4+IE5vdCBuZWNlc3NhcmlseS4gQnZlY3MgYXJlIGEgY29uc2VjdXRpdmUgbGlzdCBv
ZiBieXRlIHJhbmdlcyB3aGljaA0KPj4+IG1ha2UgdXAgdGhlIGRhdGEgcG9ydGlvbiBvZiBhIGJp
by4NCj4+PiBUaGUgbG9naWNhbCBzZWN0b3Igc2l6ZSBpcyBhIHByb3BlcnR5IG9mIHRoZSByZXF1
ZXN0IHF1ZXVlLCB3aGljaCBpcw0KPj4+IGFwcGxpZWQgd2hlbiBhIHJlcXVlc3QgaXMgZm9ybWVk
IGZyb20gb25lIG9yIHNldmVyYWwgYmlvcy4NCj4+PiBGb3IgdGhlIHJlcXVlc3QgdGhlIG92ZXJh
bGwgbGVuZ3RoIG5lZWQgdG8gYmUgYSBtdWx0aXBsZSBvZiB0aGUgbG9naWNhbA0KPj4+IHNlY3Rv
ciBzaXplLCBidXQgbm90IG5lY2Vzc2FyaWx5IHRoZSBpbmRpdmlkdWFsIGJpb3MuDQo+Pg0KPj4g
T2gsIHNvIHRoaXMgaXMgd29yc2UgdGhhbiBJIHRob3VnaHQuIFNvIGlmIHlvdSBjYXJlIGFib3V0
IGUuZy4gb25seSBzdWJtaXR0aW5nIEkvTyBpbiB1bml0cyBvZiBsb2dpY2FsX2Jsb2NrX3NpemUs
IHlvdSBoYXZlIHRvIGNvbWJpbmUNCj4gID4gc2VnbWVudHMgYWNyb3NzIHRoZSBlbnRpcmUgcmVx
dWVzdC4+DQo+IFdlbGwsIHllcywgYW5kIG5vLg0KPiBZb3UgbWlnaHQgYmUgc2VlaW5nIGEgcmVx
dWVzdCB3aXRoIHNldmVyYWwgYmlvcywgZWFjaCBoYXZpbmcgc21hbGwNCj4gYnZlY3MuIEJ1dCBp
biB0aGUgZHJpdmVyIHlvdSB3aWxsIHdhbnQgdG8gdXNlIGFuIGlvdiBpdGVyYXRvciBvciBtYXAN
Cj4gaXQgaW50byBhIHNnIGxpc3QgdmlhIGJsa19ycV9tYXBfc2coKSwgYW5kIHRoZW4gaXRlcmF0
ZSBvdmVyIHRoYXQNCj4gZm9yIHN1Ym1pc3Npb24uDQo+IA0KPiBbIC4uIF0NCj4+Pj4gLSBDYW4g
SSBzb21laG93IHJlcXVlc3QgdG8gb25seSBnZXQgc2VnbWVudHMgd2l0aCBidl9sZW4gYWxpZ25l
ZCB0bw0KPj4+PiDCoMKgIGxvZ2ljYWxfc2VjdG9yX3NpemU/IE9yIGRvIEkgbmVlZCB0byBkbyBt
eSBvd24gY29hbGVzY2luZyBhbmQgYm91bmNlDQo+Pj4+IMKgwqAgYnVmZmVyaW5nIGZvciB0aGF0
Pw0KPj4+Pg0KPj4+DQo+Pj4gVGhlIGRyaXZlciBzdXJlbHkgY2FuLiBZb3Ugc2hvdWxkIGJlIGFi
bGUgdG8gc2V0ICdtYXhfc2VnbWVudF9zaXplJyB0bw0KPj4+IHRoZSBsb2dpY2FsIGJsb2NrIHNp
emUsIGFuZCB0aGF0IHNob3VsZCBnaXZlIHlvdSB3aGF0IHlvdSB3YW50Lg0KPj4NCj4+IEJ1dCBj
b3VsZG4ndCBJIGdldCBzZWdtZW50cyBzbWFsbGVyIHRoYW4gdGhhdD8gbWF4X3NlZ21lbnRfc2l6
ZSBzZWVtcyBsaWtlDQo+PiBpdCB3b3VsZCBvbmx5IHJlc3RyaWN0IHRoZSBtYXhpbXVtIHNpemUs
IGxlYXZpbmcgdGhlIHBvc3NpYmlsaXR5IG9wZW4gZm9yDQo+PiBzbWFsbGVyIHNlZ21lbnRzLg0K
Pj4NCj4gQXMgbWVudGlvbmVkOiBpbmRpdmlkdWFsIHNlZ21lbnRzIG1pZ2h0LiBUaGUgb3ZlcmFs
bCByZXF1ZXN0IHN0aWxsIHdpbGwgYWRoZXJlIHRvIHRoZSBsb2dpY2FsIGJsb2NrIHNpemUgc2V0
dGluZyAoaWUgaXQgd2lsbCBuZXZlciBiZSBzbWFsbGVyIHRoYW4gdGhlIGxvZ2ljYWwgYmxvY2sg
c2l6ZSkuDQo+IA0KPiBNYXliZSBoYXZlIGEgbG9vayBhdCBkcml2ZXJzL210ZC91YmkvYmxvY2su
Yy4gVGhlcmUgdGhlIGRyaXZlciB3aWxsDQo+IG1hcCB0aGUgcmVxdWVzdCBvbnRvIGEgc2NhdHRl
cmxpc3QsIGFuZCB0aGVuIGl0ZXJhdGUgb3ZlciB0aGUgc2cgZW50cmllcw0KPiB0byByZWFkIGlu
IHRoZSBkYXRhLg0KPiANCj4gTm90ZTogbWFwcGluZyBvbnRvIGEgc2NhdHRlcmxpc3Qgd2lsbCBj
b2FsZXNjZSBhZGphY2VudCBidmVjcywgc28gb24gdGhlDQo+IHNjYXR0ZXJsaXN0IHlvdSB3aWxs
IGZpbmQgb25seSBjb250aWd1b3VzIHNlZ21lbnRzIHdoaWNoIGFkaGVyZSB0byB0aGUNCj4gbG9n
aWNhbCBibG9jayBzaXplIGxpbm1pdGF0aW9ucy4NCg0KSG93IGNhbiB0aGlzIGhhcHBlbj8gRnJv
bSBhYm92ZSwgeW91IGNvdWxkIGhhdmUgYSBidmVjIHdoZXJlIGl0IGNvbnRhaW5zIG9ubHkNCm9u
ZSBzZWN0b3IuIFNvIGl0IHdpbGwgYWx3YXlzIGJlIGRpc2NvbnRpZ3VvdXMgaW4gdGVybXMgb2Yg
dGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZS4NCg0KSSd2ZSBsb29rZWQgYXQgdWJpYmxvY2ssIGFuZCB0
aGF0IG9ubHkgd29ya3MgZm9yIHRoYXQgZHJpdmVyIGJlY2F1c2UgaXQncyByZWFkLW9ubHkuDQpU
aGUgTVREIEFQSSBhbGxvd3MgeW91IHRvIHJlYWQgdW5hbGlnbmVkIGJ1ZmZlcnMgKGFsdGhvdWdo
IGl0J3MgaW5lZmZpY2llbnQgc2luY2UNCnlvdSBtYXkgcmUtcmVhZCB0aGUgc2FtZSBwYWdlIG11
bHRpcGxlIHRpbWVzKSwgYnV0IGZvciB3cml0ZXMgdGhlIGRhdGEgbXVzdCBiZQ0KYWxpZ25lZCB0
byB0aGUgcGFnZSBzaXplLg0KDQpJIHRoaW5rIHRoZSBvbmx5IHdheSB0byBzb2x2ZSB0aGlzIGlz
IHRvIGNyZWF0ZSBhIChtdGQtKXBhZ2Utc2l6ZWQgYnVmZmVyIGFuZCBib3VuY2UNCnRoZSBpbmNv
bWluZyBkYXRhIGluIGlmIHRoZSBidmVjIGlzIHNob3J0ZXIgKG9yIGlmIGl0J3MgaW4gaGlnaCBt
ZW1vcnkpLg0KDQotLVNlYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
