Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F71C282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3995520883
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JjWo+zzs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3995520883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0KcJpSp/iOOntMv2JGJIemga6SapKi694Kpm33zxjU=; b=JjWo+zzsM42TEV
	iH1nTLBAuFfxe4aUvEkOeVuESvBOjT2vQGc92YG0Zuea4SakUZRVmUas8Cve6Ku90yawGvbOEVATb
	2aKyWXkserKFjZDvQfIlmxYHmJqQP11tbF830198jG5a8pIaLiJQmahnnVpouqcV8ZQJ3V8EISWyX
	COH9AU00LWc33ceJF3o9w3baaZZYgVqv5tD/ZPfHwQt6W1E7grjNc2xQ3VuyQF5V+k67sEi4vsJVa
	8pTSOgN7FgImGKdPQdpZdEQsNomPsqzI9LbIPGAjFgelytPKpUBXbDetW50Sif9AV6XeMFoEXd+N5
	PFgxCtPhtTXj6/Sl1t6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPN0-0002yO-Lk; Mon, 08 Apr 2019 08:11:10 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPMx-0002xY-S2
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 08:11:09 +0000
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 92E45100003;
 Mon,  8 Apr 2019 08:11:03 +0000 (UTC)
Date: Mon, 8 Apr 2019 10:11:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: Ensure the ND_RUN bit is reset
Message-ID: <20190408101102.782427c0@xps13>
In-Reply-To: <20190408100747.7dc8412e@collabora.com>
References: <20190407193401.7983-1-miquel.raynal@bootlin.com>
 <20190408100747.7dc8412e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_011108_049916_1CC189FB 
