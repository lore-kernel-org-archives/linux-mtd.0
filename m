Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06977D29FB3
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5cZJf6BojHddKBvo+Fc0d8JR06tUy+CH3HH6dsAS8qY=; b=uG4BOM71kyEcj3
	EVUvCFQ+yRbWr14mdxExjJVuqJNgop4QYMgGxAGxj5/zeHt3lGVs3SJDpg9pPmI8J+wJujm9Gr+FD
	/WqgY6fI4MyWazH3dBaTYDRZM5U90ql/WXSWAK6LoZNL0rhkipclQfIR+5/GzU4BBSt27elLE34nj
	kt65J3T8Rr9kRsF67RrbgNkRY4IreIpMJ5AblwRDB24USD/pXzjusEsY1duZU2Ivwb92Cjk26OX1f
	FzHUeoJH44HPOCiYDnKmzaVLrX/djD/D57AXB2CVv8AGi1TvHRjWVTsaCM25O8bQm9alHgGaeAHRM
	X68ZFxlIsrzCCD3U2d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bou-00000002Mac-0olS;
	Wed, 06 Nov 2024 08:55:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bop-00000002MWu-47i7
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 08:55:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 101EF1C000A;
	Wed,  6 Nov 2024 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DK3aO1Ft6P60EgK01AvhNU8ciFPwjwRQCU5JDKN6QFM=;
	b=KDRfvLS9HeE6reR09UlcPAaftktG9Pcxj3vpz+diP6NOyaJ/2eajMgQIvyaweGHKzNQFuA
	vJ7BkmT+7ZBD/SFkyPsabM8OGsu/CZnYXiszvHBAx9dqDRGmW/TM4dGoZJEt3jSk13Hi5K
	I7Y4/PE2duw5D3zHP8lKQN4sSBYLT8VSczV81VbnTN6fWInMXnMq9px8o/ACUpORLh097X
	nguMtvSLrXLWRcJML6LFOWDqdwMM5Wxy07SUjURfQJPf2HM/p81Sk3k9Qj6nQ2Lgxueci3
	QX0KgYPj2gp9LdLpk7Agz+rY7yUGkumxAn3vtQmLGWah5xmfauZB00TUtR2rYQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v2 0/6] Implement setup_interface() in the DaVinci NAND controller
