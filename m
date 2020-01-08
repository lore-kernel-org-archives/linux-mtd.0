Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B76C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 23:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14C93206DA
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 23:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nTMWzZql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14C93206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEJAS6Rs3O/rLxGxpWoAIjrUVLUKwidsJSsLXGv6yC0=; b=nTMWzZqlqlByr7
	hnaNUMsVPjQ6ZNcJ/SNWIHMe8BFZlguu2y6fJoOdVWOelm/WAVVvQNHb2FsrwInvc6bcSE3N6TOmv
	GupQ2eFVp6xteTRNZTabmN/coQlhWSt78vLicqEBk/veSGlSL6l52r8zKM6BELHbTIIPratKUDkKM
	NBcXHqI0Qaz+MvF3loMUtTNnyLiyZPI9PH9pAv6/fpbsHDQOXCofaa7VzSjqJrt4t0BsxN/Zj8lXC
	C2AF3Ktzzps0g+X3nbtv0kFhav+/iCgt8AkAumVmyw07c7Y6VjT8Ne4bJfJywUWIUBiinwPB11sKr
	tymMLZGaCxzrDAt623tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipL4X-0006ts-6Q; Wed, 08 Jan 2020 23:49:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipL4T-0006sf-NA
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 23:49:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 64B716088971;
 Thu,  9 Jan 2020 00:49:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id X1dNf_tafTFs; Thu,  9 Jan 2020 00:49:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A7F386088973;
 Thu,  9 Jan 2020 00:49:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id acR1bddmrWbB; Thu,  9 Jan 2020 00:49:02 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 81E846088971;
 Thu,  9 Jan 2020 00:49:02 +0100 (CET)
Date: Thu, 9 Jan 2020 00:49:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <1518112485.16967.1578527342428.JavaMail.zimbra@nod.at>
In-Reply-To: <20191230165129.11925-5-miquel.raynal@bootlin.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
 <20191230165129.11925-5-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/8] mtd: Add support for emulated SLC mode on MLC NANDs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: Add support for emulated SLC mode on MLC NANDs
