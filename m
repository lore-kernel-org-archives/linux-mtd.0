Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93EEC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/uHnIF0oAcxOynCkVKCEpEv/aK1Ycskw7t2CnacAqE=; b=2K3iAoUGyERkBZ
	RXuHo4KDlhhnh4/be/CDdsRpifWmwYvtYnyGDtxm0zRBreGgs/vcG9zvhmrCqF6WyrDgBQutGU9iI
	CVXy0SRuFgjrDZE2c2oUCx98cQE7fGSdu3wmYA7Mw1ePmJVqXH1VRpIanDruAgt19lbPZN2nxsITD
	IFepwKuygMSKA1+ikx53VwkdegE5im4DWh2fegFJPITqnP2tkZAewF7XPaNWVHdRX/Gwl7XB0ZJdo
	o4yHHWj+nfW2VmkkkuEZQs9eEyeSwdtynAebSuFqqwIFDGvVh5sdH6KAC9O+1drN1YiuZrrrKrGDd
	s96awZcm7ZHus/0oL/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nllmy-003sIp-9Q; Tue, 03 May 2022 06:13:36 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nllh8-003pEj-I4; Tue, 03 May 2022 06:07:36 +0000
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsqHj4h1sz4yT0;
 Tue,  3 May 2022 16:07:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsqHc2M5cz4xbw;
 Tue,  3 May 2022 16:07:24 +1000 (AEST)
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
Subject: [PATCH v6 07/11] spi: aspeed: Add support for the AST2400 SPI
 controller
Date: Tue,  3 May 2022 08:06:30 +0200
Message-Id: <20220503060634.122722-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503060634.122722-1-clg@kaod.org>
References: <20220503060634.122722-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_230734_774235_A51760A3 
X-CRM114-Status: GOOD (  19.00  )
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

