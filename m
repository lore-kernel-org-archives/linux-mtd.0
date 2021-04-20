Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E038AC43460
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 11:11:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC1F660232
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 11:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC1F660232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QQV25BthLuEA8AXY8OQaZy3vKFK+DmZXIpuShnSm/fI=; b=Jja/6MAna60niP5oilSdidZk0
	Bsl08xEnqxHrYb7v7Mwzg3zZrPeoa1hhQU2PxieLxIlVZjKcZ8vYQou5PaGw4DKmoMx9ruDRZq+0O
	Ce8lXwYWtu3CLu6uF1+tW6Cx3V2oFBis0qXZ9ToeGBiKSouEP03/NjAhQC3H0Exx0IZuXGohXghq4
	RzaMCYn19GWlsrFqA+XWosBqP3otmQ3rAdvwQ2b9Cf6rcYecyg0n7BgdvHJ7AmeIY2hfbN6u6ri41
	svRIy8TsftFw7WuHOR2jtxWSzcgSrDzZcC724noYba/jMGWl0VEATfqD/HZNpIZ/W0zZBqlCxelAF
	W7gKAwZPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYoGC-00BwBz-9t; Tue, 20 Apr 2021 11:09:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYoG2-00BwAo-1V
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 11:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=NTQxMkUmhd2JW6hvVPWqmPMnpoxtERCLx3TqwT+htnc=; b=4MjrLPuHzW4iaFBkXo7q/oatIS
 In8E/N8G6UJYS66eZeFQzL56uNMNbjXxa6TCx4H6femNjfgmkdW0iwAieJm1jMkYufA1MYI1BVlA7
 w7866YacNfrtsEegnGEtMO9QGTyZ+S9GP6fCyyze8Lcn4mKakFNCAzm9ybqhmzNb1DpgaybOfE/d9
 TckxHOLAFUQba43yNtVlrmKxGDEWXVktzPLjBQvxUi5UC9Orp8rNNgbTVO6h/eGehPwzLHmmDkjhy
 12rqtZ9n3H/9fK6JWdhHsSziN6cMRGlsIKXeskbMNBpkannl56uG8zZNNhFT+7jjiiekewUT2hki8
 4/Z1Fc4w==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYoFv-00C3Ol-SB
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 11:09:28 +0000
Received: (qmail 3714 invoked from network); 20 Apr 2021 11:09:12 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 20 Apr 2021 11:09:12 -0000
Subject: Re: [PATCH] mtd: spi-nor: use 4 bit locking for MX25L12805D
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210416162859.94305-1-mail@david-bauer.net>
 <1c9e57343a502c9dcc68977da783dd74@walle.cc>
From: David Bauer <mail@david-bauer.net>
Message-ID: <71259f7e-fd63-c1f0-5e8d-7516d5de25b3@david-bauer.net>
Date: Tue, 20 Apr 2021 13:09:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1c9e57343a502c9dcc68977da783dd74@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_040924_259946_BBAA7B9A 
X-CRM114-Status: GOOD (  21.72  )
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

