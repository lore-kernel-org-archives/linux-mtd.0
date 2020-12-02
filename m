Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD44CC64E8A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 11:27:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4151722206
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 11:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4151722206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x6XCD45NOvD5Zcwkb5XycTvbsZ5ktD08obdCmlGmwDg=; b=dp0CxGg/p+driWHZ65JzHJ8aR
	A4xjPuRiOR+QPwEpmgX2ixmTgE47YByCexj4cAlgcuGNJECrnn9OTT01s7trcWZu7k4lOFmdMZA+H
	LFKnRfnz/gqwhaNRSalDHfeK14v8ok0iI+CwhE8YNL+WGQdohi0CdGHZeS5GZz5Mt6bbS3mh1lkzV
	op2oR3A6ZhMwFELAz+Buhp3ADy4n0jvccuIv5flt19Xi/3P17gjmLXj3LpVUmGzxiOSERNl/ImWeE
	7y3AFeQd57VRRTwVwbKDIGcsDOwhGka/ew/dkT3UV6o9GXBYiov0wdVGYAidcI9b0caMpptwU44PC
	KfyJeMjbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkQGs-0004jJ-Fz; Wed, 02 Dec 2020 11:26:06 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkQGn-0004iF-Al
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 11:26:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2269A23E43;
 Wed,  2 Dec 2020 12:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606908354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGdaTb8+n/eu9mBaZ6S/gg5++a3lVOaPda1flJn9YFI=;
 b=S1jljpozSrGwR68R9kAGotK4F+MWcsrKJxK0FFbdStXZk3WsdPPzqBMnBw0lVlZnHIouLm
 kww2/tDroMZEzGu58ymBf3u4cYE3YgVz79b5ndS0uI1DFo0QHZ7LNrmIOAuWp7GheKw9Hp
 U0+dhyg/k+Jyf/xwBfYUucRiLRsRP/w=
MIME-Version: 1.0
Date: Wed, 02 Dec 2020 12:25:49 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v6 5/5] mtd: spi-nor: keep lock bits if they are
 non-volatile
In-Reply-To: <8e0a6a20-2779-9397-eedf-02518b4a0e5a@microchip.com>
References: <20201126202614.5710-1-michael@walle.cc>
 <20201126202614.5710-6-michael@walle.cc>
 <432b31a7-2560-3b83-44d2-aa82c2e322ae@microchip.com>
 <46c99138eb6ce251bc741d358388c219@walle.cc>
 <8e0a6a20-2779-9397-eedf-02518b4a0e5a@microchip.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <fe04f234584c2f459e865955b0d09303@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_062601_648307_6E1EB5D2 
X-CRM114-Status: GOOD (  11.87  )
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

QW0gMjAyMC0xMi0wMiAxMjoxMCwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMTEvMzAvMjAgNDozOCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKWy4uXQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCAqIGluZGljYXRlZCBieSBTTk9SX0ZfV1BfSVNfVk9MQVRJTEUuCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgICovCj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05G
SUdfTVREX1NQSV9OT1JfV1BfRElTQUJMRSkgfHwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KElTX0VOQUJMRUQoQ09ORklHX01URF9TUElfTk9SX1dQX0RJU0FCTEVfT05fVk9MQVRJTEUpIAo+
Pj4+ICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5mbGFncyAmIFNOT1JfRl9X
UF9JU19WT0xBVElMRSkpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIg
PSBzcGlfbm9yX3VubG9ja19hbGwobm9yKTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoZXJyKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIobm9yLT5kZXYsICJGYWlsZWQgdG8gdW5sb2NrIHRoZSAKPj4+PiBl
bnRpcmUKPj4+PiBmbGFzaCBtZW1vcnkgYXJyYXlcbiIpOwo+Pj4gCj4+PiBkZXZfZGJnIGZvciBs
b3cgbGV2ZWwgaW5mbwo+PiAKPj4gSXMgdGhpcyBsb3cgbGV2ZWwgaW5mbyBvciBhbiBhY3R1YWwg
ZXJyb3I/IFdoaWNoIHJhaXNlcyB0aGUgcXVlc3Rpb246Cj4+IHNob3VsZCBzcGlfbm9yX3VubG9j
a19hbGwoKSBpbiBjYXNlIFNXUkQgY291bGRuJ3QgYmUgY2xlYXJlZCBhbmQgdGh1cwo+PiBzaG91
bGQgYWxsIHRoZSBzcGlfbm9yX2luaXQgZmFpbCBvZiB0aGlzPyBPciBzaG91bGQgaXQgcmF0aGVy
IGJlIGEKPiAKPiB5ZXMsIGl0IHNob3VsZCwgYmVjYXVzZSB0aGUgZmxhc2ggd2lsbCBub3Qgd29y
ayBhcyBleHBlY3RlZC9yZXF1ZXN0ZWQuCgpPbmUgY291bnRlcmFyZ3VtZW50OiB0YWtlIG91ciBz
bDI4IGJvYXJkLCBpdCBoYXMgYSBoYXJkd2FyZSAKd3JpdGUtcHJvdGVjdGVkClNQSSBmbGFzaC4g
SXQgYWN0dWFsbHkgd29ya3MgcmlnaHQgbm93IGJlY2F1c2UgdGhlIHdyaXRlX3NyX2FuZF9jaGVj
aygpCmRvZXNuJ3Qgd29yayBhcyBpbnRlbmRlZCBhbmQgZG9lc24ndCBjaGVjayB3aGF0IGlzIHdy
aXR0ZW4uIFNvIGlmIHlvdSdkCmZpeCB0aGF0IChhbmQgdGhlc2UgY2hhbmdlcyB3b3VsZCBiZSBi
YWNrcG9ydGVkIHRvIHRoZSBzdGFibGUgdHJlZXMpLCAKeW91J2QKYmFzaWNhbGx5IGJyZWFrIHNw
aS1ub3Igb24gdGhlc2UgYm9hcmRzLiBBbmQgdGhpcyBfbXVzdF8gYmUgdGhlIGNhc2UgZm9yCmFs
bCBib2FyZHMgd2hpY2ggYXJlIGFjdHVhbGx5IHVzaW5nIChoYXJkLSBvciBzb2Z3YXJlKSB3cml0
ZS1wcm90ZWN0aW9uLgpUaGF0IGlzIHRoZSBvbmx5IHdheSB3cml0ZS1wcm90ZWN0aW9uIG1ha2Vz
IHNlbnNlIHByaW9yIHRvIHRoaXMgcGF0Y2gKc2VyaWVzLiBCZWNhdXNlIGxpbnV4IHdpbGwgaGFw
cGlseSB1bmxvY2sgZXZlcnkgZmxhc2ggb24gc3RhcnR1cC4gClRoZXJlZm9yZSwKdGhlIGhhcmR3
YXJlIHdyaXRlIHByb3RlY3Rpb24gaXMgdGhlIG9ubHkgbWVhc3VyZSBhZ2FpbnN0IHRoaXMuCgot
bWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
