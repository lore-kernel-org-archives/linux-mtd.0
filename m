Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BD2C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Vk0cguizecVJ3iNNjCIlIyCYIlmrdWvb/cvCh5SjE4=; b=LtnE6Ypdyt8NWx
	uUncu3M0nl/N1W2THYyWasHytNGPuDrftk7nzIqZAuBzoFvXGqaMd96XxRgt8HvJVaqWbZ0EYHZgG
	qeBg0vi9/ByjR8XraDnT+MtPK3OB2tgAbjsXhA+YwZ1qMIhFPU2we/kQudZ/5Q+MtpZJVKENCQ01d
	vHXj8bd/cyWzydWkB0U+nKiCdiQTjepxOCp8W8zmtEqPbNQwzRUFPK1wo5bC6qvaNjMcR0/h6CCA7
	Vk0ExyIYRrx0qOvomOTNbRi862m88sym9XiVD7DlnH/dfbKGS9LA4YNO0Hzlx8IPSJqumpl+C5bmr
	liHMk55lME2TNzdSQw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9dJ-002THQ-0n; Wed, 19 Oct 2022 14:01:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9dF-002TFr-DD
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 14:01:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 759E4E0011;
	Wed, 19 Oct 2022 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666188074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjKdsuqmYbsXzYHtoZDaHDKcmYy5lTqGujRVSrLJ6OQ=;
	b=Thd2kXRj9N1oBve4jOiexYkCk5cYDHDljXCH7CofbgvPKfK0Xl/oRJCzQtHFGFf7b2J7uD
	BIf1zg+8S/hqZT4vlvcbC+sYx5tdPvFTmybn05VPHm2SSFxSqXMjRegMItD4lvjnaOV/w9
	VZMzXGMAB7q/WxZuNwjNxcBRsQSRsdEugNigC5wESZTp8umdIpZMmAXrAnZXivBfJkt5CM
	S7wSYReb9jefMRQ/BTMumsyMOvDUuLwD+XS+TLdNYUOcJRvyPCWhsMCaVzT9j3tOD5cOmv
	31vX0RKNqcYOcvB0PeihxsMYcf19zPzsX6SCEibg0NoZ8+Rb/Dy+l3UjOIfElQ==
Date: Wed, 19 Oct 2022 16:01:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andreas Oetken <ennoerlangen@gmail.com>
Cc: linux-mtd@lists.infradead.org, Andreas Oetken
 <andreas.oetken@siemens-energy.com>
Subject: Re: [PATCH] mtd: devices: add fixups to support MT28FW02GBBA1HPC
Message-ID: <20221019160113.43213ced@xps-13>
In-Reply-To: <20221019135007.15932-1-ennoerlangen@gmail.com>
References: <20221019135007.15932-1-ennoerlangen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_070117_733719_D06D8F96 
X-CRM114-Status: GOOD (  20.47  )
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

