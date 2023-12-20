Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC5C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=shX7VJRFEhSirjch5AmGkBS0BI8RTNxqsJoru8URNrY=; b=sfl0iP2ev0+n+I
	ac5IV1neZAcITlX0nf/EP3Bu5H9w1GmkSzoBw0usEfbGPpob8p2mnzFcuSj8H/jLXe7HOHbCvzde8
	iVtlKDcW91fBVLEYOwf/aEpjmvb8Wya5r+V0V6OGxvrrYjg1e2Jz0TlDQ5/PXqNZ7ObuVan3ZXqvC
	g6XF6aLw4syeMuxnLH9/bKhJwTKqo12uFmq2Vg+9hWoOGRNN4tPs/6qnuHejBTyveMRD+r79iKCIz
	L+kH0zyc4hLdHEBj9Gu/3P/ICjrGRl4iw4fb56CT2eDY19YiCbLUYvHLJKw8nMkp4y+WcJcmVwklR
	kjF/lApJ4ogc3KVU4cxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFssw-00Gk6W-31;
	Wed, 20 Dec 2023 09:29:02 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsst-00Gk5x-2Y
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 09:29:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45780C0004;
	Wed, 20 Dec 2023 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703064535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kmUkC/ZTGe+2unmA63wHsCp/NcSu96kpZwMIqO9W7aI=;
	b=lntUB4rrg/ZSL5v8Tv0CzbCuzbYdmo1QRx7bu6J0wVjZ3gPH1DTjYpq+/IlJNYUsoLI24l
	b2n37N0CHN/6Pe+cxtGU8wa7Kuh/4vd1Re+EnYmI46EhKZK8g2nZiaXZilSM4pEGtl7U/v
	Ydy/tDGJeOL9iYatnVUVd+78YQD6oJOfVC5qm8HZXdkPHaLYWovMQS3JRz6nzhV05uwYBD
	TDdUyTgjUdG88XHk3pCbnjFxLb+XKzXVIchkpmlNRaB5PilgNG6RqG2l23QoDzSYypygXP
	cUa/O8xO0AKsj+V7dlHDtjNVlovEl/YnlX2OaAAW4iIyIBRK58xIQQEXQ5R3kQ==
