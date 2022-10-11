Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E48C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Oct 2022 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IezlZkEHDOwk6v47UkJGgqlvRSF8RZXIFH89O61YvDc=; b=42qMN+PN6gNM8U
	nftX/N2zDAHL+NWpcd69DSGg4StvzPFbBcrpTJud8zy31xfT5k3CkjtjGMm2163BlQ3XQmtZnmjGX
	jjyrHCx7D4NWhKUuTkODAKK1hHfcFM2Qqgw+AqLgN5ClS2r/ukNxPMiL6V6kBcEaeJuTeavOlIWSj
	Vv6peJuTIj5cxQtF+X06rLzoISAiOSGaIgM1+5vkjGBYt4uE1m+vWF3oyrrcOCnTPELbGgxqeRgo5
	Uv5eBp6Ey+6Y1NJk+PwCI9QjO7D7X5M1DZynvfaff98C7x+AyRdvPcSrlDA4kfnAV7QRRAQlrKLj6
	XQDquTDnuW2dKXFNXfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC7K-003wDl-0R; Tue, 11 Oct 2022 10:04:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC76-003w9R-ES; Tue, 11 Oct 2022 10:03:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id d26so23137615eje.10;
        Tue, 11 Oct 2022 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r9TR6k7ZFnpYRrQ79w4enoBrUyIdRGewHutjKTPK0c=;
        b=dit3LHF+DkfIOR2jPB98pCnX5hBg2tdQYKlOSSnzZwUddl2fl8cHYDeZJpUO9A4Aw/
         Af1C5cwxE5Q7nDLsh8IxLaXYaKJsMiSJGko8AJIB7p2FCiz6Y5Ye/uuADYF+EAGaljkZ
         4sHPGDDV6V9B5carYU3TAuQTxOgUDlgYqmscEIax3d7+v0Fr9gFsdTdmCPtX0l0nrNR3
         zamYQt+nYWT1XzLaSHw5OFuD/LqFwbunGbhVl+vUC5/UJrqSdNtXlTR6Qng6cHsnEF5Y
         JKEM2E36Tl2Rf+I0Ev7tvP53V3Dkbm4npeiVyV5qj9gTVNmmT2X4lAosMLgoyHSzWkKN
         gMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6r9TR6k7ZFnpYRrQ79w4enoBrUyIdRGewHutjKTPK0c=;
        b=k8B1q4BaWQ5smL0zVLdKubpp0RxlUrswintGVX3h6BWCIAZanOPRuLmBay1j9rrU3S
         FhgeRGMWmy2urqgk4KjOqbOrxUszLHpwmQ0g+BHITJGdD4YLdMEr17QYCZIUPcsLqBZc
         8sa7Nw8UElrdRYQ2lPn0Dc421xQ+73yCgSzsmvXVBwMdi0lkogr0xMh9LV4Unzap3Oz+
         cxygQpjJbt49w8aPCCgkypes7UwVtXuUTqoJNQF3g+Tx+2kED4vpWUrSDFNGa097+zH0
         UxcQZhDhTD2jkrJvG5w8az7BG+f7B8VcY+Gnhyb77hiBo21/CZxX4g95WGu8A9j8wY5E
         B7fg==
X-Gm-Message-State: ACrzQf23Pm2bwmLytu+3RjtJSpF1K6ZsXhxGlz+AL3xeseB7vb+H2IdM
	9e0QtQNHT9yH3MoaOhdWxuI=
X-Google-Smtp-Source: AMsMyM6gizhUse19Na7gK9CEfRA28qIOD56HDJigggh7Xg6DDqwtaArMlhx4ISEVp6zi9p7QQUvsgQ==
X-Received: by 2002:a17:907:1c1a:b0:78d:426c:2828 with SMTP id nc26-20020a1709071c1a00b0078d426c2828mr18691133ejc.331.1665482629474;
        Tue, 11 Oct 2022 03:03:49 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o8-20020a170906768800b00780ab5a9116sm4597749ejm.211.2022.10.11.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:03:49 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	bcm-kernel-feedback-list@broadcom.com,
	John Crispin <john@phrozen.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: parsers: add TP-Link SafeLoader partitions table parser
