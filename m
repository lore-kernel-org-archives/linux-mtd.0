Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3329EC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:47:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39CD61430
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F39CD61430
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E8YA2f34yORfjJaCASEG1nNDEkBt25VAImtFX7rH87c=; b=KnQ4C4zM/D2byEZlPTQR9lELK
	QZQRTjArLTv8o1KnUnSv60EUf5iLSuMM5vFdgPXQW7YUffAx++TeMh8/6k/P1JkgciNBjmUdns8GH
	/d2c8MEE0V98WysAfMZN6YxF82ZDpYhqIihmc/OltrlJqIDOFba7D8BQWI/RZUV47QEJJ5Sg65Mzk
	c9MBR/a/unOIGB+5kuDBzr7acuqDsqBdPzb5xa+JjN3uPdgyaG3hBn2Z+/6ZPpeGwARtdIkrRM/9b
	RzJJiGs2bAas+b6RHR5I+5KI0Z3kl2WAaagUa2rnb25fdSJoXUwxUHcjaxRvivE1m1a5xy04IBzoZ
	fSM0Zk/xw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2Uc-00DoYj-Qv; Mon, 10 May 2021 09:46:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2Ds-00DldO-RU
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=THwsnrL2LqbU3GCuAqEYBRhYnKltLWjw3HoPaUZQaSI=; b=rl8Bq+ikfm22QX0qrVvYs5lp1M
 oxRVouXtw+27tVgT9wqa0vhlZR2e4HZH86QhZ6WzP8gB1/K/nlB3pPrnQXSQBMNZXq70b1hzkbvEW
 HTnX39hcpA9C/MomqP3xI5iYNLlOQJ38PJzvqtgAtaBiU+1DnxvfmvXceHr/RjFh3G4IUVgJOQSkM
 BNO1OqqjyFRyhYdtonzpMkGunEhBqzbdILzi/lMtHaCFDiHqzfEEwfj2gPYyCnVriEZXyk1NFxQlJ
 7qZLgmQihoIuak5EBarmTNZZpZJnLY3Nz7QPwsxgVMyeGEBDR1bBK76xY/+vWJKpiWlgvpiOPh+SM
 6uGlZB9w==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2Do-008SRT-I8
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:29:06 +0000
Received: (qmail 17126 invoked from network); 10 May 2021 09:29:00 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 10 May 2021 09:29:00 -0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
From: David Bauer <mail@david-bauer.net>
Message-ID: <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
Date: Mon, 10 May 2021 11:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_022904_905312_D873032B 
X-CRM114-Status: GOOD (  17.24  )
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

SGkgTWljaGFlbCwKCnRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiA1LzEwLzIxIDEwOjAwIEFN
LCBNaWNoYWVsIFdhbGxlIHdyb3RlCgpbLi4uXQoKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmxh
c2hfaW5mbyBib2hvbmdfcGFydHNbXSA9IHsKPj4gK8KgwqDCoCAvKiBCb0hvbmcgTWljcm9lbGVj
dHJvbmljcyAqLwo+PiArwqDCoMKgIHsgImJoMjVxMTI4YXMiLCBJTkZPKDB4Njg0MDE4LCAwLCA2
NCAqIDEwMjQsIDI1NiwKPiAKPiBJIGNvdWxkbid0IGZpbmQgIkJvSG9uZyIgaW4gSkVQMTA2QkMu
IDB4NjggKHdpdGhvdXQgY29udGludWF0aW9uIGNvZGVzKQo+IGlzICJDb252ZXggQ29tcHV0ZXIi
LiBTbyB0aGlzIGlzIHdyb25nLiBPVE9IIEknbSBub3Qgc3VyZSwgaG93IG1hbnkKPiBTUEkgZmxh
c2hlcyAiY29udmV4IGNvbXB1dGVyIiBoYXZlLCBpZiBhbnkgOykgVGhpcyBjb21wYW55IHdhcyBi
cm91Z2h0Cj4gYnkgSFAgaW4gdGhlIGVuZC4KPiAKPiBJbiBhbnkgY2FzZSwgdGhpcyBwYXRjaCBk
ZXBlbmRzIG9uIGhvdyB3ZSBoYW5kbGUgY29udGludWF0aW9uIGNvZGVzIG9yCj4gaWYgd2UgY2Fu
IGhhbmRsZSB0aGVtIGF0IGFsbC4gT3IgaWYgdGhpcyBmbGFzaCBqdXN0IGxpZSBhYm91dCBpdHMK
PiBtYW51ZmFjdHVyZXIgaWQgYW5kIGRvbid0IGFuZCBDQy4KCkZpcnN0IG9mIGFsbCwgQm9Ib25n
IGFuZCBCb3lhIG1pY3JvZWxlY3Ryb25pY3Mgc2VlbXMgdG8gYmUgdGhlIHNhbWUgY29tcGFueSwg
YXMgdGhlaXIKZGF0YXNoZWV0cyBzZWVtIHRvIGNvcHkgZWFjaCBvdGhlci4gVGhlcmUncyBub3Qg
bXVjaCBpbmZvcm1hdGlvbiBhYm91dCBlaXRoZXIgb2YgYm90aCwKc28gSSdkIHNheSB0aGF0J3Mg
YSBmYWlyIGFzc3VtcHRpb24uCgpSZWdhcmRpbmcgdGhlIGNvbnRpbnVhdGlvbiBjb2RlcywgQm95
YSBpcyBsaXN0ZWQgaW4gYmFuayBuaW5lLCBob3dldmVyIGluIHRoaXMgY2FzZSBJCnNob3VsZCBj
dXJyZW50bHkgcmVhZCBhbiBhbGwgMHg3ZiBJRCBzaG91bGRuJ3QgST8gVGhlIGRhdGFzaGVldCBh
bHNvIG9ubHkgc3BlY2lmaWVzIDMKYnl0ZXMgYXMgYSByZXR1cm4gdmFsdWUgZm9yIHJlZ2lzdGVy
IDB4OWZoIDooCgpCZXN0CkRhdmlkCgo+IAo+IFNlZSBhbHNvOgo+IGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDIxLzIvNy8yMjMKPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9rZXJuZWwv
bXNnMzgwODI2MC5odG1sCj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VD
VF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCj4+ICt9Owo+
PiArCj4+ICtjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9ib2hvbmcg
PSB7Cj4+ICvCoMKgwqAgLm5hbWUgPSAiYm9ob25nIiwKPj4gK8KgwqDCoCAucGFydHMgPSBib2hv
bmdfcGFydHMsCj4+ICvCoMKgwqAgLm5wYXJ0cyA9IEFSUkFZX1NJWkUoYm9ob25nX3BhcnRzKSwK
Pj4gK307Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+IGluZGV4IDA1MjIzMDRmNTJmYS4uMDNhMDViY2U2MjMx
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiBAQCAtMjE5OSw2ICsyMTk5LDcgQEAgaW50IHNwaV9u
b3Jfc3IyX2JpdDdfcXVhZF9lbmFibGUoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4KPj4gwqBzdGF0
aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyICptYW51ZmFjdHVyZXJzW10gPSB7
Cj4+IMKgwqDCoMKgICZzcGlfbm9yX2F0bWVsLAo+PiArwqDCoMKgICZzcGlfbm9yX2JvaG9uZywK
Pj4gwqDCoMKgwqAgJnNwaV9ub3JfY2F0YWx5c3QsCj4+IMKgwqDCoMKgICZzcGlfbm9yX2VvbiwK
Pj4gwqDCoMKgwqAgJnNwaV9ub3JfZXNtdCwKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5oIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmgKPj4gaW5kZXggNGEzZjdm
MTUwYjVkLi5iNzEzMjMzMTcyMzUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5oCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4+IEBAIC00MDksNiAr
NDA5LDcgQEAgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyIHsKPj4KPj4gwqAvKiBNYW51ZmFj
dHVyZXIgZHJpdmVycy4gKi8KPj4gwqBleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZh
Y3R1cmVyIHNwaV9ub3JfYXRtZWw7Cj4+ICtleHRlcm4gY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFu
dWZhY3R1cmVyIHNwaV9ub3JfYm9ob25nOwo+PiDCoGV4dGVybiBjb25zdCBzdHJ1Y3Qgc3BpX25v
cl9tYW51ZmFjdHVyZXIgc3BpX25vcl9jYXRhbHlzdDsKPj4gwqBleHRlcm4gY29uc3Qgc3RydWN0
IHNwaV9ub3JfbWFudWZhY3R1cmVyIHNwaV9ub3JfZW9uOwo+PiDCoGV4dGVybiBjb25zdCBzdHJ1
Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9lc210Owo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
