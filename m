Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974D0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYRlItH5y85Ww4i7NBgnP5vJoNL0NsXpskIMW6/OQU8=; b=U9RoqUmYlKgV/5
	L+Lkylp0B7JQBl3lMtBSaER9ool9NmSI/MlavgCvFQdkFgCc/yik/9yG111qkHoHlGrgH5aDJXXaS
	x+xrfIWw3xN17m9t1FdqIu2nGZPLT9EnUiz869U+iMj3b+24ZtVgA7TMP1qvHR2qRX5NoKbtyVop7
	2s0eNJjmLDJwLb6V4pPHeVCjw0Stw8moHZAdcO9ZuKke7g3l37xpzXdUxolTYbxgysW+GUlj12wJa
	B/JfEkbSh3pL7wSftIzrbY819K7+sLsof9CPdHWWvb0G/jyOqcLzF/XxROttOsGC6+Ws3/gYhpWyT
	lQaYfpPZJG09Te5NxYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWxi-009WAr-JU; Mon, 31 Jan 2022 13:43:18 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWxf-009W9m-41
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 13:43:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8F55A200014;
 Mon, 31 Jan 2022 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643636592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNzzdrv2WUeULNwAyESjeTV+GL3fcftB5PM2h9pueek=;
 b=McTkn4xGuStHaGZwMMzwEHdXEZ1ZTskZtYmiln/jpDbssu2slFXlEV0LkL+BjV1Csi94cy
 9TAoEDRKoFgK8o8b+26uxzMYFbqL3EsqyKjcjPu5iI+T7Dh6DRmHzr7zbhBvFvureek5L/
 9j/d0wKtOMG8f/th0CbBOcF/rGk46muyGCzJeghyKaqufm7fHi36K62rU+SDmKYBXbrqxM
 lIYN4k8ATVj/mEXwnVfqp0O0/aKlOqxLVb0U7umRvs6JOiIRznkOhckJWye/Uxd3p4i9Gl
 JYhRsEVxixoBHmncpmVbF2B8JcDv36S8ZniYGtWZ8dzuAUbt7c4aFH2KcxDIVA==
Date: Mon, 31 Jan 2022 14:43:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <robh+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 4/4] mtd: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Message-ID: <20220131144309.0ffe7cc8@xps13>
In-Reply-To: <20220131095755.8981-5-christophe.kerello@foss.st.com>
References: <20220131095755.8981-1-christophe.kerello@foss.st.com>
 <20220131095755.8981-5-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_054315_641126_C86631E8 
X-CRM114-Status: GOOD (  23.15  )
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

