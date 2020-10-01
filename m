Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2FEC4741F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 12:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17F221481
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 12:27:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yR/nj8+Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="SfPB4RzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17F221481
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ove7TjtlfJaowhNTf9pdW81Nv9NIAwo2jKn7rPxz6HE=; b=yR/nj8+QTSD64iDjBU3KOZFLw
	aJEJnMUo23USRm2m5eFPtC7tM2G919Uy7Ozx5mL/pRFZINyklQWM4uOVN8/FrTp0Y/B3J+xjPwaR0
	5xjmskskJutJzE4d8EA6r7qTmlcdta8V25KlUVUZOA5hn8P+CeSYW29LFZl4zTQxQBBkGnz+xW1hi
	+rLEBJnazhBSvHCv6gQGA2C2UQJaXm7BWy+/ePuwUBaKA00jjlvrwjriHs7lEWg1/y8wqHxYbAy7w
	dTpG3Oe9Dvxupbj4klh9L23raiTo+K3OAUlBoFcUEUeb+suGrA+sFuAIj8BkOcnmMeTP+efBNDONq
	VRtYamZKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNxfg-0002CA-TZ; Thu, 01 Oct 2020 12:26:52 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNxfb-0002B9-P5
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 12:26:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 14FD422F99;
 Thu,  1 Oct 2020 14:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601555204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlhjVwPQ/MXstwRRmKyPtrXhpk9JTYKjp4oRrLNhj9E=;
 b=SfPB4RzB3yM0xeJVaFKDk7JH9EDC4SLEA1L+yvV0t3Zg63A6JeYnaQTuVK86ZAKB1JNdlY
 LkS1lSlorI+6AQ0yS6TSMvoPUKdgr1tOWJm2CKPk+mC38hDCD97KJzsas1ubs4sEqw7AvK
 zLx5lDp0ulN26usPwuis+pWLEGQTpKs=
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 14:26:43 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3] mtd: spi-nor: keep lock bits if they are non-volatile
In-Reply-To: <2df08e26-b773-9fa5-fd69-6575d3e50f67@microchip.com>
References: <20200327155939.13153-1-michael@walle.cc>
 <e56c5f60-2f59-f913-6eea-3bf8dd4c0774@microchip.com>
 <a82d1ce203383af149ed77c5fd6c8985@walle.cc>
 <bec5b899-fbd2-1c29-611c-654f17e63dbf@microchip.com>
 <8cbaef6c7565deed1109fe958291d9e0@walle.cc>
 <2df08e26-b773-9fa5-fd69-6575d3e50f67@microchip.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <8eeb398d9252547adeed5470254a68fb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_082648_106628_35AB8233 
