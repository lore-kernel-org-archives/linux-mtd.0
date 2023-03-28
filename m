Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D39EC761AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuOzXw461OLjbj44ciDowCjHtzjctSloNHkrX6dwAZ8=; b=p4U7p8qRWccP+g
	eVj/leFkDX5NVnbF48GpEfn8arKGmS5EM+U1c6Mf4B1tYmWGnsArHvOsCCLx4vm6J6N8WLtW/wrfq
	Uqddmf00rrIyHoznk8BAGE795MhLftuzvRx7dLUgGfEFcsLMcSVsPA1VUafSeVpEiX8uJOvHjRvBo
	IfbQ9clMiXmf0lUp4909yrji30s0ILCS8RctLydJ+i9oJWZEjFq7oaE18YrLjyQT7+UqKyRmehC0O
	CiMB23HsAbLd5hsT7vYK0ifB3Dplme9y7QCH7lrTZPRsiws1fqpPQ6s/dSLVz2YLdkYaR0Ck79yDO
	dCO7oG58RZyvZO5TTglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8ug-00ETJJ-0i;
	Tue, 28 Mar 2023 12:58:58 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8ud-00ETHa-0e
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 12:58:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2872240014;
	Tue, 28 Mar 2023 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680008331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaraH5Y77gs5q9fjwC2tIxEic4YCl0W2OFuwmvWv0mc=;
	b=dsXuhsKyObeBblYlxHAMlTqFDwoZAoeu4ltY0Ows9OgexMiHB24FGwxidITC62ZsxiwCoF
	WeOEgXBdJ9A0957X9ZDsrsTwXuN5vnZ4ndccXSTVyagOw9zhhENPVAJuyoxvOhTxXvj2wZ
	dNqGAig/kWxcWMgzgaNAWz5A9exTAvHxFq6ilpwObe+CsC1Zi5gmQE778spJIQshqGQmgo
	dFpw07/xcCXEkd8sb4ltR2Gz9jOKiarTALJzTIkGDMjnp9KmJtoY4SBrBWG4e7UUKJyBs8
	aYXR8vp9vJBflmbr2qmfXSWy36RdAEj4J22Wbm2W54+YFbF4Xg5lbDpYzy6Hvg==
Date: Tue, 28 Mar 2023 14:58:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bang Li <libang.linuxer@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdblock: tolerate corrected bit-flips
Message-ID: <20230328145848.5c7e4f14@xps-13>
In-Reply-To: <20230323140350.69908-1-libang.linuxer@gmail.com>
References: <20230323140350.69908-1-libang.linuxer@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_055855_370018_43A2A1BE 
X-CRM114-Status: GOOD (  16.05  )
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