Date: Wed,  6 Nov 2024 09:55:01 +0100
Message-ID: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_005516_458985_F51DE7D5 
X-CRM114-Status: GOOD (  14.13  )
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

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBpbXBsZW1lbnQgdGhlIHNldHVwX2lu
dGVyZmFjZSgpIG9wZXJhdGlvbiBpbgp0aGUgRGFWaW5jaSBOQU5EIGNvbnRyb2xsZXIgdG8gZW5h
YmxlIHRoZSB1c2Ugb2YgYWxsIE9ORkkgbW9kZXMgYW5kCmltcHJvdmUgdGhlIE5BTkQgYWNjZXNz
IHNwZWVkLgoKUEFUQ0ggMiBkZXBlbmRzIG9uIFBBVENIIDEKUEFUQ0ggNiBkZXBlbmRzIG9uIFBB
VENIIDItNC01CgpUaGlzIE5BTkQgY29udHJvbGxlciBpcyBwcmVzZW50IGluIHRoZSBEYVZpbmNp
IChPTUFQIEwxMzgpIGFuZCBLZXlzdG9uZTIKU29DcyBhbmQgZnVuY3Rpb25zIGFzIGEgJ2NoaWxk
JyBvZiB0aGUgQUVNSUYgY29udHJvbGxlci4gU28gaXRzIHRpbWluZ3MKYXJlIHNldCBieSB0aGUg
QUVNSUYgY29udHJvbGxlciBpdHNlbGYgZnJvbSBkZXZpY2UtdHJlZSBwcm9wZXJ0aWVzLgpJbXBs
ZW1lbnRpbmcgdGhlIHNldHVwX2ludGVyZmFjZSgpIGNhbGxiYWNrIGltcGxpZXMgYmVpbmcgYWJs
ZSB0byB1cGRhdGUKZHluYW1pY2FsbHkgdGhlc2UgdGltaW5ncywgc28gdGhlIGZpcnN0IHR3byBw
YXRjaGVzIG9mIHRoZSBzZXJpZXMgbW9kaWZ5CnRoZSBBRU1JRiBkcml2ZXIgdG8gcHJvdmlkZSBp
dHMgJ2NoaWxkcmVuJyBhIHdheSB0byBtb2RpZnkgdGhlaXIgY2hpcApzZWxlY3QgdGltaW5nIGNv
bmZpZ3VyYXRpb24uCgpUaGUgcmVtYWluaW5nIHBhdGNoZXMgaW1wbGVtZW50IHRoZSBzZXR1cF9p
bnRlcmZhY2UoKSBvcGVyYXRpb24uClRoZSBjb21wdXRhdGlvbiBvZiB0aGUgcmVnaXN0ZXIncyBj
b250ZW50cyBpcyBkaXJlY3RseSBiYXNlZCBvbgrCpzIwLjMuMi4zIG9mIHRoZSBPTUFQLUwxMzgg
VFJNIFsxXQoKVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24gdHdvIHBsYXRmb3JtcyBiYXNlZCB1cG9u
IHRoZSBEYVZpbmNpIFNvQy4gT25lIGlzCmludGVyZmFjZWQgd2l0aCBhIE1hY3Jvbml4IE1YMzBV
RjRHMThBQyBOQU5ELCB0aGUgb3RoZXIgd2l0aCBhIFRvc2hpYmEKTkFORC4KClsxXSA6IGh0dHBz
Oi8vd3d3LnRpLmNvbS9saXQvdWcvc3BydWg3N2Mvc3BydWg3N2MucGRmCgpDaGFuZ2UgbG9nOgoK
ICogdjIKICAgQ292ZXIgbGV0dGVyIDoKICAgICAtIEFkZCBkZXBlbmRlbmN5IGRldGFpbHMKICAg
ICAtIFJlbW92ZSB0aGUgcXVlc3Rpb24gYWJvdXQgdGktYWVtaWYuaCBsb2NhdGlvbgogICBQQVRD
SCAxIDoKICAgICAtIEZpeCBhZW1pZl9jc190aW1pbmdzJ3MgZGVzY3JpcHRpb24gaW4gdGhlIGNv
bW1lbnRzCiAgIFBBVENIIDIgOgogICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbmZpZ19jc19sb2Nr
J3MgZGVzY3JpcHRpb24gaW4gdGhlIGNvbW1lbnRzCiAgICAgLSBNb3ZlIGluY2x1ZGUvbWVtb3J5
L3RpLWFlbWlmLmggdG8gaW5jbHVkZS9saW51eC9tZW1vcnkvdGktYWVtaWYuaAogICBQQVRDSCAz
IFtORVddIDoKICAgICAtIEZpeCBkZXBlbmRlbmN5IGlzc3VlIHdpdGggYWVtaWYgY29udHJvbGxl
ciBpbiBLY29uZmlnCiAgIFBBVENIIDUgOgogICAgIC0gQWRkIGRldGFpbHMgYWJvdXQgdGhlIGNs
b2NrIGJpbmRpbmdzIGluIHRoZSBjb21taXQgbG9nCiAgICAgLSBSZXBsYWNlIGRldm1fY2xrX2dl
dCgpIHdpdGggZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKQogICAgIC0gVXNlIGRldl9lcnJfcHJvYmUo
KSB0byByZXR1cm4gdGhlIGRldm1fY2xrX2dldF9lbmFibGVkKCkgZXJyb3IKCkJhc3RpZW4gQ3Vy
dXRjaGV0ICg2KToKICBtZW1vcnk6IHRpLWFlbWlmOiBDcmVhdGUgYWVtaWZfc2V0X2NzX3RpbWlu
Z3MoKQogIG1lbW9yeTogdGktYWVtaWY6IEV4cG9ydCBhZW1pZl9zZXRfY3NfdGltaW5ncygpCiAg
bXRkOiByYXduYW5kOiBkYXZpbmNpOiBBbHdheXMgZGVwZW5kcyBvbiBUSV9BRU1JRgogIG10ZDog
cmF3bmFuZDogZGF2aW5jaTogT3JkZXIgaGVhZGVycyBhbHBoYWJldGljYWxseQogIG10ZDogcmF3
bmFuZDogZGF2aW5jaTogQWRkIGNsb2NrIHJlc291cmNlCiAgbXRkOiByYXduYW5kOiBkYXZpbmNp
OiBJbXBsZW1lbnQgc2V0dXBfaW50ZXJmYWNlKCkgb3BlcmF0aW9uCgogZHJpdmVycy9tZW1vcnkv
dGktYWVtaWYuYyAgICAgICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2RhdmluY2lfbmFuZC5jIHwgIDkzICsrKysrKysrKysrKysrKysrKysrKysrLS0K
IGluY2x1ZGUvbGludXgvbWVtb3J5L3RpLWFlbWlmLmggICAgIHwgIDMxICsrKysrKysrKwogNCBm
aWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZW1vcnkvdGktYWVtaWYuaAoKLS0gCjIuNDcuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
