Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD89BC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:42:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9A3206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpaCUhlc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9A3206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haiYtTYNdveB0IAyWTjRNGOG2LGaALrMVVHQUqFSoMg=; b=fpaCUhlc2PYSjp
	YQfjqGYgVCxTc/HLuKOwpNKhBvb86FHCwDonJM2Y1SdzDI3HMzi6koWzrkHPeERU45ImFHHo9fo9x
	hrEyVZ4K1skUeL0YBjyuLYEpPQJjuU9VX308WahKoC/Z7zJKxHpjm/igjjYB906lH/NZ9Qn+FGwA/
	UY1t4Mva8ubSuk/B81k2n+yTWeoSGriPtGcq9CROvwRgK3w+2tDyhsysvGTfxfZ5gfJuwkTVgS8P8
	ZDBEGlIo1sQuR9FIvpx41KJp3Nfg7gZ8px097sfXZkF+Jg+5aS7jmomNV7hAISHKAIcDJgopDLe9C
	GKT7QlqU5Ol2Z9EYEg5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipasn-0000O5-VH; Thu, 09 Jan 2020 16:42:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipasl-0000NO-Dz
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:42:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 523B920002;
 Thu,  9 Jan 2020 16:42:00 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:41:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add support manufacturer specific
 lock/unlock operatoin
Message-ID: <20200109174159.1737067f@xps13>
In-Reply-To: <1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
 <1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_084203_610441_9F5CE221 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
TW9uLCAyOCBPY3QgMjAxOSAxNzo1NToyNAorMDgwMDoKCj4gQWRkIG5hbmRfbG9jaygpICYgbmFu
ZF91bmxvY2soKSBmb3IgbWFudWZhY3R1cmVyIHNwZWNpZmljIGxvY2sgJiB1bmxvY2sKPiBvcGVy
YXRpb24gd2hpbGUgdGhlIGRldmljZSBzdXBwb3J0cyBCbG9jayBQcm90ZWN0aW9uIGZ1bmN0aW9u
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hc29uIFlhbmcgPG1hc29uY2N5YW5nQG14aWMuY29tLnR3
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCj4gIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAg
ICAgIHwgIDMgKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IDVjMmMzMGEuLjVl
MzE4ZmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IEBAIC00MzU2LDYgKzQzNTYs
MzQgQEAgc3RhdGljIHZvaWQgbmFuZF9zaHV0ZG93bihzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAg
CW5hbmRfc3VzcGVuZChtdGQpOwo+ICB9Cj4gIAo+ICsvKioKPiArICogbmFuZF9sb2NrIC0gW01U
RCBJbnRlcmZhY2VdIExvY2sgdGhlIE5BTkQgZmxhc2gKPiArICogQG10ZDogTVREIGRldmljZSBz
dHJ1Y3R1cmUKPiArICovCj4gK3N0YXRpYyBpbnQgbmFuZF9sb2NrKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdCBsZW4pCj4gK3sKPiArCXN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAgPSBtdGRfdG9fbmFuZChtdGQpOwo+ICsKPiArCWlmICghY2hpcC0+X2xvY2spCj4gKwkJ
cmV0dXJuIC1FTk9UU1VQUDsKPiArCj4gKwlyZXR1cm4gY2hpcC0+X2xvY2soY2hpcCwgb2ZzLCBs
ZW4pOwo+ICt9Cj4gKwo+ICsvKioKPiArICogbmFuZF91bmxvY2sgLSBbTVREIEludGVyZmFjZV0g
VW5sb2NrIHRoZSBOQU5EIGZsYXNoCj4gKyAqIEBtdGQ6IE1URCBkZXZpY2Ugc3RydWN0dXJlCj4g
KyAqLwo+ICtzdGF0aWMgaW50IG5hbmRfdW5sb2NrKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2Zm
X3Qgb2ZzLCB1aW50NjRfdCBsZW4pCj4gK3sKPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBt
dGRfdG9fbmFuZChtdGQpOwo+ICsKPiArCWlmICghY2hpcC0+X3VubG9jaykKPiArCQlyZXR1cm4g
LUVOT1RTVVBQOwo+ICsKPiArCXJldHVybiBjaGlwLT5fdW5sb2NrKGNoaXAsIG9mcywgbGVuKTsK
PiArfQo+ICsKPiAgLyogU2V0IGRlZmF1bHQgZnVuY3Rpb25zICovCj4gIHN0YXRpYyB2b2lkIG5h
bmRfc2V0X2RlZmF1bHRzKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIHsKPiBAQCAtNTc4Miw4
ICs1ODEwLDggQEAgc3RhdGljIGludCBuYW5kX3NjYW5fdGFpbChzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwKQo+ICAJbXRkLT5fcmVhZF9vb2IgPSBuYW5kX3JlYWRfb29iOwo+ICAJbXRkLT5fd3JpdGVf
b29iID0gbmFuZF93cml0ZV9vb2I7Cj4gIAltdGQtPl9zeW5jID0gbmFuZF9zeW5jOwo+IC0JbXRk
LT5fbG9jayA9IE5VTEw7Cj4gLQltdGQtPl91bmxvY2sgPSBOVUxMOwo+ICsJbXRkLT5fbG9jayA9
IG5hbmRfbG9jazsKPiArCW10ZC0+X3VubG9jayA9IG5hbmRfdW5sb2NrOwo+ICAJbXRkLT5fc3Vz
cGVuZCA9IG5hbmRfc3VzcGVuZDsKPiAgCW10ZC0+X3Jlc3VtZSA9IG5hbmRfcmVzdW1lOwo+ICAJ
bXRkLT5fcmVib290ID0gbmFuZF9zaHV0ZG93bjsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tdGQvcmF3bmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gaW5kZXggNGFi
OWJjYy4uMjQzMGVjZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiBAQCAtMTEzNiw2ICsxMTM2LDkg
QEAgc3RydWN0IG5hbmRfY2hpcCB7Cj4gIAkJY29uc3Qgc3RydWN0IG5hbmRfbWFudWZhY3R1cmVy
ICpkZXNjOwo+ICAJCXZvaWQgKnByaXY7Cj4gIAl9IG1hbnVmYWN0dXJlcjsKPiArCj4gKwlpbnQg
KCpfbG9jaykoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IG9mcywgdWludDY0X3QgbGVu
KTsKPiArCWludCAoKl91bmxvY2spKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZfdCBvZnMs
IHVpbnQ2NF90IGxlbik7CgpLZXJuZWwgZG9jdW1lbnRhdGlvbiBpcyBtaXNzaW5nIGhlcmUuCgpB
bHNvIHBsZWFzZSBmaXgga2J1aWxkdGVzdCByb2JvdCB3YXJuaW5ncy4KCldpdGggYWxsIHRoaXMg
ZG9uZSwgcGxlYXNlIGFkZCBteToKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
