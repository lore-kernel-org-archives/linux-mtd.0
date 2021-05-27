Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A30C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 18:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635E0613B4
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 18:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635E0613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPGYk6aBKF+p9ogx9+M9zNDInR04+ihSrFjOtGVGoSo=; b=c9aQF65zIsjXB9
	ZmJ0eCkGp6o7R70ZckyyFOVSLzE6WRdG2C/ThaQ/8utY9Al4kFYOSmg3/nSfR5hreGOEDL8xgMd41
	224jmM7j68p024f4HG/PyxpzO/G1dvKhBYxMNWnFDaFPdH6OJPmy1oWgYYxpIysj716ZJ7fSRFe04
	XLttu1U/jrNXXlAVffNC6W6/ObTZbXAhjRO+uRkhWsGDxXeLteEouZunAbPKmw4DHjibYHDPBIH40
	USgzBzfg9dqadBpeKyW2K65OZdZhCkR9sif1sPTOtNJeo3aA0wi8aH+wq6QYtljmFRRR2EHBBfwbL
	YbEOocN3bs6UTtLBb8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmKK6-008JEF-KC; Thu, 27 May 2021 18:01:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmIn8-007a2h-Ej; Thu, 27 May 2021 16:23:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D745CFF806;
 Thu, 27 May 2021 16:23:18 +0000 (UTC)
Date: Thu, 27 May 2021 18:23:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v3 3/3] mtd: spinand: add SPI-NAND MTD resume handler
Message-ID: <20210527182317.38d5edc6@xps13>
In-Reply-To: <20210527161252.16620-4-patrice.chotard@foss.st.com>
References: <20210527161252.16620-1-patrice.chotard@foss.st.com>
 <20210527161252.16620-4-patrice.chotard@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_092326_808470_CADE5EAE 
X-CRM114-Status: GOOD (  20.67  )
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