X-CRM114-Status: GOOD (  21.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDggQXByCjIwMTkgMTA6MDc6NDcgKzAyMDA6Cgo+IE9uIFN1biwgIDcg
QXByIDIwMTkgMjE6MzQ6MDEgKzAyMDAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZToKPiAKPiA+IFNpbmNlIHRoZSBtaWdyYXRpb24gb2YgdGhlIGRyaXZl
ciB0byBzdG9wIHVzaW5nIHRoZSBsZWdhY3kgIAo+ID4gLT5zZWxlY3RfY2hpcCgpIGhvb2ssIHRo
ZXJlIGlzIG5vdGhpbmcgZGVzZWxlY3RpbmcgdGhlIHRhcmdldCBhbnltb3JlLCAgICAKPiA+IHRo
dXMgdGhlIHNlbGVjdGlvbiBpcyBub3QgZm9yY2VkIGF0IHRoZSBuZXh0IGFjY2Vzcy4gRW5zdXJl
IHRoZSBORF9SVU4KPiA+IGJpdCBpcyBhbHdheXMgaW4gYSBjbGVhbiBzdGF0ZS4KPiA+IAo+ID4g
Q2M6IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gPiBGaXhlczogYjI1MjUxNDE0ZjZlMDAgKCJtdGQ6IHJhd25hbmQ6IG1hcnZl
bGw6IFN0b3AgaW1wbGVtZW50aW5nIC0+c2VsZWN0X2NoaXAoKSIpCj4gPiBTdWdnZXN0ZWQtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
LS0tCj4gPiAKPiA+IEhpIERhbmllbCwgY291bGQgeW91IHBsZWFzZSB0ZXN0IHRoaXMgdmVyc2lv
biBvZiB0aGUgZml4Pwo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsCj4gPiAKPiA+IAo+ID4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwgMTIgKysrKysrLS0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+IGluZGV4IGYzOGU1YzFiODdlNC4u
YTdkN2YxN2Q4NjgyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVs
bF9uYW5kLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4g
PiBAQCAtNzIyLDEyICs3MjIsNiBAQCBzdGF0aWMgdm9pZCBtYXJ2ZWxsX25mY19zZWxlY3RfdGFy
Z2V0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgCXN0cnVjdCBtYXJ2ZWxsX25mYyAqbmZj
ID0gdG9fbWFydmVsbF9uZmMoY2hpcC0+Y29udHJvbGxlcik7Cj4gPiAgCXUzMiBuZGNyX2dlbmVy
aWM7Cj4gPiAgCj4gPiAtCWlmIChjaGlwID09IG5mYy0+c2VsZWN0ZWRfY2hpcCAmJiBkaWVfbnIg
PT0gbWFydmVsbF9uYW5kLT5zZWxlY3RlZF9kaWUpCj4gPiAtCQlyZXR1cm47Cj4gPiAtCj4gPiAt
CXdyaXRlbF9yZWxheGVkKG1hcnZlbGxfbmFuZC0+bmR0cjAsIG5mYy0+cmVncyArIE5EVFIwKTsK
PiA+IC0Jd3JpdGVsX3JlbGF4ZWQobWFydmVsbF9uYW5kLT5uZHRyMSwgbmZjLT5yZWdzICsgTkRU
UjEpOwo+ID4gLQo+ID4gIAkvKgo+ID4gIAkgKiBSZXNldCB0aGUgTkRDUiByZWdpc3RlciB0byBh
IGNsZWFuIHN0YXRlIGZvciB0aGlzIHBhcnRpY3VsYXIgY2hpcCwKPiA+ICAJICogYWxzbyBjbGVh
ciBORF9SVU4gYml0Lgo+ID4gQEAgLTczNiw2ICs3MzAsMTIgQEAgc3RhdGljIHZvaWQgbWFydmVs
bF9uZmNfc2VsZWN0X3RhcmdldChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gIAkJICAgICAg
IE5EQ1JfR0VORVJJQ19GSUVMRFNfTUFTSyAmIH5ORENSX05EX1JVTjsKPiA+ICAJd3JpdGVsX3Jl
bGF4ZWQobmRjcl9nZW5lcmljIHwgbWFydmVsbF9uYW5kLT5uZGNyLCBuZmMtPnJlZ3MgKyBORENS
KTsKPiA+ICAKPiA+ICsJaWYgKGNoaXAgPT0gbmZjLT5zZWxlY3RlZF9jaGlwICYmIGRpZV9uciA9
PSBtYXJ2ZWxsX25hbmQtPnNlbGVjdGVkX2RpZSkKPiA+ICsJCXJldHVybjsKPiA+ICsKPiA+ICsJ
d3JpdGVsX3JlbGF4ZWQobWFydmVsbF9uYW5kLT5uZHRyMCwgbmZjLT5yZWdzICsgTkRUUjApOwo+
ID4gKwl3cml0ZWxfcmVsYXhlZChtYXJ2ZWxsX25hbmQtPm5kdHIxLCBuZmMtPnJlZ3MgKyBORFRS
MSk7Cj4gPiArCj4gPiAgCS8qIEFsc28gcmVzZXQgdGhlIGludGVycnVwdCBzdGF0dXMgcmVnaXN0
ZXIgKi8KPiA+ICAJbWFydmVsbF9uZmNfY2xlYXJfaW50KG5mYywgTkRDUl9BTExfSU5UKTsgIAo+
IAo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYWxzbyBiZSBtb3ZlZCBiZWZvcmUgdGhlCj4gCj4gCWlm
IChjaGlwID09IG5mYy0+c2VsZWN0ZWRfY2hpcCAmJgo+IAkgICAgZGllX25yID09IG1hcnZlbGxf
bmFuZC0+c2VsZWN0ZWRfZGllKQo+IAo+IGNoZWNrLgoKWWVzLCBJIHRoaW5rIGl0IGlzIG5vdCBu
ZWVkZWQsIEkgd2FudGVkIERhbmllbCB0byB0ZXN0LiBCdXQgbWF5YmUgaXQgaXMKYmV0dGVyIHRv
IGVuc3VyZSBpbnRlcnJ1cHRzIGFyZSBhbHdheXMgY2xlYXJlZCBhbnl3YXkuIEknbGwgc2VuZCBh
IHYyCnRoZW4uCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