SGksCgp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKT24gNC8yMC8yMSAxMDo0NCBBTSwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPiBIaSBEYXZpZCwKPiAKPiBBbSAyMDIxLTA0LTE2IDE4OjI4LCBzY2hy
aWViIERhdmlkIEJhdWVyOgo+PiBNYWNyb25peCBNWDI1TDEyODA1RCBzdXBwb3J0cyBsb2NraW5n
IHdpdGggNCBibG9jawo+PiBwcm90ZWN0aW9uIGJpdHMgaW4gaXRzIHN0YXR1cyByZWdpc3Rlci4g
QWRkIHRoZSBjb3JyZXNwb25kaW5nCj4+IGZsYWcgaW4gb3JkZXIgdG8gY2xlYXIgdGhlc2UgYml0
cyB3aGVuIHVubG9raW5nIHRoZSBmbGFzaC4KPj4KPj4gT3RoZXJ3aXNlLCB0aGUgZmxhc2ggbWln
aHQgbm90IGJlIHdyaXRhYmxlIGRlcGVuZGluZyBvbiB0aGUgc3RhdGUKPj4gbGVmdCBieSB0aGUg
Ym9vdGxvYWRlci4KPj4KPj4gVGVzdGVkLW9uOiBVYmlxdWl0aSBVbmlGaSBBQyBMaXRlIChhdGg3
OSkKPj4KPj4gRml4ZXMgY29tbWl0IDYyNTkzY2Y0MGIyMyAoIm10ZDogc3BpLW5vcjogcmVmYWN0
b3IgYmxvY2sgcHJvdGVjdGlvbiBmdW5jdGlvbnMiKQo+IAo+IFN0cmljdGx5IHNwZWFraW5nLCB0
aGlzIGlzIG5vdCBhIGZpeCwgYmVjYXVzZSB0aGVyZSB3YXMgbmV2ZXIKPiBsb2NraW5nIHN1cHBv
cnQgZm9yIG1hY3Jvbml4IGZsYXNoZXMuCgpZb3UncmUgcmlnaHQuIE9uIGEgc2Vjb25kIHJlYWQs
IHRoZSBkZXNjcmlwdGlvbiBpcyBhIGJpdCBvZmYsIHBhcnQgb2YgdGhlIHJlYXNvbgpiZWluZyB0
aGUgcGF0Y2ggd2FzIHBhcnQgb2YgYW5vdGhlciBzZXJpZXMgZnJvbSBtZSBzb21lIG1vdGhzIGFn
by4gSSdsbCBmaXggdGhhdC4KCj4gCj4gVGhpcyBzaG91bGQgYWxzbyBiZSBpbiB0aGUgc3ViamVj
dCwgaXQgc2hvdWxkIHJhdGhlciBiZSAiZW5hYmxlIGxvY2tpbmcKPiBzdXBwb3J0IiBvciBzb21l
dGhpbmcgc2ltaWxhci4KPiAKPiBCdHcuIHRoZXNlIGJpdHMgYXJlIG5vbi12b2xhdGlsZSwgc28g
aWYgeW91ciBib290bG9hZGVyIHdpbGwgc2V0Cj4gdGhlbSBhZ2FpbiwgZGVwZW5kaW5nIG9uIHRo
ZSBmbGFzaCBhbmQgeW91ciByZWJvb3QgY3ljbGVzLCB0aGV5IG1pZ2h0Cj4gd2VhciBvdXQuCgpJ
IGRpZG4ndCBrbmV3IHRoYXQsIHRoYW5rcyBmb3IgdGhpcyBpbmZvcm1hdGlvbi4gU2FkbHkgdGhp
cyBpcyB0aGUgcXVpcmsgb2YKdGhlIGJvb3Rsb2FkZXIgZnJvbSBVYmlxdWl0aS4gU29tZSB2ZXJz
aW9ucyBvZiB0aGVpciBVbmlGaSBhbmQgYWxsIG9mIHRoZWlyCkFpck1heCBzZXJpZXMgYmVoYXZl
IGxpa2UgdGhhdC4KCkJlc3QKRGF2aWQKCj4gCj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEJhdWVy
IDxtYWlsQGRhdmlkLWJhdWVyLm5ldD4KPiAKPiBXaXRoIHRoYXQ6Cj4gUmV2aWV3ZWQtYnk6IE1p
Y2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4gCj4gLW1pY2hhZWwKPiAKPj4gLS0tCj4+
IMKgZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jIHwgMyArKy0KPj4gwqAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jv
bml4LmMKPj4gaW5kZXggMmQzOWRkMzJhNjRlLi5lZDhiNTZhMDEwMmYgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL21hY3Jvbml4LmMKPj4gQEAgLTUwLDcgKzUwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
bGFzaF9pbmZvIG1hY3Jvbml4X3BhcnRzW10gPSB7Cj4+IMKgwqDCoMKgIHsgIm14MjV1NDAzNSIs
wqDCoCBJTkZPKDB4YzIyNTMzLCAwLCA2NCAqIDEwMjQswqDCoCA4LCBTRUNUXzRLKSB9LAo+PiDC
oMKgwqDCoCB7ICJteDI1dTgwMzUiLMKgwqAgSU5GTygweGMyMjUzNCwgMCwgNjQgKiAxMDI0LMKg
IDE2LCBTRUNUXzRLKSB9LAo+PiDCoMKgwqDCoCB7ICJteDI1dTY0MzVmIizCoCBJTkZPKDB4YzIy
NTM3LCAwLCA2NCAqIDEwMjQsIDEyOCwgU0VDVF80SykgfSwKPj4gLcKgwqDCoCB7ICJteDI1bDEy
ODA1ZCIsIElORk8oMHhjMjIwMTgsIDAsIDY0ICogMTAyNCwgMjU2LCBTRUNUXzRLKSB9LAo+PiAr
wqDCoMKgIHsgIm14MjVsMTI4MDVkIiwgSU5GTygweGMyMjAxOCwgMCwgNjQgKiAxMDI0LCAyNTYs
IFNFQ1RfNEsgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9S
X0hBU19MT0NLIHwgU1BJX05PUl80QklUX0JQKSB9LAo+PiDCoMKgwqDCoCB7ICJteDI1bDEyODU1
ZSIsIElORk8oMHhjMjI2MTgsIDAsIDY0ICogMTAyNCwgMjU2LCAwKSB9LAo+PiDCoMKgwqDCoCB7
ICJteDI1cjE2MzVmIizCoCBJTkZPKDB4YzIyODE1LCAwLCA2NCAqIDEwMjQswqAgMzIsCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9EVUFM
X1JFQUQgfAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
