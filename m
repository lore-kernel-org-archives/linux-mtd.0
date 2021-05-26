Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF39FC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5A5B613D7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5A5B613D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtJuIHlK+7oNBWbspp0ueEqG+5YaGYQiQc5xOZUdjFQ=; b=GsZky88sf1t7Ed
	YFEH0HMTMoBx3XM84RPFlHmTC1XmZRSKJrOaNA7n5HYFDHV7qsp8TcgXjVtoxJX83ubQNXyAG9V2X
	B/W32cTRNQnF6tfi8SDiTd7RB23jlYqwnvwknTBP1k9L+JJBBo8+6MIYoYESiYeWp0H/5S1GvN/8f
	PTdOJFYuwM5gmsOJQOjmlPZBMnEbSNaVNzNVzZr+qjGCGdKftwjyNgkxMv/EG35qbLcn18geoj8Ys
	IsSfCJIFDaqTWlXMScKbHmlO600XvK0kZZBV/1cwASnC0JABRlQrZc7YNwYXFDWzv2j01AAN1g6Xv
	3qT12rF3tBDems0YSy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llwui-00FwdD-Lk; Wed, 26 May 2021 17:01:48 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llvfx-00FSQ3-TB; Wed, 26 May 2021 15:42:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B4F50100007;
 Wed, 26 May 2021 15:42:25 +0000 (UTC)