SGVsbG8sCgpsaWJhbmcubGludXhlckBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAyMyBNYXIgMjAy
MyAyMjowMzo1MCArMDgwMDoKCj4gbXRkX3JlYWQoKSBtYXkgcmV0dXJuIC1FVUNMRUFOIGluIGNh
c2Ugb2YgY29ycmVjdGVkIGJpdC1mbGlwcy5UaGlzCj4gcGFydGljdWxhciBjb25kaXRpb24gc2hv
dWxkIG5vdCBiZSB0cmVhdGVkIGxpa2UgYW4gZXJyb3IuCgpJJ20gZmluZSB3aXRoIHRoZSBwYXRj
aCwgUmljaGFyZCwgYXJlIHlvdSBva2F5IGFzIHdlbGw/Cgo+IFNpZ25lZC1vZmYtYnk6IEJhbmcg
TGkgPGxpYmFuZy5saW51eGVyQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkYmxv
Y2suYyB8IDEyICsrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRibG9jay5j
IGIvZHJpdmVycy9tdGQvbXRkYmxvY2suYwo+IGluZGV4IDFlOTRlN2QxMGI4Yi4uYTBhMTE5NGRj
MWQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGJsb2NrLmMKPiArKysgYi9kcml2ZXJz
L210ZC9tdGRibG9jay5jCj4gQEAgLTE1Myw3ICsxNTMsNyBAQCBzdGF0aWMgaW50IGRvX2NhY2hl
ZF93cml0ZSAoc3RydWN0IG10ZGJsa19kZXYgKm10ZGJsaywgdW5zaWduZWQgbG9uZyBwb3MsCj4g
IAkJCQltdGRibGstPmNhY2hlX3N0YXRlID0gU1RBVEVfRU1QVFk7Cj4gIAkJCQlyZXQgPSBtdGRf
cmVhZChtdGQsIHNlY3Rfc3RhcnQsIHNlY3Rfc2l6ZSwKPiAgCQkJCQkgICAgICAgJnJldGxlbiwg
bXRkYmxrLT5jYWNoZV9kYXRhKTsKPiAtCQkJCWlmIChyZXQpCj4gKwkJCQlpZiAocmV0ICYmICFt
dGRfaXNfYml0ZmxpcChyZXQpKQo+ICAJCQkJCXJldHVybiByZXQ7Cj4gIAkJCQlpZiAocmV0bGVu
ICE9IHNlY3Rfc2l6ZSkKPiAgCQkJCQlyZXR1cm4gLUVJTzsKPiBAQCAtMTg4LDggKzE4OCwxMiBA
QCBzdGF0aWMgaW50IGRvX2NhY2hlZF9yZWFkIChzdHJ1Y3QgbXRkYmxrX2RldiAqbXRkYmxrLCB1
bnNpZ25lZCBsb25nIHBvcywKPiAgCXByX2RlYnVnKCJtdGRibG9jazogcmVhZCBvbiBcIiVzXCIg
YXQgMHglbHgsIHNpemUgMHgleFxuIiwKPiAgCQkJbXRkLT5uYW1lLCBwb3MsIGxlbik7Cj4gIAo+
IC0JaWYgKCFzZWN0X3NpemUpCj4gLQkJcmV0dXJuIG10ZF9yZWFkKG10ZCwgcG9zLCBsZW4sICZy
ZXRsZW4sIGJ1Zik7Cj4gKwlpZiAoIXNlY3Rfc2l6ZSkgewo+ICsJCXJldCA9IG10ZF9yZWFkKG10
ZCwgcG9zLCBsZW4sICZyZXRsZW4sIGJ1Zik7Cj4gKwkJaWYgKHJldCAmJiAhbXRkX2lzX2JpdGZs
aXAocmV0KSkKPiArCQkJcmV0dXJuIHJldDsKPiArCQlyZXR1cm4gMDsKPiArCX0KPiAgCj4gIAl3
aGlsZSAobGVuID4gMCkgewo+ICAJCXVuc2lnbmVkIGxvbmcgc2VjdF9zdGFydCA9IChwb3Mvc2Vj
dF9zaXplKSpzZWN0X3NpemU7Cj4gQEAgLTIwOSw3ICsyMTMsNyBAQCBzdGF0aWMgaW50IGRvX2Nh
Y2hlZF9yZWFkIChzdHJ1Y3QgbXRkYmxrX2RldiAqbXRkYmxrLCB1bnNpZ25lZCBsb25nIHBvcywK
PiAgCQkJbWVtY3B5IChidWYsIG10ZGJsay0+Y2FjaGVfZGF0YSArIG9mZnNldCwgc2l6ZSk7Cj4g
IAkJfSBlbHNlIHsKPiAgCQkJcmV0ID0gbXRkX3JlYWQobXRkLCBwb3MsIHNpemUsICZyZXRsZW4s
IGJ1Zik7Cj4gLQkJCWlmIChyZXQpCj4gKwkJCWlmIChyZXQgJiYgIW10ZF9pc19iaXRmbGlwKHJl
dCkpCj4gIAkJCQlyZXR1cm4gcmV0Owo+ICAJCQlpZiAocmV0bGVuICE9IHNpemUpCj4gIAkJCQly
ZXR1cm4gLUVJTzsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
