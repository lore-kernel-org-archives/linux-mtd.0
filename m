Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8D8C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 19 May 2022 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJt7QTLFn4nh189md+yw6LYxJi4CPZrk71/ZOQI2HDM=; b=pYUPuPyDeEU2+A
	SvQxD6+LwoSw9dNgPcHvualHTHWtlwEcjYcJnkko9fKp+edV2ZOKrPXJhyhquoWzAgrUa9TD/ztpq
	8D4eH5VnkYopQEwDyRst749cO3nDq3Dd0TGA3szoGjRgw3UoV1MFb69DMrfzkjgYv2PXPPf4vU1Yt
	AFSbEXjVdhzlsyKI3xmqcxQKrIxO0rgrwWw5qc8ogijAmCovKCqwXH74t4/V5lybdBRMDSRY/rOSk
	z0Hl47i9USuT+ijKWYgXD4fWTgi39zQc5L1mj+FjqXNtxjR3ZtVRPVq1kMVoBHbRnkro8EMwCuy01
	uByrHcZh3bQgOX8thvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriht-008JHH-F1; Thu, 19 May 2022 16:08:57 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrihp-008JEr-Pf
 for linux-mtd@lists.infradead.org; Thu, 19 May 2022 16:08:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36A3FE000A;
 Thu, 19 May 2022 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652976532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByiOulBWamz/zuHBoIDwqdz5Do5Vv8M0VJXe3rUUGlc=;
 b=o8ZvioP/PWb4/1n3deyZ9sJmKepmeuwbVxEWmnPzG6Xl3AcqkCo+h4RzZa/uLH0xdjj4Qj
 U37C2RmTGOkgt2NMXRV+CPtoW0r62orYe5PDWnfFWeh5RgVLXzqLvOGGMfAeJHzTgkQFAK
 znJsqd2+R5LQNLHHlo34pTzD7zq7+/o33GI00EMFiowbjmwOkTczxWynf1y+d7nsimChX+
 FfsE5sPrEi/qvon9Jrf4nvhRsSS5GMPHjqsXXe0riVLgBh/LVQS1GHH2hPaBaovoX4y9rt
 h9Zn9lCfz6sLNP7vq18qTF654oJVZPMh0G1S2vfvPi03YmyMIpPtlF3rcl50SQ==
Date: Thu, 19 May 2022 18:08:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhengxun <zhengxunli.mxic@gmail.com>
Cc: linux-mtd@lists.infradead.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 1/4] mtd: spinand: Add support continuous read mode
Message-ID: <20220519180850.2190b171@xps-13>
In-Reply-To: <20220209091022.30155-2-zhengxunli.mxic@gmail.com>
References: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
 <20220209091022.30155-2-zhengxunli.mxic@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_090853_984841_1AD84A72 
X-CRM114-Status: GOOD (  17.14  )
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

SGkgWmhlbmd4dW4sCgp6aGVuZ3h1bmxpLm14aWNAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgIDkg
RmViIDIwMjIgMTc6MTA6MTkgKzA4MDA6Cgo+IFRoZSBwYXRjaCBzdXBwb3J0cyBzZXR0aW5nIHRo
ZSAiQ09OVCIgYml0IG9mIHRoZSBjb25maWd1cmF0aW9uCgogICAgICAgICAgICBhZGQgc3VwcG9y
dCBmb3IKCj4gcmVnaXN0ZXIgYW5kIGFkZGluZyBhIGNvbnRpbnVvdXMgcmVhZCBtb2RlIGZsYWcg
Zm9yIGlkZW50aWZpY2F0aW9uLgoKSXQncyBub3QgcmVhbGx5IGEgY29uZmlndXJhdGlvbiByZWdp
c3RlciwgaXQncyBjYXBhYmlsaXR5IGZsYWcuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW5neHVu
IDx6aGVuZ3h1bmxpLm14aWNAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMgfCAxMSArKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgg
fCAgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jCj4gaW5kZXggMmM4Njg1ZjFmMmZhLi5kYzJlMWRjMWRiZWUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jCj4gQEAgLTE5Myw2ICsxOTMsMTcgQEAgc3RhdGljIGludCBzcGluYW5kX2luaXRfcXVh
ZF9lbmFibGUoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICAJCQkgICAgICAgZW5h
YmxlID8gQ0ZHX1FVQURfRU5BQkxFIDogMCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgc3BpbmFu
ZF9jb250aW51b3VzX3JlYWRfZW5hYmxlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkK
PiArewo+ICsJcmV0dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfQ09OVF9SRUFEX0VO
QUJMRSwKPiArCQkJICAgICAgIENGR19DT05UX1JFQURfRU5BQkxFKTsKPiArfQo+ICsKPiArc3Rh
dGljIGludCBzcGluYW5kX2NvbnRpbnVvdXNfcmVhZF9kaXNhYmxlKHN0cnVjdCBzcGluYW5kX2Rl
dmljZSAqc3BpbmFuZCkKPiArewo+ICsJcmV0dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBD
RkdfQ09OVF9SRUFEX0VOQUJMRSwgMCk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9l
Y2NfZW5hYmxlKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJICAgICAgYm9v
bCBlbmFibGUpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5o
IGIvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4gaW5kZXggNjk4ODk1NmI4NDkyLi4wNGJl
MTBlYzhmYjAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4gQEAgLTE1NCw2ICsxNTQsNyBAQAo+ICAj
ZGVmaW5lIFJFR19DRkcJCQkweGIwCj4gICNkZWZpbmUgQ0ZHX09UUF9FTkFCTEUJCUJJVCg2KQo+
ICAjZGVmaW5lIENGR19FQ0NfRU5BQkxFCQlCSVQoNCkKPiArI2RlZmluZSBDRkdfQ09OVF9SRUFE
X0VOQUJMRQlCSVQoMikKPiAgI2RlZmluZSBDRkdfUVVBRF9FTkFCTEUJCUJJVCgwKQo+ICAKPiAg
Lyogc3RhdHVzIHJlZ2lzdGVyICovCj4gQEAgLTMwNyw2ICszMDgsNyBAQCBzdHJ1Y3Qgc3BpbmFu
ZF9lY2NfaW5mbyB7Cj4gIAo+ICAjZGVmaW5lIFNQSU5BTkRfSEFTX1FFX0JJVAkJQklUKDApCj4g
ICNkZWZpbmUgU1BJTkFORF9IQVNfQ1JfRkVBVF9CSVQJCUJJVCgxKQo+ICsjZGVmaW5lIFNQSU5B
TkRfSEFTX0NPTlRfUkVBRF9CSVQJQklUKDIpCgpOb3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoLgoK
PiAgCj4gIC8qKgo+ICAgKiBzdHJ1Y3Qgc3BpbmFuZF9vbmRpZV9lY2NfY29uZiAtIHByaXZhdGUg
U1BJLU5BTkQgb24tZGllIEVDQyBlbmdpbmUgc3RydWN0dXJlCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
