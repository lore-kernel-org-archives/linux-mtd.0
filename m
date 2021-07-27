Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0C9C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 08:50:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C946124B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 08:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34C946124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uoxh5QqJ20Tnq1REJnUH28fWx9MdcKDawdjP3H7EuNg=; b=r4sO/aoW0GslolmrCHi+QOPGP5
	VA9HcApgWejtH5X8geVUyWqcg1LLgzdCc6w3rBAFicvgXchWQgT0vIx5YQTrZSsy+uCtyJUNSOHHC
	CFaO2UP1EyrQfNgmoexwMZZJ2hYydpYeW65UU9TbwawLa48JmuwA3iJCE4ADmw7PxC/+XHyrslN5h
	2qz6M0Hf5XcQ52pW4SzJgo41IGjBSj06gOlzC1mRpJveubT2wy/xsJKTqH4HFlzKb/0r9go3prJ1D
	KhuQjl4oQgmJdRRHb3k2AeYAE66pGVHdbopkpni6f5uLX7pqBETF+w9I6HBALyJ5oR1Jn6/RiNs1J
	pGXP8KZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Ime-00E77O-C5; Tue, 27 Jul 2021 08:49:52 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ImJ-00E74f-Qv; Tue, 27 Jul 2021 08:49:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5C8B32224A;
 Tue, 27 Jul 2021 10:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627375769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8TtB/u/jLy0EZEf3eBEE7XJjWvF+Smm8dhZHLm9sB4=;
 b=TdBFo92aEFu1394aLOowvWhVtNsQ3no18HpaBIccnoOtSyF2OJKRptHwL1+u8ODzpOdUFr
 9AlJfv5bPMMapTG+XkwLYtosltsfjCHlSCAt6c1naZZAbPX0GilrOhR6n8bHNGII4AaUvR
 Bsad0DSOc75Xd9PD70j/V6XGCQTMm4c=
MIME-Version: 1.0
Date: Tue, 27 Jul 2021 10:49:26 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, p.yadav@ti.com, figgyc@figgyc.uk, mail@david-bauer.net,
 linux@rasmusvillemoes.dk, esben@geanix.com, knaerzche@gmail.com,
 code@reto-schneider.ch, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 heiko.thiery@gmail.com, macromorgan@hotmail.com, sr@denx.de,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v2 35/35] docs: mtd: spi-nor: Add details about how to
 propose a new flash addition
In-Reply-To: <a7a6da4b-7d36-7308-e244-95f476b202f8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-36-tudor.ambarus@microchip.com>
 <4304e19f3399a0a6e856119d01ccabe0@walle.cc>
 <a7a6da4b-7d36-7308-e244-95f476b202f8@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6eb1b7a05c9a0c0eb8c8c73f11c39218@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_014932_075603_890BD0E1 
X-CRM114-Status: GOOD (  15.68  )
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

QW0gMjAyMS0wNy0yNyAxMDowOSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gNy8yNy8yMSAxMDoyMiBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyAKPj4gdGhlIGNvbnRlbnQgaXMgc2FmZQo+PiAKPj4gQW0gMjAyMS0wNy0yNyAwNjo1Miwg
c2NocmllYiBUdWRvciBBbWJhcnVzOgo+Pj4gQWRkIHNvbWUgZ3VpZGVsaW5lc3Mgb24gaG93IHRv
IHByb3Bvc2UgYSBuZXcgZmxhc2ggYWRkaXRpb24uCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IFR1
ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4KPj4+IC0tLQo+Pj4gwqBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0IHwgNjUgCj4+PiArKysrKysr
KysrKysrKysrKysrKysrKysKPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykK
Pj4+IAo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tdGQvc3BpLW5v
ci5yc3QKPj4+IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL210ZC9zcGktbm9yLnJzdAo+Pj4g
aW5kZXggNGEzYWRjYTQxN2ZkLi5mZmI4ZDk3YTI3NjYgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0Cj4+IFsuLl0KPj4+ICtFdmVyeSBuZXcgZmxhc2gg
YWRkaXRpb24gdGhhdCBkZWZpbmUgdGhlIFNGRFAgdGFibGVzLCBzaG91bGQgaGV4ZHVtcAo+Pj4g
aXRzIFNGRFAKPj4+ICt0YWJsZXMgaW4gdGhlIHBhdGNoJ3MgY29tbWVudCBzZWN0aW9uIGJlbG93
IHRoZSAtLS0gbGluZSwgc28gdGhhdCB3ZQo+Pj4gY2FuCj4+PiArcmVmZXJlbmNlIGl0IGluIGNh
c2Ugb2YgSUQgY29sbGlzaW9ucy4KPj4gCj4+IE5pY2UsIGJ1dCBjb3VsZCB5b3UgYWRkIHNvbWUg
Z3VpZGVsaW5lcyBob3cgdG8gZG8gaXQ/IFRoYXQgaXMgdGhlIAo+PiBleGFjdAo+PiBjb21tYW5k
cywgbWF5YmUgd2l0aCBhIG5vdGljZSBvbmUgc2hvdWxkIHVzZSB0aGVzZSB3aGVuZXZlciBwb3Nz
aWJsZS4gCj4+IEkKPj4gd2FudCB0byBwcmV2ZW50IGhhdmluZyBhbGwgc29ydHMgb2YgdmFyaWF0
aW9ucyBvZiB0aGUgb3V0cHV0IGFuZCBJIAo+PiB3YW50Cj4+IHRvIGJlIGFibGUgdG8gcmV2ZXJz
ZSB0aGUgb3BlcmF0aW9uIGFuZCB2ZXJpZnkgaXQuCj4gCj4gb2ssIHdpbGwgZG8KPiAKPj4gCj4+
ICMgeHhkIC1wIC9wYXRoL3RvL3NmZHAKPj4gIyBtZDVzdW0gL3BhdGgvdG8vc2ZkcAo+IAo+IG1h
eWJlIHNoYTFzdW0gaGVyZT8KCnN1cmUsIHRoYXQgb25lIGRvZXNuJ3QgcmVhbGx5IG1hdHRlci4g
YW55ICpzdW0gd2lsbCB3b3JrLgoKPj4gIyBjYXQgL3BhdGgvdG8vamVkZWNfaWQKPj4gIyBjYXQg
L3BhdGgvdG8vcGFydG5hbWUKPj4gIyBjYXQgL3BhdGgvdG8vbWFudWZhY3R1cmVyCj4+IAo+IAo+
IFdpbGwgYWRkIHNvbWUgc2hvcnQgZXhhbXBsZXMgb2YgbXRkX2RlYnVnIGFuZCB0aGUgZXJhc2Us
IHZlcmlmeSwKPiB3cml0ZSwgcmVhZCBiYWNrCj4gYW5kIGNvbXBhcmUgdG9vLgo+IAo+IERvIHlv
dSBoYXZlIHNvbWUgbG9ja2luZyB0ZXN0IGV4YW1wbGVzPyBJJ2xsIGhhdmUgdG8gY2hlY2sgdGhv
c2UgdG9vLgoKTm90IHJlYWxseSwgSSB1c3VhbGx5IGNoZWNrIHRoZSBsb2NraW5nIGJ5IGxvb2tp
bmcgYXQgdGhlIEJQIGJpdHMsCmJ1dCB0aGVyZSBpcyBubyBlYXN5IG1ldGhvZCB0byBsb29rIGF0
IHRoZW0gaW4gbGludXguCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
