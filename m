Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB66C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhJoGgnpWHoWwM2Ul9J4hiAE7LKr2U5gT/UaxzwvmK8=; b=WOA9BJnX/DLSvR
	WW2rkCyv6YafwpvQqiUu/6DANJbEKrK3XzL8IJdmPHYz+XarGb9czELcPkmVe7Oq09K3x3Rq2dmiW
	dfdEjnoLIt/zFc0+rxWUMMhqQeHOS8xcGO9caYuaFavds0HUGGxZHMrUCN54uvFxBV8FIee+16BG+
	0gBMOJkHR9EvuswGjqPaG4D4h9/SkrbG+3u8ULcQ+lxXndsnxF1ROd61HftJ+i5i7vn+xSs1C7/wD
	gKjbIl2+pkEiduu3c58z/Z1EvJ7VYtYn2Gsctwf9trcvS3uVRDM8fWJVrUnopkJPFzT/R5miycllJ
	xTFaP5Hp2lvDvx9fmCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7fk-00Fgi8-NJ; Mon, 09 May 2022 17:59:52 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7d3-00FeyA-VI; Mon, 09 May 2022 17:57:07 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Kxpld4J6jz4ySZ;
 Tue, 10 May 2022 03:57:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KxplX1mjLz4xVP;
 Tue, 10 May 2022 03:56:55 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Tao Ren <rentao.bupt@gmail.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH v7 05/11] spi: aspeed: Adjust direct mapping to device size
Date: Mon,  9 May 2022 19:56:10 +0200
Message-Id: <20220509175616.1089346-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509175616.1089346-1-clg@kaod.org>
References: <20220509175616.1089346-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_105706_202043_DEE7BA55 
X-CRM114-Status: GOOD (  21.80  )
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

