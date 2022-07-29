Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA36C19F2B
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Va3ycRnST7iKjJJ8Qb93dT4m3TbOVciM2B0yDSxjOfY=; b=qZ92LEVnugNJv1
	JHynIOXVeoX9T2YHk10nWF3wa36Rwgk9c+eEi/Ebt1LY7aU8YefTuFt1BxPKhghP89FlI+w49W++6
	qUwf8Lg+i1sEE1Iy87nfc4v2ypKuWVGoGWLyK9pG377MeMB7QCqfFYk2gurQ8N2oQ6LvlSHMRQhH2
	OU8yV0weDkksn+A3Me6jCjcJlatmS/YTnQ3AP8OFMHITnfr5XFw1qi/sM2a6D/AwNfLfH9ArRbNZQ
	BXy2qntAm/z3Sfd3kaGtl/Gx52QG0udK0aa+c4LkOG4Humw0ooZZOFvM4YqIgMAtqsj1GTMBW++qJ
	fId168hY6MYZBmf5HTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM8n-003jUT-UX; Fri, 29 Jul 2022 09:18:42 +0000
Received: from vps.slashdirt.org ([144.91.108.218])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM7v-003ixf-Bo
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 09:17:49 +0000
Received: from supercopter.milliways.lan (unknown [IPv6:2a01:e0a:4ca:1080:42a8:f0ff:fe28:2844])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vps.slashdirt.org (Postfix) with ESMTPSA id 9C5C2603AC;
	Fri, 29 Jul 2022 11:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 vps.slashdirt.org 9C5C2603AC
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=slashdirt.org; s=mail;
	t=1659086259; bh=kvH0uaFR76rwZBLBEJzzwq8QoJGS/fLRPi/hp8CULGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mt90uSam5L2nC6f5Uet/XST0S1txGJPQBn6RMezOdUky9/gjAKI69z+sqN5JwF2bP
	 uXti2ulePKZGYamUYxCBAV1h7gEkowuBitObJIZ3I5cVCRCrZqERYMsAMcaAxQQYnj
	 vwxPvUxmR/SNE2iP6mmVlPKPpW0or7Tgr38zi3oc=
From: =?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	git@johnthomson.fastmail.com.au,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
Subject: [PATCH v3 2/3] mtd: spi-nor: set erasesize_minor for non-uniform erase
Date: Fri, 29 Jul 2022 11:16:35 +0200
Message-Id: <20220729091636.59287-3-hacks+kernel@slashdirt.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
References: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_021747_935205_3803B0B5 
X-CRM114-Status: GOOD (  13.06  )
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

VGhpcyBwYXRjaCBzZXRzIGVyYXNlc2l6ZV9taW5vciBvbiBTUEktTk9SIGRldmljZXMgc3VwcG9y
dGluZwpub24tdW5pZm9ybSBlcmFzZSwgYWxsb3dpbmcgd3JpdGUgYWNjZXNzIHRvIHBhcnRpdGlv
bnMgdGhhdCBzaXQgb24KIm1pbm9yIiBib3VuZGFyeS4gSXQgcHJlc2VydmVzIGJhY2t3YXJkIGNv
bXBhdGliaWxpdHkgd2l0aCBleGlzdGluZwp1bmlmb3JtIGJlaGF2aW9yLgoKU2lnbmVkLW9mZi1i
eTogSm9obiBUaG9tc29uIDxnaXRAam9obnRob21zb24uZmFzdG1haWwuY29tLmF1PgpTaWduZWQt
b2ZmLWJ5OiBUaGliYXV0IFZBUsOITkUgPGhhY2tzK2tlcm5lbEBzbGFzaGRpcnQub3JnPgotLS0K
IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwppbmRleCA1
MDI5NjdjNzYuLmJhZmQzMzk2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKQEAgLTIxNDQsNiArMjE0NCw3IEBA
IHN0YXRpYyBpbnQgc3BpX25vcl9zZWxlY3RfZXJhc2Uoc3RydWN0IHNwaV9ub3IgKm5vcikKIHsK
IAlzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9tYXAgKm1hcCA9ICZub3ItPnBhcmFtcy0+ZXJhc2VfbWFw
OwogCWNvbnN0IHN0cnVjdCBzcGlfbm9yX2VyYXNlX3R5cGUgKmVyYXNlID0gTlVMTDsKKwljb25z
dCBzdHJ1Y3Qgc3BpX25vcl9lcmFzZV90eXBlICplcmFzZV9taW5vciA9IE5VTEw7CiAJc3RydWN0
IG10ZF9pbmZvICptdGQgPSAmbm9yLT5tdGQ7CiAJdTMyIHdhbnRlZF9zaXplID0gbm9yLT5pbmZv
LT5zZWN0b3Jfc2l6ZTsKIAlpbnQgaTsKQEAgLTIxNzIsMTIgKzIxNzMsMTQgQEAgc3RhdGljIGlu
dCBzcGlfbm9yX3NlbGVjdF9lcmFzZShzdHJ1Y3Qgc3BpX25vciAqbm9yKQogCiAJLyoKIAkgKiBG
b3Igbm9uLXVuaWZvcm0gU1BJIGZsYXNoIG1lbW9yeSwgc2V0IG10ZC0+ZXJhc2VzaXplIHRvIHRo
ZQotCSAqIG1heGltdW0gZXJhc2Ugc2VjdG9yIHNpemUuIE5vIG5lZWQgdG8gc2V0IG5vci0+ZXJh
c2Vfb3Bjb2RlLgorCSAqIG1heGltdW0gZXJhc2Ugc2VjdG9yIHNpemUgYW5kIG10ZC0+ZXJhc2Vz
aXplX21pbm9yIHRvIHRoZSBtaW5pbXVtLgorCSAqIE5vIG5lZWQgdG8gc2V0IG5vci0+ZXJhc2Vf
b3Bjb2RlLgogCSAqLwogCWZvciAoaSA9IFNOT1JfRVJBU0VfVFlQRV9NQVggLSAxOyBpID49IDA7
IGktLSkgewogCQlpZiAobWFwLT5lcmFzZV90eXBlW2ldLnNpemUpIHsKLQkJCWVyYXNlID0gJm1h
cC0+ZXJhc2VfdHlwZVtpXTsKLQkJCWJyZWFrOworCQkJaWYgKCFlcmFzZSkKKwkJCQllcmFzZSA9
ICZtYXAtPmVyYXNlX3R5cGVbaV07CisJCQllcmFzZV9taW5vciA9ICZtYXAtPmVyYXNlX3R5cGVb
aV07CiAJCX0KIAl9CiAKQEAgLTIxODUsNiArMjE4OCw4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9z
ZWxlY3RfZXJhc2Uoc3RydWN0IHNwaV9ub3IgKm5vcikKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlt
dGQtPmVyYXNlc2l6ZSA9IGVyYXNlLT5zaXplOworCWlmIChlcmFzZV9taW5vci0+c2l6ZSA8IGVy
YXNlLT5zaXplKQorCQltdGQtPmVyYXNlc2l6ZV9taW5vciA9IGVyYXNlX21pbm9yLT5zaXplOwog
CXJldHVybiAwOwogfQogCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