RXh0ZW5kIHRoZSBkcml2ZXIgZm9yIHRoZSBBU1QyNDAwIFNQSSBGbGFzaCBDb250cm9sbGVyIChT
UEkpLiBUaGlzCmNvbnRyb2xsZXIgaGFzIGEgc2xpZ2h0bHkgZGlmZmVyZW50IGludGVyZmFjZSB3
aGljaCByZXF1aXJlcwphZGFwdGF0aW9uIG9mIHRoZSA0QiBoYW5kbGluZy4gU3VtbWFyeSBvZiBm
ZWF0dXJlcyA6CgogICAuIGhvc3QgRmlybXdhcmUKICAgLiAxIGNoaXAgc2VsZWN0IHBpbiAoQ0Uw
KQogICAuIHNsaWdodGx5IGRpZmZlcmVudCByZWdpc3RlciBzZXQsIGJldHdlZW4gQVNUMjUwMCBh
bmQgdGhlIGxlZ2FjeQogICAgIGNvbnRyb2xsZXIKICAgLiBubyBzZWdtZW50IHJlZ2lzdGVycwog
ICAuIHNpbmdsZSwgZHVhbCBtb2RlLgoKUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBq
bXMuaWQuYXU+ClRlc3RlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KVGVzdGVk
LWJ5OiBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+ClRlc3RlZC1ieTogSmFlIEh5dW4g
WW9vIDxxdWljX2phZWh5b29AcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyB8
IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDMy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktYXNwZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwppbmRleCBkMmIz
MzQyYzEzM2UuLmQyYjYzYzhiYjg4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWFzcGVl
ZC1zbWMuYworKysgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCkBAIC0zMCw2ICszMCw3
IEBACiAjZGVmaW5lICAgQ1RSTF9JT19EVUFMX0RBVEEJCUJJVCgyOSkKICNkZWZpbmUgICBDVFJM
X0lPX1FVQURfREFUQQkJQklUKDMwKQogI2RlZmluZSAgIENUUkxfQ09NTUFORF9TSElGVAkJMTYK
KyNkZWZpbmUgICBDVFJMX0lPX0FERFJFU1NfNEIJCUJJVCgxMykJLyogQVNUMjQwMCBTUEkgb25s
eSAqLwogI2RlZmluZSAgIENUUkxfSU9fRFVNTVlfU0VUKGR1bW15KQkJCQkJXAogCSgoKCgoZHVt
bXkpID4+IDIpICYgMHgxKSA8PCAxNCkgfCAoKChkdW1teSkgJiAweDMpIDw8IDYpKQogI2RlZmlu
ZSAgIENUUkxfQ0VfU1RPUF9BQ1RJVkUJCUJJVCgyKQpAQCAtMjgwLDYgKzI4MSw4IEBAIHN0YXRp
YyBib29sIGFzcGVlZF9zcGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwgY29uc3Qg
c3RydWN0IHNwaV9tZW1fb3AKIAlyZXR1cm4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKG1l
bSwgb3ApOwogfQogCitzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBhc3QyNDAw
X3NwaV9kYXRhOworCiBzdGF0aWMgaW50IGRvX2FzcGVlZF9zcGlfZXhlY19vcChzdHJ1Y3Qgc3Bp
X21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCiB7CiAJc3RydWN0IGFzcGVl
ZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShtZW0tPnNwaS0+bWFzdGVy
KTsKQEAgLTMwOSw2ICszMTIsOSBAQCBzdGF0aWMgaW50IGRvX2FzcGVlZF9zcGlfZXhlY19vcChz
dHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqbwogCQkJYWRkcl9t
b2RlIHw9ICgweDExIDw8IGNoaXAtPmNzKTsKIAkJZWxzZQogCQkJYWRkcl9tb2RlICY9IH4oMHgx
MSA8PCBjaGlwLT5jcyk7CisKKwkJaWYgKG9wLT5hZGRyLm5ieXRlcyA9PSA0ICYmIGNoaXAtPmFz
cGktPmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpCisJCQljdGxfdmFsIHw9IENUUkxfSU9fQURE
UkVTU180QjsKIAl9CiAKIAlpZiAob3AtPmR1bW15Lm5ieXRlcykKQEAgLTM5OCw3ICs0MDQsMTMg
QEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2NoaXBfc2V0X2RlZmF1bHRfd2luZG93KHN0cnVjdCBh
c3BlZWRfc3BpX2NoaXAgKmNoaXApCiAJc3RydWN0IGFzcGVlZF9zcGlfd2luZG93IHdpbmRvd3Nb
QVNQRUVEX1NQSV9NQVhfTlVNX0NTXSA9IHsgMCB9OwogCXN0cnVjdCBhc3BlZWRfc3BpX3dpbmRv
dyAqd2luID0gJndpbmRvd3NbY2hpcC0+Y3NdOwogCi0JYXNwZWVkX3NwaV9nZXRfd2luZG93cyhh
c3BpLCB3aW5kb3dzKTsKKwkvKiBObyBzZWdtZW50IHJlZ2lzdGVycyBmb3IgdGhlIEFTVDI0MDAg
U1BJIGNvbnRyb2xsZXIgKi8KKwlpZiAoYXNwaS0+ZGF0YSA9PSAmYXN0MjQwMF9zcGlfZGF0YSkg
eworCQl3aW4tPm9mZnNldCA9IDA7CisJCXdpbi0+c2l6ZSA9IGFzcGktPmFoYl93aW5kb3dfc2l6
ZTsKKwl9IGVsc2UgeworCQlhc3BlZWRfc3BpX2dldF93aW5kb3dzKGFzcGksIHdpbmRvd3MpOwor
CX0KIAogCWNoaXAtPmFoYl9iYXNlID0gYXNwaS0+YWhiX2Jhc2UgKyB3aW4tPm9mZnNldDsKIAlj
aGlwLT5haGJfd2luZG93X3NpemUgPSB3aW4tPnNpemU7CkBAIC00NjEsNiArNDczLDEwIEBAIHN0
YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coc3RydWN0IGFzcGVlZF9zcGlf
Y2hpcCAqY2hpcCwKIAlzdHJ1Y3QgYXNwZWVkX3NwaV93aW5kb3cgKndpbiA9ICZ3aW5kb3dzW2No
aXAtPmNzXTsKIAlpbnQgcmV0OwogCisJLyogTm8gc2VnbWVudCByZWdpc3RlcnMgZm9yIHRoZSBB
U1QyNDAwIFNQSSBjb250cm9sbGVyICovCisJaWYgKGFzcGktPmRhdGEgPT0gJmFzdDI0MDBfc3Bp
X2RhdGEpCisJCXJldHVybiAwOworCiAJLyoKIAkgKiBEdWUgdG8gYW4gSFcgaXNzdWUgb24gdGhl
IEFTVDI1MDAgU1BJIGNvbnRyb2xsZXIsIHRoZSBDRTAKIAkgKiB3aW5kb3cgc2l6ZSBzaG91bGQg
YmUgc21hbGxlciB0aGFuIHRoZSBtYXhpbXVtIDEyOE1CLgpAQCAtNTQ1LDYgKzU2MSwxMiBAQCBz
dGF0aWMgaW50IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0ZShzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBf
ZGVzYyAqZGVzYykKIAkJZWxzZQogCQkJYWRkcl9tb2RlICY9IH4oMHgxMSA8PCBjaGlwLT5jcyk7
CiAJCXdyaXRlbChhZGRyX21vZGUsIGFzcGktPnJlZ3MgKyBDRV9DVFJMX1JFRyk7CisKKwkJLyog
QVNUMjQwMCBTUEkgY29udHJvbGxlciBzZXRzIDRCWVRFIGFkZHJlc3MgbW9kZSBpbgorCQkgKiBD
RTAgQ29udHJvbCBSZWdpc3RlcgorCQkgKi8KKwkJaWYgKG9wLT5hZGRyLm5ieXRlcyA9PSA0ICYm
IGNoaXAtPmFzcGktPmRhdGEgPT0gJmFzdDI0MDBfc3BpX2RhdGEpCisJCQljdGxfdmFsIHw9IENU
UkxfSU9fQUREUkVTU180QjsKIAl9CiAKIAkvKiBSRUFEIG1vZGUgaXMgdGhlIGNvbnRyb2xsZXIg
ZGVmYXVsdCBzZXR0aW5nICovCkBAIC04MTYsNiArODM4LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI0MDBfZm1jX2RhdGEgPSB7CiAJLnNlZ21lbnRfcmVnICAg
PSBhc3BlZWRfc3BpX3NlZ21lbnRfcmVnLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBhc3Bl
ZWRfc3BpX2RhdGEgYXN0MjQwMF9zcGlfZGF0YSA9IHsKKwkubWF4X2NzCSAgICAgICA9IDEsCisJ
Lmhhc3R5cGUgICAgICAgPSBmYWxzZSwKKwkud2UwCSAgICAgICA9IDAsCisJLmN0bDAJICAgICAg
ID0gMHgwNCwKKwkvKiBObyBzZWdtZW50IHJlZ2lzdGVycyAqLworfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjUwMF9mbWNfZGF0YSA9IHsKIAkubWF4X2NzCSAg
ICAgICA9IDMsCiAJLmhhc3R5cGUgICAgICAgPSB0cnVlLApAQCAtODYwLDYgKzg5MCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI2MDBfc3BpX2RhdGEgPSB7CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFzcGVlZF9zcGlfbWF0Y2hlc1tdID0g
ewogCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI0MDAtZm1jIiwgLmRhdGEgPSAmYXN0MjQw
MF9mbWNfZGF0YSB9LAorCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI0MDAtc3BpIiwgLmRh
dGEgPSAmYXN0MjQwMF9zcGlfZGF0YSB9LAogCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1
MDAtZm1jIiwgLmRhdGEgPSAmYXN0MjUwMF9mbWNfZGF0YSB9LAogCXsgLmNvbXBhdGlibGUgPSAi
YXNwZWVkLGFzdDI1MDAtc3BpIiwgLmRhdGEgPSAmYXN0MjUwMF9zcGlfZGF0YSB9LAogCXsgLmNv
bXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtZm1jIiwgLmRhdGEgPSAmYXN0MjYwMF9mbWNfZGF0
YSB9LAotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
