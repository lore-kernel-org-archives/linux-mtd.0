Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6CAC282DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD9B208E3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5WSB8Oh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD9B208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZ1MCAbDqdXeubFk1gy3tLu5FccAclR+dl6tXSIoBSE=; b=H5WSB8OhsSElaB
	Aem42+qWnUM1cHZvNWv7Q9EM8Bc3kDf4ApX8vRWCgOz5dRdVKdEe/XKZlyY9AaAvm08zUIcLVd8zW
	hyv/1GsUQy5s7usCz9AI3O2XIELxuFfW7bV5/DofiLRF2Ys13sTEsTOnRHFEEjfDMqSnbRestosW5
	P7APYPwfhWmoe93OzD+RbnfD0W1SoFfUbh7sF5/SOgqSAOLuFlumIpLavf0Itna2RIC71T7f9dLoD
	IvG2hGLF4rov4kGuQXzZpxDgZiU41f8R63LJqNOLlhCRfgnnEAf5GnFDokPzGe47gX2jKVfw2sozW
	y1+pybrCCXFPr0OZoBNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPJs-000146-VP; Mon, 08 Apr 2019 08:07:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPJp-00012g-Lb
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 08:07:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 87A8326068F;
 Mon,  8 Apr 2019 09:07:50 +0100 (BST)
Date: Mon, 8 Apr 2019 10:07:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: Ensure the ND_RUN bit is reset
Message-ID: <20190408100747.7dc8412e@collabora.com>
In-Reply-To: <20190407193401.7983-1-miquel.raynal@bootlin.com>
References: <20190407193401.7983-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_010753_900032_A281908B 
X-CRM114-Status: GOOD (  20.95  )
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

T24gU3VuLCAgNyBBcHIgMjAxOSAyMTozNDowMSArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gU2luY2UgdGhlIG1pZ3JhdGlvbiBvZiB0aGUg
ZHJpdmVyIHRvIHN0b3AgdXNpbmcgdGhlIGxlZ2FjeQo+IC0+c2VsZWN0X2NoaXAoKSBob29rLCB0
aGVyZSBpcyBub3RoaW5nIGRlc2VsZWN0aW5nIHRoZSB0YXJnZXQgYW55bW9yZSwgIAo+IHRodXMg
dGhlIHNlbGVjdGlvbiBpcyBub3QgZm9yY2VkIGF0IHRoZSBuZXh0IGFjY2Vzcy4gRW5zdXJlIHRo
ZSBORF9SVU4KPiBiaXQgaXMgYWx3YXlzIGluIGEgY2xlYW4gc3RhdGUuCj4gCj4gQ2M6IERhbmll
bCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IEZpeGVzOiBiMjUyNTE0MTRmNmUwMCAoIm10ZDogcmF3bmFuZDogbWFydmVsbDogU3RvcCBpbXBs
ZW1lbnRpbmcgLT5zZWxlY3RfY2hpcCgpIikKPiBTdWdnZXN0ZWQtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiAKPiBIaSBEYW5pZWws
IGNvdWxkIHlvdSBwbGVhc2UgdGVzdCB0aGlzIHZlcnNpb24gb2YgdGhlIGZpeD8KPiAKPiBUaGFu
a3MsCj4gTWlxdcOobAo+IAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQu
YyB8IDEyICsrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2
ZWxsX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gaW5kZXgg
ZjM4ZTVjMWI4N2U0Li5hN2Q3ZjE3ZDg2ODIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWFydmVsbF9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxs
X25hbmQuYwo+IEBAIC03MjIsMTIgKzcyMiw2IEBAIHN0YXRpYyB2b2lkIG1hcnZlbGxfbmZjX3Nl
bGVjdF90YXJnZXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCXN0cnVjdCBtYXJ2ZWxsX25m
YyAqbmZjID0gdG9fbWFydmVsbF9uZmMoY2hpcC0+Y29udHJvbGxlcik7Cj4gIAl1MzIgbmRjcl9n
ZW5lcmljOwo+ICAKPiAtCWlmIChjaGlwID09IG5mYy0+c2VsZWN0ZWRfY2hpcCAmJiBkaWVfbnIg
PT0gbWFydmVsbF9uYW5kLT5zZWxlY3RlZF9kaWUpCj4gLQkJcmV0dXJuOwo+IC0KPiAtCXdyaXRl
bF9yZWxheGVkKG1hcnZlbGxfbmFuZC0+bmR0cjAsIG5mYy0+cmVncyArIE5EVFIwKTsKPiAtCXdy
aXRlbF9yZWxheGVkKG1hcnZlbGxfbmFuZC0+bmR0cjEsIG5mYy0+cmVncyArIE5EVFIxKTsKPiAt
Cj4gIAkvKgo+ICAJICogUmVzZXQgdGhlIE5EQ1IgcmVnaXN0ZXIgdG8gYSBjbGVhbiBzdGF0ZSBm
b3IgdGhpcyBwYXJ0aWN1bGFyIGNoaXAsCj4gIAkgKiBhbHNvIGNsZWFyIE5EX1JVTiBiaXQuCj4g
QEAgLTczNiw2ICs3MzAsMTIgQEAgc3RhdGljIHZvaWQgbWFydmVsbF9uZmNfc2VsZWN0X3Rhcmdl
dChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAJCSAgICAgICBORENSX0dFTkVSSUNfRklFTERT
X01BU0sgJiB+TkRDUl9ORF9SVU47Cj4gIAl3cml0ZWxfcmVsYXhlZChuZGNyX2dlbmVyaWMgfCBt
YXJ2ZWxsX25hbmQtPm5kY3IsIG5mYy0+cmVncyArIE5EQ1IpOwo+ICAKPiArCWlmIChjaGlwID09
IG5mYy0+c2VsZWN0ZWRfY2hpcCAmJiBkaWVfbnIgPT0gbWFydmVsbF9uYW5kLT5zZWxlY3RlZF9k
aWUpCj4gKwkJcmV0dXJuOwo+ICsKPiArCXdyaXRlbF9yZWxheGVkKG1hcnZlbGxfbmFuZC0+bmR0
cjAsIG5mYy0+cmVncyArIE5EVFIwKTsKPiArCXdyaXRlbF9yZWxheGVkKG1hcnZlbGxfbmFuZC0+
bmR0cjEsIG5mYy0+cmVncyArIE5EVFIxKTsKPiArCj4gIAkvKiBBbHNvIHJlc2V0IHRoZSBpbnRl
cnJ1cHQgc3RhdHVzIHJlZ2lzdGVyICovCj4gIAltYXJ2ZWxsX25mY19jbGVhcl9pbnQobmZjLCBO
RENSX0FMTF9JTlQpOwoKSSB0aGluayB0aGlzIHNob3VsZCBhbHNvIGJlIG1vdmVkIGJlZm9yZSB0
aGUKCglpZiAoY2hpcCA9PSBuZmMtPnNlbGVjdGVkX2NoaXAgJiYKCSAgICBkaWVfbnIgPT0gbWFy
dmVsbF9uYW5kLT5zZWxlY3RlZF9kaWUpCgpjaGVjay4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