SGkgVmlnbmVzaCwgVHVkb3J5LCBQcmF0eXVzaCwKCisgVHVkb3IgYW5kIFByYXR5dXNoCgpjaHJp
c3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20gd3JvdGUgb24gTW9uLCAzMSBKYW4gMjAyMiAxMDo1
Nzo1NSArMDEwMDoKCj4gV3AtZ3Bpb3MgcHJvcGVydHkgY2FuIGJlIHVzZWQgb24gTlZNRU0gbm9k
ZXMgYW5kIHRoZSBzYW1lIHByb3BlcnR5IGNhbgo+IGJlIGFsc28gdXNlZCBvbiBNVEQgTkFORCBu
b2Rlcy4gSW4gY2FzZSBvZiB0aGUgd3AtZ3Bpb3MgcHJvcGVydHkgaXMKPiBkZWZpbmVkIGF0IE5B
TkQgbGV2ZWwgbm9kZSwgdGhlIEdQSU8gbWFuYWdlbWVudCBpcyBkb25lIGF0IE5BTkQgZHJpdmVy
Cj4gbGV2ZWwuIFdyaXRlIHByb3RlY3QgaXMgZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHBy
b2JlZCBvciByZXN1bWVkCj4gYW5kIGlzIGVuYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlbGVh
c2VkIG9yIHN1c3BlbmRlZC4KPiAKPiBXaGVuIG5vIHBhcnRpdGlvbnMgYXJlIGRlZmluZWQgaW4g
dGhlIE5BTkQgRFQgbm9kZSwgdGhlbiB0aGUgTkFORCBEVCBub2RlCj4gd2lsbCBiZSBwYXNzZWQg
dG8gTlZNRU0gZnJhbWV3b3JrLiBJZiB3cC1ncGlvcyBwcm9wZXJ0eSBpcyBkZWZpbmVkIGluCj4g
dGhpcyBub2RlLCB0aGUgR1BJTyByZXNvdXJjZSBpcyB0YWtlbiB0d2ljZSBhbmQgdGhlIE5BTkQg
Y29udHJvbGxlcgo+IGRyaXZlciBmYWlscyB0byBwcm9iZS4KPiAKPiBBIG5ldyBCb29sZWFuIGZs
YWcgbmFtZWQgc2tpcF93cF9ncGlvIGhhcyBiZWVuIGFkZGVkIGluIG52bWVtX2NvbmZpZy4KPiBJ
biBjYXNlIHNraXBfd3BfZ3BpbyBpcyBzZXQsIGl0IG1lYW5zIHRoYXQgdGhlIEdQSU8gaXMgaGFu
ZGxlZCBieSB0aGUKPiBwcm92aWRlci4gTGV0cyBzZXQgdGhpcyBmbGFnIGluIE1URCBsYXllciB0
byBhdm9pZCB0aGUgY29uZmxpY3Qgb24KPiB3cF9ncGlvcyBwcm9wZXJ0eS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDcwZjQ5MmRjZTE1OC4uZTZkMjUxNTk0
ZGVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZGNvcmUuYwo+IEBAIC01NDYsNiArNTQ2LDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1f
YWRkKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJY29uZmlnLnN0cmlkZSA9IDE7Cj4gIAljb25m
aWcucmVhZF9vbmx5ID0gdHJ1ZTsKPiAgCWNvbmZpZy5yb290X29ubHkgPSB0cnVlOwo+ICsJY29u
ZmlnLnNraXBfd3BfZ3BpbyA9IHRydWU7Cj4gIAljb25maWcubm9fb2Zfbm9kZSA9ICFvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShub2RlLCAibnZtZW0tY2VsbHMiKTsKPiAgCWNvbmZpZy5wcml2ID0g
bXRkOwo+ICAKPiBAQCAtODMzLDYgKzgzNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbnZtZW1fZGV2aWNl
ICptdGRfb3RwX252bWVtX3JlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJY29uZmln
Lm93bmVyID0gVEhJU19NT0RVTEU7Cj4gIAljb25maWcudHlwZSA9IE5WTUVNX1RZUEVfT1RQOwo+
ICAJY29uZmlnLnJvb3Rfb25seSA9IHRydWU7Cj4gKwljb25maWcuc2tpcF93cF9ncGlvID0gdHJ1
ZTsKPiAgCWNvbmZpZy5yZWdfcmVhZCA9IHJlZ19yZWFkOwo+ICAJY29uZmlnLnNpemUgPSBzaXpl
Owo+ICAJY29uZmlnLm9mX25vZGUgPSBucDsKClRMRFI6IFRoZXJlIGlzIGEgY29uZmxpY3QgYmV0
d2VlbiBNVEQgYW5kIE5WTUVNLCB3aG8gc2hvdWxkIGhhbmRsZSB0aGUKV1AgcGluIHdoZW4gdGhl
cmUgaXMgb25lPyBBdCBsZWFzdCBmb3IgcmF3IE5BTkQgZGV2aWNlcywgSSBkb24ndCB3YW50CnRo
ZSBOVk1FTSBjb3JlIHRvIGhhbmRsZSB0aGUgd3AgcGluLiBTbyB3ZSd2ZSBpbnRyb2R1Y2VkIHRo
aXMKc2tpcF93cF9ncGlvIG52bWVtIGNvbmZpZyBvcHRpb24uIEJ1dCB0aGVyZSBhcmUgdHdvIHBs
YWNlcyB3aGVyZSB0aGlzCmJvb2xlYW4gY2FuIGJlIHNldCBhbmQgb25lIG9mIHRoZXNlIGlzIGZv
ciBvdHAgcmVnaW9ucyAoc2VlIGFib3ZlKS4gSW4KdGhpcyBjYXNlLCBJIGRvbid0IGtub3cgaWYg
aXQgaXMgc2FmZSBvciBpZiBDRkkvU1BJLU5PUiByZWx5IG9uIHRoZQpudm1lbSBwcm90ZWN0aW9u
LiBQbGVhc2UgdGVsbCB1cyBpZiB5b3UgdGhpbmsgdGhpcyBpcyBmaW5lIGZvciB5b3UuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
