Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B912FC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D6A60720
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73D6A60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDpVr7ky2Rhfow5iSlbZD1it7K/yYORMeQLBDyMXeA8=; b=bHszm3mEgcL+89
	lsc9vUcFcvk+RGb74jH4YKX1JIazHfThPNff9KF0JBwJqYx//PH8fzcS8URuHwI6/56W5MX1LZXWP
	GsWt1W1cJP7GztXW3yO0gklFndPL7zmRUXX2TggHeYzC08rvEQ1i702VIfwan2JYYvNzvOas3/EPs
	iNLlnvYyN6kckHq8wBG1l+yThCetfzWPNWAblMxyNG2yzHFxkYNOfhsSyp53NJ+KFhwJgIO6m6lHe
	mVLCxuXYeDEVxaUR30D8U/6NQN0v1F4rnRdXCOlxpq5b20kqBud69uQvWwzMB5Jurs+mENRDE8wLT
	6JwE5izzmF/ZHmxVvjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBmp-0043hB-U2; Thu, 27 May 2021 08:54:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBm5-0043IT-2x; Thu, 27 May 2021 08:53:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7F6EAC000D;
 Thu, 27 May 2021 08:53:47 +0000 (UTC)
Date: Thu, 27 May 2021 10:53:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v2] mtd: spinand: add SPI-NAND MTD resume handler
Message-ID: <20210527105346.315cf125@xps13>
In-Reply-To: <20210527084959.1548-1-patrice.chotard@foss.st.com>
References: <20210527084959.1548-1-patrice.chotard@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_015353_516824_3532EC4A 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgUGF0cmljZSwKCjxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlIG9uIFRodSwg
MjcgTWF5IDIwMjEgMTA6NDk6NTkgKzAyMDA6Cgo+IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IAo+IEFmdGVyIHBvd2VyIHVwLCBhbGwgU1BJIE5B
TkQncyBibG9ja3MgYXJlIGxvY2tlZC4gT25seSByZWFkIG9wZXJhdGlvbnMKPiBhcmUgYWxsb3dl
ZCwgd3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMgYXJlIGZvcmJpZGRlbi4KPiBUaGUgU1BJIE5B
TkQgZnJhbWV3b3JrIHVubG9ja3MgYWxsIHRoZSBibG9ja3MgZHVyaW5nIGl0cyBpbml0aWFsaXph
dGlvbi4KPiAKPiBEdXJpbmcgYSBzdGFuZGJ5IGxvdyBwb3dlciwgdGhlIG1lbW9yeSBpcyBwb3dl
cmVkIGRvd24sIGxvc2luZyBpdHMKPiBjb25maWd1cmF0aW9uLgo+IER1cmluZyB0aGUgcmVzdW1l
LCB0aGUgUVNQSSBkcml2ZXIgc3RhdGUgaXMgcmVzdG9yZWQgYnV0IHRoZSBTUEkgTkFORAo+IGZy
YW1ld29yayBkb2VzIG5vdCByZWNvbmZpZ3VyZWQgdGhlIG1lbW9yeS4KPiAKPiBUaGlzIHBhdGNo
IGFkZHMgU1BJLU5BTkQgTVREIFBNIGhhbmRsZXJzIGZvciByZXN1bWUgb3BzLgo+IFNQSSBOQU5E
IHJlc3VtZSBvcCByZS1pbml0aWFsaXplcyBTUEkgTkFORCBmbGFzaCB0byBpdHMgcHJvYmVkIHN0
YXRlLgo+IAo+IEl0IGFsc28gYWRkcyBhIG5ldyBoZWxwZXIgc3BpbmFuZF9ibG9ja191bmxvY2so
KSB3aGljaCBpcwo+IGNhbGxlZCBpbiBzcGluYW5kX2luaXQoKSBhbmQgaW4gc3BpbmFuZF9tdGRf
cmVzdW1lKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3Rv
cGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAg
IC0gQWRkIGhlbHBlciBzcGluYW5kX2Jsb2NrX3VubG9jaygpLgo+ICAgLSBBZGQgc3BpbmFuZF9l
Y2NfZW5hYmxlKCkgY2FsbC4KPiAgIC0gUmVtb3ZlIHNvbWUgZGV2X2VycigpLgo+ICAgLSBGaXgg
Y29tbWl0J3MgdGl0bGUgYW5kIG1lc3NhZ2UuCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYyB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+IGluZGV4IDE3ZjYzZjk1ZjRhMi4uZjc3YWVmZjExZjQzIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+IEBAIC0xMDc0LDYgKzEwNzQsNTUgQEAgc3RhdGljIGludCBzcGluYW5kX2RldGVjdChz
dHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAr
c3RhdGljIGludCBzcGluYW5kX2Jsb2NrX3VubG9jayhzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNw
aW5hbmQpCj4gK3sKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNw
aS0+ZGV2Owo+ICsJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kID0gc3BpbmFuZF90b19uYW5kKHNw
aW5hbmQpOwo+ICsJaW50IHJldCA9IDAsIGk7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG5hbmQt
Pm1lbW9yZy5udGFyZ2V0czsgaSsrKSB7Cj4gKwkJcmV0ID0gc3BpbmFuZF9zZWxlY3RfdGFyZ2V0
KHNwaW5hbmQsIGkpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwo+ICsJCXJl
dCA9IHNwaW5hbmRfbG9ja19ibG9jayhzcGluYW5kLCBCTF9BTExfVU5MT0NLRUQpOwo+ICsJCWlm
IChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQoK
UGxlYXNlIGluc2VydCB0aGlzIGhlbHBlciAoYW5kIHVzZSBpdCBpbiB0aGUgcHJvYmUpIGluIGEg
c2VwYXJhdGUKcGF0Y2gsIHNvIHRoYXQgcGF0Y2ggMi8yIG9ubHkgaW1wbGVtZW50cyB0aGUgX3Jl
c3VtZSBob29rLgoKPiArCj4gK3N0YXRpYyB2b2lkIHNwaW5hbmRfbXRkX3Jlc3VtZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCkKPiArewo+ICsJc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0g
bXRkX3RvX3NwaW5hbmQobXRkKTsKPiArCXN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCA9IG10ZF90
b19uYW5kZGV2KG10ZCk7Cj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmc3BpbmFuZC0+c3BpbWVt
LT5zcGktPmRldjsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gc3BpbmFuZF9yZXNldF9vcChz
cGluYW5kKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuOwo+ICsKPiArCXJldCA9IHNwaW5hbmRf
aW5pdF9xdWFkX2VuYWJsZShzcGluYW5kKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuOwo+ICsK
PiArCXJldCA9IHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfT1RQX0VOQUJMRSwgMCk7Cj4g
KwlpZiAocmV0KQo+ICsJCXJldHVybjsKPiArCj4gKwlyZXQgPSBzcGluYW5kX21hbnVmYWN0dXJl
cl9pbml0KHNwaW5hbmQpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcmV0ID0g
c3BpbmFuZF9ibG9ja191bmxvY2soc3BpbmFuZCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybjsK
PiArCj4gKwlzcGluYW5kX2VjY19lbmFibGUoc3BpbmFuZCwgZmFsc2UpOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgaW50IHNwaW5hbmRfaW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4g
IHsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+
IEBAIC0xMTM3LDE1ICsxMTg2LDkgQEAgc3RhdGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNw
aW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICAJfQo+ICAKPiAgCS8qIEFmdGVyIHBvd2VyIHVwLCBh
bGwgYmxvY2tzIGFyZSBsb2NrZWQsIHNvIHVubG9jayB0aGVtIGhlcmUuICovCj4gLQlmb3IgKGkg
PSAwOyBpIDwgbmFuZC0+bWVtb3JnLm50YXJnZXRzOyBpKyspIHsKPiAtCQlyZXQgPSBzcGluYW5k
X3NlbGVjdF90YXJnZXQoc3BpbmFuZCwgaSk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJZ290byBlcnJf
bWFudWZfY2xlYW51cDsKPiAtCj4gLQkJcmV0ID0gc3BpbmFuZF9sb2NrX2Jsb2NrKHNwaW5hbmQs
IEJMX0FMTF9VTkxPQ0tFRCk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJZ290byBlcnJfbWFudWZfY2xl
YW51cDsKPiAtCX0KPiArCXJldCA9IHNwaW5hbmRfYmxvY2tfdW5sb2NrKHNwaW5hbmQpOwo+ICsJ
aWYgcmV0KQoKSSBkb3VidCB0aGlzIGFzIGV2ZW4gYmUgYnVpbGQtdGVzdGVkIDopCgo+ICsJCWdv
dG8gZXJyX21hbnVmX2NsZWFudXA7Cj4gIAo+ICAJcmV0ID0gbmFuZGRldl9pbml0KG5hbmQsICZz
cGluYW5kX29wcywgVEhJU19NT0RVTEUpOwo+ICAJaWYgKHJldCkKPiBAQCAtMTE2Nyw2ICsxMjEw
LDcgQEAgc3RhdGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kKQo+ICAJbXRkLT5fYmxvY2tfaXNyZXNlcnZlZCA9IHNwaW5hbmRfbXRkX2Jsb2NrX2lzcmVz
ZXJ2ZWQ7Cj4gIAltdGQtPl9lcmFzZSA9IHNwaW5hbmRfbXRkX2VyYXNlOwo+ICAJbXRkLT5fbWF4
X2JhZF9ibG9ja3MgPSBuYW5kZGV2X210ZF9tYXhfYmFkX2Jsb2NrczsKPiArCW10ZC0+X3Jlc3Vt
ZSA9IHNwaW5hbmRfbXRkX3Jlc3VtZTsKPiAgCj4gIAlpZiAobmFuZC0+ZWNjLmVuZ2luZSkgewo+
ICAJCXJldCA9IG10ZF9vb2JsYXlvdXRfY291bnRfZnJlZWJ5dGVzKG10ZCk7CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