X-CRM114-Status: GOOD (  24.92  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpBbSAyMDIwLTEwLTAxIDEzOjQ2LCBzY2hyaWViIFR1ZG9yLkFtYmFydXNAbWlj
cm9jaGlwLmNvbToKPj4gQW0gMjAyMC0xMC0wMSAwOTowNywgc2NocmllYiBUdWRvci5BbWJhcnVz
QG1pY3JvY2hpcC5jb206Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMgCj4+Pj4+PiBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+Pj4+PiBpbmRleCBj
YzY4ZWE4NDMxOGUuLmZkMWMzNmQ3MGExMyAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+
Pj4+Pj4gQEAgLTI5MTYsMjAgKzI5MTYsMzggQEAgc3RhdGljIGludCBzcGlfbm9yX3F1YWRfZW5h
YmxlKHN0cnVjdAo+Pj4+Pj4gc3BpX25vcgo+Pj4+Pj4gKm5vcikKPj4+Pj4+IMKgfQo+Pj4+Pj4g
Cj4+Pj4+PiDCoC8qKgo+Pj4+Pj4gLSAqIHNwaV9ub3JfdW5sb2NrX2FsbCgpIC0gVW5sb2NrcyB0
aGUgZW50aXJlIGZsYXNoIG1lbW9yeSBhcnJheS4KPj4+Pj4+ICsgKiBzcGlfbm9yX2dsb2JhbF91
bnByb3RlY3QoKSAtIFBlcmZvcm0gYSBnbG9iYWwgdW5wcm90ZWN0IG9mIHRoZQo+Pj4+Pj4gbWVt
b3J5IGFyZWEuCj4+Pj4+PiDCoCAqIEBub3I6wqDCoMKgIHBvaW50ZXIgdG8gYSAnc3RydWN0IHNw
aV9ub3InLgo+Pj4+Pj4gwqAgKgo+Pj4+Pj4gwqAgKiBTb21lIFNQSSBOT1IgZmxhc2hlcyBhcmUg
d3JpdGUgcHJvdGVjdGVkIGJ5IGRlZmF1bHQgYWZ0ZXIgYQo+Pj4+Pj4gcG93ZXItb24gcmVzZXQK
Pj4+Pj4+IMKgICogY3ljbGUsIGluIG9yZGVyIHRvIGF2b2lkIGluYWR2ZXJ0ZW50IHdyaXRlcyBk
dXJpbmcgcG93ZXItdXAuCj4+Pj4+PiBCYWNrd2FyZAo+Pj4+Pj4gwqAgKiBjb21wYXRpYmlsaXR5
IGltcG9zZXMgdG8gdW5sb2NrIHRoZSBlbnRpcmUgZmxhc2ggbWVtb3J5IGFycmF5IAo+Pj4+Pj4g
YXQKPj4+Pj4+IHBvd2VyLXVwCj4+Pj4+PiAtICogYnkgZGVmYXVsdC4KPj4+Pj4+ICsgKiBieSBk
ZWZhdWx0LiBEbyBpdCBvbmx5IGZvciBmbGFzaGVzIHdoZXJlIHRoZSBibG9jayBwcm90ZWN0aW9u
Cj4+Pj4+PiBiaXRzCj4+Pj4+PiArICogYXJlIHZvbGF0aWxlLCB0aGlzIGlzIGluZGljYXRlZCBi
eSBTTk9SX0ZfTkVFRF9VTlBST1RFQ1QuCj4+Pj4+PiArICoKPj4+Pj4+ICsgKiBXZSBjYW5ub3Qg
dXNlIHNwaV9ub3JfdW5sb2NrKG5vci0+cGFyYW1zLnNpemUpIGhlcmUgYmVjYXVzZQo+Pj4+Pj4g
dGhlcmUKPj4+Pj4+IGFyZQo+Pj4+Pj4gKyAqIGxlZ2FjeSBkZXZpY2VzIChlZy4gQVQyNURGMDQx
QSkgd2hpY2ggbmVlZCBhICJnbG9iYWwgCj4+Pj4+PiB1bnByb3RlY3QiCj4+Pj4+PiBjb21tYW5k
Lgo+Pj4+Pj4gKyAqIFRoaXMgaXMgZG9uZSBieSB3cml0aW5nIDBiMHgwMDAweHggdG8gdGhlIHN0
YXR1cyByZWdpc3Rlci4gCj4+Pj4+PiBUaGlzCj4+Pj4+PiB3aWxsIGFsc28KPj4+Pj4+ICsgKiB3
b3JrIGZvciBhbGwgb3RoZXIgZmxhc2hlcyB3aGljaCBoYXZlIHRoZXNlIGJpdHMgbWFwcGVkIHRv
IEJQMAo+Pj4+Pj4gdG8KPj4+Pj4+IEJQMy4KPj4+Pj4+ICsgKiBUaGUgdG9wIG1vc3QgYml0IGlz
IHVzdXNhbGx5IHNvbWUga2luZCBvZiBsb2NrIGJpdCBmb3IgdGhlIAo+Pj4+Pj4gYmxvY2sKPj4+
Pj4+ICsgKiBwcm90ZWN0aW9uIGJpdHMuCj4+Pj4+PiDCoCAqLwo+Pj4+Pj4gLXN0YXRpYyBpbnQg
c3BpX25vcl91bmxvY2tfYWxsKHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4+PiArc3RhdGljIGlu
dCBzcGlfbm9yX2dsb2JhbF91bnByb3RlY3Qoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4+Pj4+IMKg
ewo+Pj4+Pj4gLcKgwqDCoCBpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNfTE9DSykKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBzcGlfbm9yX3VubG9jaygmbm9yLT5tdGQs
IDAsIAo+Pj4+Pj4gbm9yLT5wYXJhbXMtPnNpemUpOwo+Pj4+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+
Pj4+Pj4gCj4+Pj4+PiAtwqDCoMKgIHJldHVybiAwOwo+Pj4+Pj4gK8KgwqDCoCBkZXZfZGJnKG5v
ci0+ZGV2LCAidW5wcm90ZWN0aW5nIGVudGlyZSBmbGFzaFxuIik7Cj4+Pj4+PiArwqDCoMKgIHJl
dCA9IHNwaV9ub3JfcmVhZF9zcihub3IsIG5vci0+Ym91bmNlYnVmKTsKPj4+Pj4+ICvCoMKgwqAg
aWYgKHJldCkKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+
PiArCj4+Pj4+PiArwqDCoMKgIG5vci0+Ym91bmNlYnVmWzBdICY9IH5TUl9HTE9CQUxfVU5QUk9U
RUNUX01BU0s7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+PiArwqDCoMKgwqAgKiBE
b24ndCB1c2Ugc3BpX25vcl93cml0ZV9zcjFfYW5kX2NoZWNrKCkgYmVjYXVzZSB3cml0aW5nIAo+
Pj4+Pj4gdGhlCj4+Pj4+PiBzdGF0dXMKPj4+Pj4+ICvCoMKgwqDCoCAqIHJlZ2lzdGVyIG1pZ2h0
IGZhaWwgaWYgdGhlIGZsYXNoIGlzIGhhcmR3YXJlIHdyaXRlCj4+Pj4+PiBwcm90ZWN0ZWQuCj4+
Pj4+PiArwqDCoMKgwqAgKi8KPj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHNwaV9ub3Jfd3JpdGVfc3Io
bm9yLCBub3ItPmJvdW5jZWJ1ZiwgMSk7Cj4+Pj4+PiDCoH0KPj4+Pj4gCj4+Pj4+IFRoaXMgd29u
J3Qgd29yayBmb3IgYWxsIHRoZSBmbGFzaGVzLiBZb3UgdXNlIGEgR0VOTUFTSyg1LCAyKSB0byAK
Pj4+Pj4gY2xlYXIKPj4+Pj4gdGhlIFN0YXR1cyBSZWdpc3RlciBldmVuIGZvciBCUDAtMiBmbGFz
aGVzIGFuZCB5b3UgZW5kIHVwIGNsZWFyaW5nCj4+Pj4+IEJJVCg1KQo+Pj4+PiB3aGljaCBjYW4g
bGVhZCB0byBzaWRlIGVmZmVjdHMuCj4+Pj4+IAo+Pj4+PiBXZSBzaG91bGQgaW5zdGVhZCBpbnRy
b2R1Y2UgYQo+Pj4+PiBub3ItPnBhcmFtcy0+bG9ja2luZ19vcHMtPmdsb2JhbF91bmxvY2soKQo+
Pj4+PiBob29rCj4+Pj4+IGZvciB0aGUgZmxhc2hlcyB0aGF0IGhhdmUgc3BlY2lhbCBvcGNvZGVz
IHRoYXQgdW5sb2NrIGFsbCB0aGUgZmxhc2gKPj4+Pj4gYmxvY2tzLAo+Pj4+PiBvciBmb3IgdGhl
IGZsYXNoZXMgdGhhdCBkZXZpYXRlIGZyb20gdGhlICJjbGVhciBqdXN0IHlvdXIgQlAgYml0cyIK
Pj4+Pj4gcnVsZS4KPj4+PiAKPj4+PiBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8ganVz
dCBzZXQgcGFyYW1zLT5sb2NraW5nX29wcyBmb3IgCj4+Pj4gdGhlc2UKPj4+PiBmbGFzaGVzCj4+
Pj4gdG8gZGlmZmVyZW50IGZ1bmN0aW9ucz8gb3IgZXZlbiBwcm92aWRlIGEgCj4+Pj4gc3BpX25v
cl9nbG9iYWxfdW5wcm90ZWN0X29wcwo+Pj4+IGluCj4+Pj4gY29yZS5jIGFuZCB0aGVzZSBmbGFz
aGVzIHdpbGwganVzdCBzZXQgdGhlbS4gdGhlcmUgaXMgbm8gaW5kaXZpZHVhbAo+Pj4+IHNlY3Rv
cgo+Pj4+IHJhbmdlIGxvY2sgZm9yIHRoZXNlIGNoaXBzLiBqdXN0IGEgbG9jayBhbGwgb3Igbm90
aGluZy4KPj4+IAo+Pj4gSSBsaWtlIHRoZSBpZGVhIG9mIGhhdmluZyBhbGwgbG9ja2luZyByZWxh
dGVkIGZ1bmN0aW9ucyBwbGFjZWQgaW4gYQo+Pj4gc2luZ2xlCj4+PiBwbGFjZSwgdGh1cyB0aGUg
Z2xvYmFsX3VubG9jaygpIHNob3VsZCBiZSBpbnNpZGUgbG9ja2luZ19vcHMgc3RydWN0Lgo+PiAK
Pj4gTXkgcG9pbnQgd2FzIHRoYXQgdGhpcyBnbG9iYWwgdW5sb2NrIHNob3VsZG4ndCBiZSBhIHNw
ZWNpYWwgY2FzZSBmb3IgCj4+IHRoZQo+PiBjdXJyZW50IHNwaV9ub3JfdW5sb2NrKCkgYnV0IGp1
c3QgYW5vdGhlciAiaG93IHRvIHVubG9jayB0aGUgZmxhc2giCj4+IGZ1bmN0aW9uCj4+IGFuZCB0
aHVzIHNob3VsZCByZXBsYWNlIHRoZSBvcmlnaW5hbCB1bmxvY2sgb3AuIEZvciBleGFtcGxlLCBp
dCBpcyAKPj4gYWxzbwo+PiBsaWtlbHkKPj4gdGhhdCB5b3UgbmVlZCBhIHNwZWNpYWwgZ2xvYmFs
IGxvY2sgKGkuZS4gd3JpdGUgYWxsIDEncykuCj4+IAo+PiBzdGF0aWMgaW50IHNwaV9ub3JfZ2xv
YmFsX3VubG9jaygpCj4+IHsKPj4gwqAgd3JpdGVfc3IoMCk7IC8qIGFjdHVhbGx5IGl0IHdpbGwg
YmUgYSByZWFkLW1vZGlmeSB3cml0ZSAqLwo+PiB9Cj4+IAo+PiBzdGF0aWMgaW50IHNwaV9ub3Jf
Z2xvYmFsX2xvY2soKQo+PiB7Cj4+IMKgIHdyaXRlX3NyKDB4MWMpOwo+PiB9Cj4+IAo+PiBzdGF0
aWMgaW50IHNwaV9ub3JfaXNfZ2xvYmFsX2xvY2tlZCgpCj4+IHsKPj4gwqAgcmV0dXJuIHJlYWRf
c3IoKSAmIDB4MWM7Cj4+IH0KPj4gCj4+IGNvbnN0IHN0cnVjdCBzcGlfbm9yX2xvY2tpbmdfb3Bz
IHNwaV9ub3Jfc3JfbG9ja2luZ19vcHMgPSB7Cj4+IMKgwqDCoMKgwqDCoMKgIC5sb2NrID0gc3Bp
X25vcl9nbG9iYWxfdW5sb2NrLAo+PiDCoMKgwqDCoMKgwqDCoCAudW5sb2NrID0gc3BpX25vcl9n
bG9iYWxfbG9jaywKPj4gwqDCoMKgwqDCoMKgwqAgLmlzX2xvY2tlZCA9IHNwaV9ub3JfaXNfZ2xv
YmFsX2xvY2tlZCwKPj4gfTsKPiAKPiBNZWgsIHRoaXMgd291bGQgYmUgdmFsaWQgb25seSBpZiB0
aGUgZmxhc2ggc3VwcG9ydHMgX2p1c3RfIGdsb2JhbCAKPiAodW4pbG9jaywKPiB3aXRob3V0IHN1
cHBvcnRpbmcgbG9ja2luZyBvbiBhIHNtYWxsZXIgZ3JhbnVsYXJpdHkuCgpNb3N0IChhbGw/KSBv
ZiB0aGVzZSBmbGFzaGVzIHdpbGwgc3VwcG9ydCB0aGUgcGVyLXNlY3RvciBwcm90ZWN0aW9uLCAK
d2hpY2gKd2UgZG9lc24ndCBzdXBwb3J0LiBTbyB5ZXMsIHRoaXMgaXMgY3VycmVudGx5IGEgc2hv
cnRjdXQgZm9yIHRoZSBmbGFzaGVzCndoaWNoIHdlcmUgdW5sb2NrZWQgYnkgZGVmYXVsdCBpbiB0
aGUgcGFzdCwgYnV0IGRvZXNuJ3QgZmFsbCBpbnRvIHRoZSBCUApiaXRzIGNhdGVnb3J5LgoKSXQg
ZG9lc24ndCBmZWVsIHJpZ2h0IHRvIGFkZCB0aGlzIGFzIGEgc3BlY2lhbCBjYXNlIHRvIHRoZSBj
dXJyZW50CnNwaV9ub3JfbG9jaygpLCB3aGljaCBpcyByZWFsbHkgYSBzcGlfbm9yX2JwX2xvY2so
KS4gQW5kIHRoaXMgbG9ja2luZwpoYXMgbm90aGluZyB0byBkbyB3aXRoIEJQIGJpdHMuIElmIHRo
ZXJlIHdvdWxkIGJlIHN1cHBvcnQgZm9yIHBlci1zZWN0b3IKcHJvdGVjdGlvbiwgdGhlbiB0aGlz
IHdvdWxkIGVuZCB1cCB0aGVyZS4gQnV0IHRoZXJlIGlzbid0LgoKPiBPdGhlcndpc2UsIHBlb3Bs
ZSB3aWxsCj4gZ2V0IGxhenkgYW5kIGp1c3QgYWRkIHN1cHBvcnQgZm9yIGdsb2JhbCAodW5sb2Nr
KSB3aXRob3V0IGludHJvZHVjaW5nCj4gc29mdHdhcmUgZm9yIHNtYWxsZXIgZ3JhbnVsYXJpdHkg
bG9ja2luZywgd2hpY2ggd291bGQgYmUgYSBwaXR5LgoKSSBjYW4ndCByZWxhdGUgdG8gdGhpcy4g
SWYgcGVvcGxlIG5lZWQgcGVyLXNlY3RvciBsb2NraW5nLCB0aGVyZSB3aWxsCmV2ZW50dWFsbHkg
YmUgY29kZS4gSWYgcGVvcGxlIGp1c3QgbmVlZCBhIHByb3RlY3QgYWxsIG9yIG5vdGhpbmcsIHdl
bGwKdGhlbi4KCj4gSWYgdGhlcmUncyBzdWNoIGEgY2FzZSwgdGhvc2UgZnVuY3Rpb25zIHNob3Vs
ZCBiZSBtYW51ZmFjdHVyZXIvZmxhc2ggCj4gc3BlY2lmaWMuCgpMdWNreSBtZSwgdGhpcyBpcyAo
YXQgdGhlIG1vbWVudCkganVzdCBBdG1lbC4gU28gaXMgaXQgYWNjZXB0YWJsZSwKaWYgSSdsbCBw
dXQgdGhpcyBnbG9iYWwgdW5sb2NrIG9wcyBpbnRvIGF0bWVsLmM/IEkgbWVhbiBldmVudHVhbGx5
LCB0aGlzCndpbGwgYmUgcmVwbGFjZWQgYnkgcHJvcGVyIHBlci1zZWN0b3IgbG9ja2luZy4gSXQg
aXMganVzdCB0aGVyZSB0byAKc3VwcG9ydAp0aGUgZmxhc2hlcyB3aGljaCB3YXMgYWxyZWFkeSB1
bmxvY2tlZCB0aGF0IHdheSBpbiB0aGUgcGFzdC4gSW4gdGVybXMKb2YgYmFja3dhcmQgY29tcGF0
aWJpbGl0eSB0aGVyZSB3b24ndCBiZSBtb3JlIGZsYXNoZXMgd2hpY2ggbmVlZCB0aGlzCmdsb2Jh
bCB1bmxvY2suCgpCdXQgdGhlbiB0aGlzIHJlbGF0ZXMgdG8gdGhlIHF1ZXN0aW9uIGhvdyBJIHNo
b3VsZCBuYW1lIHRoZSBtZW51Y29uZmlnCmNob2ljZXMuIEJlY2F1c2UgdGhlc2UgZmxhc2hlcyBk
b2Vzbid0IGhhdmUgdGhlIGJsb2NrIHByb3RlY3Rpb24gYml0cy4KCi1taWNoYWVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
