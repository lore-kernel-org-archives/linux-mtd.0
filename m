Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2969DC64ED6
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jxe1tbt9Q/QKeDvXTxR+vSe1Peu+7dFdEbX5ZO8+448=; b=MYKNrcCnXWdRWm
	NoD418aQIwBbJ8iYnxipPQbfIHEB/zjOqodOzwZt0D0hlAAJYG/dNu4pGQAqg7WJXihgI4SgPKxxo
	CxwXlkCIGjdnnC5tHT3Qb3AHDqNNKPJdosCHyixgKprbyp3HqXMlCQVkO56mzVDiZHCb6zaioXCa8
	0nWnaC4HPCmjoGjm0LswCxJMaUZwzXMrfcjPSIrFP4sViVSPmvEBBTmVNoICTQVBeDlQH2mFgPmRg
	S/B+ukPUIEJEOSbgns2WM4Ym6WBwxDWzbXThNH1ydFUAds7LymAJwfFoResRUdYfcP3dkYCWs8yYa
	y3McVxpvnklBOACOsMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBqy-00GXBP-42; Thu, 23 Feb 2023 13:41:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBpK-00GW8q-Uc
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 13:40:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D870B240007;
	Thu, 23 Feb 2023 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677159597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dW/a3s/IrrURYzf8yXS/vPFUGZvsfNMD7d42NjHDPA=;
	b=PbiSgv2KYo8PfjiaPS9sW9Trydrw4aNpGZVmeOmLiClx2qrEDQ2IPbvjfsa2Kis/WiMFm0
	FYBUbSkqpGb0cGQc2BJF19gvdajFs5fNwQtD894areswPAe6NsfVIkohAuVqbZp1KelxbM
	fobENlN55EVMRpLTC9cuaxtFPS3Voq9k/kU1kBVWCtZOUB7mAFZjkUh+qvDBP/H15Z7oHW
	UXIwrqPteFjJfl89zOI7CMTSWWotCPhUQ1CNhjHVFfxhEuemR7mDNopBOAFuklPrWkNBgm
	zveUv8zEqCHppsPHkVft59axS6L/emWInXHptf4XFpTLcfKqZTrjOX7Ne5jCNg==
