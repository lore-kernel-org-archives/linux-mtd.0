Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4295C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:44:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5736460EC0
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5736460EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ/4qEaumGuE8LoGRlJp/0a/he8Bx5DG1dBvMzZ8pls=; b=BiMsyVYkA68hYy
	KMtNK8m2c63gXOtvDdNZuZ88XphNJ1VWrvrATs3H0ooS47hKSLRGt51GgmlUOym1JfEBsFHuYdtcn
	j0yvxUCeHrWOMxUBDRMS6zT13a/KRjgYcoZkqoi6VkQ559lDcdVJlUkJ7igYk1GP6/mIcMDjnxk7k
	znr/BNpfbhpOwwNI/5N2wQzR5xuAj7bcavpAkLiCR3Gp5P6XA6P3fJg6xWbhcG5dLYu6mq4TCrYb/
	GdJfCRNntzxAM+3JZ3fSb/Gj1LRhlmKHPri8Tg/qunNJjg6BQa35AJrmkpyK+8nV8YxYoYPszV01G
	cFtFTNT4zNeYigmaGYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4oq-00DAY4-0u; Fri, 06 Aug 2021 18:43:44 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4om-00DAXB-7C
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 18:43:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8AC7A1BF205;
 Fri,  6 Aug 2021 18:43:35 +0000 (UTC)
Date: Fri, 6 Aug 2021 20:43:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 04/13] mtd: spinand: Fix odd byte addr and data phase in
 read/write reg op and write VCR op for Octal DTR mode