Thread-Index: fvG+8zwBR9Oy/XBxKAqH7c8InCJveQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_154906_051903_C3095AEC 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
PiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAiVHVkb3IgQW1iYXJ1
cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4sCj4gImxpbnV4LW10ZCIgPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+LCAiVGhvbWFzIFBldGF6em9uaSIgPHRob21hcy5wZXRhenpv
bmlAYm9vdGxpbi5jb20+LCAiQm9yaXMKPiBCcmV6aWxsb24iIDxib3Jpcy5icmV6aWxsb25AYm9v
dGxpbi5jb20+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4g
R2VzZW5kZXQ6IE1vbnRhZywgMzAuIERlemVtYmVyIDIwMTkgMTc6NTE6MjUKPiBCZXRyZWZmOiBb
UEFUQ0ggNC84XSBtdGQ6IEFkZCBzdXBwb3J0IGZvciBlbXVsYXRlZCBTTEMgbW9kZSBvbiBNTEMg
TkFORHMKCj4gRnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5j
b20+Cj4gCj4gTUxDIE5BTkRzIGNhbiBiZSBtYWRlIGEgYml0IG1vcmUgcmVsaWFibGUgaWYgd2Ug
b25seSBwcm9ncmFtIHRoZSBsb3dlcgo+IHBhZ2Ugb2YgZWFjaCBwYWlyLiBBdCBsZWFzdCwgdGhp
cyBzb2x2ZXMgdGhlIHBhaXJlZC1wYWdlcyBjb3JydXB0aW9uCj4gaXNzdWUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiAtLS0KPiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAgICAgfCAxODkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tCj4gZHJpdmVycy9tdGQvbXRkcGFydC5jICAgICAgICAgIHwg
IDU0ICsrKysrKy0tLS0KPiBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCAgICAgICAgfCAgIDcgKy0K
PiBpbmNsdWRlL2xpbnV4L210ZC9wYXJ0aXRpb25zLmggfCAgIDIgKwo+IGluY2x1ZGUvdWFwaS9t
dGQvbXRkLWFiaS5oICAgICB8ICAgMSArCj4gNSBmaWxlcyBjaGFuZ2VkLCAyMTMgaW5zZXJ0aW9u
cygrKSwgNDAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNv
cmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDI5MTY2NzQyMDhiMy4uZGUwYTY5
MmVjYjI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL210ZGNvcmUuYwo+IEBAIC02MTcsNiArNjE3LDE5IEBAIGludCBhZGRfbXRkX2Rldmlj
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAJCSAgICAhKG10ZC0+ZmxhZ3MgJiBNVERfTk9fRVJB
U0UpKSkKPiAJCXJldHVybiAtRUlOVkFMOwo+IAo+ICsJLyoKPiArCSAqIE1URF9NTENfSU5fU0xD
X01PREUgY2FuIG9ubHkgYmUgc2V0IG9uIHBhcnRpdGlvbnMsIHdoZW4gdGhlIG1hc3RlcgoKSSBz
dWdnZXN0IGdpdmluZyBhIG5hbWUgd2hpY2ggaW5kaWNhdGVzIHRoYXQgd2UgYXJlIGFjdHVhbGx5
IGVtdWxhdGluZwphbiBTTEMuIE1heWJlIE1URF9TTENfRU1VTEFUSU9OPwpTb21lIE1MQyBOQU5E
cyBzdXBwb3J0IFNMQyBtb2RlIGluIGhhcmR3YXJlLCBNVERfTUxDX0lOX1NMQ19NT0RFIHJlYWRz
IGxpa2UKdGhpcyBmZWF0dXJlLgoKPiArCSAqIGlzIGFuIE1MQyBOQU5EIGFuZCBoYXMgYSBwcm9w
ZXIgcGFpcmluZyBzY2hlbWUgZGVmaW5lZC4KPiArCSAqIFdlIGFsc28gcmVqZWN0IG1hc3RlcnMg
dGhhdCBpbXBsZW1lbnQgLT5fd3JpdGV2KCkgZm9yIG5vdywgYmVjYXVzZQo+ICsJICogTkFORCBj
b250cm9sbGVyIGRyaXZlcnMgZG9uJ3QgaW1wbGVtZW50IHRoaXMgaG9vaywgYW5kIGFkZGluZyB0
aGUKPiArCSAqIFNMQyAtPiBNTEMgYWRkcmVzcy9sZW5ndGggY29udmVyc2lvbiB0byB0aGlzIHBh
dGggaXMgdXNlbGVzcyBpZiB3ZQo+ICsJICogZG9uJ3QgaGF2ZSBhIHVzZXIuCj4gKwkgKi8KPiAr
CWlmIChtdGQtPmZsYWdzICYgTVREX01MQ19JTl9TTENfTU9ERSAmJgo+ICsJICAgICghbXRkX2lz
X3BhcnRpdGlvbihtdGQpIHx8IG1hc3Rlci0+dHlwZSAhPSBNVERfTUxDTkFOREZMQVNIIHx8Cj4g
KwkgICAgICFtYXN0ZXItPnBhaXJpbmcgfHwgbWFzdGVyLT5fd3JpdGV2KSkKPiArCQlyZXR1cm4g
LUVJTlZBTDsKPiArCj4gCW11dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gCj4gCWkgPSBp
ZHJfYWxsb2MoJm10ZF9pZHIsIG10ZCwgMCwgMCwgR0ZQX0tFUk5FTCk7Cj4gQEAgLTYzMiw2ICs2
NDUsMTQgQEAgaW50IGFkZF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+IAlpZiAo
bXRkLT5iaXRmbGlwX3RocmVzaG9sZCA9PSAwKQo+IAkJbXRkLT5iaXRmbGlwX3RocmVzaG9sZCA9
IG10ZC0+ZWNjX3N0cmVuZ3RoOwo+IAo+ICsJaWYgKG10ZC0+ZmxhZ3MgJiBNVERfTUxDX0lOX1NM
Q19NT0RFKSB7Cj4gKwkJaW50IG5ncm91cHMgPSBtdGRfcGFpcmluZ19ncm91cHMobWFzdGVyKTsK
PiArCj4gKwkJbXRkLT5lcmFzZXNpemUgLz0gbmdyb3VwczsKPiArCQltdGQtPnNpemUgPSAodTY0
KW10ZF9kaXZfYnlfZWIobXRkLT5zaXplLCBtYXN0ZXIpICoKPiArCQkJICAgIG10ZC0+ZXJhc2Vz
aXplOwoKQ2FuIHdlIHBsZWFzZSBoYXZlIGEgaGVscGVyIGZvciB0aGlzPyBZb3UgdXNlIHRoaXMg
Zm9ybXVsYSBtYW55IHRpbWVzLgoKPiArCX0KPiArCj4gCWlmIChpc19wb3dlcl9vZl8yKG10ZC0+
ZXJhc2VzaXplKSkKPiAJCW10ZC0+ZXJhc2VzaXplX3NoaWZ0ID0gZmZzKG10ZC0+ZXJhc2VzaXpl
KSAtIDE7Cj4gCWVsc2UKPiBAQCAtMTA3NCw5ICsxMDk1LDExIEBAIGludCBtdGRfZXJhc2Uoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvCj4gKmluc3RyKQo+IHsKPiAJc3Ry
dWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQpOwo+IAl1NjQgbXN0X29m
cyA9IG10ZF9nZXRfbWFzdGVyX29mcyhtdGQsIDApOwo+ICsJc3RydWN0IGVyYXNlX2luZm8gYWRq
aW5zdHI7Cj4gCWludCByZXQ7Cj4gCj4gCWluc3RyLT5mYWlsX2FkZHIgPSBNVERfRkFJTF9BRERS
X1VOS05PV047Cj4gKwlhZGppbnN0ciA9ICppbnN0cjsKPiAKPiAJaWYgKCFtdGQtPmVyYXNlc2l6
ZSB8fCAhbWFzdGVyLT5fZXJhc2UpCj4gCQlyZXR1cm4gLUVOT1RTVVBQOwo+IEBAIC0xMDkxLDEy
ICsxMTE0LDI3IEBAIGludCBtdGRfZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBl
cmFzZV9pbmZvCj4gKmluc3RyKQo+IAo+IAlsZWR0cmlnX210ZF9hY3Rpdml0eSgpOwo+IAo+IC0J
aW5zdHItPmFkZHIgKz0gbXN0X29mczsKPiAtCXJldCA9IG1hc3Rlci0+X2VyYXNlKG1hc3Rlciwg
aW5zdHIpOwo+IC0JaWYgKGluc3RyLT5mYWlsX2FkZHIgIT0gTVREX0ZBSUxfQUREUl9VTktOT1dO
KQo+IC0JCWluc3RyLT5mYWlsX2FkZHIgLT0gbXN0X29mczsKPiArCWlmIChtdGQtPmZsYWdzICYg
TVREX01MQ19JTl9TTENfTU9ERSkgewo+ICsJCWFkamluc3RyLmFkZHIgPSAobG9mZl90KW10ZF9k
aXZfYnlfZWIoaW5zdHItPmFkZHIsIG10ZCkgKgo+ICsJCQkJbWFzdGVyLT5lcmFzZXNpemU7Cj4g
KwkJYWRqaW5zdHIubGVuID0gKCh1NjQpbXRkX2Rpdl9ieV9lYihpbnN0ci0+YWRkciArIGluc3Ry
LT5sZW4sIG10ZCkgKgo+ICsJCQkJbWFzdGVyLT5lcmFzZXNpemUpIC0KPiArCQkJICAgICAgIGFk
amluc3RyLmFkZHI7Cj4gKwl9Cj4gKwo+ICsJYWRqaW5zdHIuYWRkciArPSBtc3Rfb2ZzOwo+ICsK
PiArCXJldCA9IG1hc3Rlci0+X2VyYXNlKG1hc3RlciwgJmFkamluc3RyKTsKPiArCj4gKwlpZiAo
YWRqaW5zdHIuZmFpbF9hZGRyICE9IE1URF9GQUlMX0FERFJfVU5LTk9XTikgewo+ICsJCWluc3Ry
LT5mYWlsX2FkZHIgPSBhZGppbnN0ci5mYWlsX2FkZHIgLSBtc3Rfb2ZzOwo+ICsJCWlmIChtdGQt
PmZsYWdzICYgTVREX01MQ19JTl9TTENfTU9ERSkgewo+ICsJCQlpbnN0ci0+ZmFpbF9hZGRyID0g
bXRkX2Rpdl9ieV9lYihpbnN0ci0+ZmFpbF9hZGRyLAo+ICsJCQkJCQkJIG1hc3Rlcik7Cj4gKwkJ
CWluc3RyLT5mYWlsX2FkZHIgKj0gbXRkLT5lcmFzZXNpemU7Cj4gKwkJfQo+ICsJfQo+IAo+IC0J
aW5zdHItPmFkZHIgLT0gbXN0X29mczsKPiAJcmV0dXJuIHJldDsKPiB9Cj4gRVhQT1JUX1NZTUJP
TF9HUEwobXRkX2VyYXNlKTsKPiBAQCAtMTI3Niw2ICsxMzE0LDEwMSBAQCBzdGF0aWMgaW50IG10
ZF9jaGVja19vb2Jfb3BzKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+IGxvZmZfdCBvZmZzLAo+IAly
ZXR1cm4gMDsKPiB9Cj4gCj4gK3N0YXRpYyBpbnQgbXRkX3JlYWRfb29iX3N0ZChzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgbG9mZl90IGZyb20sCj4gKwkJCSAgICBzdHJ1Y3QgbXRkX29vYl9vcHMgKm9w
cykKPiArewo+ICsJc3RydWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQp
Owo+ICsJaW50IHJldDsKPiArCj4gKwlmcm9tID0gbXRkX2dldF9tYXN0ZXJfb2ZzKG10ZCwgZnJv
bSk7Cj4gKwlpZiAobWFzdGVyLT5fcmVhZF9vb2IpCj4gKwkJcmV0ID0gbWFzdGVyLT5fcmVhZF9v
b2IobWFzdGVyLCBmcm9tLCBvcHMpOwo+ICsJZWxzZQo+ICsJCXJldCA9IG1hc3Rlci0+X3JlYWQo
bWFzdGVyLCBmcm9tLCBvcHMtPmxlbiwgJm9wcy0+cmV0bGVuLAo+ICsJCQkJICAgIG9wcy0+ZGF0
YnVmKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IG10ZF93cml0
ZV9vb2Jfc3RkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sCj4gKwkJCSAgICAgc3Ry
dWN0IG10ZF9vb2Jfb3BzICpvcHMpCj4gK3sKPiArCXN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyID0g
bXRkX2dldF9tYXN0ZXIobXRkKTsKPiArCWludCByZXQ7Cj4gKwo+ICsJdG8gPSBtdGRfZ2V0X21h
c3Rlcl9vZnMobXRkLCB0byk7Cj4gKwlpZiAobWFzdGVyLT5fd3JpdGVfb29iKQo+ICsJCXJldCA9
IG1hc3Rlci0+X3dyaXRlX29vYihtYXN0ZXIsIHRvLCBvcHMpOwo+ICsJZWxzZQo+ICsJCXJldCA9
IG1hc3Rlci0+X3dyaXRlKG1hc3RlciwgdG8sIG9wcy0+bGVuLCAmb3BzLT5yZXRsZW4sCj4gKwkJ
CQkgICAgIG9wcy0+ZGF0YnVmKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW50IG10ZF9vb2JfaW9fc2xjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgc3RhcnQs
IGJvb2wgcmVhZCwKPiArCQkJICBzdHJ1Y3QgbXRkX29vYl9vcHMgKm9wcykKClRoZSBuYW1lIGlz
IG1pc2xlYWRpbmcuIFdlIGRvbid0IGRvIE9PQiBJTyBvbiBhIFNMQyBOQU5ELAp3ZSBlbXVsYXRl
IFNMQy4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
