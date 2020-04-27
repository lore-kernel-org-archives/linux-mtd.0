Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CC5C54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:17:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EFC02054F
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oi4pWYXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EFC02054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ds7qDjpynpXNeoFAUUntghAxskxec/pmJkmX6nLTwM=; b=Oi4pWYXZ4hZmpe
	HcrwCI34IDcbd0lcxt+CmxJHeBwEnQLK/ddbJ0oUXc9QTvYI/wBvfYESdaaT9B90A5Xuh/pho7vBE
	kgkpkuM8k/cPojnGSe0xDTaoWowSoGd3K7VLp+tIEdIH0orYH6k/gDZ93Tsb9SmXffA1D3VQ+xfyV
	8W8FUJ4KLQVzhntSgz9Xza4GM4QvaR6MKNgWSkmvNbnEx7/qbnv81VhQnxQb/1KID251s/Q4C8TsS
	6HmmPBBEhnCuVPg0omJSzK/S+HJgcmg4CLbVdy/CD96G6ZfXFHvdJwRy4gAXtheNSuRoPKqE9imuu
	CVDrHMojYIU/41l8F/gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT5Vh-0003Rj-4b; Mon, 27 Apr 2020 15:17:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT5Vd-0003Qz-VL
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 15:17:27 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1D38020011;
 Mon, 27 Apr 2020 15:17:20 +0000 (UTC)
Date: Mon, 27 Apr 2020 17:17:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: atmel: Convert the driver to exec_op()
Message-ID: <20200427171719.395b84a7@xps13>
In-Reply-To: <20200418194959.1017197-2-boris.brezillon@collabora.com>
References: <20200418194959.1017197-1-boris.brezillon@collabora.com>
 <20200418194959.1017197-2-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_081726_278507_75C8B2F7 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpUaGFua3MgZm9yIHRoZSBjb252ZXJzaW9uIQoKQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gU2F0LCAxOCBBcHIKMjAyMCAy
