Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED07C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 13:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7101161440
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 13:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7101161440
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=kempniu.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooIGBym5x/840YTcfQXZWg/JKmXegrBDO/gzplXUDbE=; b=TTYYM5mvt7erIL
	1jVyanFQokSBAgysxA+PLXO4Cu3av68ALQS3gKX9Wr2yvDyHIBwfLknZg2+vLfmZi4ySwQutWzk6M
	9QwXxS9U90ePdUovjunPJO4YdfUNdSSylR/K46hQv/4fPx3/G+RQeJOVLTL3kUQVMI0w5XE7Q3jHr
	Eo9GD6YrdwdM2Y5YmY8jz/67qvJhx0c7CDrF3MqFU/xX5+y6KebgwifbPBJZ3ObubwZfZXaKTqfhm
	rxJRTfbcSU77+tj0UtqJZdUp/XsoWypwTiI13tFU/Vq/c0Iyr7NL1Zguc2rJ3IshVDN95HpbO3dUW
	74KuFwq/+F0b+3xYpqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVwVt-00EaGO-9V; Thu, 30 Sep 2021 13:54:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVwVq-00EaEd-4a
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 13:54:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id j5so20806885lfg.8
 for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2021 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IdLMxkgri7V5entmZJQNJDz8zpFwVw1y07FV58dcbto=;
 b=ERulCy/fsaITHIG0mWFm3/2gwLLrJI6tKL0vkkC4oD7KAbYsmkiy0BKmIqn/+pfmEJ
 7t3Iah/ieg/J1wCyPzsfIRtmy+TRgB+Ae6DTdkeEIR2hbDFumh9ZZirPQ8GHVfnK3Jr0
 xVnTofriDTprFctoGaE46m/G4WLc1C6m4M0UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IdLMxkgri7V5entmZJQNJDz8zpFwVw1y07FV58dcbto=;
 b=lTtPEiPqLdBuxo06y8EiA33WLjZ2K94XSM3RhNdAuhNfG7AzCPAjQio/N1bpK6tDOM
 o020r929bkntZX6aqJmF0Gy/zsiz/wAif+NEhQqyu5NplK9SrV9JcCllc0HPpWXibPf5
 teOrXKIMwzhLzR01wZ2Ic6b1bfKOoTcc8BnXzg9sWKJN6zY8YHWxGZQsYtTAhbbOpoSo
 TlrwqrnySe0Gd4hjLFSwYdFkIx40J9CVjAE4OJyq4+gRxYprcEaoG2OngWYFKbAng4gR
 nwuyIfKSKoZkpZY+LEDrWnWPAWMwTEA3GGtTYwc5esiOZIVgjrFn07H1xu1qcAlcLOn1
 3POg==
X-Gm-Message-State: AOAM533Ry7gcQaD+dt5b+MP4IkEi8+RekOfPC46BpgV48hJDPJX0TToB
 ow4Xl3I+P5vc1rNn1COP+j0CNORlRKULcAR+
X-Google-Smtp-Source: ABdhPJyjxExAlth6xAb+iGCfadGoFBjFej58ch5RdBRbApgFFu8ZjE/BJ/DbtYOQYm+YD0Ca+M+Kaw==
X-Received: by 2002:a19:f249:: with SMTP id d9mr6080077lfk.229.1633010050307; 
 Thu, 30 Sep 2021 06:54:10 -0700 (PDT)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id 10sm346077ljp.12.2021.09.30.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:54:09 -0700 (PDT)
Date: Thu, 30 Sep 2021 15:54:07 +0200
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: add MEMREAD ioctl
Message-ID: <YVXBf0v0AQ5+G9dt@larwa.hq.kempniu.pl>
References: <20210920070221.10173-1-kernel@kempniu.pl>
 <20210928155859.433844cb@xps13>
 <20210928162402.6bb64fcf@collabora.com>
 <20210928163519.08cd1138@xps13>
 <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
 <20210930085133.13b5a228@collabora.com>
 <20210930104721.03dc45bb@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930104721.03dc45bb@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_065414_281937_F68BC6CF 
X-CRM114-Status: GOOD (  23.98  )
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

