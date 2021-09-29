Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7967C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 19:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACCA61439
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 19:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ACCA61439
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=kempniu.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpISr6CQglPglZxnPUUSuz47yd80ZIWy4sRfmFR528M=; b=o/uLh5UXXvBL4N
	xivJSoHFZ91vCZT0GO/Sq4EhyGU2KdX5PXkTuiJIrQGVMsr4PZFmkb9RzBo6VoaRrJvqgABnDOzC3
	tixKv7aM9AzIvWJYsk6VT4s5mqpnK2A8R/xLz2byzJoEgv/bwTsR/H00DNlTS+QAxEteCeAhUqRh1
	oAzDxxEvcSrJZCLqv929m6p7ZL56u8Pu41MuQ2f8H7UBDDXTXtXyYoNFLf93y/xoItWkPgsS/6391
	xLWByd3QndmQq4urkxUsrBtNcdKNEC3PImBz1k84BN5ZIaW4ydbeJ5yC/0hkuFqQmit4b+5mRuBfT
	XR6fNUp8+zctK8evZifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVfTN-00CCdr-Tn; Wed, 29 Sep 2021 19:42:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVfTK-00CCd5-5k
 for linux-mtd@lists.infradead.org; Wed, 29 Sep 2021 19:42:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id u18so15314288lfd.12
 for <linux-mtd@lists.infradead.org>; Wed, 29 Sep 2021 12:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fpTJo9PN19CwOpgH8yiUSJNn3It4EQ9dC+3Al0lph7I=;
 b=tl/tsT2Nrh6yQ+Rl3+dJK0ANroWNYbYFblftSnt7NYLQkg3QBbxlmOGrafH2Y9dq60
 T+9j4Aq0uVfWPZDjwLMqzhISmuzeLywWKwO3tUC6l+6mg1ycYLmEMc/sOK4jSrPbr/cT
 hYvlBN+kCNdan69XerxoD18kxuVU9ZCwThMkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fpTJo9PN19CwOpgH8yiUSJNn3It4EQ9dC+3Al0lph7I=;
 b=RuPsNGM8zTlLSgTIjb2DiU//5PZSP5LlJ7WhnHQwwpfSWMpoEwvctfMYyUTwCZtUOD
 QK9CsA8dhUmv050XHun6Zc8tTmafBcVJlq4SP1abS3OE8KtVrO5S6G6EgtETWBSHjXIl
 x61i6CW4ZOaLO8BHxpssMYlPCJhwVolZYwdXlDoffCRmPZUIGn8Sik+T9XZnluyr48Pm
 xnDB5mw4/Mgwc7CV7kUBcFznWeLEiyk3I0aVJXzQ4LbfyOq84Mkj8r2V0gnw9gZMzRBP
 crPjgPNMM9Rs5XCX1qi02arKi8I7SL5F1l3HQNTUTCbhra64pKkvnPg8H1fGZAst2uYy
 BITg==
X-Gm-Message-State: AOAM530bMYpSIuu7PzA9gz1lWTlvFOCVuJ7mwSuPbmHFKknvN4VHbjyL
 bEcyQnOJGvXV41LY1IVRsDBtVA==
X-Google-Smtp-Source: ABdhPJwU4jfdBet2tozUxiHUN7/qai9e5NS39a/T8NwbrMvUA4f4qE1xXnzZqQLEzNTuswAvuUVpCg==
X-Received: by 2002:a05:6512:15a3:: with SMTP id
 bp35mr1436941lfb.11.1632944547503; 
 Wed, 29 Sep 2021 12:42:27 -0700 (PDT)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id 23sm86008ljq.83.2021.09.29.12.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:42:26 -0700 (PDT)
Date: Wed, 29 Sep 2021 21:42:24 +0200
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: add MEMREAD ioctl
Message-ID: <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
References: <20210920070221.10173-1-kernel@kempniu.pl>
 <20210928155859.433844cb@xps13>
 <20210928162402.6bb64fcf@collabora.com>
 <20210928163519.08cd1138@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928163519.08cd1138@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_124230_314969_B13265EC 
