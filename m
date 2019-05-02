Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7C2C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 08:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C46B20873
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 08:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usWJRPlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C46B20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4026DKCCSP64ianxFpi7OrYJrcAR76jpa4iTHKfTyQc=; b=usWJRPltPF+wPl
	otuwsPO1iCy+ZoyuQGa53h0IYieHeTKcLoZoqFuTxm9R7thmNmV7dOvJtAjB64gT7X8vrY5R1mgX4
	rxEkGbqfOE8uRUYhtswAPWIVcIcQJAyQe2WnwmCDCTqE/GVOlemwloDQHvRLklEPgYOjKiaGrNo6U
	QzNSPcx1Obb/idoavybYJ3dlSWTufK3vNdqZFVTEdmKjPTj4C9ZHfCc0ckiyVNw3l5Gzj8D5fLEp6
	ZwiiT3uB2xiZZzMpFcXCkLhdw/24HyJs18jqEW2umDbJJRQzg6bUKJlFGeeMj1IzInj8Soc1EWz3j
	WKjhgeO4LLBPdR7nkSSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM71p-0001Dz-Pk; Thu, 02 May 2019 08:25:17 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM71m-00016t-Pe
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 08:25:16 +0000
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3B27810001D;
 Thu,  2 May 2019 08:25:05 +0000 (UTC)
Date: Thu, 2 May 2019 10:25:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] mtd: nand: raw: brcmnand: When oops in progress use pio
 and interrupt polling