Message-ID: <20210806204334.5fedea42@xps13>
In-Reply-To: <20210713130538.646-5-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-5-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_114340_572755_551857FD 
X-CRM114-Status: GOOD (  25.27  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjI5CiswMDAwOgoKPiBJbiBPY3RhbCBEVFIgU1BJIG1vZGUsIDIg
Ynl0ZXMgb2YgZGF0YSBnZXRzIHRyYW5zbWl0dGVkIG92ZXIgb25lIGNsb2NrCj4gY3ljbGUsIGFu
ZCBoYWxmLWN5Y2xlIGluc3RydWN0aW9uIHBoYXNlcyBhcmVuJ3Qgc3VwcG9ydGVkIHlldC4gU28s
Cj4gZXZlcnkgRFRSIHNwaV9tZW1fb3AgbmVlZHMgdG8gaGF2ZSBldmVuIG5ieXRlcyBpbiBhbGwg
cGhhc2VzIGZvcgo+IG5vbi1lcnJhdGljIGJlaGF2aW91ciBmcm9tIHRoZSBTUEkgY29udHJvbGxl
ci4KPiAKPiBUaGUgb2RkIGxlbmd0aCBjbWQgYW5kIGR1bW15IHBoYXNlcyBnZXQgaGFuZGxlZCBi
eSBzcGltZW1fc2V0dXBfb3AoKQo+IGJ1dCB0aGUgb2RkIGxlbmd0aCBhZGRyZXNzIGFuZCBkYXRh
IHBoYXNlcyBuZWVkIHRvIGJlIGhhbmRsZWQgYWNjb3JkaW5nCj4gdG8gdGhlIHVzZSBjYXNlLiBG
b3IgZXhhbXBsZSBpbiBPY3RhbCBEVFIgbW9kZSwgcmVhZCByZWdpc3RlciBvcGVyYXRpb24KPiBo
YXMgb25lIGJ5dGUgbG9uZyBhZGRyZXNzIGFuZCBkYXRhIHBoYXNlLiBTbyBpdCBuZWVkcyB0byBl
eHRlbmQgaXQKPiBieSBhZGRpbmcgYSBzdWl0YWJsZSBleHRyYSBieXRlIGluIGFkZHIgYW5kIHJl
YWRpbmcgMiBieXRlcyBvZiBkYXRhLAo+IGRpc2NhcmRpbmcgdGhlIHNlY29uZCBieXRlLgo+IAo+
IEhhbmRsZSBhZGRyZXNzIGFuZCBkYXRhIHBoYXNlcyBmb3IgT2N0YWwgRFRSIG1vZGUgaW4gcmVh
ZC93cml0ZQo+IHJlZ2lzdGVyIGFuZCB3cml0ZSB2b2xhdGlsZSBjb25maWd1cmF0aW9uIHJlZ2lz
dGVyIG9wZXJhdGlvbnMKPiBieSBhZGRpbmcgYSBzdWl0YWJsZSBleHRyYSBieXRlIGluIHRoZSBh
ZGRyZXNzIGFuZCBkYXRhIHBoYXNlLgo+IAo+IENyZWF0ZSBzcGltZW1fc2V0dXBfcmVnX29wKCkg
aGVscGVyIGZ1bmN0aW9uIHRvIGVhc2Ugc2V0dGluZyB1cAo+IHJlYWQvd3JpdGUgcmVnaXN0ZXIg
b3BlcmF0aW9ucyBpbiBvdGhlciBmdW5jdGlvbnMsIGUuZy4gd2FpdCgpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYwo+IGluZGV4IDJlNTlmYWVjYzhmNS4uYTUzMzRhZDM0Zjk2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYwo+IEBAIC02NSwxMiArNjUsMjcgQEAgc3RhdGljIHZvaWQgc3BpbmFuZF9zZXR1cF9v
cChjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gIAl9Cj4gIH0KPiAgCj4g
K3N0YXRpYyB2b2lkIHNwaW5hbmRfc2V0dXBfcmVnX29wKGNvbnN0IHN0cnVjdCBzcGluYW5kX2Rl
dmljZSAqc3BpbmFuZCwKPiArCQkJCSBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCgpTYW1lIHJlbWFy
ayBhYm91dCB0aGUgbmFtaW5nLiBJbiBmYWN0IEkgYmVsaWV2ZSB3ZSBjb3VsZCBoYXZlIHRoaXMK
bG9naWMgaW4gX3NldHVwX29wKCkgKG9yIHdoYXRldmVyIGl0cyBuYW1lKSBhbmQgYWRkIGEgc3Bl
Y2lmaWMKcGFyYW1ldGVyIGZvciBpdD8KCj4gK3sKPiArCWlmIChzcGluYW5kLT5yZWdfcHJvdG8g
PT0gU1BJTkFORF9PQ1RBTF9EVFIpIHsKPiArCQkvKgo+ICsJCSAqIEFzc2lnbmluZyBzYW1lIGZp
cnN0IGFuZCBzZWNvbmQgYnl0ZSB3aWxsIHJlc3VsdCBpbiBjb25zdGFudAo+ICsJCSAqIGJpdHMg
b24gdGhzIFNQSSBidXMgYmV0d2VlbiBwb3NpdGl2ZSBhbmQgbmVnYXRpdmUgY2xvY2sgZWRnZXMK
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIHRoZQoKPiArCQkgKi8KPiArCQlvcC0+YWRkci52
YWwgPSAob3AtPmFkZHIudmFsIDw8IDgpIHwgb3AtPmFkZHIudmFsOwoKSSBhbSBub3Qgc3VyZSB0
byB1bmRlcnN0YW5kIHdoYXQgeW91IGRvIGhlcmU/Cgo+ICsJCW9wLT5hZGRyLm5ieXRlcyA9IDI7
Cj4gKwkJb3AtPmRhdGEubmJ5dGVzID0gMjsKPiArCX0KClNwYWNlCgo+ICsJc3BpbmFuZF9zZXR1
cF9vcChzcGluYW5kLCBvcCk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9yZWFkX3Jl
Z19vcChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIHU4IHJlZywgdTggKnZhbCkKPiAg
ewo+IC0Jc3RydWN0IHNwaV9tZW1fb3Agb3AgPSBTUElOQU5EX0dFVF9GRUFUVVJFX09QKHJlZywK
PiAtCQkJCQkJICAgICAgc3BpbmFuZC0+c2NyYXRjaGJ1Zik7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9v
cCBvcCA9IFNQSU5BTkRfR0VUX0ZFQVRVUkVfT1AocmVnLCBzcGluYW5kLT5zY3JhdGNoYnVmKTsK
CllvdSBjYW4gZG8gdGhpcywgYnV0IGluIGEgZGlmZmVyZW50IGNvbW1pdC4KCj4gIAlpbnQgcmV0
Owo+ICAKPiArCXNwaW5hbmRfc2V0dXBfcmVnX29wKHNwaW5hbmQsICZvcCk7Cj4gIAlyZXQgPSBz
cGlfbWVtX2V4ZWNfb3Aoc3BpbmFuZC0+c3BpbWVtLCAmb3ApOwo+ICAJaWYgKHJldCkKPiAgCQly
ZXR1cm4gcmV0Owo+IEBAIC04MSwxMCArOTYsMTAgQEAgc3RhdGljIGludCBzcGluYW5kX3JlYWRf
cmVnX29wKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTggcmVnLCB1OCAqdmFsKQo+
ICAKPiAgc3RhdGljIGludCBzcGluYW5kX3dyaXRlX3JlZ19vcChzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQsIHU4IHJlZywgdTggdmFsKQo+ICB7Cj4gLQlzdHJ1Y3Qgc3BpX21lbV9vcCBv
cCA9IFNQSU5BTkRfU0VUX0ZFQVRVUkVfT1AocmVnLAo+IC0JCQkJCQkgICAgICBzcGluYW5kLT5z
Y3JhdGNoYnVmKTsKPiArCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJTkFORF9TRVRfRkVBVFVS
RV9PUChyZWcsIHNwaW5hbmQtPnNjcmF0Y2hidWYpOwoKU2FtZSBoZXJlLgoKPiAgCj4gLQkqc3Bp
bmFuZC0+c2NyYXRjaGJ1ZiA9IHZhbDsKPiArCXNwaW5hbmRfc2V0dXBfcmVnX29wKHNwaW5hbmQs
ICZvcCk7Cj4gKwltZW1zZXQoc3BpbmFuZC0+c2NyYXRjaGJ1ZiwgdmFsLCBvcC5kYXRhLm5ieXRl
cyk7Cj4gIAlyZXR1cm4gc3BpX21lbV9leGVjX29wKHNwaW5hbmQtPnNwaW1lbSwgJm9wKTsKPiAg
fQo+ICAKPiBAQCAtNTQ3LDYgKzU2Miw3IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF93YWl0KHN0cnVj
dCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCXU4IHN0YXR1czsKPiAgCWludCByZXQ7Cj4g
IAo+ICsJc3BpbmFuZF9zZXR1cF9yZWdfb3Aoc3BpbmFuZCwgJm9wKTsKPiAgCXJldCA9IHNwaV9t
ZW1fcG9sbF9zdGF0dXMoc3BpbmFuZC0+c3BpbWVtLCAmb3AsIFNUQVRVU19CVVNZLCAwLAo+ICAJ
CQkJICBpbml0aWFsX2RlbGF5X3VzLAo+ICAJCQkJICBwb2xsX2RlbGF5X3VzLAoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