X-CRM114-Status: GOOD (  22.70  )
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

TWlxdWVsLCBCb3JpcywKClRoYW5rIHlvdSBib3RoIGZvciB5b3VyIGlucHV0LgoKPiA+IEkgZG8g
YWdyZWUgdGhhdCBhIG5ldyBpbnRlcmZhY2UgaXMgbmVlZGVkLCBidXQgaWYgd2UncmUgYWRkaW5n
IGEgbmV3Cj4gPiBlbnRyeSBwb2ludCwgbGV0J3MgbWFrZSBzdXJlIGl0IGNvdmVycyBhbGwgcG9z
c2libGUgdXNlIGNhc2VzIHdlIGhhdmUKPiA+IG5vdy4gQXQgdGhlIHZlcnkgbGVhc3QsIEkgdGhp
bmsgd2UncmUgbWlzc2luZyBpbmZvIGFib3V0IHRoZSBtYXhpbXVtCj4gPiBudW1iZXIgb2YgY29y
cmVjdGVkIGJpdHMgcGVyIEVDQyByZWdpb24gb24gdGhlIHBvcnRpb24gYmVpbmcgcmVhZC4KPiA+
IFByb3BhZ2F0aW5nIEVVQ0xFQU4gZXJyb3JzIGlzIG5pY2UsIGJ1dCBpdCdzIG5vdCBwcmVjaXNl
IGVub3VnaCBJTUhPLgo+ID4gCj4gPiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgc2VhcmNoIGEgbmV3
IFJFQUQgaW9jdGwgd2l0aCBTYXNjaGEgSGF1ZXIgYSBmZXcKPiA+IHllYXJzIGJhY2ssIGJ1dCBJ
IGNhbid0IGZpbmQgdGhlIGRpc2N1c3Npb24uLi4KCkkgdGhpbmsgdGhpcyBpcyB0aGUgdGhyZWFk
IGluIHF1ZXN0aW9uOgoKICAgIGh0dHBzOi8vd3d3LmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xp
bnV4LW10ZC8yMDE2LUFwcmlsL3RocmVhZC5odG1sIzY3MDg1CgpJbiBmYWN0LCBpdCBsb29rcyBs
aWtlIEJvcmlzIGJlYXQgbWUgdG8gcHJlcGFyaW5nIGEgZHJhZnQgcGF0Y2ggYWRkaW5nIGEKTUVN
UkVBRCBpb2N0bCBieSBzb21lIGZpdmUgeWVhcnM6CgogICAgaHR0cHM6Ly93d3cuaW5mcmFkZWFk
Lm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMTYtQXByaWwvMDY3MTg3Lmh0bWwKCkl0IGlzIGFw
cGFyZW50bHkgdHJ1ZSB0aGF0ICJldmVyeXRoaW5nIHRoYXQgY2FuIGJlIGludmVudGVkIGhhcyBi
ZWVuCmludmVudGVkIi4uLiA6LSkgIEkgZGlkIHNlYXJjaCB0aGUgd2ViIGZvciBleGlzdGluZyBt
ZW50aW9ucyBvZiBhCk1FTVJFQUQgaW9jdGwgYmVmb3JlIHN1Ym1pdHRpbmcgbXkgcGF0Y2gsIGJ1
dCB0aGlzIHRocmVhZCBkaWQgbm90IHR1cm4KdXAgaW4gdGhlIHJlc3VsdHMgOigKCkFueXdheSwg
YmFjayBpbiAyMDE2LCBTYXNjaGEgaGludGVkIHRoYXQgaGUgbWlnaHQgbW92ZSBmb3J3YXJkIHdp
dGggdGhlCmRyYWZ0IHByZXBhcmVkIGJ5IEJvcmlzOgoKICAgIGh0dHBzOi8vd3d3LmluZnJhZGVh
ZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE2LUFwcmlsLzA2NzIxNS5odG1sCgpidXQgSSBj
YW5ub3QgZmluZCBhbnkgcmVsYXRlZCBzdWJtaXNzaW9ucyBmcm9tIFNhc2NoYSBpbiBsaW51eC1t
dGQncwpQYXRjaHdvcmsuCgo+IFdlIGFsc28gZGlzY3Vzc2VkIGEgbXRkX2lvX29wIHNvbWUgdGlt
ZSBhZ28sIHdoaWNoIHdvdWxkIGVxdWl2YWxlbnRseQo+IHJlcGxhY2UgbXRkX29vYl9vcHMgYXQg
c29tZSBwb2ludCwgaW5jbHVkaW5nIG1vcmUgaW5mb3JtYXRpb24gc3VjaCBhcwo+IHRoZSBiaXRm
bGlwcyB3aGljaCBoYXBwZW5lZCBvbiBldmVyeSBjaHVuayBpbnN0ZWFkIG9mIHRoZSBpbmZvcm1h
dGlvbgo+IHJlZ2FyZGluZyB0aGUgbWF4aW11bSBudW1iZXIgb2YgYml0ZmxpcHMgaW4gb25lIG9m
IHRoZSBjaHVua3Mgb25seS4KCklzIHRoYXQgZGlzY3Vzc2lvbiBhdmFpbGFibGUgb25saW5lPyAg
U2VhcmNoIGVuZ2luZXMgc2VlbSB0byBiZQpvYmxpdmlvdXMgdG8gdGhhdCB0ZXJtLCB3aGljaCBt
YWtlcyBpdCBoYXJkIGZvciBtZSB0byBnZXQgYWNxdWFpbnRlZAp3aXRoIHRoYXQgaWRlYSBhbmQv
b3IgdG8gY29tbWVudCBvbiBpdCA7KQoKPiBJSVJDIHRoZSBwb2ludCB3YXMgdG8gZ2V0IHJpZCBv
ZiB0aGUgbXRkX3tyZWFkLHdyaXRlfXssX29vYn0gaG9va3MgYW5kCj4gc3RydWN0dXJlcyBpbiBm
YXZvciBvZiBhIG1vcmUgcm9idXN0IGFuZCBjb21wbGV0ZSBzZXQgb2Ygb3BlcmF0aW9ucy4KClRo
YXQgc291bmRzIGxpa2UgYSBtYWpvciBvdmVyaGF1bCwgcmlnaHQ/CgpJIGd1ZXNzIHRoZSBiaWcg
cXVlc3Rpb24gZnJvbSBteSBwZXJzcGVjdGl2ZSBpczogc2hvdWxkIEkgcmV2aXZlIEJvcmlzJwpv
cmlnaW5hbCBlZmZvcnQgb24gdGhlIE1FTVJFQUQgaW9jdGwgKHdoaWNoIHJldHVybnMgbW9yZSBk
ZXRhaWxlZApiaXRmbGlwIHN0YXRzIGluIHRoZSBzdHJ1Y3R1cmUgcGFzc2VkIGJ5IHVzZXIgc3Bh
Y2UpIG9yIHdvdWxkIHRoYXQgYmUgYQp3YXN0ZSBvZiB0aW1lIGJlY2F1c2UgdGhlIHN1YnN5c3Rl
bSB3aWxsIGJlIHN3aXRjaGVkIG92ZXIgd2hvbGVzYWxlIHRvIGEKbmV3IHdheSBvZiBkb2luZyBJ
L08gKG10ZF9pb19vcCkgaW4gdGhlIGZvcmVzZWVhYmxlIGZ1dHVyZSBhbmQgdGhlcmVmb3JlCmV4
cG9zaW5nIHlldCBhbm90aGVyIGlvY3RsIHRvIHVzZXIgc3BhY2UgdG9kYXkgd291bGQgYmUgZnJv
d25lZCB1cG9uPwoKLS0gCkJlc3QgcmVnYXJkcywKTWljaGHFgiBLxJlwaWXFhAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