Message-ID: <20190502102504.32b45247@xps13>
In-Reply-To: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
References: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_012515_138522_8D1618C9 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gV2Vk
LCAgMSBNYXkgMjAxOSAxMzo0NjoxNQotMDQwMDoKCj4gSWYgbXRkX29vcHMgaXMgaW4gcHJvZ3Jl
c3Mgc3dpdGNoIHRvIHBvbGxpbmcgZm9yIG5hbmQgY29tbWFuZCBjb21wbGV0aW9uCgpzL25hbmQv
TkFORC8KCj4gaW50ZXJydXB0cyBhbmQgdXNlIFBJTyBtb2RlIHdpaHRvdXQgRE1BIHNvIHRoYXQg
dGhlIG10ZF9vb3BzIGJ1ZmZlciBjYW4KPiBiZSBjb21wbGV0ZWx5IHdyaXR0ZW4gaW4gdGhlIGFz
c2luZ2VkIG5hbmQgcGFydGl0aW9uLgoKV2hhdCBhYm91dDoKCiJJZiBtdGRfb29wcyBpcyBpbiBw
cm9ncmVzcywgc3dpdGNoIHRvIHBvbGxpbmcgZHVyaW5nIE5BTkQgY29tbWFuZApjb21wbGV0aW9u
IGluc3RlYWQgb2YgcmVseWluZyBvbiBETUEvaW50ZXJydXB0cyBzbyB0aGF0IHRoZSBtdGRfb29w
cwpidWZmZXIgY2FuIGJlIGNvbXBsZXRlbHkgd3JpdHRlbiBpbiB0aGUgYXNzaWduZWQgTkFORCBw
YXJ0aXRpb24uIgoKPiBUaGlzIGlzIG5lZWRlZCBpbgo+IGNhc2VzIHdoZXJlIHRoZSBwYW5pYyBk
b2VzIG5vdCBoYXBwZW4gb24gY3B1MCBhbmQgdGhlcmUgaXMgb25seSBvbmUgb25saW5lCj4gQ1BV
IGFuZCB0aGUgcGFuaWMgaXMgbm90IG9uIGNwdTAuCgoiVGhpcyBpcyBuZWVkZWQgaW4gY2FzZSB0
aGUgcGFuaWMgZG9lcyBub3QgaGFwcGVuIG9uIENQVTAgYW5kIHRoZXJlIGlzCm9ubHkgb25lIG9u
bGluZSBDUFUuIgoKSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIG9yIGhv
dyB0aGlzIGNhbiBoYXBwZW4gKGFuZApiZSBhIHByb2JsZW0pLiBIYXZlIHlvdSBtZXQgc3VjaCBp
c3N1ZSBhbHJlYWR5IG9yIGlzIHRoaXMgcHVyZWx5CnNwZWN1bGF0aXZlPwoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDU1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+
IGluZGV4IDQ4MmM2ZjAuLmNmYmU1MWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMKPiBAQCAtODIzLDYgKzgyMywxMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
aGFzX2ZsYXNoX2RtYShzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKPiAgCXJldHVy
biBjdHJsLT5mbGFzaF9kbWFfYmFzZTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSB2b2lkIGRp
c2FibGVfZmxhc2hfZG1hX3hmZXIoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCj4g
K3sKPiArCWlmIChoYXNfZmxhc2hfZG1hKGN0cmwpKQo+ICsJCWN0cmwtPmZsYXNoX2RtYV9iYXNl
ID0gMDsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSBib29sIGZsYXNoX2RtYV9idWZfb2soY29u
c3Qgdm9pZCAqYnVmKQo+ICB7Cj4gIAlyZXR1cm4gYnVmICYmICFpc192bWFsbG9jX2FkZHIoYnVm
KSAmJgo+IEBAIC0xMjM3LDE1ICsxMjQzLDU4IEBAIHN0YXRpYyB2b2lkIGJyY21uYW5kX2NtZF9j
dHJsKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBkYXQsCj4gIAkvKiBpbnRlbnRpb25hbGx5
IGxlZnQgYmxhbmsgKi8KPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgaXNfbXRkX29vcHNfaW5fcHJv
Z3Jlc3Modm9pZCkKPiArewo+ICsJaW50IGkgPSAwOwo+ICsKPiArI2lmZGVmIENPTkZJR19NVERf
T09QUwo+ICsJaWYgKG9vcHNfaW5fcHJvZ3Jlc3MgJiYgc21wX3Byb2Nlc3Nvcl9pZCgpKSB7Cj4g
KwkJaW50IGNwdSA9IDA7Cj4gKwo+ICsJCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQo+ICsJCQkr
K2k7Cj4gKwl9Cj4gKyNlbmRpZgo+ICsJcmV0dXJuIGkgPT0gMSA/IHRydWUgOiBmYWxzZTsKCkkg
c3VwcG9zZSByZXR1cm4gKGkgPT0gMSk7IGlzIGVub3VnaAoKPiArfQo+ICsKPiArc3RhdGljIGJv
b2wgYnJjbXN0Yl9uYW5kX3dhaXRfZm9yX2NvbXBsZXRpb24oc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCkKPiArewo+ICsJc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QgPSBuYW5kX2dldF9jb250cm9s
bGVyX2RhdGEoY2hpcCk7Cj4gKwlzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCA9IGhv
c3QtPmN0cmw7Cj4gKwlib29sIGVyciA9IGZhbHNlOwo+ICsJaW50IHN0czsKPiArCj4gKwlpZiAo
aXNfbXRkX29vcHNfaW5fcHJvZ3Jlc3MoKSkgewo+ICsJCS8qIFN3aXRjaCB0byBpbnRlcnJ1cHQg
cG9sbGluZyBhbmQgUElPIG1vZGUgKi8KPiArCQlkaXNhYmxlX2ZsYXNoX2RtYV94ZmVyKGN0cmwp
Owo+ICsJCXN0cyA9IGJjbW5hbmRfY3RybF9wb2xsX3N0YXR1cyhjdHJsLCBOQU5EX0NUUkxfUkRZ
IHwKPiArCQkJCQkgICAgICAgTkFORF9TVEFUVVNfUkVBRFksCj4gKwkJCQkJICAgICAgIE5BTkRf
Q1RSTF9SRFkgfAo+ICsJCQkJCSAgICAgICBOQU5EX1NUQVRVU19SRUFEWSwgMCk7Cj4gKwkJZXJy
ID0gKHN0cyA8IDApID8gdHJ1ZSA6IGZhbHNlOwo+ICsJfSBlbHNlIHsKPiArCQl1bnNpZ25lZCBs
b25nIHRpbWVvID0gbXNlY3NfdG9famlmZmllcygKPiArCQkJCQkJTkFORF9QT0xMX1NUQVRVU19U
SU1FT1VUX01TKTsKPiArCQkvKiB3YWl0IGZvciBjb21wbGV0aW9uIGludGVycnVwdCAqLwo+ICsJ
CXN0cyA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmY3RybC0+ZG9uZSwgdGltZW8pOwo+
ICsJCWVyciA9IChzdHMgPD0gMCkgPyB0cnVlIDogZmFsc2U7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJu
IGVycjsKPiArfQo+ICsKPiAgc3RhdGljIGludCBicmNtbmFuZF93YWl0ZnVuYyhzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwKQo+ICB7Cj4gIAlzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCA9IG5hbmRf
Z2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKPiAgCXN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVy
ICpjdHJsID0gaG9zdC0+Y3RybDsKPiAtCXVuc2lnbmVkIGxvbmcgdGltZW8gPSBtc2Vjc190b19q
aWZmaWVzKDEwMCk7Cj4gKwlib29sIGVyciA9IGZhbHNlOwo+ICAKPiAgCWRldl9kYmcoY3RybC0+
ZGV2LCAid2FpdCBvbiBuYXRpdmUgY21kICVkXG4iLCBjdHJsLT5jbWRfcGVuZGluZyk7Cj4gLQlp
ZiAoY3RybC0+Y21kX3BlbmRpbmcgJiYKPiAtCQkJd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0
KCZjdHJsLT5kb25lLCB0aW1lbykgPD0gMCkgewoKV2hhdCBhYm91dCB0aGUgd2FpdF9mb3JfY29t
cGxldGlvbl90aW1lb3V0KCkgY2FsbCBpbiBicmNtbmFuZF93cml0ZSgpPwoKPiArCWlmIChjdHJs
LT5jbWRfcGVuZGluZykKPiArCQllcnIgPSBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxldGlv
bihjaGlwKTsKPiArCj4gKwlpZiAoZXJyKSB7Cj4gIAkJdTMyIGNtZCA9IGJyY21uYW5kX3JlYWRf
cmVnKGN0cmwsIEJSQ01OQU5EX0NNRF9TVEFSVCkKPiAgCQkJCQk+PiBicmNtbmFuZF9jbWRfc2hp
ZnQoY3RybCk7ICAKPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
