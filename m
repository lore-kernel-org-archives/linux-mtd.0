Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710F8C43603
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 12:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416A82146E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 12:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H0adj5HK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="WBxNdLsK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416A82146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lk5RiahtJgC+p1hzqRrHU6ppOByw8amEAa6V7MdKCU8=; b=H0adj5HKg3fAvE1N+5ltZ8ttm
	q+bpkumBwpRSTtGLbTyROxwHNhTwn7i7/f0U+9t54K0YJIusRQFRgpG5vhtD3258ENKMQowPgXP/V
	2BIHwIJOPFDf2woraj8f+27sU8CtjFg1809JWU04K48bgEECfH0ds0j4FvpEG9gojMle+UDRqCmWD
	wvXV6IpxoJIxBmBK/2koW8cxeolUjG4nk3VdrXfd41Yse49qaZlf3Kt1nfVr85y0mUDL0JavH8eT3
	GcKg/pKuxbdutyV2QQ8ToW6qNx5XzqH8zq5LPnUjX7FpGLnlUh46UereHEu081d3hn58sKe/v01YV
	VlutlwjzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiHgH-0007pQ-3a; Fri, 20 Dec 2019 12:46:57 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiHgD-0007nn-Su
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 12:46:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6D56123D1F;
 Fri, 20 Dec 2019 13:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1576846005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrX8218OZlK1OdarzjqvWdw/65Ksoux5IbNS+/y+8TE=;
 b=WBxNdLsKddON8fDuOngYT9aWaqD8OK10kkTHtAcjAiHlYv7llsmLpvhqbamS4C1dZQPjBD
 ikjLCAjK28tl/KKgfkgOS8iBDDou6hkY/ifKISm8BpyY2r0GkSsY6F69i2GfMp4A/2HPKP
 3Uq08nQc7zBAb6uwpsEqEMvPyVzL4jc=
MIME-Version: 1.0
Date: Fri, 20 Dec 2019 13:46:40 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: document new flag
In-Reply-To: <2dfc30a7-3261-d783-8256-f72458a0141b@ti.com>
References: <20191214191943.3679-1-michael@walle.cc>
 <556fe468-0080-ad05-8228-5ff8f1b3dac6@ti.com>
 <af3692dba69e85fa8136ab3d170bef39@walle.cc>
 <2dfc30a7-3261-d783-8256-f72458a0141b@ti.com>