Date: Tue, 11 Oct 2022 12:03:33 +0200
Message-Id: <20221011100333.32536-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011100333.32536-1-zajec5@gmail.com>
References: <20221011100333.32536-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030352_516427_FDC3EA01 
X-CRM114-Status: GOOD (  22.40  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBwYXJzZXIgZGVh
bHMgd2l0aCBtb3N0IFRQLUxpbmsgaG9tZSByb3V0ZXJzLiBJdCByZWFkcyBpbmZvIGFib3V0CnBh
cnRpdGlvbnMgYW5kIHJlZ2lzdGVycyB0aGVtIGluIHRoZSBNVEQgc3Vic3lzdGVtLgoKU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMv
bXRkL3BhcnNlcnMvS2NvbmZpZyAgICAgICAgICAgICB8ICAxNSArKysKIGRyaXZlcnMvbXRkL3Bh
cnNlcnMvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL210ZC9wYXJzZXJzL3Rw
bGlua19zYWZlbG9hZGVyLmMgfCAxNTAgKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDE2NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
dGQvcGFyc2Vycy90cGxpbmtfc2FmZWxvYWRlci5jCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
cGFyc2Vycy9LY29uZmlnIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9LY29uZmlnCmluZGV4IGFhYTA2
MDUwYzliYy4uYzI1OGJhMmEzYTZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL0tj
b25maWcKKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9LY29uZmlnCkBAIC0xMjMsNiArMTIzLDIx
IEBAIGNvbmZpZyBNVERfQUZTX1BBUlRTCiAJICBmb3IgeW91ciBwYXJ0aWN1bGFyIGRldmljZS4g
SXQgd29uJ3QgaGFwcGVuIGF1dG9tYXRpY2FsbHkuIFRoZQogCSAgJ3BoeXNtYXAnIG1hcCBkcml2
ZXIgKENPTkZJR19NVERfUEhZU01BUCkgZG9lcyB0aGlzLCBmb3IgZXhhbXBsZS4KIAorY29uZmln
IE1URF9QQVJTRVJfVFBMSU5LX1NBRkVMT0FERVIKKwl0cmlzdGF0ZSAiVFAtTGluayBTYWZlbG9h
ZGVyIHBhcnRpdGlvbnMgcGFyc2VyIgorCWRlcGVuZHMgb24gTVREICYmIChBUkNIX0JDTV81MzAx
WCB8fCBBVEg3OSB8fCBTT0NfTVQ3NjIwIHx8IFNPQ19NVDc2MjEgfHwgQ09NUElMRV9URVNUKQor
CWhlbHAKKwkgIFRQLUxpbmsgaG9tZSByb3V0ZXJzIHVzZSBmbGFzaCBwYXJ0aXRpb25zIHRvIHN0
b3JlIHZhcmlvdXMgZGF0YS4gSW5mbworCSAgYWJvdXQgZmxhc2ggc3BhY2UgbGF5b3V0IGlzIHN0
b3JlZCBpbiBhIHBhcnRpdGlvbnMgdGFibGUgdXNpbmcgYQorCSAgY3VzdG9tIEFTQ0lJLWJhc2Vk
IGZvcm1hdC4KKworCSAgVGhhdCBmb3JtYXQgd2FzIGZpcnN0IGZvdW5kIGluIGRldmljZXMgd2l0
aCBTYWZlTG9hZGVyIGJvb3Rsb2FkZXIgYW5kCisJICB3YXMgbmFtZWQgYWZ0ZXIgaXQuIExhdGVy
IGl0IHdhcyBhZGFwdGVkIHRvIENGRSBhbmQgVS1Cb290CisJICBib290bG9hZGVycy4KKworCSAg
VGhpcyBkcml2ZXIgcmVhZHMgcGFydGl0aW9ucyB0YWJsZSwgcGFyc2VzIGl0IGFuZCBjcmVhdGVz
IE1URAorCSAgcGFydGl0aW9ucy4KKwogY29uZmlnIE1URF9QQVJTRVJfVFJYCiAJdHJpc3RhdGUg
IlBhcnNlciBmb3IgVFJYIGZvcm1hdCBwYXJ0aXRpb25zIgogCWRlcGVuZHMgb24gTVREICYmIChC
Q000N1hYIHx8IEFSQ0hfQkNNXzUzMDFYIHx8IEFSQ0hfTUVESUFURUsgfHwgUkFMSU5LIHx8IENP
TVBJTEVfVEVTVCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvTWFrZWZpbGUgYi9k
cml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlCmluZGV4IDIzZmE0ZGU0MDE2Zi4uMGU3MGI2MjFh
MWQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlCisrKyBiL2RyaXZl
cnMvbXRkL3BhcnNlcnMvTWFrZWZpbGUKQEAgLTEwLDYgKzEwLDcgQEAgb2ZwYXJ0LSQoQ09ORklH
X01URF9PRl9QQVJUU19CQ000OTA4KQkrPSBvZnBhcnRfYmNtNDkwOC5vCiBvZnBhcnQtJChDT05G
SUdfTVREX09GX1BBUlRTX0xJTktTWVNfTlMpKz0gb2ZwYXJ0X2xpbmtzeXNfbnMubwogb2JqLSQo
Q09ORklHX01URF9QQVJTRVJfSU1BR0VUQUcpCSs9IHBhcnNlcl9pbWFnZXRhZy5vCiBvYmotJChD
T05GSUdfTVREX0FGU19QQVJUUykJCSs9IGFmcy5vCitvYmotJChDT05GSUdfTVREX1BBUlNFUl9U
UExJTktfU0FGRUxPQURFUikJKz0gdHBsaW5rX3NhZmVsb2FkZXIubwogb2JqLSQoQ09ORklHX01U
RF9QQVJTRVJfVFJYKQkJKz0gcGFyc2VyX3RyeC5vCiBvYmotJChDT05GSUdfTVREX1NFUkNPTU1f
UEFSVFMpCQkrPSBzY3BhcnQubwogb2JqLSQoQ09ORklHX01URF9TSEFSUFNMX1BBUlRTKQkJKz0g
c2hhcnBzbHBhcnQubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy90cGxpbmtfc2Fm
ZWxvYWRlci5jIGIvZHJpdmVycy9tdGQvcGFyc2Vycy90cGxpbmtfc2FmZWxvYWRlci5jCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNzMxN2QxZmFhYmJiCi0tLSAvZGV2
L251bGwKKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy90cGxpbmtfc2FmZWxvYWRlci5jCkBAIC0w
LDAgKzEsMTUwIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cisv
KgorICogQ29weXJpZ2h0IMKpIDIwMjIgUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
PgorICovCisKKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+CisjaW5jbHVkZSA8bGludXgvbXRkL3Bh
cnRpdGlvbnMuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4KKworI2RlZmluZSBUUExJTktfU0FGRUxPQURFUl9EQVRBX09GRlNFVAkJNAorI2RlZmluZSBU
UExJTktfU0FGRUxPQURFUl9NQVhfUEFSVFMJCTMyCisKK3N0cnVjdCBzYWZlbG9hZGVyX2Ntbl9o
ZWFkZXIgeworCV9fYmUzMiBzaXplOworCXVpbnQzMl90IHVudXNlZDsKK30gX19wYWNrZWQ7CisK
K3N0YXRpYyB2b2lkICptdGRfcGFyc2VyX3RwbGlua19zYWZlbG9hZGVyX3JlYWRfdGFibGUoc3Ry
dWN0IG10ZF9pbmZvICptdGQpCit7CisJc3RydWN0IHNhZmVsb2FkZXJfY21uX2hlYWRlciBoZHI7
CisJc3RydWN0IGRldmljZV9ub2RlICpucDsKKwlzaXplX3QgYnl0ZXNfcmVhZDsKKwlzaXplX3Qg
b2Zmc2V0OworCXNpemVfdCBzaXplOworCWNoYXIgKmJ1ZjsKKwlpbnQgZXJyOworCisJbnAgPSBt
dGRfZ2V0X29mX25vZGUobXRkKTsKKwlpZiAobXRkX2lzX3BhcnRpdGlvbihtdGQpKQorCQlvZl9u
b2RlX2dldChucCk7CisJZWxzZQorCQlucCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG5wLCAicGFy
dGl0aW9ucyIpOworCisJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAicGFydGl0aW9ucy10
YWJsZS1vZmZzZXQiLCAmb2Zmc2V0KSkgeworCQlwcl9lcnIoIkZhaWxlZCB0byBnZXQgcGFydGl0
aW9ucyB0YWJsZSBvZmZzZXRcbiIpOworCQlnb3RvIGVycl9wdXQ7CisJfQorCisJZXJyID0gbXRk
X3JlYWQobXRkLCBvZmZzZXQsIHNpemVvZihoZHIpLCAmYnl0ZXNfcmVhZCwgKHVpbnQ4X3QgKikm
aGRyKTsKKwlpZiAoZXJyICYmICFtdGRfaXNfYml0ZmxpcChlcnIpKSB7CisJCXByX2VycigiRmFp
bGVkIHRvIHJlYWQgZnJvbSAlcyBhdCAweCV6eFxuIiwgbXRkLT5uYW1lLCBvZmZzZXQpOworCQln
b3RvIGVycl9wdXQ7CisJfQorCisJc2l6ZSA9IGJlMzJfdG9fY3B1KGhkci5zaXplKTsKKworCWJ1
ZiA9IGttYWxsb2Moc2l6ZSArIDEsIEdGUF9LRVJORUwpOworCWlmICghYnVmKQorCQlnb3RvIGVy
cl9wdXQ7CisKKwllcnIgPSBtdGRfcmVhZChtdGQsIG9mZnNldCArIHNpemVvZihoZHIpLCBzaXpl
LCAmYnl0ZXNfcmVhZCwgYnVmKTsKKwlpZiAoZXJyICYmICFtdGRfaXNfYml0ZmxpcChlcnIpKSB7
CisJCXByX2VycigiRmFpbGVkIHRvIHJlYWQgZnJvbSAlcyBhdCAweCV6eFxuIiwgbXRkLT5uYW1l
LCBvZmZzZXQgKyBzaXplb2YoaGRyKSk7CisJCWdvdG8gZXJyX2tmcmVlOworCX0KKworCWJ1Zltz
aXplIC0gMV0gPSAnXDAnOworCisJb2Zfbm9kZV9wdXQobnApOworCisJcmV0dXJuIGJ1ZjsKKwor
ZXJyX2tmcmVlOgorCWtmcmVlKGJ1Zik7CitlcnJfcHV0OgorCW9mX25vZGVfcHV0KG5wKTsKKwly
ZXR1cm4gTlVMTDsKK30KKworc3RhdGljIGludCBtdGRfcGFyc2VyX3RwbGlua19zYWZlbG9hZGVy
X3BhcnNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAorCQkJCQkgICAgICBjb25zdCBzdHJ1Y3QgbXRk
X3BhcnRpdGlvbiAqKnBwYXJ0cywKKwkJCQkJICAgICAgc3RydWN0IG10ZF9wYXJ0X3BhcnNlcl9k
YXRhICpkYXRhKQoreworCXN0cnVjdCBtdGRfcGFydGl0aW9uICpwYXJ0czsKKwljaGFyIG5hbWVb
NjVdOworCXNpemVfdCBvZmZzZXQ7CisJc2l6ZV90IGJ5dGVzOworCWNoYXIgKmJ1ZjsKKwlpbnQg
aWR4OworCWludCBlcnI7CisKKwlwYXJ0cyA9IGtjYWxsb2MoVFBMSU5LX1NBRkVMT0FERVJfTUFY
X1BBUlRTLCBzaXplb2YoKnBhcnRzKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFwYXJ0cykgeworCQll
cnIgPSAtRU5PTUVNOworCQlnb3RvIGVycl9vdXQ7CisJfQorCisJYnVmID0gbXRkX3BhcnNlcl90
cGxpbmtfc2FmZWxvYWRlcl9yZWFkX3RhYmxlKG10ZCk7CisJaWYgKCFidWYpIHsKKwkJZXJyID0g
LUVOT0VOVDsKKwkJZ290byBlcnJfb3V0OworCX0KKworCWZvciAoaWR4ID0gMCwgb2Zmc2V0ID0g
VFBMSU5LX1NBRkVMT0FERVJfREFUQV9PRkZTRVQ7CisJICAgICBpZHggPCBUUExJTktfU0FGRUxP
QURFUl9NQVhfUEFSVFMgJiYKKwkgICAgIHNzY2FuZihidWYgKyBvZmZzZXQsICJwYXJ0aXRpb24g
JTY0cyBiYXNlIDB4JWxseCBzaXplIDB4JWxseCVuXG4iLAorCQkgICAgbmFtZSwgJnBhcnRzW2lk
eF0ub2Zmc2V0LCAmcGFydHNbaWR4XS5zaXplLCAmYnl0ZXMpID09IDM7CisJICAgICBpZHgrKywg
b2Zmc2V0ICs9IGJ5dGVzICsgMSkgeworCQlwYXJ0c1tpZHhdLm5hbWUgPSBrc3RyZHVwKG5hbWUs
IEdGUF9LRVJORUwpOworCQlpZiAoIXBhcnRzW2lkeF0ubmFtZSkgeworCQkJZXJyID0gLUVOT01F
TTsKKwkJCWdvdG8gZXJyX2ZyZWU7CisJCX0KKwl9CisKKwlpZiAoaWR4ID09IFRQTElOS19TQUZF
TE9BREVSX01BWF9QQVJUUykKKwkJcHJfd2FybigiUmVhY2hlZCBtYXhpbXVtIG51bWJlciBvZiBw
YXJ0aXRpb25zIVxuIik7CisKKwlrZnJlZShidWYpOworCisJKnBwYXJ0cyA9IHBhcnRzOworCisJ
cmV0dXJuIGlkeDsKKworZXJyX2ZyZWU6CisJZm9yIChpZHggLT0gMTsgaWR4ID49IDA7IGlkeC0t
KQorCQlrZnJlZShwYXJ0c1tpZHhdLm5hbWUpOworZXJyX291dDoKKwlyZXR1cm4gZXJyOworfTsK
Kworc3RhdGljIHZvaWQgbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9jbGVhbnVwKGNvbnN0
IHN0cnVjdCBtdGRfcGFydGl0aW9uICpwcGFydHMsCisJCQkJCQkgaW50IG5yX3BhcnRzKQorewor
CWludCBpOworCisJZm9yIChpID0gMDsgaSA8IG5yX3BhcnRzOyBpKyspCisJCWtmcmVlKHBwYXJ0
c1tpXS5uYW1lKTsKKworCWtmcmVlKHBwYXJ0cyk7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG10ZF9wYXJzZXJfdHBsaW5rX3NhZmVsb2FkZXJfb2ZfbWF0Y2hfdGFibGVb
XSA9IHsKKwl7IC5jb21wYXRpYmxlID0gInRwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMiIH0s
CisJe30sCit9OworTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRkX3BhcnNlcl90cGxpbmtfc2Fm
ZWxvYWRlcl9vZl9tYXRjaF90YWJsZSk7CisKK3N0YXRpYyBzdHJ1Y3QgbXRkX3BhcnRfcGFyc2Vy
IG10ZF9wYXJzZXJfdHBsaW5rX3NhZmVsb2FkZXIgPSB7CisJLnBhcnNlX2ZuID0gbXRkX3BhcnNl
cl90cGxpbmtfc2FmZWxvYWRlcl9wYXJzZSwKKwkuY2xlYW51cCA9IG10ZF9wYXJzZXJfdHBsaW5r
X3NhZmVsb2FkZXJfY2xlYW51cCwKKwkubmFtZSA9ICJ0cGxpbmstc2FmZWxvYWRlciIsCisJLm9m
X21hdGNoX3RhYmxlID0gbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9vZl9tYXRjaF90YWJs
ZSwKK307Cittb2R1bGVfbXRkX3BhcnRfcGFyc2VyKG10ZF9wYXJzZXJfdHBsaW5rX3NhZmVsb2Fk
ZXIpOworCitNT0RVTEVfTElDRU5TRSgiR1BMIik7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