SGkgQW5kcmVhcywKCmVubm9lcmxhbmdlbkBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAxOSBPY3Qg
MjAyMiAxNTo1MDowNyArMDIwMDoKCj4gQXBwbHkgZXhpc3RpbmcgZml4dXBzIGZvciBNVDI4Rlcw
MkdCQkExSFBDIGZyb206Cj4gQ29tbWl0IDBhOGU5ODMwNWY2M2RlYWYwYTc5OWQ1Y2Y1NTMyY2M4
M2FmMDM1ZDEgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjoKPiBVc2UgY2hpcF9yZWFkeSgpIGZvciB3
cml0ZSBvbiBTMjlHTDA2NE4iKQo+IENvbW1pdCAwZmUzZWRlNzk0MWRmY2Q2ZmQ1NDBmYzJiMDg2
NDUzZDNlZThmMjM2ICgibXRkOiBjZmk6IEFkZCBlYXJseQo+IGZpeHVwIGZvciBTNzBHTDAyR1Mi
KQo+IAoKVGhlIHN1YmplY3QgcHJlZml4IGlzIHdyb25nIGFuZCB5b3UgbmVlZCB0byB1c2UgZ2V0
X21haW50YWluZXJzLnBsIHRvCmZpbmQgdGhlIHJpZ2h0IG1haW50YWluZXJzIChpbiB0aGlzIGNh
c2UsIFZpZ25lc2gpIGFuZCBjYXRjaCBoaXMKYXR0ZW50aW9uIHdpdGggdGhlIHJpZ2h0IHRpdGxl
LgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE9ldGtlbiA8ZW5ub2VybGFuZ2VuQGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAgNCArKyst
Cj4gIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9wcm9iZS5jICAgICAgIHwgMTUgKysrKysrKysrKysr
KystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgYi9k
cml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+IGluZGV4IDliZDY1ZjNmODA1Yy4u
NGUwYmMyYTFhYmI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jCj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBAQCAt
NDQxLDggKzQ0MSwxMCBAQCBzdGF0aWMgdm9pZCBmaXh1cF9xdWlya3Moc3RydWN0IG10ZF9pbmZv
ICptdGQpCj4gIAlzdHJ1Y3QgbWFwX2luZm8gKm1hcCA9IG10ZC0+cHJpdjsKPiAgCXN0cnVjdCBj
ZmlfcHJpdmF0ZSAqY2ZpID0gbWFwLT5mbGRydl9wcml2Owo+ICAKPiAtCWlmIChjZmktPm1mciA9
PSBDRklfTUZSX0FNRCAmJiBjZmktPmlkID09IDB4MGMwMSkKPiArCWlmIChjZmktPm1mciA9PSBD
RklfTUZSX0FNRCAmJiBjZmktPmlkID09IDB4MGMwMSB8fAo+ICsJICAgIGNmaS0+bWZyID09IENG
SV9NRlJfSU5URUwgJiYgY2ZpLT5pZCA9PSAweDIyN2UpIC8qTVQyOEZXMDJHQkJBMUhQQyovCj4g
IAkJY2ZpLT5xdWlya3MgfD0gQ0ZJX1FVSVJLX0RRX1RSVUVfREFUQTsKPiArCj4gIH0KPiAgCj4g
IC8qIFVzZWQgdG8gZml4IENGSS1UYWJsZXMgb2YgY2hpcHMgd2l0aG91dCBFeHRlbmRlZCBRdWVy
eSBUYWJsZXMgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3Byb2JlLmMg
Yi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfcHJvYmUuYwo+IGluZGV4IGNmNDI2OTU2NDU0Yy4uMTAy
YzFmZmI5YWFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9wcm9iZS5jCj4g
KysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3Byb2JlLmMKPiBAQCAtMTg2LDkgKzE4NiwyMiBA
QCBzdGF0aWMgdm9pZCBmaXh1cF9zNzBnbDAyZ3NfY2hpcHMoc3RydWN0IGNmaV9wcml2YXRlICpj
ZmkpCj4gIAlwcl93YXJuKCJCYWQgUzcwR0wwMkdTIENGSSBkYXRhOyBhZGp1c3QgdG8gZGV0ZWN0
IDIgY2hpcHNcbiIpOwo+ICB9Cj4gIAo+ICsKPiArc3RhdGljIHZvaWQgZml4dXBfbXQyOGZ3MDJn
YmJhMWhwY19jaGlwcyhzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSkKPiArewo+ICsJLyoKPiArCSAq
IE1UMjhGVzAyR0JCQTFIUEMgZmxhc2ggcmVwb3J0cyBhIHNpbmdsZSAyNTYgTWlCIGNoaXAsIGJ1
dCBpcyByZWFsbHkgbWFkZSB1cAo+ICsJICogb2YgdHdvIDEyOCBNaUIgY2hpcHMgd2l0aCAxMDI0
IHNlY3RvcnMgZWFjaC4KPiArCSAqLwo+ICsJY2ZpLT5jZmlxLT5EZXZTaXplID0gMjc7Cj4gKwlj
ZmktPmNmaXEtPkVyYXNlUmVnaW9uSW5mb1swXSA9IDB4MjAwMDNmZjsKPiArCXByX3dhcm4oIkJh
ZCBNVDI4RlcwMkdCQkExSFBDIENGSSBkYXRhOyBhZGp1c3QgdG8gZGV0ZWN0IDIgY2hpcHNcbiIp
Owo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNmaV9lYXJseV9maXh1cCBjZmlfZWFy
bHlfZml4dXBfdGFibGVbXSA9IHsKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4NDgwMSwgZml4dXBfczcw
Z2wwMmdzX2NoaXBzIH0sCj4gLQl7IH0sCj4gKwl7IENGSV9NRlJfSU5URUwsIDB4MjI3ZSwgZml4
dXBfbXQyOGZ3MDJnYmJhMWhwY19jaGlwc30sCj4gKwl7IH0KPiAgfTsKPiAgCj4gIHN0YXRpYyBp
bnQgX194aXByYW0gY2ZpX2NoaXBfc2V0dXAoc3RydWN0IG1hcF9pbmZvICptYXAsCgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