SGkgUGF0cmljZSwKCisgUHJhdHl1c2gKCjxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdy
b3RlIG9uIFRodSwgMjcgTWF5IDIwMjEgMTg6MTI6NTIgKzAyMDA6Cgo+IEZyb206IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IAo+IEFmdGVyIHBvd2VyIHVw
LCBhbGwgU1BJIE5BTkQncyBibG9ja3MgYXJlIGxvY2tlZC4gT25seSByZWFkIG9wZXJhdGlvbnMK
PiBhcmUgYWxsb3dlZCwgd3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMgYXJlIGZvcmJpZGRlbi4K
PiBUaGUgU1BJIE5BTkQgZnJhbWV3b3JrIHVubG9ja3MgYWxsIHRoZSBibG9ja3MgZHVyaW5nIGl0
cyBpbml0aWFsaXphdGlvbi4KPiAKPiBEdXJpbmcgYSBzdGFuZGJ5IGxvdyBwb3dlciwgdGhlIG1l
bW9yeSBpcyBwb3dlcmVkIGRvd24sIGxvc2luZyBpdHMKPiBjb25maWd1cmF0aW9uLgo+IER1cmlu
ZyB0aGUgcmVzdW1lLCB0aGUgUVNQSSBkcml2ZXIgc3RhdGUgaXMgcmVzdG9yZWQgYnV0IHRoZSBT
UEkgTkFORAo+IGZyYW1ld29yayBkb2VzIG5vdCByZWNvbmZpZ3VyZWQgdGhlIG1lbW9yeS4KPiAK
PiBUaGlzIHBhdGNoIGFkZHMgU1BJLU5BTkQgTVREIFBNIGhhbmRsZXJzIGZvciByZXN1bWUgb3Bz
Lgo+IFNQSSBOQU5EIHJlc3VtZSBvcCByZS1pbml0aWFsaXplcyBTUEkgTkFORCBmbGFzaCB0byBp
dHMgcHJvYmVkIHN0YXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8
Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4g
djM6Cj4gICAtIEFkZCBzcGluYW5kX3JlYWRfY2ZnKCkgY2FsbCB0byByZXBvcHVsYXRlIGNhY2hl
Cj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAgIC0gQWRkIGhlbHBlciBzcGluYW5kX2Jsb2NrX3VubG9j
aygpLgo+ICAgLSBBZGQgc3BpbmFuZF9lY2NfZW5hYmxlKCkgY2FsbC4KPiAgIC0gUmVtb3ZlIHNv
bWUgZGV2X2VycigpLgo+ICAgLSBGaXggY29tbWl0J3MgdGl0bGUgYW5kIG1lc3NhZ2UuCj4gCj4g
IGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiBpbmRleCAxZjY5OWFkODRmMWIuLmUzZmNiY2YzODFjMyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPiBAQCAtMTA5OSw2ICsxMDk5LDM4IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9ibG9j
a191bmxvY2soc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICAJcmV0dXJuIHJldDsK
PiAgfQo+ICAKPiArc3RhdGljIHZvaWQgc3BpbmFuZF9tdGRfcmVzdW1lKHN0cnVjdCBtdGRfaW5m
byAqbXRkKQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBtdGRfdG9f
c3BpbmFuZChtdGQpOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSBzcGluYW5kX3Jlc2V0X29w
KHNwaW5hbmQpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcmV0ID0gc3BpbmFu
ZF9yZWFkX2NmZyhzcGluYW5kKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuOwo+ICsKPiArCXJl
dCA9IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzcGluYW5kKTsKPiArCWlmIChyZXQpCj4gKwkJ
cmV0dXJuOwo+ICsKPiArCXJldCA9IHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfT1RQX0VO
QUJMRSwgMCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybjsKPiArCj4gKwlyZXQgPSBzcGluYW5k
X21hbnVmYWN0dXJlcl9pbml0KHNwaW5hbmQpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm47Cj4g
Kwo+ICsJcmV0ID0gc3BpbmFuZF9ibG9ja191bmxvY2soc3BpbmFuZCk7Cj4gKwlpZiAocmV0KQo+
ICsJCXJldHVybjsKPiArCj4gKwlzcGluYW5kX2VjY19lbmFibGUoc3BpbmFuZCwgZmFsc2UpOwo+
ICt9CgpTb3JyeSBmb3Igbm90IGJlaW5nIGNsZWFyLCBidXQgSSB0aGluayB3aGF0IFByYXR5dXNo
IG1lYW50IHdhcyB0aGF0CnlvdSBjb3VsZCBjcmVhdGUgYSBoZWxwZXIgZG9pbmcgYWxsIHRoZSBj
b21tb24gaW5pdGlhbGl6YXRpb25zIGJldHdlZW4Kc3BpbmFuZF9pbml0KCkgYW5kIHNwaW5hbmRf
cmVzdW1lKCkgYW5kIGNhbGwgaXQgZnJvbSB0aGVzZSBwbGFjZXMgdG8KYXZvaWQgY29kZSBkdXBs
aWNhdGlvbi4gSGlzIGNvbW1lbnQgc29tZWhvdyBvdXRjbGFzc2VkIG1pbmUgYXMgSSBvbmx5CmZv
Y3VzZWQgb24gdGhlIHVubG9jayBwYXJ0ICh3aGljaCBJIHRoaW5rIGlzIGNsZWFyZXIgYW55d2F5
LCBwbGVhc2Uga2VlcAppdCBsaWtlIHRoYXQpLgoKPiArCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9p
bml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgewo+ICAJc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnNwaW5hbmQtPnNwaW1lbS0+c3BpLT5kZXY7Cj4gQEAgLTExODYsNiArMTIxOCw3
IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCkKPiAgCW10ZC0+X2Jsb2NrX2lzcmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9ja19pc3Jlc2Vy
dmVkOwo+ICAJbXRkLT5fZXJhc2UgPSBzcGluYW5kX210ZF9lcmFzZTsKPiAgCW10ZC0+X21heF9i
YWRfYmxvY2tzID0gbmFuZGRldl9tdGRfbWF4X2JhZF9ibG9ja3M7Cj4gKwltdGQtPl9yZXN1bWUg
PSBzcGluYW5kX210ZF9yZXN1bWU7Cj4gIAo+ICAJaWYgKG5hbmQtPmVjYy5lbmdpbmUpIHsKPiAg
CQlyZXQgPSBtdGRfb29ibGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
