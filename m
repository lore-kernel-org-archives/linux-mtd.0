Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB166C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2C3206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wv0MnYKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2C3206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFybWgJSi8HrIHy/HcRd2WD21jBX70GjGIwXXxJ+yjA=; b=Wv0MnYKlMwxrTz
	jsCxlw32ZL1YFNDEkkV21NF7Zx6lknjWXWurkRBgl660dmhDVluRKjW15YTTp4xIs4pk1tT8Oe5QU
	rpw1yJi1uTqsHvBRgoWe5G3kC1LJBEtlt9b3UpkowCmoJW4olIrtl+YdKPuMVilncAVHwjGs0ooe7
	ODMmyDecB+Pn57CqizJTS+xiKDYpCUU62BsL+MV+lfmmGu+EEGZKzYpvFZ3yXeZQmJ8HwSpTLK/A6
	tBjXUtWFvbR966/gbxEo241uWpI0qWwI0Ah+5d2IFkwJ7PqUep2VbYQbUZsdGeaftyK3NasNVA4iL
	zT8s+SUdXTYGhktwqUbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipay7-0006U0-R1; Thu, 09 Jan 2020 16:47:35 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipay4-0006Si-Bd
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:47:34 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 58A56E000F;
 Thu,  9 Jan 2020 16:47:14 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:47:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 2/4] mtd: rawnand: Add support Macronix Block
 Protection function
Message-ID: <20200109174713.71ea377b@xps13>
In-Reply-To: <1572256527-5074-3-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
 <1572256527-5074-3-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_084732_668562_81B1FA09 