Date: Wed, 20 Dec 2023 10:28:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: [GIT PULL] mtd: nand: Changes for v6.8-rc1
Message-ID: <20231220102853.61275d76@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_012900_099650_74FB3769 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpUaGlzIGlzIHRoZSBOQU5EIFBSIGZvciB2Ni44LXJjMS4KClRoYW5rcywKTWlxdcOo
bAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBiODVlYTk1ZDA4NjQ3MWFmYjRh
ZDA2MjAxMmE0ZDczY2QzMjhmYTg2OgoKICBMaW51eCA2LjctcmMxICgyMDIzLTExLTEyIDE2OjE5
OjA3IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0
IHRhZ3MvbmFuZC9mb3ItNi44Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMDIzZTZh
YWQ3ZTVlN2YyZTA4NmMzOTlhYmQwNjc1NTg5YzEyMzcyODoKCiAgbXRkOiByYXduYW5kOiBzM2My
NDEwOiBmaXggRXhjZXNzIHN0cnVjdCBtZW1iZXIgZGVzY3JpcHRpb24ga2VybmVsLWRvYyB3YXJu
aW5ncyAoMjAyMy0xMi0yMCAxMDoxMToyNiArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKiBSYXcgTkFORAoKVGhl
IG1vc3QgbWVhbmluZ2Z1bCBjaGFuZ2UgYmVpbmcgdGhlIGNvbnZlcnNpb24gb2YgdGhlIGJyY21u
YW5kIGRyaXZlcgp0byB0aGUgLT5leGVjX29wKCkgQVBJLCB0aGlzIHNlcmllcyBicm91Z2h0IGFk
ZGl0aW9uYWwgY2hhbmdlcyB0byB0aGUKY29yZSBpbiBvcmRlciB0byBoZWxwIGNvbnRyb2xsZXIg
ZHJpdmVycyB0byBoYW5kbGUgdGhlbXNlbHZlcyB0aGUgV1AgcGluCmR1cmluZyBkZXN0cnVjdGl2
ZSBvcGVyYXRpb25zIHdoZW4gcmVsZXZhbnQuCgpBcyBhbHdheXMsIHRoZXJlIGlzIGFzIHdlbGwg
YSB3aG9sZSBidW5jaCBvZiBtaXNjZWxsYW5lb3VzIFc9MSBmaXhlcywKdG9nZXRoZXIgd2l0aCBh
IGZldyBydW50aW1lIGZpeGVzIChkb3VibGUgZnJlZSwgdGltZW91dCB2YWx1ZSwgT09CCmxheW91
dCwgbWlzc2luZyByZWdpc3RlciBpbml0aWFsaXphdGlvbikgYW5kIHRoZSB1c3VhbCBsb2FkIG9m
IHJlbW92ZQpjYWxsYmFja3MgdHVybmVkIGludG8gdm9pZCAod2hpY2ggbGVkIHRvIHN3aXRjaCB0
aGUgdHh4OW5kZm1jIGRyaXZlciB0bwp1c2UgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpKS4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KQXJzZW5peSBLcmFzbm92ICgyKToKICAgICAgbXRkOiByYXduYW5kOiBtZXNvbjogaW5p
dGlhbGl6ZSBjbG9jayByZWdpc3RlcgogICAgICBtdGQ6IHJhd25hbmQ6IG1lc29uOiBoYW5kbGUg
T09CIGJ1ZmZlciBhY2NvcmRpbmcgT09CIGxheW91dAoKQm9yaXMgQnJlemlsbG9uICgxKToKICAg
ICAgbXRkOiByYXduYW5kOiBBZGQgZGVzdHJ1Y3RpdmUgb3BlcmF0aW9uCgpEYXZpZCBSZWdhbiAo
Myk6CiAgICAgIG10ZDogcmF3bmFuZDogTkFORCBjb250cm9sbGVyIHdyaXRlIHByb3RlY3QKICAg
ICAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogcGFzcyBob3N0IHN0cnVjdCB0byBiY21uYW5kX2N0
cmxfcG9sbF9zdGF0dXMKICAgICAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogZXhlY19vcCBpbXBs
ZW1lbnRhdGlvbgoKRGluZ2hhbyBMaXUgKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IGRpc2tvbmNo
aXA6IGZpeCBhIHBvdGVudGlhbCBkb3VibGUgZnJlZSBpbiBkb2NfcHJvYmUKCk1pcXVlbCBSYXlu
YWwgKDMpOgogICAgICBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBGaXgga2VybmVsIGRvYwogICAgICBt
dGQ6IHJhd25hbmQ6IHJvY2tjaGlwOiBSZW5hbWUgYSBzdHJ1Y3R1cmUKICAgICAgbXRkOiByYXdu
YW5kOiByb2NrY2hpcDogQWRkIG1pc3NpbmcgdGl0bGUgdG8gYSBrZXJuZWwgZG9jIGNvbW1lbnQK
ClJhbmR5IER1bmxhcCAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogczNjMjQxMDogZml4IEV4Y2Vz
cyBzdHJ1Y3QgbWVtYmVyIGRlc2NyaXB0aW9uIGtlcm5lbC1kb2Mgd2FybmluZ3MKClJvbmFsZCBN
b250aGVybyAoMSk6CiAgICAgIG10ZDogcmF3bmFuZDogSW5jcmVtZW50IElGQ19USU1FT1VUX01T
RUNTIGZvciBuYW5kIGNvbnRyb2xsZXIgcmVzcG9uc2UKClV3ZSBLbGVpbmUtS8O2bmlnICg0KToK
ICAgICAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgbXRkOiByYXduYW5kOiB0eHg5bmRmbWM6IFN3
aXRjaCB0byBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkKICAgICAgbXRkOiByYXduYW5kOiB0eHg5
bmRmbWM6IERyb3AgaWYgYmxvY2sgd2l0aCBhbHdheXMgZmFsc2UgY29uZGl0aW9uCiAgICAgIG10
ZDogcmF3bmFuZDogdHh4OW5kZm1jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JjbTYzMTM4
X25hbmQuYyAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9iY202MzY4
X25hbmQuYyAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYmNtYV9u
YW5kLmMgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgICAgICAgIHwgNDA4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmggICAg
ICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtc3RiX25hbmQu
YyAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvaXByb2NfbmFuZC5j
ICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYyAgICAgICAg
ICAgICAgIHwgIDEwICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZjX25hbmQuYyAgICAg
ICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jICAgICAg
ICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAg
ICAgICAgICAgIHwgIDEwICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRy
b2xsZXIuYyAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1j
b250cm9sbGVyLmMgfCAgIDcgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3MzYzI0MTAuYyAgICAg
ICAgICAgICAgICAgIHwgICAyIC0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jICAg
ICAgICAgICAgICAgIHwgIDEzICstCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAg
ICAgICAgICAgICAgICB8ICAxMyArKwogMTYgZmlsZXMgY2hhbmdlZCwgMjI1IGluc2VydGlvbnMo
KyksIDI2MiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