MTo0OTo1OSArMDIwMDoKClsuLi5dCgo+ICAKPiAtc3RhdGljIHZvaWQgYXRtZWxfbmFuZF9jbWRf
Y3RybChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY21kLAo+IC0JCQkJdW5zaWduZWQgaW50
IGN0cmwpCj4gK3N0YXRpYyBpbnQgYXRtZWxfaHNtY19leGVjX3J3KHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsCj4gKwkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ym9wICpzdWJvcCkKPiAgewo+
ICsJY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyID0gc3Vib3AtPmluc3RyczsKPiAg
CXN0cnVjdCBhdG1lbF9uYW5kICpuYW5kID0gdG9fYXRtZWxfbmFuZChjaGlwKTsKPiAtCXN0cnVj
dCBhdG1lbF9uYW5kX2NvbnRyb2xsZXIgKm5jOwo+ICAKPiAtCW5jID0gdG9fbmFuZF9jb250cm9s
bGVyKGNoaXAtPmNvbnRyb2xsZXIpOwo+ICsJaWYgKFdBUk5fT05fT05DRShzdWJvcC0+bmluc3Ry
cyAhPSAxIHx8Cj4gKwkJCSAoaW5zdHItPnR5cGUgIT0gTkFORF9PUF9EQVRBX0lOX0lOU1RSICYm
Cj4gKwkJCSAgaW5zdHItPnR5cGUgIT0gTkFORF9PUF9EQVRBX09VVF9JTlNUUikpKQo+ICsJCXJl
dHVybiAtRUlOVkFMOwo+ICAKPiAtCWlmICgoY3RybCAmIE5BTkRfQ1RSTF9DSEFOR0UpICYmIG5h
bmQtPmFjdGl2ZWNzLT5jc2dwaW8pIHsKPiAtCQlpZiAoY3RybCAmIE5BTkRfTkNFKQo+IC0JCQln
cGlvZF9zZXRfdmFsdWUobmFuZC0+YWN0aXZlY3MtPmNzZ3BpbywgMCk7Cj4gLQkJZWxzZQo+IC0J
CQlncGlvZF9zZXRfdmFsdWUobmFuZC0+YWN0aXZlY3MtPmNzZ3BpbywgMSk7Cj4gLQl9Cj4gKwlp
ZiAoaW5zdHItPnR5cGUgPT0gTkFORF9PUF9EQVRBX0lOX0lOU1RSKQo+ICsJCWF0bWVsX25hbmRf
cmVhZF9idWYobmFuZCwgaW5zdHItPmN0eC5kYXRhLmJ1Zi5pbiwKPiArCQkJCSAgICBpbnN0ci0+
Y3R4LmRhdGEubGVuLAo+ICsJCQkJICAgIGluc3RyLT5jdHguZGF0YS5mb3JjZV84Yml0KTsKPiAr
CWVsc2UKPiArCQlhdG1lbF9uYW5kX3dyaXRlX2J1ZihuYW5kLCBpbnN0ci0+Y3R4LmRhdGEuYnVm
Lm91dCwKPiArCQkJCSAgICAgaW5zdHItPmN0eC5kYXRhLmxlbiwKPiArCQkJCSAgICAgaW5zdHIt
PmN0eC5kYXRhLmZvcmNlXzhiaXQpOwo+ICAKPiAtCWlmIChjdHJsICYgTkFORF9BTEUpCj4gLQkJ
d3JpdGViKGNtZCwgbmFuZC0+YWN0aXZlY3MtPmlvLnZpcnQgKyBuYy0+Y2Fwcy0+YWxlX29mZnMp
Owo+IC0JZWxzZSBpZiAoY3RybCAmIE5BTkRfQ0xFKQo+IC0JCXdyaXRlYihjbWQsIG5hbmQtPmFj
dGl2ZWNzLT5pby52aXJ0ICsgbmMtPmNhcHMtPmNsZV9vZmZzKTsKPiArCXJldHVybiAwOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgaW50IGF0bWVsX2hzbWNfZXhlY193YWl0cmR5KHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsCj4gKwkJCQkgICBjb25zdCBzdHJ1Y3QgbmFuZF9zdWJvcCAqc3Vib3ApCj4gK3sK
PiArCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9IHN1Ym9wLT5pbnN0cnM7Cj4g
KwlzdHJ1Y3QgYXRtZWxfbmFuZCAqbmFuZCA9IHRvX2F0bWVsX25hbmQoY2hpcCk7Cj4gKwo+ICsJ
aWYgKFdBUk5fT05fT05DRShzdWJvcC0+bmluc3RycyAhPSAxIHx8Cj4gKwkJCSBpbnN0ci0+dHlw
ZSAhPSBOQU5EX09QX1dBSVRSRFlfSU5TVFIpKQo+ICsJCXJldHVybiAtRUlOVkFMOwoKSG93IGNv
dWxkIHRoaXMgaGFwcGVuPyBJIHdvdWxkIGRyb3AgdGhpcyBleHRyYSBjaGVjayB3aGljaCBJTUhP
IGlzIG5vdAp1c2VmdWwgKHNhbWUgZm9yIGFsbCB0aGUgb2NjdXJyZW5jZXMgb2Ygc2ltaWxhciBj
b25kaXRpb25zKS4KCj4gKwo+ICsJcmV0dXJuIGF0bWVsX2hzbWNfbmFuZF93YWl0cmR5KG5hbmQs
IGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21zKTsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBuYW5kX29wX3BhcnNlciBhdG1lbF9oc21jX29wX3BhcnNlciA9IE5BTkRfT1BfUEFS
U0VSKAo+ICsJTkFORF9PUF9QQVJTRVJfUEFUVEVSTihhdG1lbF9oc21jX2V4ZWNfY21kX2FkZHIs
Cj4gKwkJTkFORF9PUF9QQVJTRVJfUEFUX0NNRF9FTEVNKHRydWUpLAo+ICsJCU5BTkRfT1BfUEFS
U0VSX1BBVF9BRERSX0VMRU0odHJ1ZSwgNSksCj4gKwkJTkFORF9PUF9QQVJTRVJfUEFUX0NNRF9F
TEVNKHRydWUpKSwKPiArCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4oYXRtZWxfaHNtY19leGVjX3J3
LAo+ICsJCU5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX0lOX0VMRU0oZmFsc2UsIFVJTlRfTUFYKSks
CgpJIGZpbmQgbW9yZSBtZWFuaW5nZnVsIHRvIHVzZSAwIHRoYW4gVUlOVF9NQVggYXMgdGhlIGNv
cmUgd2lsbCBpZ25vcmUKYW55IGJvdW5kYXJ5IGluIHRoaXMgY2FzZS4KCj4gKwlOQU5EX09QX1BB
UlNFUl9QQVRURVJOKGF0bWVsX2hzbWNfZXhlY19ydywKPiArCQlOQU5EX09QX1BBUlNFUl9QQVRf
REFUQV9JTl9FTEVNKGZhbHNlLCBVSU5UX01BWCkpLAoKWW91IHByb2JhYmx5IG1lYW50IERBVEFf
T1VUIGhlcmU/Cgo+ICsJTkFORF9PUF9QQVJTRVJfUEFUVEVSTihhdG1lbF9oc21jX2V4ZWNfd2Fp
dHJkeSwKPiArCQlOQU5EX09QX1BBUlNFUl9QQVRfV0FJVFJEWV9FTEVNKGZhbHNlKSksCj4gKyk7
Cj4gKwo+ICtzdGF0aWMgaW50IGF0bWVsX2hzbWNfbmFuZF9leGVjX29wKHN0cnVjdCBhdG1lbF9u
YW5kICpuYW5kLAo+ICsJCQkJICAgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCwKPiAr
CQkJCSAgIGJvb2wgY2hlY2tfb25seSkKPiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAoY2hl
Y2tfb25seSkKPiArCQlyZXR1cm4gbmFuZF9vcF9wYXJzZXJfZXhlY19vcCgmbmFuZC0+YmFzZSwK
PiArCQkJCQkgICAgICAmYXRtZWxfaHNtY19vcF9wYXJzZXIsIG9wLCB0cnVlKTsKPiArCj4gKwlh
dG1lbF9oc21jX25hbmRfc2VsZWN0X2RpZShuYW5kLCBvcC0+Y3MpOwo+ICsJcmV0ID0gbmFuZF9v
cF9wYXJzZXJfZXhlY19vcCgmbmFuZC0+YmFzZSwgJmF0bWVsX2hzbWNfb3BfcGFyc2VyLCBvcCwK
PiArCQkJCSAgICAgZmFsc2UpOwo+ICsJYXRtZWxfaHNtY19uYW5kX3Vuc2VsZWN0X2RpZShuYW5k
KTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAoKV2l0aCB0aGUgYWJvdmUgZml4ZWQsIHBs
ZWFzZSBhZGQgbXkKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
