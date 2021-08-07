Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D25C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EA3610FC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82EA3610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQfKP+LikIhxJp7gekZ3vcpB7NpfHPxz5sfx+aqhiPs=; b=yI4XeZnoQV0UnR
	N324VlmricotrDn6PXG6IJGt6WHAOPKDZcNS8KxsvGYTU8EGbbW93U2x/AhGx7CJ2MNutbRrMNMT/
	gvRvQsJQkrlQa59FjspCICJVIeq5KaSbz/58hoHibC6M8ctT+niPuQlotCdJxW/D/ov5gcdLrgn53
	aGQBgVQ1vkpEyPpn2tjnmy9AL9enwJCiymTwMCOXNJ19Ng+RwfLz1S5mwsWxypu9dRMhlfCv9PXnD
	lKE71kTC1vXoHIOJ9QeaS1aXNvXp48CAawKISBH5WtUl/KrOfA/v05uFY97Dnxh77CZ0UJRV4gnOU
	L6iJ7Hr0bCisiiZzoqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCJdL-00EZVv-Rj; Sat, 07 Aug 2021 10:32:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCJdI-00EZV0-NQ
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 10:32:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C80EB60002;
 Sat,  7 Aug 2021 10:32:44 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:32:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>
Subject: Re: [PATCH 1/2] mtd: mtdconcat: Judge callback function existence
 getting from master for each partition
Message-ID: <20210807123243.7661e4e3@xps13>
In-Reply-To: <27c67e42-f275-fc50-64e5-d80233130f7e@huawei.com>
References: <20210731023243.3977104-1-chengzhihao1@huawei.com>
 <20210731023243.3977104-2-chengzhihao1@huawei.com>
 <20210806212857.240e0c1f@xps13>
 <27c67e42-f275-fc50-64e5-d80233130f7e@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_033248_942424_24F51BDC 
X-CRM114-Status: GOOD (  13.43  )
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

SGkgWmhpaGFvLAoKWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gU2F0LCA3IEF1ZyAyMDIxCjEwOjE1OjQ2ICswODAwOgoKPiDlnKggMjAyMS84LzcgMzoyOCwg
TWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGkgTWlxdWVsLAo+ID4gSGkgWmhpaGFvLAo+ID4KPiA+
IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlIG9uIFNhdCwgMzEg
SnVsIDIwMjEKPiA+IDEwOjMyOjQyICswODAwOgo+ID4gQEAgLTcyMSwxNCArNzI0LDE1IEBAIHN0
cnVjdCBtdGRfaW5mbyAqbXRkX2NvbmNhdF9jcmVhdGUoc3RydWN0IG10ZF9pbmZvICpzdWJkZXZb
XSwJLyogc3ViZGV2aWNlcyB0byBjCj4gPiAgIAkJCQkgICAgc3ViZGV2W2ldLT5mbGFncyAmIE1U
RF9XUklURUFCTEU7Cj4gPiAgIAkJfSAgCj4gPiAgID4gKwkJc3ViZGV2X21hc3RlciA9IG10ZF9n
ZXRfbWFzdGVyKHN1YmRldltpXSk7ICAKPiA+ICAgCQljb25jYXQtPm10ZC5zaXplICs9IHN1YmRl
dltpXS0+c2l6ZTsKPiA+ICAgCQljb25jYXQtPm10ZC5lY2Nfc3RhdHMuYmFkYmxvY2tzICs9Cj4g
PiAgIAkJCXN1YmRldltpXS0+ZWNjX3N0YXRzLmJhZGJsb2NrczsKPiA+ICAgCQlpZiAoY29uY2F0
LT5tdGQud3JpdGVzaXplICAgIT0gIHN1YmRldltpXS0+d3JpdGVzaXplIHx8Cj4gPiAgIAkJICAg
IGNvbmNhdC0+bXRkLnN1YnBhZ2Vfc2Z0ICE9IHN1YmRldltpXS0+c3VicGFnZV9zZnQgfHwKPiA+
ICAgCQkgICAgY29uY2F0LT5tdGQub29ic2l6ZSAgICAhPSAgc3ViZGV2W2ldLT5vb2JzaXplIHx8
Cj4gPiAtCQkgICAgIWNvbmNhdC0+bXRkLl9yZWFkX29vYiAgIT0gIXN1YmRldltpXS0+X3JlYWRf
b29iIHx8Cj4gPiAtCQkgICAgIWNvbmNhdC0+bXRkLl93cml0ZV9vb2IgIT0gIXN1YmRldltpXS0+
X3dyaXRlX29vYikgewo+ID4gKwkJICAgICFjb25jYXQtPm10ZC5fcmVhZF9vb2IgICE9ICFzdWJk
ZXZfbWFzdGVyLT5fcmVhZF9vb2IgfHwKPiA+ICsJCSAgICAhY29uY2F0LT5tdGQuX3dyaXRlX29v
YiAhPSAhc3ViZGV2X21hc3Rlci0+X3dyaXRlX29vYikgewo+ID4gRG8geW91IHJlYWxseSBuZWVk
IHRoaXMgY2hhbmdlPyAgCj4gCj4gSSB0aGluayBib3RoICIhY29uY2F0LT5tdGQuX3JlYWRfb29i
ICE9ICFzdWJkZXZbaV0tPl9yZWFkX29vYiIgYW5kICIhY29uY2F0LT5tdGQuX3dyaXRlX29vYiAh
PSAhc3ViZGV2W2ldLT5fd3JpdGVfb29iIiBuZWVkIHRvIGJlIG1vZGlmaWVkIG90aGVyd2lzZSBj
b25jYXRlbmF0aW5nIGdvZXMgZmFpbHVyZS4KPiAKPiBJIHRob3VnaHQgdGhlcmUgZXhpc3RzIHR3
byBwcm9ibGVtczoKPiAKPiAgwqAgMS4gV3JvbmcgY2FsbGJhY2sgZmV0Y2hpbmcgaW4gbXRkIHBh
cnRpdGlvbiBkZXZpY2UKPiAKPiAgwqAgMi4gV2FybmluZyBmb3IgZXhpc3RlbmNlIG9mIF9yZWFk
IGFuZCBfcmVhZF9vb2IgYXQgdGhlIHNhbWUgdGltZQo+IAo+IHNvIEkgc29sdmVkIHRoZW0gaW4g
dHdvIHN0ZXBzIHRvIG1ha2UgaGlzdG9yeSBjb21taXQgbG9ncyBhIGJpdCBjbGVhci4KPiAKPiBU
aG91Z2ggdGhlc2UgdHdvIHBhdGNoZXMgY2FuIGJlIGNvbWJpbmVkIHRvIG9uZS4KCk5vIHBsZWFz
ZSBrZWVwIHRoZSBzcGxpdC4KCldoYXQgSSBtZWFuIGhlcmUgaXMgdGhhdCBJIGRvbid0IHRoaW5r
IHlvdXIgZml4IGlzIHZhbGlkLiBNYXliZSB3ZQpzaG91bGQgcHJvcGFnYXRlIHRoZXNlIGNhbGxi
YWNrcyBhcyB3ZWxsIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGhhY2sgaW50bwp0aGlzIGNvbmRpdGlv
bi4gSSBkb24ndCBzZWUgd2h5IHlvdSBzaG91bGQgY2hlY2sgYWdhaW5zdCBzdWJkZXZbaV0gZm9y
CmhhbGYgb2YgdGhlIGNhbGxiYWNrcyBhbmQgY2hlY2sgZm9yIHN1YmRldl9tYXN0ZXIgZm9yIHRo
ZSBsYXN0IHR3by4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
