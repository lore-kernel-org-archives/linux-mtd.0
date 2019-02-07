Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED85C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 11:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD523218FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 11:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sp/hagKR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD523218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkImwa992xIjCvoekqu/CqwI32KxAG8HhcjSTz0Rwi8=; b=Sp/hagKRtqa7cY
	pNbxaLCHhC+1DOnCbHxGg2mb8knPeHaa2WuOPs3kJavnXYD8IhFR4BpF3uS55XabEq32QYy06M7Wh
	Q3c6vkYX3bI5+Q1otzTF6o1icGRrALPJZh41tMko50Jn+/SY8r7CkPo/UoFDGSe0r9kSR7Dqk5/UM
	CqIS2APHpM2f8I0oYtMNo1MJc7r3xYIMTP+1VzRrgZ13hVlhi3ajF0FEzM73q17rdGSMzIS6Fd+Bg
	tizhz/M+ieWd9BMHlP3Pplim6JE3lpyk0Os/jWgLn18Dmw88zGlF0SK3Ct6h1wOiB0pXwN2oFK6UI
	jyRC1DOZ580ANapvGe7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grhRW-000238-2y; Thu, 07 Feb 2019 11:02:06 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grhRR-00022J-Kz
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 11:02:04 +0000
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3E450240014;
 Thu,  7 Feb 2019 11:01:52 +0000 (UTC)
Date: Thu, 7 Feb 2019 12:01:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Introduce GPMI_IS_MXS() macro
Message-ID: <20190207120151.37b7bbd3@xps13>
In-Reply-To: <20190207105055.10860-1-festevam@gmail.com>
References: <20190207105055.10860-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_030201_836762_93953188 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: han.xu@nxp.com, martin.kepplinger@ginzinger.com,
 linux-mtd@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFRo
dSwgIDcgRmViIDIwMTkgMDg6NTA6NTQKLTAyMDA6Cgo+IEludHJvZHVjZSBhIEdQTUlfSVNfTVhT
KCkgbWFjcm8gdG8gdGFrZSBpbnRvIGFjY291bnQgdGhlIGNhc2VzCj4gd2hlbiBteDIzIG9yIG14
MjggYXJlIHVzZWQsIHdoaWNoIGhlbHBzIHJlYWRhYmlsaXR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMgIHwgNiArKy0tLS0KPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIHwgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmggfCAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3Bt
aS1uYW5kL2dwbWktbGliLmMKPiBpbmRleCBhNDc2OGRmNTA4M2YuLmE4YjI2ZDJlNzkzYyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gQEAgLTE1Nyw4
ICsxNTcsNyBAQCBpbnQgZ3BtaV9pbml0KHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiAg
CSAqIFJlc2V0IEJDSCBoZXJlLCB0b28uIFdlIGdvdCBmYWlsdXJlcyBvdGhlcndpc2UgOigKPiAg
CSAqIFNlZSBsYXRlciBCQ0ggcmVzZXQgZm9yIGV4cGxhbmF0aW9uIG9mIE1YMjMgYW5kIE1YMjgg
aGFuZGxpbmcKPiAgCSAqLwo+IC0JcmV0ID0gZ3BtaV9yZXNldF9ibG9jayhyLT5iY2hfcmVncywK
PiAtCQkJICAgICAgIEdQTUlfSVNfTVgyMyh0aGlzKSB8fCBHUE1JX0lTX01YMjgodGhpcykpOwo+
ICsJcmV0ID0gZ3BtaV9yZXNldF9ibG9jayhyLT5iY2hfcmVncywgR1BNSV9JU19NWFModGhpcykp
Owo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9vdXQ7Cj4gIAo+IEBAIC0yNjYsOCArMjY1LDcg
QEAgaW50IGJjaF9zZXRfZ2VvbWV0cnkoc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ICAJ
KiBjaGlwLCBvdGhlcndpc2UgaXQgd2lsbCBsb2NrIHVwLiBTbyB3ZSBza2lwIHJlc2V0dGluZyBC
Q0ggb24gdGhlIE1YMjMuCj4gIAkqIGFuZCBNWDI4Lgo+ICAJKi8KPiAtCXJldCA9IGdwbWlfcmVz
ZXRfYmxvY2soci0+YmNoX3JlZ3MsCj4gLQkJCSAgICAgICBHUE1JX0lTX01YMjModGhpcykgfHwg
R1BNSV9JU19NWDI4KHRoaXMpKTsKPiArCXJldCA9IGdwbWlfcmVzZXRfYmxvY2soci0+YmNoX3Jl
Z3MsIEdQTUlfSVNfTVhTKHRoaXMpKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBlcnJfb3V0Owo+
ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFu
ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gaW5kZXgg
ZWQ0MDVjOTQzNGZlLi5iY2Y1MzI4Y2YyMzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Z3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gQEAgLTE3MSw3ICsxNzEsNyBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgZ3BtaV9jaGVja19lY2Moc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ICAJc3Ry
dWN0IGJjaF9nZW9tZXRyeSAqZ2VvID0gJnRoaXMtPmJjaF9nZW9tZXRyeTsKPiAgCj4gIAkvKiBE
byB0aGUgc2FuaXR5IGNoZWNrLiAqLwo+IC0JaWYgKEdQTUlfSVNfTVgyMyh0aGlzKSB8fCBHUE1J
X0lTX01YMjgodGhpcykpIHsKPiArCWlmIChHUE1JX0lTX01YUyh0aGlzKSkgewo+ICAJCS8qIFRo
ZSBteDIzL214Mjggb25seSBzdXBwb3J0IHRoZSBHRjEzLiAqLwo+ICAJCWlmIChnZW8tPmdmX2xl
biA9PSAxNCkKPiAgCQkJcmV0dXJuIGZhbHNlOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmggYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1p
LW5hbmQvZ3BtaS1uYW5kLmgKPiBpbmRleCBkMGI3OWJhYzI3MjguLmE4MDRhNGE1YmQ0NiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmgKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmgKPiBAQCAtMjA3
LDQgKzIwNyw1IEBAIHZvaWQgZ3BtaV9jb3B5X2JpdHModTggKmRzdCwgc2l6ZV90IGRzdF9iaXRf
b2ZmLAo+ICAKPiAgI2RlZmluZSBHUE1JX0lTX01YNih4KQkJKEdQTUlfSVNfTVg2USh4KSB8fCBH
UE1JX0lTX01YNlNYKHgpIHx8IFwKPiAgCQkJCSBHUE1JX0lTX01YN0QoeCkpCj4gKyNkZWZpbmUg
R1BNSV9JU19NWFMoeCkJCShHUE1JX0lTX01YMjMoeCkgfHwgR1BNSV9JU19NWDI4KHgpKQo+ICAj
ZW5kaWYKCkknbSBmaW5lIHdpdGggdGhlIHBhdGNoIGJ1dCBhcyB0aGlzIGRlcGVuZHMgb24gdGhl
IGZpeCBCb3JpcyBqdXN0IHRvb2sgSQp3aWxsIGFwcGx5IGl0IGZvciA1LjIuCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