PiA+ID4gPiA+IEkgcmVtZW1iZXIgZGlzY3Vzc2luZyBzZWFyY2ggYSBuZXcgUkVBRCBpb2N0bCB3
aXRoIFNhc2NoYSBIYXVlciBhIGZldwo+ID4gPiA+ID4geWVhcnMgYmFjaywgYnV0IEkgY2FuJ3Qg
ZmluZCB0aGUgZGlzY3Vzc2lvbi4uLiAgICAKPiA+ID4gCj4gPiA+IEkgdGhpbmsgdGhpcyBpcyB0
aGUgdGhyZWFkIGluIHF1ZXN0aW9uOgo+ID4gPiAKPiA+ID4gICAgIGh0dHBzOi8vd3d3LmluZnJh
ZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE2LUFwcmlsL3RocmVhZC5odG1sIzY3MDg1
Cj4gPiA+IAo+ID4gPiBJbiBmYWN0LCBpdCBsb29rcyBsaWtlIEJvcmlzIGJlYXQgbWUgdG8gcHJl
cGFyaW5nIGEgZHJhZnQgcGF0Y2ggYWRkaW5nIGEKPiA+ID4gTUVNUkVBRCBpb2N0bCBieSBzb21l
IGZpdmUgeWVhcnM6Cj4gPiA+IAo+ID4gPiAgICAgaHR0cHM6Ly93d3cuaW5mcmFkZWFkLm9yZy9w
aXBlcm1haWwvbGludXgtbXRkLzIwMTYtQXByaWwvMDY3MTg3Lmh0bWwgIAo+ID4gCj4gPiBFeGFj
dGx5IHRoZSBvbmUgSSB3YXMgcmVmZXJyaW5nIHRvLiBOb3RlIHRoYXQgdGhpcyBwYXRjaCBzdGls
bCBjb250YWlucwo+ID4gdGhlIHVuYm91bmRlZCBtYWxsb2Mgd2hpY2ggSSB0aGluayBpcyB3b3J0
aCBmaXhpbmcsIGJ1dCBvdGhlciB0aGFuCj4gPiB0aGF0IGFuZCB0aGUgYWRkaXRpb24gb2YgRUND
IHN0YXRzLCBpdCBsb29rcyBwcmV0dHkgc2ltaWxhciB0byB5b3Vycy4KClJpZ2h0LCB0aGFua3Mu
Cgo+ID4gPiBJIGd1ZXNzIHRoZSBiaWcgcXVlc3Rpb24gZnJvbSBteSBwZXJzcGVjdGl2ZSBpczog
c2hvdWxkIEkgcmV2aXZlIEJvcmlzJwo+ID4gPiBvcmlnaW5hbCBlZmZvcnQgb24gdGhlIE1FTVJF
QUQgaW9jdGwgKHdoaWNoIHJldHVybnMgbW9yZSBkZXRhaWxlZAo+ID4gPiBiaXRmbGlwIHN0YXRz
IGluIHRoZSBzdHJ1Y3R1cmUgcGFzc2VkIGJ5IHVzZXIgc3BhY2UpIG9yIHdvdWxkIHRoYXQgYmUg
YQo+ID4gPiB3YXN0ZSBvZiB0aW1lIGJlY2F1c2UgdGhlIHN1YnN5c3RlbSB3aWxsIGJlIHN3aXRj
aGVkIG92ZXIgd2hvbGVzYWxlIHRvIGEKPiA+ID4gbmV3IHdheSBvZiBkb2luZyBJL08gKG10ZF9p
b19vcCkgaW4gdGhlIGZvcmVzZWVhYmxlIGZ1dHVyZSBhbmQgdGhlcmVmb3JlCj4gPiA+IGV4cG9z
aW5nIHlldCBhbm90aGVyIGlvY3RsIHRvIHVzZXIgc3BhY2UgdG9kYXkgd291bGQgYmUgZnJvd25l
ZCB1cG9uPwo+ID4gPiAgIAo+ID4gCj4gPiBUaGF0J3Mgbm90IG15IGNhbGwgdG8gbWFrZSwgYnV0
IEkgdGhpbmsgdGhvc2UgMiB0aGluZ3MgYXJlIG9ydGhvZ29uYWwKPiA+IGFuZCBjYW4gYmUgYWRk
cmVzc2VkIHNlcGFyYXRlbHkuCj4gCj4gQWdyZWVkLgoKVGhhbmsgeW91IGJvdGggLSBpdCBzb3Vu
ZHMgbGlrZSBJIHNob3VsZCBzdGFydCB3b3JraW5nIG9uIGEgdjIgdGhhdCB3aWxsCm1ha2UgdGhl
IG5ldyBNRU1SRUFEIGlvY3RsIHJldHVybiBtb3JlIGRldGFpbGVkIEVDQyBzdGF0aXN0aWNzIHRv
IHVzZXIKc3BhY2UuCgpCb3JpcywgSSB0aGluayBhIFN1Z2dlc3RlZC1ieSB0YWcgY3JlZGl0aW5n
IHlvdSBpcyBpbiBvcmRlciBmb3IgYm90aCB0aGUKdW5ib3VuZGVkIG1hbGxvYyBpc3N1ZSBhbmQg
dGhlIE1FTVJFQUQgaW9jdGwsIGJ1dCBzdWJtaXR0aW5nLXBhdGNoZXMucnN0CnNheXMgSSBzaG91
bGQgbm90IGFkZCB0aGlzIHRhZyB3aXRob3V0IHlvdXIgcGVybWlzc2lvbi4gIFNvLCBhcmUgeW91
Cm9rYXkgd2l0aCBtZSBhZGRpbmcgaXQ/CgpNaXF1ZWwsIGFzIGZvciB0aGUgdW5ib3VuZGVkIG1h
bGxvYyBpc3N1ZSwgc2hvdWxkIEkgYWRkcmVzcyB0aGlzIGluIGEKc2VwYXJhdGUgKHByZWxpbWlu
YXJ5KSBwYXRjaCBvciByYXRoZXIgc3VibWl0IGEgdHdvLXBhdGNoIHYyIHNlcmllcwoodW5ib3Vu
ZGVkIG1hbGxvYyBmaXggKyBuZXcgTUVNUkVBRCBpb2N0bCk/CgotLSAKQmVzdCByZWdhcmRzLApN
aWNoYcWCIEvEmXBpZcWECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