Message-ID: <09f5f76eb49a38c4b2960abe688b2892@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 6D56123D1F
X-Spamd-Result: default: False [1.40 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[dt];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; NEURAL_HAM(-0.00)[-0.742];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_044654_096063_FAA0883C 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKCkFtIDIwMTktMTItMTkgMDY6MzMsIHNjaHJpZWIgVmlnbmVzaCBSYWdoYXZl
bmRyYToKPiBIaSBNaWNoYWVsLAo+IAo+IFsuLi5dCj4+Pj4gKy0gbm8tdW5sb2NrIDogQnkgZGVm
YXVsdCwgbGludXggdW5sb2NrcyB0aGUgd2hvbGUgZmxhc2ggYmVjYXVzZSAKPj4+PiB0aGVyZQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcmUgbGVnYWN5IGZsYXNoIGRldmljZXMgd2hpY2gg
YXJlIGxvY2tlZCBieSBkZWZhdWx0Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGFmdGVyIHJl
c2V0LiBTZXQgdGhpcyBmbGFnIGlmIHlvdSBkb24ndCB3YW50IGxpbnV4IHRvCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgIHVubG9jayB0aGUgd2hvbGUgZmxhc2ggYXV0b21hdGljYWxseS4gSW4g
dGhpcyBjYXNlIHlvdQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYW4gY29udHJvbCB0aGUg
bm9uLXZvbGF0aWxlIGJpdHMgYnkgdGhlCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYXNo
X2xvY2svZmxhc2hfdW5sb2NrIHRvb2xzLgo+Pj4+IAo+Pj4gCj4+PiBDdXJyZW50IFNQSSBOT1Ig
ZnJhbWV3b3JrIHVuY29uZGl0aW9uYWxseSB1bmxvY2tzIGVudGlyZSBmbGFzaCB3aGljaAo+Pj4g
SSBhZ3JlZSBpcyBub3QgdGhlIGJlc3QgdGhpbmcgdG8gZG8sIGJ1dCBJIGRvbid0IHRoaW5rIHdl
IG5lZWQKPj4+IG5ldyBEVCBwcm9wZXJ0eSBoZXJlLiBNVEQgY21kbGluZSBwYXJ0aXRpb25zIGFu
ZCBEVCBwYXJ0aXRpb25zIAo+Pj4gYWxyZWFkeQo+Pj4gcHJvdmlkZSBhIHdheSB0byBzcGVjaWZ5
IHRoYXQgYSBwYXJ0aXRpb24gc2hvdWxkIHJlbWFpbiBsb2NrZWRbMV1bMl0KPj4gCj4+IEkga25v
dyB0aGF0IHRoZSBNVEQgbGF5ZXIgaGFzIHRoZSBzYW1lIGtpbmQgb2YgdW5sb2NraW5nLiBCdXQg
dGhhdAo+PiB1bmxvY2tpbmcgaXMgZG9uZSBvbiBhIHBlciBtdGQgcGFydGl0aW9uIGJhc2lzLiBF
Zy4gY29uc2lkZXIgc29tZXRoaW5nCj4+IGxpa2UgdGhlIGZvbGxvd2luZwo+PiAKPj4gwqBtdGQx
IGJvb3Rsb2FkZXLCoCAobG9ja2VkKQo+PiDCoG10ZDIgZmlybXdhcmXCoMKgwqAgKGxvY2tlZCkK
Pj4gwqBtdGQzIGtlcm5lbAo+PiDCoG10ZDQgZW52aXJvbm1lbnQKPj4gCj4+IEZ1cnRoZXIgYXNz
dW1lLCB0aGF0IHRoZSBlbmQgb2YgbXRkMiBhbGlnbnMgd2l0aCBvbmUgb2YgdGhlIHBvc3NpYmxl
Cj4+IGxvY2tpbmcgYXJlYXMgd2hpY2ggYXJlIHN1cHBvcnRlZCBieSB0aGUgZmxhc2ggY2hpcC4g
RWcuIHRoZSBmaXJzdCAKPj4gcXVhcnRlci4KPj4gCj4+IFRoZSBtdGQgbGF5ZXIgd291bGQgZG8g
dHdvIChvciBmb3VyLCBpZiAibG9jayIgcHJvcGVydHkgaXMgc2V0KSAKPj4gdW5sb2NrKCkKPj4g
Y2FsbHMsIG9uZSBmb3IgbXRkMSBhbmQgb25lIGZvciBtdGQyLgo+PiAKPiAKPiAKPj4gTXkgcG9p
bnQgaGVyZSBpcywgdGhhdCB0aGUgbXRkIHBhcnRpdGlvbnMgZG9lc24ndCBhbHdheXMgbWFwIHRv
IHRoZQo+PiBsb2NraW5nIHJlZ2lvbnMgb2YgdGhlIFNQSSBmbGFzaCAoYXQgbGVhc3QgaWYgdGhl
IGFyZSBub3QgbWVyZ2VkIAo+PiB0b2dldGhlcikuCj4+IAo+IAo+IFlvdSBhcmUgcmlnaHQhIFRo
aXMgd2lsbCBiZSBhbiBpc3N1ZSBpZiBleGlzdGluZyBwYXJ0aXRpb25zIGFyZSBub3QKPiBhbGln
bmVkIHRvIGxvY2tpbmcgcmVnaW9ucy4KPiAKPiBJIHRha2UgbXkgY29tbWVudHMgYmFjay4uLiBC
dXQgSSBhbSBub3Qgc3VyZSBpZiBhIG5ldyBEVCBwcm9wZXJ0eSBpcyAKPiB0aGUKPiBuZWVkZWQu
IFRoaXMgZG9lcyBub3QgZGVzY3JpYmUgSFcgYW5kIGlzIHNwZWNpZmljIHRvIExpbnV4IFNQSSBO
T1IKPiBzdGFjay4gSG93IGFib3V0IGEgbW9kdWxlIHBhcmFtZXRlciBpbnN0ZWFkPwo+IE1vZHVs
ZSBwYXJhbWV0ZXIgd29uJ3QgcHJvdmlkZSBwZXIgZmxhc2ggZ3JhbnVsYXJpdHkgaW4gY29udHJv
bGxpbmcKPiB1bmxvY2tpbmcgYmVoYXZpb3IuIEJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgbWF0dGVy
cy4KCkkgZG9uJ3QgYXJndWUgYWdhaW5zdCBoYXZpbmcgYSBrZXJuZWwgcGFyYW1ldGVyLCBidXQg
anVzdCB3YW50aW5nIHRvIApwb2ludApvdXQgYW5vdGhlciBhbHRlcm5hdGl2ZSAod2hpY2ggbWln
aHQgYmUgY29udHJvdmVyc2lhbCk6CgogIC0gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGlzIHVu
bG9ja19hbGwoKSBhdCBhbGwuIEFwcGFyZW50bHkgdGhlcmUgYXJlCiAgICBzb21lIGZsYXNoZXMg
d2hpY2ggaGF2ZSB0aGUgcHJvdGVjdGlvbiBiaXRzIHNldC4gRWl0aGVyIGF0IHN0YXJ0dXAKICAg
IChhbmQgdGhlbiB0aGV5IGFyZSBub24tdm9sYXRpbGUpIG9yIHRoZXkgY29tZSBpbiB0aGF0IHN0
YXRlIG91dCBvZiAKdGhlCiAgICBmYWN0b3J5LiBUaGUgbGF0dGVyIG1ha2VzIGxpdHRsZSBzZW5z
ZSBJTUhPLgoKICAtIEFjdHVhbGx5LCBhbGwgbmV3ZXIgZmxhc2hlcyB3ZSd2ZSB1c2VkIGhhdmUg
dGhlc2UgYml0cyBub24tdm9sYXRpbGUgCmFuZAogICAgYXJlIHVubG9ja2VkIGJ5IGRlZmF1bHQu
CgpTbyBjYW4ndCB3ZSBoYXZlIGEgd2hpdGVsaXN0IChpZS4gYSBuZXcgZmxhZyBpbiB0aGUgc3Bp
X25vcl9pZHMpIHdoaWNoCnN1cHJlc3NlcyB0aGUgdW5sb2NrIGlmIHRoZXkgaGF2ZW4ndCBhbnkg
YmxvY2sgcHJvdGVjdGlvbnMgYml0IHNldAphY2NvcmRpbmcgdG8gdGhlIG1hbnVhbD8gQmVjYXVz
ZSBpbiB0aGlzIGNhc2UgdGhlIHVubG9ja2luZyBtYWtlcyBuZXZlcgpzZW5zZSBJTUhPLgoKLW1p
Y2hhZWwKCj4gCj4gVHVkb3IsCj4gCj4gWW91IGhhZCBhIHBhdGNoIGRvaW5nIHNvbWV0aGluZyBz
aW1pbGFyLiBEb2VzIG1vZHVsZSBwYXJhbSBzb3VuZCBnb29kIAo+IHRvCj4geW91PwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