X-CRM114-Status: GOOD (  19.60  )
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
TW9uLCAyOCBPY3QgMjAxOSAxNzo1NToyNQorMDgwMDoKCj4gTWFjcm9uaXggQUMgc2VyaWVzIHN1
cHBvcnQgdXNpbmcgU0VUX0ZFQVRVUkVTIHRvIGNoYW5nZQo+IEJsb2NrIFByb3RlY3Rpb24gYW5k
IFVucHJvdGVjdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXNvbiBZYW5nIDxtYXNvbmNjeWFu
Z0BteGljLmNvbS50dz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25p
eC5jIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX21hY3Jvbml4LmMKPiBpbmRleCA1ODUxMWFlLi4xMzkyOWJmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+IEBAIC0xMSw2ICsxMSwxMCBAQAo+ICAjZGVm
aW5lIE1BQ1JPTklYX1JFQURfUkVUUllfQklUIEJJVCgwKQo+ICAjZGVmaW5lIE1BQ1JPTklYX05V
TV9SRUFEX1JFVFJZX01PREVTIDYKPiAgCj4gKyNkZWZpbmUgT05GSV9GRUFUVVJFX0FERFJfTVhJ
Q19QUk9URUNUSU9OIDB4QTAKPiArI2RlZmluZSBNWElDX0JMT0NLX1BST1RFQ1RJT05fQUxMX0xP
Q0sgMHgzOAo+ICsjZGVmaW5lIE1YSUNfQkxPQ0tfUFJPVEVDVElPTl9BTExfVU5MT0NLIDB4MAo+
ICsKPiAgc3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggewo+ICAJdTggcmVzZXJ2ZWQ7
Cj4gIAl1OCByZWxpYWJpbGl0eV9mdW5jOwo+IEBAIC01Nyw3ICs2MSw3IEBAIHN0YXRpYyB2b2lk
IG1hY3Jvbml4X25hbmRfb25maV9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gICAqIHRo
ZSB0aW1pbmdzIHVubGlrZSB3aGF0IGlzIGRlY2xhcmVkIGluIHRoZSBwYXJhbWV0ZXIgcGFnZS4g
VW5mbGFnCj4gICAqIHRoaXMgZmVhdHVyZSB0byBhdm9pZCB1bm5lY2Vzc2FyeSBkb3dudHVybnMu
Cj4gICAqLwo+IC1zdGF0aWMgdm9pZCBtYWNyb25peF9uYW5kX2ZpeF9icm9rZW5fZ2V0X3RpbWlu
Z3Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArc3RhdGljIGludCBtYWNyb25peF9uYW5kX2Zp
eF9icm9rZW5fZ2V0X3RpbWluZ3Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgewo+ICAJdW5z
aWduZWQgaW50IGk7Cj4gIAlzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGJyb2tlbl9nZXRfdGlt
aW5nc1tdID0gewo+IEBAIC03OCw3ICs4Miw3IEBAIHN0YXRpYyB2b2lkIG1hY3Jvbml4X25hbmRf
Zml4X2Jyb2tlbl9nZXRfdGltaW5ncyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJfTsKPiAg
Cj4gIAlpZiAoIWNoaXAtPnBhcmFtZXRlcnMuc3VwcG9ydHNfc2V0X2dldF9mZWF0dXJlcykKPiAt
CQlyZXR1cm47Cj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJ
WkUoYnJva2VuX2dldF90aW1pbmdzKTsgaSsrKSB7Cj4gIAkJaWYgKCFzdHJjbXAoYnJva2VuX2dl
dF90aW1pbmdzW2ldLCBjaGlwLT5wYXJhbWV0ZXJzLm1vZGVsKSkKPiBAQCAtODYsMjIgKzkwLDc5
IEBAIHN0YXRpYyB2b2lkIG1hY3Jvbml4X25hbmRfZml4X2Jyb2tlbl9nZXRfdGltaW5ncyhzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJfQo+ICAKPiAgCWlmIChpID09IEFSUkFZX1NJWkUoYnJv
a2VuX2dldF90aW1pbmdzKSkKPiAtCQlyZXR1cm47Cj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJYml0
bWFwX2NsZWFyKGNoaXAtPnBhcmFtZXRlcnMuZ2V0X2ZlYXR1cmVfbGlzdCwKPiAgCQkgICAgIE9O
RklfRkVBVFVSRV9BRERSX1RJTUlOR19NT0RFLCAxKTsKPiAgCWJpdG1hcF9jbGVhcihjaGlwLT5w
YXJhbWV0ZXJzLnNldF9mZWF0dXJlX2xpc3QsCj4gIAkJICAgICBPTkZJX0ZFQVRVUkVfQUREUl9U
SU1JTkdfTU9ERSwgMSk7Cj4gKwlyZXR1cm4gMTsKPiArfQo+ICsKPiArLyoKPiArICogTWFjcm9u
aXggTkFORCBzdXBwb3J0cyBCbG9jayBQcm90ZWN0aW9uIGJ5IFByb3RlY3RvaW4oUFQpIHBpbjsK
PiArICogYWN0aXZlIGhpZ2ggYXQgcG93ZXItb24gd2hpY2ggcHJvdGVjdHMgdGhlIGVudGlyZSBj
aGlwIGV2ZW4gdGhlICNXUCBpcwo+ICsgKiBkaXNhYmxlZC4gTG9jay91bmxvY2sgcHJvdGVjdGlv
biBhcmVhIGNhbiBiZSBwYXJ0aXRpb24gYWNjb3JkaW5nIHRvCj4gKyAqIHByb3RlY3Rpb24gYml0
cywgaS5lLiB1cHBlciAxLzIgbG9ja2VkLCB1cHBlciAxLzQgbG9ja2VkIGFuZCBzbyBvbi4KPiAr
ICovCj4gK3N0YXRpYyBpbnQgbXhpY19uYW5kX2xvY2soc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
bG9mZl90IG9mcywgdWludDY0X3QgbGVuKQo+ICt7Cj4gKwl1OCBmZWF0dXJlW09ORklfU1VCRkVB
VFVSRV9QQVJBTV9MRU5dOwo+ICsJaW50IHJldDsKPiArCj4gKwlmZWF0dXJlWzBdID0gTVhJQ19C
TE9DS19QUk9URUNUSU9OX0FMTF9MT0NLOwo+ICsJbmFuZF9zZWxlY3RfdGFyZ2V0KGNoaXAsIDAp
Owo+ICsJcmV0ID0gbmFuZF9zZXRfZmVhdHVyZXMoY2hpcCwgT05GSV9GRUFUVVJFX0FERFJfTVhJ
Q19QUk9URUNUSU9OLAo+ICsJCQkJZmVhdHVyZSk7Cj4gKwluYW5kX2Rlc2VsZWN0X3RhcmdldChj
aGlwKTsKPiArCWlmIChyZXQpCj4gKwkJcHJfZXJyKCIlcyBhbGwgYmxvY2tzIGZhaWxlZFxuIiwg
X19mdW5jX18pOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgbXhp
Y19uYW5kX3VubG9jayhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBsb2ZmX3Qgb2ZzLCB1aW50NjRf
dCBsZW4pCj4gK3sKPiArCXU4IGZlYXR1cmVbT05GSV9TVUJGRUFUVVJFX1BBUkFNX0xFTl07Cj4g
KwlpbnQgcmV0Owo+ICsKPiArCWZlYXR1cmVbMF0gPSBNWElDX0JMT0NLX1BST1RFQ1RJT05fQUxM
X1VOTE9DSzsKPiArCW5hbmRfc2VsZWN0X3RhcmdldChjaGlwLCAwKTsKPiArCXJldCA9IG5hbmRf
c2V0X2ZlYXR1cmVzKGNoaXAsIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVDVElPTiwKPiAr
CQkJCWZlYXR1cmUpOwo+ICsJbmFuZF9kZXNlbGVjdF90YXJnZXQoY2hpcCk7Cj4gKwlpZiAocmV0
KQo+ICsJCXByX2VycigiJXMgYWxsIGJsb2NrcyBmYWlsZWRcbiIsIF9fZnVuY19fKTsKPiArCj4g
KwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBNYWNyb25peCBOQU5EIEFDIHNlcmll
cyBzdXBwb3J0IEJsb2NrIFByb3RlY3Rpb24gYnkgU0VUX0ZFQVRVUkVTCj4gKyAqIHRvIGxvY2sv
dW5sb2NrIGJsb2Nrcy4KPiArICovCj4gIHN0YXRpYyBpbnQgbWFjcm9uaXhfbmFuZF9pbml0KHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIHsKPiArCWJvb2wgYmxvY2twcm90ZWN0ZWQgPSBmYWxz
ZTsKPiArCj4gIAlpZiAobmFuZF9pc19zbGMoY2hpcCkpCj4gIAkJY2hpcC0+b3B0aW9ucyB8PSBO
QU5EX0JCTV9GSVJTVFBBR0UgfCBOQU5EX0JCTV9TRUNPTkRQQUdFOwo+ICAKPiAtCW1hY3Jvbml4
X25hbmRfZml4X2Jyb2tlbl9nZXRfdGltaW5ncyhjaGlwKTsKPiArCWlmIChtYWNyb25peF9uYW5k
X2ZpeF9icm9rZW5fZ2V0X3RpbWluZ3MoY2hpcCkpCj4gKwkJYmxvY2twcm90ZWN0ZWQgPSB0cnVl
OwoKSSBkb24ndCBsaWtlIHRoaXMgYXQgYWxsIDopCgpQbGVhc2UgY3JlYXRlIGEgaGVscGVyIHdo
aWNoIGRldGVjdHMgd2hpY2ggcGFydCBpcyBicm9rZW4vcHJvdGVjdGVkCnRoZW4gY3JlYXRlIGhl
bHBlcnMgdG8gYWN0IGluIHRoaXMgY2FzZS4KCklmIHRoZSBsaXN0IGlzIGFic29sdXRlbHkgaWRl
bnRpY2FsLCB5b3UgY2FuIHNoYXJlIHRoZSBkZXRlY3Rpb24KaGVscGVyLiBPdGhlcndpc2UsIGlm
IHlvdSB0aGluayB0aGUgbGlzdCBjYW4gZGl2ZXJnZSwgcGxlYXNlIG9ubHkgc2hhcmUKdGhlIGxp
c3QgZm9yIG5vdyBhbmQgY3JlYXRlIHR3byBkZXRlY3Rpb24gaGVscGVycy4KCj4gKwo+ICAJbWFj
cm9uaXhfbmFuZF9vbmZpX2luaXQoY2hpcCk7Cj4gIAo+ICsJaWYgKGJsb2NrcHJvdGVjdGVkKSB7
Cj4gKwkJYml0bWFwX3NldChjaGlwLT5wYXJhbWV0ZXJzLnNldF9mZWF0dXJlX2xpc3QsCj4gKwkJ
CSAgIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVDVElPTiwgMSk7Cj4gKwkJYml0bWFwX3Nl
dChjaGlwLT5wYXJhbWV0ZXJzLmdldF9mZWF0dXJlX2xpc3QsCj4gKwkJCSAgIE9ORklfRkVBVFVS
RV9BRERSX01YSUNfUFJPVEVDVElPTiwgMSk7Cj4gKwo+ICsJCWNoaXAtPl9sb2NrID0gbXhpY19u
YW5kX2xvY2s7Cj4gKwkJY2hpcC0+X3VubG9jayA9IG14aWNfbmFuZF91bmxvY2s7Cj4gKwl9Cj4g
Kwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