VGhlIHNlZ21lbnQgcmVnaXN0ZXJzIG9mIHRoZSBGTUMvU1BJIGNvbnRyb2xsZXJzIHByb3ZpZGUg
YSB3YXkgdG8KY29uZmlndXJlIHRoZSBtYXBwaW5nIHdpbmRvdyBvZiB0aGUgZmxhc2ggZGV2aWNl
IGNvbnRlbnRzIG9uIHRoZSBBSEIKYnVzLiBBZGp1c3QgdGhpcyB3aW5kb3cgdG8gdGhlIHNpemUg
b2YgdGhlIHNwaS1tZW0gbWFwcGluZy4KClRoaW5ncyBnZXQgbW9yZSBjb21wbGV4IHdpdGggbXVs
dGlwbGUgZGV2aWNlcy4gVGhlIGRyaXZlciBuZWVkcyB0bwphbHNvIGFkanVzdCB0aGUgd2luZG93
IG9mIHRoZSBuZXh0IGRldmljZSB0byBtYWtlIHN1cmUgdGhhdCB0aGVyZSBpcwpubyBvdmVybGFw
LCBldmVuIGlmIHRoZXJlIGlzIG5vIGF2YWlsYWJsZSBkZXZpY2UuIFRoZSBwcm9wb3NhbCBiZWxv
dwppcyBub3QgcGVyZmVjdCBidXQgaXQgaXMgY292ZXJpbmcgYWxsIHRoZSBjYXNlcyB3ZSBoYXZl
IHNlZW4gb24KZGlmZmVyZW50IGJvYXJkcyB3aXRoIG9uZSBhbmQgdHdvIGRldmljZXMgb24gdGhl
IHNhbWUgYnVzLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClRl
c3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVkLWJ5OiBUYW8gUmVu
IDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClRlc3RlZC1ieTogSmFlIEh5dW4gWW9vIDxxdWljX2ph
ZWh5b29AcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8IDg4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDg4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIGIvZHJpdmVy
cy9zcGkvc3BpLWFzcGVlZC1zbWMuYwppbmRleCA1MGNjN2JkN2JhM2UuLjBhZmY0MmUyMGI4ZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYworKysgYi9kcml2ZXJzL3Nw
aS9zcGktYXNwZWVkLXNtYy5jCkBAIC00MTEsNiArNDExLDkyIEBAIHN0YXRpYyBpbnQgYXNwZWVk
X3NwaV9jaGlwX3NldF9kZWZhdWx0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlw
KQogCXJldHVybiBjaGlwLT5haGJfd2luZG93X3NpemUgPyAwIDogLTE7CiB9CiAKK3N0YXRpYyBp
bnQgYXNwZWVkX3NwaV9zZXRfd2luZG93KHN0cnVjdCBhc3BlZWRfc3BpICphc3BpLAorCQkJCSBj
b25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgKndpbikKK3sKKwl1MzIgc3RhcnQgPSBhc3Bp
LT5haGJfYmFzZV9waHkgKyB3aW4tPm9mZnNldDsKKwl1MzIgZW5kID0gc3RhcnQgKyB3aW4tPnNp
emU7CisJdm9pZCBfX2lvbWVtICpzZWdfcmVnID0gYXNwaS0+cmVncyArIENFMF9TRUdNRU5UX0FE
RFJfUkVHICsgd2luLT5jcyAqIDQ7CisJdTMyIHNlZ192YWxfYmFja3VwID0gcmVhZGwoc2VnX3Jl
Zyk7CisJdTMyIHNlZ192YWwgPSBhc3BpLT5kYXRhLT5zZWdtZW50X3JlZyhhc3BpLCBzdGFydCwg
ZW5kKTsKKworCWlmIChzZWdfdmFsID09IHNlZ192YWxfYmFja3VwKQorCQlyZXR1cm4gMDsKKwor
CXdyaXRlbChzZWdfdmFsLCBzZWdfcmVnKTsKKworCS8qCisJICogUmVzdG9yZSBpbml0aWFsIHZh
bHVlIGlmIHNvbWV0aGluZyBnb2VzIHdyb25nIGVsc2Ugd2UgY291bGQKKwkgKiBsb29zZSBhY2Nl
c3MgdG8gdGhlIGNoaXAuCisJICovCisJaWYgKHNlZ192YWwgIT0gcmVhZGwoc2VnX3JlZykpIHsK
KwkJZGV2X2Vycihhc3BpLT5kZXYsICJDRSVkIGludmFsaWQgd2luZG93IFsgMHglLjh4IC0gMHgl
Ljh4IF0gJWRNQiIsCisJCQl3aW4tPmNzLCBzdGFydCwgZW5kIC0gMSwgd2luLT5zaXplID4+IDIw
KTsKKwkJd3JpdGVsKHNlZ192YWxfYmFja3VwLCBzZWdfcmVnKTsKKwkJcmV0dXJuIC1FSU87CisJ
fQorCisJaWYgKHdpbi0+c2l6ZSkKKwkJZGV2X2RiZyhhc3BpLT5kZXYsICJDRSVkIG5ldyB3aW5k
b3cgWyAweCUuOHggLSAweCUuOHggXSAlZE1CIiwKKwkJCXdpbi0+Y3MsIHN0YXJ0LCBlbmQgLSAx
LCAgd2luLT5zaXplID4+IDIwKTsKKwllbHNlCisJCWRldl9kYmcoYXNwaS0+ZGV2LCAiQ0UlZCB3
aW5kb3cgY2xvc2VkIiwgd2luLT5jcyk7CisKKwlyZXR1cm4gMDsKK30KKworLyoKKyAqIFlldCB0
byBiZSBkb25lIHdoZW4gcG9zc2libGUgOgorICogLSBBbGlnbiBtYXBwaW5ncyBvbiBmbGFzaCBz
aXplICh3ZSBkb24ndCBoYXZlIHRoZSBpbmZvKQorICogLSBpb3JlbWFwIGVhY2ggd2luZG93LCBu
b3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IHNpbmNlIHRoZSBvdmVyYWxsIHdpbmRvdworICogICBpcyBj
b3JyZWN0LgorICovCitzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2luZG93KHN0
cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCisJCQkJCSB1MzIgbG9jYWxfb2Zmc2V0LCB1MzIg
c2l6ZSkKK3sKKwlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IGNoaXAtPmFzcGk7CisJc3RydWN0
IGFzcGVlZF9zcGlfd2luZG93IHdpbmRvd3NbQVNQRUVEX1NQSV9NQVhfTlVNX0NTXSA9IHsgMCB9
OworCXN0cnVjdCBhc3BlZWRfc3BpX3dpbmRvdyAqd2luID0gJndpbmRvd3NbY2hpcC0+Y3NdOwor
CWludCByZXQ7CisKKwlhc3BlZWRfc3BpX2dldF93aW5kb3dzKGFzcGksIHdpbmRvd3MpOworCisJ
LyogQWRqdXN0IHRoaXMgY2hpcCB3aW5kb3cgKi8KKwl3aW4tPm9mZnNldCArPSBsb2NhbF9vZmZz
ZXQ7CisJd2luLT5zaXplID0gc2l6ZTsKKworCWlmICh3aW4tPm9mZnNldCArIHdpbi0+c2l6ZSA+
IGFzcGktPmFoYl93aW5kb3dfc2l6ZSkgeworCQl3aW4tPnNpemUgPSBhc3BpLT5haGJfd2luZG93
X3NpemUgLSB3aW4tPm9mZnNldDsKKwkJZGV2X3dhcm4oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5kb3cg
cmVzaXplZCB0byAlZE1CIiwgY2hpcC0+Y3MsIHdpbi0+c2l6ZSA+PiAyMCk7CisJfQorCisJcmV0
ID0gYXNwZWVkX3NwaV9zZXRfd2luZG93KGFzcGksIHdpbik7CisJaWYgKHJldCkKKwkJcmV0dXJu
IHJldDsKKworCS8qIFVwZGF0ZSBjaGlwIG1hcHBpbmcgaW5mbyAqLworCWNoaXAtPmFoYl9iYXNl
ID0gYXNwaS0+YWhiX2Jhc2UgKyB3aW4tPm9mZnNldDsKKwljaGlwLT5haGJfd2luZG93X3NpemUg
PSB3aW4tPnNpemU7CisKKwkvKgorCSAqIEFsc28gYWRqdXN0IG5leHQgY2hpcCB3aW5kb3cgdG8g
bWFrZSBzdXJlIHRoYXQgaXQgZG9lcyBub3QKKwkgKiBvdmVybGFwIHdpdGggdGhlIGN1cnJlbnQg
d2luZG93LgorCSAqLworCWlmIChjaGlwLT5jcyA8IGFzcGktPmRhdGEtPm1heF9jcyAtIDEpIHsK
KwkJc3RydWN0IGFzcGVlZF9zcGlfd2luZG93ICpuZXh0ID0gJndpbmRvd3NbY2hpcC0+Y3MgKyAx
XTsKKworCQkvKiBDaGFuZ2Ugb2Zmc2V0IGFuZCBzaXplIHRvIGtlZXAgdGhlIHNhbWUgZW5kIGFk
ZHJlc3MgKi8KKwkJaWYgKChuZXh0LT5vZmZzZXQgKyBuZXh0LT5zaXplKSA+ICh3aW4tPm9mZnNl
dCArIHdpbi0+c2l6ZSkpCisJCQluZXh0LT5zaXplID0gKG5leHQtPm9mZnNldCArIG5leHQtPnNp
emUpIC0gKHdpbi0+b2Zmc2V0ICsgd2luLT5zaXplKTsKKwkJZWxzZQorCQkJbmV4dC0+c2l6ZSA9
IDA7CisJCW5leHQtPm9mZnNldCA9IHdpbi0+b2Zmc2V0ICsgd2luLT5zaXplOworCisJCWFzcGVl
ZF9zcGlfc2V0X3dpbmRvdyhhc3BpLCBuZXh0KTsKKwl9CisJcmV0dXJuIDA7Cit9CisKIHN0YXRp
YyBpbnQgYXNwZWVkX3NwaV9kaXJtYXBfY3JlYXRlKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNj
ICpkZXNjKQogewogCXN0cnVjdCBhc3BlZWRfc3BpICphc3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0
X2RldmRhdGEoZGVzYy0+bWVtLT5zcGktPm1hc3Rlcik7CkBAIC00MjUsNiArNTExLDggQEAgc3Rh
dGljIGludCBhc3BlZWRfc3BpX2Rpcm1hcF9jcmVhdGUoc3RydWN0IHNwaV9tZW1fZGlybWFwX2Rl
c2MgKmRlc2MpCiAJaWYgKG9wLT5kYXRhLmRpciAhPSBTUElfTUVNX0RBVEFfSU4pCiAJCXJldHVy
biAtRU9QTk9UU1VQUDsKIAorCWFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2luZG93KGNoaXAsIGRl
c2MtPmluZm8ub2Zmc2V0LCBkZXNjLT5pbmZvLmxlbmd0aCk7CisKIAlpZiAoZGVzYy0+aW5mby5s
ZW5ndGggPiBjaGlwLT5haGJfd2luZG93X3NpemUpCiAJCWRldl93YXJuKGFzcGktPmRldiwgIkNF
JWQgd2luZG93ICglZE1CKSB0b28gc21hbGwgZm9yIG1hcHBpbmciLAogCQkJIGNoaXAtPmNzLCBj
aGlwLT5haGJfd2luZG93X3NpemUgPj4gMjApOwotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