Date: Wed, 26 May 2021 17:42:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: mtd: spinand: add spi nand mtd resume handler
Message-ID: <20210526174224.2b8714fc@xps13>
In-Reply-To: <20210526153016.32653-1-patrice.chotard@foss.st.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_084230_246464_456A45EF 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgo8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPiB3cm90ZSBvbiBXZWQsIDI2IE1h
eSAyMDIxIDE3OjMwOjE2ICswMjAwOgoKPiBGcm9tOiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlz
dG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KCldvdWxkIHlvdSBtaW5kIHRvIHVzZSAiYWRkIFNQ
SS1OQU5EIE1URCByZXN1bWUgaGFuZGxlciIgYXMgdGl0bGU/ICh3aXRoCnVwcGVyIGNhc2UgbGV0
dGVycykKCj4gQWZ0ZXIgcG93ZXIgdXAsIGFsbCBTUEkgTkFORCdzIGJsb2NrcyBhcmUgbG9ja2Vk
LiBPbmx5IHJlYWQgb3BlcmF0aW9ucwo+IGFyZSBhbGxvd2VkLCB3cml0ZSBhbmQgZXJhc2Ugb3Bl
cmF0aW9ucyBhcmUgZm9yYmlkZGVuLgo+IFRoZSBTUEkgTkFORCBmcmFtZXdvcmsgdW5sb2NrcyBh
bGwgdGhlIGJsb2NrcyBkdXJpbmcgaXRzIGluaXRpYWxpemF0aW9uLgo+IAo+IER1cmluZyBhIHN0
YW5kYnkgbG93IHBvd2VyLCB0aGUgbWVtb3J5IGlzIHBvd2VyZWQgZG93biwgbG9zaW5nIGl0cwo+
IGNvbmZpZ3VyYXRpb24uCj4gRHVyaW5nIHRoZSByZXN1bWUsIHRoZSBRU1BJIGRyaXZlciBzdGF0
ZSBpcyByZXN0b3JlZCBidXQgdGhlIFNQSSBOQU5ECj4gZnJhbWV3b3JrIGRvZXMgbm90IHJlY29u
ZmlndXJlZCB0aGUgbWVtb3J5Lgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBzcGkgbmFuZCBtdGQgUE0g
aGFuZGxlcnMgZm9yIHJlc3VtZSBvcHMuCgpkaXR0byAgICAgICAgICAgICBeXl5eXl5eXl5eXl4K
Cj4gU1BJIE5BTkQgcmVzdW1lIG9wIHJlLWluaXRpYWxpemVzIFNQSSBOQU5EIGZsYXNoIHRvIGl0
cyBwcm9iZWQgc3RhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxj
aHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBD
aG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYyB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gaW5kZXggMTdmNjNmOTVmNGEyLi42YWJhZjg3NGViM2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gQEAgLTEwNzQsNiArMTA3NCw2MSBAQCBzdGF0aWMgaW50IHNwaW5hbmRfZGV0ZWN0KHN0cnVj
dCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0
aWMgdm9pZCBzcGluYW5kX210ZF9yZXN1bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gK3sKPiAr
CXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCA9IG10ZF90b19zcGluYW5kKG10ZCk7Cj4g
KwlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOwo+ICsJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXY7Cj4gKwlpbnQgcmV0
LCBpOwo+ICsKPiArCXJldCA9IHNwaW5hbmRfcmVzZXRfb3Aoc3BpbmFuZCk7Cj4gKwlpZiAocmV0
KQo+ICsJCXJldHVybjsKPiArCj4gKwlyZXQgPSBzcGluYW5kX2luaXRfcXVhZF9lbmFibGUoc3Bp
bmFuZCk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJZGV2X2VycihkZXYsCj4gKwkJCSJGYWlsZWQgdG8g
aW5pdGlhbGl6ZSB0aGUgcXVhZCBwYXJ0IChlcnIgPSAlZClcbiIsCgpxdWFkIHBhcnQ/IHdoYXQg
YWJvdXQgIkZhaWxlZCB0byByZXN1bWUgdGhlIHF1YWQgc3RhdGUiIG9yIHNvbWV0aGluZwphbGlr
ZT8KCj4gKwkJCXJldCk7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiArCXJldCA9IHNwaW5hbmRf
dXBkX2NmZyhzcGluYW5kLCBDRkdfT1RQX0VOQUJMRSwgMCk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJ
ZGV2X2VycihkZXYsCj4gKwkJCSJGYWlsZWQgdG8gdXBkdGFlIHRoZSBPVFAgKGVyciA9ICVkKVxu
IiwKCnVwZGF0ZQoKPiArCQkJcmV0KTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICsJcmV0ID0g
c3BpbmFuZF9tYW51ZmFjdHVyZXJfaW5pdChzcGluYW5kKTsKPiArCWlmIChyZXQpIHsKPiArCQlk
ZXZfZXJyKGRldiwKPiArCQkJIkZhaWxlZCB0byBpbml0aWFsaXplIHRoZSBTUEkgTkFORCBjaGlw
IChlcnIgPSAlZClcbiIsCj4gKwkJCXJldCk7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiArCS8q
IEFmdGVyIHBvd2VyIHVwLCBhbGwgYmxvY2tzIGFyZSBsb2NrZWQsIHNvIHVubG9jayB0aGVtIGhl
cmUuICovCj4gKwlmb3IgKGkgPSAwOyBpIDwgbmFuZC0+bWVtb3JnLm50YXJnZXRzOyBpKyspIHsK
PiArCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3BpbmFuZCwgaSk7Cj4gKwkJaWYgKHJl
dCkgewo+ICsJCQlkZXZfZXJyKGRldiwKPiArCQkJCSJGYWlsZWQgdG8gc2VsZWN0IHRoZSB0YXJn
ZXQgKGVyciA9ICVkKVxuIiwKPiArCQkJCXJldCk7Cj4gKwkJCXJldHVybjsKPiArCQl9Cj4gKwo+
ICsJCXJldCA9IHNwaW5hbmRfbG9ja19ibG9jayhzcGluYW5kLCBCTF9BTExfVU5MT0NLRUQpOwo+
ICsJCWlmIChyZXQpIHsKPiArCQkJZGV2X2VycihkZXYsCj4gKwkJCQkiRmFpbGVkIHRvIHVubG9j
ayBibG9jayAoZXJyID0gJWQpXG4iLAo+ICsJCQkJcmV0KTsKPiArCQkJcmV0dXJuOwo+ICsJCX0K
PiArCX0KCkkgYmV0IHRoaXMgd291bGQgZGVzZXJ2ZSBhIGhlbHBlciBhcyB0aGlzIGlzIHRoZSBl
eGFjdCBzYW1lIHBlYWNlIG9mCmNvZGUgdGhhdCBpcyBiZWluZyBydW4gaW4gc3Bpbm5hbmRfaW5p
dCgpPwoKQXQgdGhlIHZlcnkgbGVhc3QgSSB0aGluayB0aGF0IHNwaW5hbmRfZWNjX2VuYWJsZShz
cGluYW5kLCBmYWxzZSk7CnNob3VsZCBiZSBjYWxsZWQuCgpJZGVhbGx5LCBhIHJlc3VtZSBvcGVy
YXRpb24gc2hvdWxkIGJlIHByb3ZpZGVkIGJ5IEVDQyBlbmdpbmVzLCBidXQgdGhhdApjYW4gYmUg
YWRkZWQgbGF0ZXIuCgo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHNwaW5hbmRfaW5pdChzdHJ1Y3Qg
c3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIHsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZz
cGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+IEBAIC0xMTY3LDYgKzEyMjIsNyBAQCBzdGF0aWMg
aW50IHNwaW5hbmRfaW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIAltdGQt
Pl9ibG9ja19pc3Jlc2VydmVkID0gc3BpbmFuZF9tdGRfYmxvY2tfaXNyZXNlcnZlZDsKPiAgCW10
ZC0+X2VyYXNlID0gc3BpbmFuZF9tdGRfZXJhc2U7Cj4gIAltdGQtPl9tYXhfYmFkX2Jsb2NrcyA9
IG5hbmRkZXZfbXRkX21heF9iYWRfYmxvY2tzOwo+ICsJbXRkLT5fcmVzdW1lID0gc3BpbmFuZF9t
dGRfcmVzdW1lOwo+ICAKPiAgCWlmIChuYW5kLT5lY2MuZW5naW5lKSB7Cj4gIAkJcmV0ID0gbXRk
X29vYmxheW91dF9jb3VudF9mcmVlYnl0ZXMobXRkKTsKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
