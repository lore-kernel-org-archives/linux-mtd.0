Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698D8C0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 12:29:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5C820881
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 12:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tIMDdeYL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5C820881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/zb3ut+Bi+y9rdXbO/oc88OV2oqp2ujCfjGqffqjFo=; b=tIMDdeYLmSOmAw
	AM7ipAwyhO2ywgxosPnDM9OM5oP0dP9f9HtqVYQy17M6t4s3P0iDL7Fr/TQFx6eLJIATbqxSOSOm1
	esfrPF8omo3ehU+EcPGd/Lc/CeE/X0rWB79uLpcYpcpFYpyFaSU7SyCsNJNn9FR7pAyX2otkqndaf
	cSInfD+SRufnsngQ9xa/sWCevZ6lBkhLDgrqAVqh19y5ESiS+xsPLugakToL5LMLXWBWskMFX8nko
	Ze1HxUG7HbmBeZ5P5h5Ajx798lP7t2CRnz8ZlW5k5OETERDZ/pa0pkfVOrrXnXvKJaUDaUuWk38OG
	pOZiaANCJjHbo8O/xiRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhvQe-0005CP-CV; Mon, 01 Jul 2019 12:29:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhvQa-0005Ba-Ne
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 12:29:02 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C27BC24001A;
 Mon,  1 Jul 2019 12:28:48 +0000 (UTC)
