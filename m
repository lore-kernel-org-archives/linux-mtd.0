Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68771C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqY1ojO6Hh/HMTQ8UvgiL1JbcuGaZudnLDi61i3L4eE=; b=JYUpw4OumClYS4
	ZQZp20CVqh0f4S4OumR9+CtLVE41FygTqlHC9k09hS5jnl8yvcxe527P0jvWeXZdRGoNdkYES82jS
	/wDIWd3xAzOPTLHz+XxjkFFgsqA1I2TxT3zw9CCi4BeKa7C4OxCDHt/hZSeLff5wiJ58UQbLvZmcT
	Oit40Ln8CVyR00Jxsnx0F69eO68Kam8hcyydEIS54t+CAKOiEf/Blvhje9gxcmdXLcaXPOKmgoGL/
	vaJaWTj3NWt5omDG6tfRmi/pNdiv9nJfdsQiopWx03P0YBS4W4vM/OhaP2QgG2RcKCcS3LYIk1MIp
	8rjsu6OeznnCNtpDKuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7jn-00FjFA-UL; Mon, 09 May 2022 18:04:03 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7df-00FfIi-V6; Mon, 09 May 2022 17:57:45 +0000
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KxpmK07cmz4xcY;
 Tue, 10 May 2022 03:57:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KxpmC2sCwz4xVP;
 Tue, 10 May 2022 03:57:31 +1000 (AEST)
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
 linux-kernel@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v7 11/11] mtd: spi-nor: aspeed: set the decoding size to at
 least 2MB for AST2600
Date: Mon,  9 May 2022 19:56:16 +0200
Message-Id: <20220509175616.1089346-12-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509175616.1089346-1-clg@kaod.org>
References: <20220509175616.1089346-1-clg@kaod.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_105744_218952_1B5DBC10 
X-CRM114-Status: GOOD (  14.06  )
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

RnJvbTogUG90aW4gTGFpIDxwb3Rpbi5sYWlAcXVhbnRhdHcuY29tPgoKSW4gQVNUMjYwMCwgdGhl
IHVuaXQgb2YgU1BJIENFeCBkZWNvZGluZyByYW5nZSByZWdpc3RlciBpcyAxTUIsIGFuZCBlbmQK
YWRkcmVzcyBvZmZzZXQgaXMgc2V0IHRvIHRoZSBhY2N0dWFsIG9mZnNldCAtIDFNQi4gSWYgdGhl
IGZsYXNoIG9ubHkgaGFzCjFNQiwgdGhlIGVuZCBhZGRyZXNzIHdpbGwgaGFzIHNhbWUgdmFsdWUg
YXMgc3RhcnQgYWRkcmVzcywgd2hpY2ggd2lsbApjYXVzaW5nIHVuZXhwZWN0ZWQgZXJyb3JzLgoK
VGhpcyBwYXRjaCBzZXQgdGhlIGRlY29kaW5nIHNpemUgdG8gYXQgbGVhc3QgMk1CIHRvIGF2b2lk
IGRlY29kaW5nIGVycm9ycy4KClRlc3RlZDoKcm9vdEBibGV0Y2hsZXk6fiMgZG1lc2cgfCBncmVw
ICJhc3BlZWQtc21jIDFlNjMxMDAwLnNwaTogQ0UwIHdpbmRvdyIKWyAgIDU5LjMyODEzNF0gYXNw
ZWVkLXNtYyAxZTYzMTAwMC5zcGk6IENFMCB3aW5kb3cgcmVzaXplZCB0byAyTUIgKEFTVDI2MDAg
RGVjb2RpbmcpClsgICA1OS4zNDMwMDFdIGFzcGVlZC1zbWMgMWU2MzEwMDAuc3BpOiBDRTAgd2lu
ZG93IFsgMHg1MDAwMDAwMCAtIDB4NTAyMDAwMDAgXSAyTUIKcm9vdEBibGV0Y2hsZXk6fiMgZGV2
bWVtIDB4MWU2MzEwMzAKMHgwMDEwMDAwMAoKVGVzdGVkLWJ5OiBKYWUgSHl1biBZb28gPHF1aWNf
amFlaHlvb0BxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogUG90aW4gTGFpIDxwb3Rpbi5sYWlA
cXVhbnRhdHcuY29tPgpbIGNsZyA6IFBvcnRlZCBvbiBuZXcgc3BpLW1lbSBkcml2ZXIgXQpTaWdu
ZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGRyaXZlcnMv
c3BpL3NwaS1hc3BlZWQtc21jLmMgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21j
LmMgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCmluZGV4IDM1ZjY5MzQ4NDdiNy4uNDk2
ZjNlMWU5MDc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCisrKyBi
L2RyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKQEAgLTQ3NCw2ICs0NzQsOCBAQCBzdGF0aWMg
aW50IGFzcGVlZF9zcGlfc2V0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSwKICAqICAg
aXMgY29ycmVjdC4KICAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0
MjUwMF9zcGlfZGF0YTsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI2
MDBfc3BpX2RhdGE7CitzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBhc3QyNjAw
X2ZtY19kYXRhOwogCiBzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9hZGp1c3Rfd2luZG93KHN0
cnVjdCBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCiAJCQkJCSB1MzIgbG9jYWxfb2Zmc2V0LCB1MzIg
c2l6ZSkKQEAgLTQ5Nyw2ICs0OTksMTcgQEAgc3RhdGljIGludCBhc3BlZWRfc3BpX2NoaXBfYWRq
dXN0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwLAogCQkJIGNoaXAtPmNzLCBz
aXplID4+IDIwKTsKIAl9CiAKKwkvKgorCSAqIFRoZSBkZWNvZGluZyBzaXplIG9mIEFTVDI2MDAg
U1BJIGNvbnRyb2xsZXIgc2hvdWxkIHNldCBhdAorCSAqIGxlYXN0IDJNQi4KKwkgKi8KKwlpZiAo
KGFzcGktPmRhdGEgPT0gJmFzdDI2MDBfc3BpX2RhdGEgfHwgYXNwaS0+ZGF0YSA9PSAmYXN0MjYw
MF9mbWNfZGF0YSkgJiYKKwkgICAgc2l6ZSA8IFNaXzJNKSB7CisJCXNpemUgPSBTWl8yTTsKKwkJ
ZGV2X2luZm8oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5kb3cgcmVzaXplZCB0byAlZE1CIChBU1QyNjAw
IERlY29kaW5nKSIsCisJCQkgY2hpcC0+Y3MsIHNpemUgPj4gMjApOworCX0KKwogCWFzcGVlZF9z
cGlfZ2V0X3dpbmRvd3MoYXNwaSwgd2luZG93cyk7CiAKIAkvKiBBZGp1c3QgdGhpcyBjaGlwIHdp
bmRvdyAqLwotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
