Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD651C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAO5hsnQHCBdr5Kgm2sHIZTKXxTus3mucK3FY6Ulrmo=; b=DD+D5oP5LkOM5W
	g0nq25U9N40sdHkXGkDq4bheRcMcWD90xhBnt0FXXtWhdc7FA8ZuvQ5+NiWFED83JCAKQ5SGzEtc5
	7IUz0uttzIcaC0s+yYY7X2n7hFjSw1qXrBRTb6MZTVl4q36NgbhRH4ZOp1rmdAfVXTi5TpJB4Vi57
	xsU4hQkXzxk8Dd6yWHI8K0gWBsCdYhwnCQMPNAYYXil2CEcLnSaYnRlwIOB8/SgSoHf2K+kWen7By
	TSD1X6mE9y+cu0ffjtKyamloZ6jzz+MD8MbPZzLCaKWJBky5mUcSjHNjA1UHZMHQK+hkwsVht2ygD
	KP3EAl3WfPBtCEqWa6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIo0-007Nl6-T0; Tue, 25 Jan 2022 10:12:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCInw-007Nji-Gf
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 10:12:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B2D6C000F;
 Tue, 25 Jan 2022 10:11:53 +0000 (UTC)
Date: Tue, 25 Jan 2022 11:11:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <robh+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>
Subject: Re: [PATCH 3/3] nvmem: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Message-ID: <20220125111152.4fa65ee4@xps13>
In-Reply-To: <20220105135734.271313-4-christophe.kerello@foss.st.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_021200_766305_19C5FAE3 
X-CRM114-Status: GOOD (  29.02  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBX
ZWQsIDUgSmFuIDIwMjIgMTQ6NTc6MzQgKzAxMDA6CgpTb3JyeSBmb3IgdGhlIHRpbWUgaXQgdG9v
ayBtZSB0byByZXZpZXcgdGhpcyBwYXRjaHNldC4KCj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJl
IHVzZWQgb24gTlZNRU4gbm9kZXMgYW5kIHRoZSBzYW1lIHByb3BlcnR5IGNhbgo+IGJlIGFsc28g
dXNlZCBvbiBNVEQgTkFORCBub2Rlcy4gSW4gY2FzZSBvZiB0aGUgd3AtZ3Bpb3MgcHJvcGVydHkg
aXMKPiBkZWZpbmVkIGF0IE5BTkQgbGV2ZWwgbm9kZSwgdGhlIEdQSU8gbWFuYWdlbWVudCBpcyBk
b25lIGF0IE5BTkQgZHJpdmVyCj4gbGV2ZWwuIFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hl
biB0aGUgZHJpdmVyIGlzIHByb2JlZCBvciByZXN1bWVkCj4gYW5kIGlzIGVuYWJsZWQgd2hlbiB0
aGUgZHJpdmVyIGlzIHJlbGVhc2VkIG9yIHN1c3BlbmRlZC4KPiAKPiBXaGVuIG5vIHBhcnRpdGlv
bnMgYXJlIGRlZmluZWQgaW4gdGhlIE5BTkQgRFQgbm9kZSwgdGhlbiB0aGUgTkFORCBEVCBub2Rl
Cj4gd2lsbCBiZSBwYXNzZWQgdG8gTlZNRU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0
eSBpcyBkZWZpbmVkIGluCj4gdGhpcyBub2RlLCB0aGUgR1BJTyByZXNvdXJjZSBpcyB0YWtlbiB0
d2ljZSBhbmQgdGhlIE5BTkQgY29udHJvbGxlcgo+IGRyaXZlciBmYWlscyB0byBwcm9iZS4KPiAK
PiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBzZXQgY29uZmlnLT53cF9ncGlvIGF0IE1URCBsZXZl
bCBiZWZvcmUgY2FsbGluZwo+IG52bWVtX3JlZ2lzdGVyIGZ1bmN0aW9uIGJ1dCBOVk1FTSBmcmFt
ZXdvcmsgd2lsbCB0b2dnbGVkIHRoaXMgR1BJTyBvbgoKdG9nZ2xlCgo+IGVhY2ggd3JpdGUgd2hl
biB0aGlzIEdQSU8gc2hvdWxkIG9ubHkgYmUgY29udHJvbGxlZCBhdCBOQU5EIGxldmVsIGRyaXZl
cgo+IHRvIGVuc3VyZSB0aGF0IHRoZSBXcml0ZSBQcm90ZWN0IGhhcyBub3QgYmVlbiBlbmFibGVk
Lgo+IAo+IEFzIE1URCBmcmFtZXdvcmsgaXMgb25seSB1c2luZyBOVk1FTiBmcmFtZXdvcmsgaW4g
cmVhZCBvbmx5LCBhIHdheSB0byBmaXgKCk5WTUVNCgo+IHRoaXMgY29uZmxpY3QgaXMgdG8gZ2V0
IHRoZSBHUElPIHJlc291cmNlIGF0IE5WTUVNIGxldmVsIG9ubHkgaWYgcmVnX3dyaXRlCj4gQVBJ
IGlzIGRlZmluZWQuIFRoaXMgR1BJTyBpcyBvbmx5IHRvZ2dsZWQgaWYgcmVnX3dyaXRlIG9wcyBp
cyBkZWZpbmVkLgoKVGhlIHNvbHV0aW9uIGxvb2tzIGEgYml0IGhhY2tpc2ggdG8gbWUuCgpUaGUg
bnZtZW1fY29uZmlnIHN0cnVjdHVyZSBhbHJlYWR5IGNvbnRhaW5zIGEgZmllbGQgbmFtZWQgd3Bf
Z3BpbyB3aGljaApzZWVtIHRvIGltcGx5IHRoYXQgY2FsbGVycyBjYW4gcHJvdmlkZSBhIHdwX2dw
aW8gaGFuZGxlIHRoZXJlIGlmIHRoZXkKd2FudC4gQnV0IHlldCB0aGUgbnZtZW0gY29yZSBpZ25v
cmVzIGlmIG5vIGdwaW8gd2FzIHByb3ZpZGVkIGFuZCB3aWxsCnRyeSB0byBnZXQgb25lIGFueXdh
eS4gU2hvdWxkbid0IHRoaXMgYmVoYXZpb3IgYmUgY2hhbmdlZD8KClRoZXJlIGFyZSBhbHJlYWR5
IGEgYmlnIG51bWJlciBvZiBjYWxsZXJzIGZvciBudm1lbV9yZWdpc3RlcigpIHNvIEkKdW5kZXJz
dGFuZCBpdCBtaWdodCBiZSBhIGJpdCB0ZWRpb3VzIHRvIGp1c3QgZHJvcCB0aGUgZWxzZSBwYXJ0
IG9mCnRoYXQgY29uZGl0aW9uLCBidXQgbWF5YmUgd2UgY2FuIHByb3ZpZGUgYSBkdW1teSBjb29r
aWUgaW50byB0aGUKd3BfZ3BpbyBmaWVsZCB3aGljaCB3b3VsZCBiZSBpbnRlcnByZXRlZCBhczog
ImRvbid0IG1lc3Mgd2l0aCBpdCIuIE9yCnBlcmhhcHMgYW4gYWRkaXRpb25hbCBmbGFnIHNvbWV3
aGVyZSBlbHNlIGp1c3QgdG8gY2xlYXJseSBza2lwIHRoZQp3cF9ncGlvIHRoaW5nIGVudGlyZWx5
PwoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxs
b0Bmb3NzLnN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9udm1lbS9jb3JlLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4gaW5kZXgg
ZTc2NWQzZDA1NDJlLi5lMTFjNzRkYjY0ZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udm1lbS9j
b3JlLmMKPiArKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+IEBAIC03NjksNyArNzY5LDcgQEAg
c3RydWN0IG52bWVtX2RldmljZSAqbnZtZW1fcmVnaXN0ZXIoY29uc3Qgc3RydWN0IG52bWVtX2Nv
bmZpZyAqY29uZmlnKQo+ICAKPiAgCWlmIChjb25maWctPndwX2dwaW8pCj4gIAkJbnZtZW0tPndw
X2dwaW8gPSBjb25maWctPndwX2dwaW87Cj4gLQllbHNlCj4gKwllbHNlIGlmIChjb25maWctPnJl
Z193cml0ZSkKPiAgCQludm1lbS0+d3BfZ3BpbyA9IGdwaW9kX2dldF9vcHRpb25hbChjb25maWct
PmRldiwgIndwIiwKPiAgCQkJCQkJICAgIEdQSU9EX09VVF9ISUdIKTsKPiAgCWlmIChJU19FUlIo
bnZtZW0tPndwX2dwaW8pKSB7CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