Date: Mon, 1 Jul 2019 14:28:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix ingenic_ecc dependency
Message-ID: <20190701142847.1c1ac4b1@xps13>
In-Reply-To: <20190629012248.12447-1-paul@crapouillou.net>
References: <20190629012248.12447-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_052901_079203_10B36CBE 
X-CRM114-Status: GOOD (  19.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, od@zcrc.me,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKCk9uZSBxdWVzdGlvbiBiZWxvdy4KClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZSBvbiBTYXQsIDI5IEp1biAyMDE5IDAzOjIyOjQ4CiswMjAwOgoKPiBJ
ZiBNVERfTkFORF9KWjQ3ODAgaXMgeSBhbmQgTVREX05BTkRfSlo0NzgwX0JDSCBpcyBtLAo+IHdo
aWNoIHNlbGVjdCBDT05GSUdfTVREX05BTkRfSU5HRU5JQ19FQ0MgdG8gbSwgYnVpbGRpbmcgZmFp
bHM6Cj4gCj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmQubzogSW4g
ZnVuY3Rpb24gYGluZ2VuaWNfbmFuZF9yZW1vdmUnOgo+IGluZ2VuaWNfbmFuZC5jOigudGV4dCsw
eDE3Nyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGluZ2VuaWNfZWNjX3JlbGVhc2UnCj4gZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmQubzogSW4gZnVuY3Rpb24gYGlu
Z2VuaWNfbmFuZF9lY2NfY29ycmVjdCc6Cj4gaW5nZW5pY19uYW5kLmM6KC50ZXh0KzB4MmVlKTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5nZW5pY19lY2NfY29ycmVjdCcKPiAKPiBUbyBmaXgg
dGhhdCwgdGhlIGluZ2VuaWNfbmFuZCBhbmQgaW5nZW5pY19lY2MgbW9kdWxlcyBoYXZlIGJlZW4g
ZnVzZWQKPiBpbnRvIG9uZSBzaW5nbGUgbW9kdWxlLgo+IC0gVGhlIGluZ2VuaWNfZWNjLmMgY29k
ZSBpcyBub3cgY29tcGlsZWQgaW4gb25seSBpZgo+ICAgJChDT05GSUdfTVREX05BTkRfSU5HRU5J
Q19FQ0MpIGlzIHNldC4gVGhpcyBpcyBub3cgYSBib29sZWFuIGluc3RlYWQKPiAgIG9mIHRyaXN0
YXRlLgo+IC0gVG8gYXZvaWQgY2hhbmdpbmcgdGhlIG1vZHVsZSBuYW1lLCB0aGUgaW5nZW5pY19u
YW5kLmMgZmlsZSBpcyBtb3ZlZCB0bwo+ICAgaW5nZW5pY19uYW5kX2Rydi5jLiBUaGVuIHRoZSBt
b2R1bGUgbmFtZSBpcyBzdGlsbCBpbmdlbmljX25hbmQuCj4gLSBTaW5jZSBpbmdlbmljX2VjYy5j
IGlzIG5vIG1vcmUgYSBtb2R1bGUsIHRoZSBtb2R1bGUtc3BlY2lmaWMgbWFjcm9zCj4gICBoYXZl
IGJlZW4gZHJvcHBlZCwgYW5kIHRoZSBmdW5jdGlvbnMgYXJlIG5vIG1vcmUgZXhwb3J0ZWQgZm9y
IHVzZSBieQo+ICAgdGhlIGluZ2VuaWNfbmFuZCBkcml2ZXIuCgpJIGFtIGZpbmUgd2l0aCB0aGlz
IGFwcHJvYWNoLgoKPiAKPiBGaXhlczogMTVkZThjNmVmZDBlICgibXRkOiByYXduYW5kOiBpbmdl
bmljOiBTZXBhcmF0ZSB0b3AtbGV2ZWwgYW5kIFNvQyBzcGVjaWZpYyBjb2RlIikKPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiBSZXBvcnRlZC1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gQ2M6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2Vp
LmNvbT4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9pbmdlbmljL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCA0
ICsrKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5jICAgICAg
ICAgICAgICAgfCA5IC0tLS0tLS0tLQo+ICAuLi4vcmF3L2luZ2VuaWMve2luZ2VuaWNfbmFuZC5j
ID0+IGluZ2VuaWNfbmFuZF9kcnYuY30gICB8IDAKPiAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ICByZW5hbWUgZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW5nZW5pYy97aW5nZW5pY19uYW5kLmMgPT4gaW5nZW5pY19uYW5kX2Rydi5jfSAoMTAwJSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9LY29uZmlnIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9LY29uZmlnCj4gaW5kZXggMTlhOTZjZTUxNWMxLi42
NmI3Y2ZmZGIwYzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9L
Y29uZmlnCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9LY29uZmlnCj4gQEAg
LTE2LDcgKzE2LDcgQEAgY29uZmlnIE1URF9OQU5EX0paNDc4MAo+ICBpZiBNVERfTkFORF9KWjQ3
ODAKPiAgCj4gIGNvbmZpZyBNVERfTkFORF9JTkdFTklDX0VDQwo+IC0JdHJpc3RhdGUKPiArCWJv
b2wKPiAgCj4gIGNvbmZpZyBNVERfTkFORF9KWjQ3NDBfRUNDCj4gIAl0cmlzdGF0ZSAiSGFyZHdh
cmUgQkNIIHN1cHBvcnQgZm9yIEpaNDc0MCBTb0MiCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2luZ2VuaWMvTWFrZWZpbGUgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmlj
L01ha2VmaWxlCj4gaW5kZXggMWFjNGY0NTViYWVhLi5iNjNkMzY4ODkyNjMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2luZ2VuaWMvTWFrZWZpbGUKPiBAQCAtMiw3ICsyLDkgQEAKPiAgb2JqLSQo
Q09ORklHX01URF9OQU5EX0paNDc0MCkgKz0gano0NzQwX25hbmQubwo+ICBvYmotJChDT05GSUdf
TVREX05BTkRfSlo0NzgwKSArPSBpbmdlbmljX25hbmQubwo+ICAKPiAtb2JqLSQoQ09ORklHX01U
RF9OQU5EX0lOR0VOSUNfRUNDKSArPSBpbmdlbmljX2VjYy5vCj4gK2luZ2VuaWNfbmFuZC15ICs9
IGluZ2VuaWNfbmFuZF9kcnYubwo+ICtpbmdlbmljX25hbmQtJChDT05GSUdfTVREX05BTkRfSU5H
RU5JQ19FQ0MpICs9IGluZ2VuaWNfZWNjLm8KPiArCj4gIG9iai0kKENPTkZJR19NVERfTkFORF9K
WjQ3NDBfRUNDKSArPSBqejQ3NDBfZWNjLm8KPiAgb2JqLSQoQ09ORklHX01URF9OQU5EX0paNDcy
NUJfQkNIKSArPSBqejQ3MjViX2JjaC5vCj4gIG9iai0kKENPTkZJR19NVERfTkFORF9KWjQ3ODBf
QkNIKSArPSBqejQ3ODBfYmNoLm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW5nZW5pYy9pbmdlbmljX2VjYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdl
bmljX2VjYy5jCj4gaW5kZXggZDNlMDg1YzU2ODVhLi5jOTU0MTg5NjA2ZjYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5jCj4gQEAgLTMwLDcgKzMwLDYg
QEAgaW50IGluZ2VuaWNfZWNjX2NhbGN1bGF0ZShzdHJ1Y3QgaW5nZW5pY19lY2MgKmVjYywKPiAg
ewo+ICAJcmV0dXJuIGVjYy0+b3BzLT5jYWxjdWxhdGUoZWNjLCBwYXJhbXMsIGJ1ZiwgZWNjX2Nv
ZGUpOwo+ICB9Cj4gLUVYUE9SVF9TWU1CT0woaW5nZW5pY19lY2NfY2FsY3VsYXRlKTsKPiAgCj4g
IC8qKgo+ICAgKiBpbmdlbmljX2VjY19jb3JyZWN0KCkgLSBkZXRlY3QgYW5kIGNvcnJlY3QgYml0
IGVycm9ycwo+IEBAIC01MSw3ICs1MCw2IEBAIGludCBpbmdlbmljX2VjY19jb3JyZWN0KHN0cnVj
dCBpbmdlbmljX2VjYyAqZWNjLAo+ICB7Cj4gIAlyZXR1cm4gZWNjLT5vcHMtPmNvcnJlY3QoZWNj
LCBwYXJhbXMsIGJ1ZiwgZWNjX2NvZGUpOwo+ICB9Cj4gLUVYUE9SVF9TWU1CT0woaW5nZW5pY19l
Y2NfY29ycmVjdCk7Cj4gIAo+ICAvKioKPiAgICogaW5nZW5pY19lY2NfZ2V0KCkgLSBnZXQgdGhl
IEVDQyBjb250cm9sbGVyIGRldmljZQo+IEBAIC0xMTEsNyArMTA5LDYgQEAgc3RydWN0IGluZ2Vu
aWNfZWNjICpvZl9pbmdlbmljX2VjY19nZXQoc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlKQo+
ICAJfQo+ICAJcmV0dXJuIGVjYzsKPiAgfQo+IC1FWFBPUlRfU1lNQk9MKG9mX2luZ2VuaWNfZWNj
X2dldCk7Cj4gIAo+ICAvKioKPiAgICogaW5nZW5pY19lY2NfcmVsZWFzZSgpIC0gcmVsZWFzZSB0
aGUgRUNDIGNvbnRyb2xsZXIgZGV2aWNlCj4gQEAgLTEyMiw3ICsxMTksNiBAQCB2b2lkIGluZ2Vu
aWNfZWNjX3JlbGVhc2Uoc3RydWN0IGluZ2VuaWNfZWNjICplY2MpCj4gIAljbGtfZGlzYWJsZV91
bnByZXBhcmUoZWNjLT5jbGspOwo+ICAJcHV0X2RldmljZShlY2MtPmRldik7Cj4gIH0KPiAtRVhQ
T1JUX1NZTUJPTChpbmdlbmljX2VjY19yZWxlYXNlKTsKPiAgCj4gIGludCBpbmdlbmljX2VjY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gQEAgLTE1OSw4ICsxNTUs
MyBAQCBpbnQgaW5nZW5pY19lY2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgCXJldHVybiAwOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woaW5nZW5pY19lY2NfcHJvYmUpOwoK
QW55IHJlYXNvbiB0byBrZWVwIHRoaXMgb25lPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