Date: Thu, 23 Feb 2023 14:39:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: herve.codina@bootlin.com, sashal@kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Message-ID: <20230223143956.057ae78a@xps-13>
In-Reply-To: <20230223122736.379537-1-hector.palacios@digi.com>
References: <20230223122736.379537-1-hector.palacios@digi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054003_191855_44B17CEB 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgSGVjdG9yLAoKaGVjdG9yLnBhbGFjaW9zQGRpZ2kuY29tIHdyb3RlIG9uIFRodSwgMjMgRmVi
IDIwMjMgMTM6Mjc6MzYgKzAxMDA6Cgo+IEFjY29yZGluZyB0byB0aGUgT05GSSBzcGVjaWZpY2F0
aW9uLCBiaXQgMCBvZiAnU0RSIHRpbWluZyBtb2RlIHN1cHBvcnQnCj4gKGJ5dGVzIDEyOS0xMzAp
ICJzaGFsbCBiZSAxIi4gVGhhdCBtZWFucyB0aGUgTkFORCBzdXBwb3J0cyBhdCBsZWFzdAo+IHRp
bWluZyBtb2RlIDAuCj4gCj4gTkFORCBjaGlwIEh5bml4IEgyN1U0RzhGMkdEQS1CSSAoYXQgbGVh
c3QpIGlzIHJlYWRpbmcgYSAwIG9uIHRoaXMgZmllbGQKPiB3aGljaCBtYWtlcyBuYW5kX2Nob29z
ZV9iZXN0X3Nkcl90aW1pbmdzKCkgcmV0dXJuIHdpdGggZXJyb3IgYW5kIHRoZQo+IHByb2JlIGZ1
bmN0aW9uIHRvIGV2ZW50dWFsbHkgZmFpbC4KPiAKPiBHaXZlbiB0aGF0IHNkcl90aW1pbmdfbW9k
ZXMgYml0IDAgbXVzdCBiZSAxIGJ5IHNwZWNpZmljYXRpb24sIGZvcmNlCj4gaXQgaW4gY2FzZSB0
aGUgTkFORCByZXBvcnRzIGl0IGlzIG5vdCBzZXQuIFRoaXMgaXMgYSBzYWZlIGFzc3VtcHRpb24K
PiBiZWNhdXNlIHRoZSBtb2RlIDAgaXMgdGhlIG1pbmltdW0gKHNhZmVyKSBzZXQgb2YgdGltaW5n
cyB0aGF0IHRoZQo+IE5BTkQgY2FuIHdvcmsgd2l0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWN0
b3IgUGFsYWNpb3MgPGhlY3Rvci5wYWxhY2lvc0BkaWdpLmNvbT4KPiAtLS0KPiB2MjoKPiAgIE1v
dmUgcGF0Y2ggdG8gSHluaXggc3BlY2lmaWMgZml4dXAgaG9vay4KPiAgIFVzZSBCSVQoMCkgbWFj
cm8uCj4gdjE6Cj4gICBJbXBsZW1lbnQgZ2VuZXJpYyBwYXRjaCBpbiBuYW5kX2Jhc2UuYy4KPiAK
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jIHwgMTQgKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9oeW5peC5jCj4gaW5kZXggMGQ0ZDRiYmZkZWNlLi45M2Y5NzI5MGUzY2UgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9oeW5peC5jCj4gQEAgLTcyOCw4ICs3MjgsMjIgQEAgc3RhdGljIGludCBo
eW5peF9uYW5kX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCXJldHVybiByZXQ7Cj4g
IH0KPiAgCj4gK3N0YXRpYyB2b2lkIGh5bml4X2ZpeHVwX29uZmlfcGFyYW1fcGFnZShzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLAo+ICsJCQkJCXN0cnVjdCBuYW5kX29uZmlfcGFyYW1zICpwKQo+ICt7
Cj4gKwkvKgo+ICsJICogQ2VydGFpbiBjaGlwcyBtaWdodCByZXBvcnQgYSAwIG9uIHNkcl90aW1p
bmdfbW9kZSBmaWVsZAo+ICsJICogKGJ5dGVzIDEyOS0xMzApLiBUaGlzIGhhcyBiZWVuIHNlZW4g
b24gSDI3VTRHOEYyR0RBLUJJLgo+ICsJICogQWNjb3JkaW5nIHRvIE9ORkkgc3BlY2lmaWNhdGlv
biwgYml0IDAgb2YgdGhpcyBmaWVsZCAic2hhbGwgYmUgMSIuCj4gKwkgKiBGb3JjZSB0aGlzIGJp
dCBpZiB1bnNldC4KPiArCSAqLwo+ICsJaWYgKCEocC0+c2RyX3RpbWluZ19tb2RlcyAmJiBCSVQo
MCkpKQoKU2hhbGwgYmUgCQkJICAmCgpCdXQgVEJIIHlvdSBjYW4gY2VydGFpbmx5IGp1c3Qgc2V0
IHRoZSBiaXQgYmxpbmRseS4KCj4gKwkJcC0+c2RyX3RpbWluZ19tb2RlcyB8PSBCSVQoMCk7Cj4g
K30KPiArCj4gIGNvbnN0IHN0cnVjdCBuYW5kX21hbnVmYWN0dXJlcl9vcHMgaHluaXhfbmFuZF9t
YW51Zl9vcHMgPSB7Cj4gIAkuZGV0ZWN0ID0gaHluaXhfbmFuZF9kZWNvZGVfaWQsCj4gIAkuaW5p
dCA9IGh5bml4X25hbmRfaW5pdCwKPiAgCS5jbGVhbnVwID0gaHluaXhfbmFuZF9jbGVhbnVwLAo+
ICsJLmZpeHVwX29uZmlfcGFyYW1fcGFnZSA9IGh5bml4X2ZpeHVwX29uZmlfcGFyYW1fcGFnZSwK
PiAgfTsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
