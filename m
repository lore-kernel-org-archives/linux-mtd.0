Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CC3C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 07:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K5fbBKuzz4GQ2+HSoM+FBc3fYVuuvsFQWSjHyg0KS70=; b=XEXZRPB7IxLVT2
	nZ8rWhH7BXSP2Y4ahoynpU391AqCEgv5N46T/j4pF0rxvhXaBbVUSvHqbpzZkc7RkpWtZyLqiDjXc
	ZXK7CxP6tzNv5cC+IpEcZOsRITc7wiZNER2zt57U6TfCQtDbLCAnPMHJV9XvD9eyWzyJ09doKaBae
	qBjHIuOIiW7fOWMYApw09OOByjPeAZHgoYfOTVYi/rkn/+/xU0zcE1/V7jM19sOPKUyz5is8iIXpf
	+REnzEaKqQL6aA0l3ujje/NDsJRN8fCelH35c0YAqQKqEcum6J0+kzbnzjvXNE6zJRho/6tT93VDz
	bvcUpmoe4NfJ4s2+GPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozY81-00H3sx-9B; Mon, 28 Nov 2022 07:00:33 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozY7n-00H3mN-NX; Mon, 28 Nov 2022 07:00:21 +0000
Received: by mail-lj1-x236.google.com with SMTP id y5so3310829lji.0;
        Sun, 27 Nov 2022 23:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8JXtlo4DWFyHURdtAccWfZAXE3cOsEDHes1809eE/U=;
        b=gQ9JYrQsicj8eAsKvk3R5rm/zo+h46O6J6weTbBj9yLpvDA99c4s1v3auMmpe7RItY
         sjg66lnFysPwh5muJgAa9KfewShQtjN4D7Qom/G7fQftbKwZV5EG6FmZnM37TQemuxz/
         fxaopkm8qbg0aQ+c0hf/QaM3D+XJhDCIfGk8oTWKGrcT5lkbaazP7MfG53/aEkWV+/Il
         uo4rb4N6Jp01OgYB47EvF+ED/GTiz9wJlT/GeGiqPvx0NXSMBtH+oJ0+Ce8gbMHUEX1w
         w77jiS3hv3FUIcMCgYJWYIDZ5nMJJMJADIsx/obBsjRLU8S0jNuui3FBlAjdE4SM6Ag3
         FkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8JXtlo4DWFyHURdtAccWfZAXE3cOsEDHes1809eE/U=;
        b=UV0Kh/ejUprsVaXPjNtCVs8aOt6YfgqQP8zXgFCbDrQXo1axxSHrq4vv4e1wEix5JO
         AYmKiYnIjYkvCa02FTiMyIlFUtkLTO9Yo1+f15fabsNt+ZaHt7btRDFV8lROmz52Z+d5
         LPkNw2yyk7B6Yzk5VRSo/r2SsKNAXcJyBUns23fFWDHGzhuuhXhH1lPr4K4NdW89c61V
         L7sHbV9umgj0XUjzbjFW4JylGri7H216zUZegO7GCIwjNMg1m3ChIl7KKqwU7dspNSVe
         P90EGtZqY60OjbMYocB8HuV6Qn/tlD2TlfT485vN9MlF283Rtd7oFLI7Xjo6qHND1B4S
         AiFQ==
X-Gm-Message-State: ANoB5pkJ6dcjCVx5rL9nV98AnDvVaPnkKGqV/2ab+zF48r2Eqy2M76oA
	60dKz5Mvv9MiDQ/O+yBAQWs=
X-Google-Smtp-Source: AA0mqf5jXColcAENepdyWUW3CDWbxMRsZ4OcZhdqOP2i1kldSqZax7lMxZ1fVluk7O0mb8Qwdk74vA==
X-Received: by 2002:a05:651c:19ab:b0:276:66a4:47c3 with SMTP id bx43-20020a05651c19ab00b0027666a447c3mr9874524ljb.49.1669618813964;
        Sun, 27 Nov 2022 23:00:13 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t12-20020a2e780c000000b002770a7e320esm1129686ljc.81.2022.11.27.23.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 23:00:13 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] nvmem: core: refactor .cell_post_process() CB arguments
Date: Mon, 28 Nov 2022 07:59:22 +0100
Message-Id: <20221128065923.1180-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_230019_796946_224086DC 
X-CRM114-Status: GOOD (  18.94  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKUGFzcyB3aG9sZSBOVk1F
TSBjZWxsIHN0cnVjdCBhbmQgbGVuZ3RoIHBvaW50ZXIgYXMgYXJndW1lbnRzIHRvIGNhbGxiYWNr
CmZ1bmN0aW9ucy4KClRoaXMgYWxsb3dzOgoKMS4gQ2VsbHMgY29udGVudCB0byBiZSBtb2RpZmll
ZCBiYXNlZCBvbiBtb3JlIGluZm8KICAgU29tZSBjZWxscyAoaWRlbnRpZmllZCBieSB0aGVpciBu
YW1lcykgY29udGFpbiBzcGVjaWZpYyBkYXRhIHRoYXQKICAgbmVlZHMgZnVydGhlciBwcm9jZXNz
aW5nLiBUaGlzIGNhbiBiZSBlLmcuIE1BQyBhZGRyZXNzIHN0b3JlZCBpbiBhbgogICBBU0NJSSBm
b3JtYXQuIE5WTUVNIGNvbnN1bWVycyBleHBlY3QgTUFDIHRvIGJlIHJlYWQgaW4gYSBiaW5hcnkg
Zm9ybS4KICAgTW9yZSBjb21wbGV4IGNlbGxzIG1heSBiZSBhZGRpdGlvbmFsbHkgZGVzY3JpYmVk
IGluIERULiBUaGlzIGNoYW5nZQogICBhbGxvd3MgYWxzbyBhY2Nlc3NpbmcgcmVsZXZhbnQgRFQg
bm9kZXMgYW5kIHJlYWRpbmcgZXh0cmEgaW5mby4KCjIuIEFkanVzdGluZyBkYXRhIGxlbmd0aAog
ICBJZiBjZWxsIHByb2Nlc3NpbmcgcmVzdWx0cyBpbiByZWZvcm1hdHRpbmcgaXQsIGl0J3MgcmVx
dWlyZWQgdG8KICAgYWRqdXN0IGxlbmd0aC4gVGhpcyBhZ2FpbiBhcHBsaWVzIGUuZy4gdG8gdGhl
IE1BQyBmb3JtYXQgY2hhbmdlIGZyb20KICAgQVNDSUkgdG8gdGhlIGJ5dGUtYmFzZWQuCgpMYXRl
ciBvbiB3ZSBtYXkgY29uc2lkZXIgbW9yZSBjbGVhbnVwcyAmIGZlYXR1cmVzIGxpa2U6CjEuIERy
b3BwaW5nICJjb25zdCBjaGFyICppZCIgYW5kIGp1c3QgdXNpbmcgTlZNRU0gY2VsbCBuYW1lCjIu
IEFkZGluZyBleHRyYSBhcmd1bWVudCBmb3IgY2VsbHMgcHJvdmlkaW5nIG11bHRpcGxlIHZhbHVl
cwoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0K
VGhpcyBzb2x1dGlvbiBjb25mbGljdHMgd2l0aCAxIHBhcnQgb2YgTWljaGFlbCdzIHdvcms6CltQ
QVRDSCB2MiAwMC8yMF0gbnZtZW06IGNvcmU6IGludHJvZHVjZSBOVk1FTSBsYXlvdXRzCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMjA5MDEyMjE4NTcuMjYwMDM0
MC0xLW1pY2hhZWxAd2FsbGUuY2MvCgpJbnN0ZWFkIG9mOgoxLiBBZGRpbmcgTlZNRU0gY2VsbC1s
ZXZlbCBwb3N0X3Byb2Nlc3MgY2FsbGJhY2sKMi4gQWRkaW5nIGNhbGxiYWNrICguZml4dXBfY2Vs
bF9pbmZvKCkpIGZvciBzZXR0aW5nIGNhbGxiYWNrcwozLiBEcm9wcGluZyBOVk1FTSBkZXZpY2Ut
bGV2ZWwgcG9zdF9wcm9jZXNzIGNhbGxiYWNrCkkgZGVjaWRlZCB0byByZWZhY3RvciBleGlzdGlu
ZyBjYWxsYmFjay4KCk1pY2hhZWwncyB3b3JrIG9uIGFkZGluZyAjbnZtZW0tY2VsbC1jZWxscyBz
aG91bGQgYmUgcG9zc2libGUgdG8gZWFzaWx5CnJlYmFzZSBvbiB0b3Agb2YgdGhvc2UgY2hhbmdl
cy4KClRoaXMgZG9lbid0IGFkZCBzdXBwb3J0IGZvciAxIGNlbGwgcHJvdmlkaW5nIG11bHRpcGxl
IHZhbHVlcy4gVGhhdCBuZWVkcwp0byBiZSBhZGRlZCBsYXRlciBvbmNlIHdlIHNvcnQgb3V0ICNu
dm1lbS1jZWxsLWNlbGxzIGJpbmRpbmdzLiBUaGlzCmZpeGVzIHRoZSBiYXNpYyBjYXNlIHdpdGgg
cmVmb3JtYXR0aW5nIGNlbGxzIGRhdGEuCi0tLQogZHJpdmVycy9udm1lbS9jb3JlLmMgICAgICAg
ICAgIHwgMTkgKysrLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9udm1lbS9pbXgtb2NvdHAuYyAg
ICAgIHwgIDggKysrKy0tLS0KIGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCB8IDE3ICsr
KysrKysrKysrKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9u
dm1lbS9jb3JlLmMKaW5kZXggMzIxZDdkNjNlMDY4Li4wYmMzZTI2ZTRjYTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbnZtZW0vY29yZS5jCisrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCkBAIC00Niwx
NiArNDYsNiBAQCBzdHJ1Y3QgbnZtZW1fZGV2aWNlIHsKICNkZWZpbmUgdG9fbnZtZW1fZGV2aWNl
KGQpIGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgbnZtZW1fZGV2aWNlLCBkZXYpCiAKICNkZWZpbmUg
RkxBR19DT01QQVQJCUJJVCgwKQotc3RydWN0IG52bWVtX2NlbGxfZW50cnkgewotCWNvbnN0IGNo
YXIJCSpuYW1lOwotCWludAkJCW9mZnNldDsKLQlpbnQJCQlieXRlczsKLQlpbnQJCQliaXRfb2Zm
c2V0OwotCWludAkJCW5iaXRzOwotCXN0cnVjdCBkZXZpY2Vfbm9kZQkqbnA7Ci0Jc3RydWN0IG52
bWVtX2RldmljZQkqbnZtZW07Ci0Jc3RydWN0IGxpc3RfaGVhZAlub2RlOwotfTsKIAogc3RydWN0
IG52bWVtX2NlbGwgewogCXN0cnVjdCBudm1lbV9jZWxsX2VudHJ5ICplbnRyeTsKQEAgLTE0MTYs
MjQgKzE0MDYsMjEgQEAgc3RhdGljIGludCBfX252bWVtX2NlbGxfcmVhZChzdHJ1Y3QgbnZtZW1f
ZGV2aWNlICpudm1lbSwKIAlpbnQgcmM7CiAKIAlyYyA9IG52bWVtX3JlZ19yZWFkKG52bWVtLCBj
ZWxsLT5vZmZzZXQsIGJ1ZiwgY2VsbC0+Ynl0ZXMpOwotCiAJaWYgKHJjKQogCQlyZXR1cm4gcmM7
CisJaWYgKGxlbikKKwkJKmxlbiA9IGNlbGwtPmJ5dGVzOwogCiAJLyogc2hpZnQgYml0cyBpbi1w
bGFjZSAqLwogCWlmIChjZWxsLT5iaXRfb2Zmc2V0IHx8IGNlbGwtPm5iaXRzKQogCQludm1lbV9z
aGlmdF9yZWFkX2J1ZmZlcl9pbl9wbGFjZShjZWxsLCBidWYpOwogCiAJaWYgKG52bWVtLT5jZWxs
X3Bvc3RfcHJvY2VzcykgewotCQlyYyA9IG52bWVtLT5jZWxsX3Bvc3RfcHJvY2Vzcyhudm1lbS0+
cHJpdiwgaWQsCi0JCQkJCSAgICAgIGNlbGwtPm9mZnNldCwgYnVmLCBjZWxsLT5ieXRlcyk7CisJ
CXJjID0gbnZtZW0tPmNlbGxfcG9zdF9wcm9jZXNzKG52bWVtLT5wcml2LCBjZWxsLCBpZCwgYnVm
LCBsZW4pOwogCQlpZiAocmMpCiAJCQlyZXR1cm4gcmM7CiAJfQogCi0JaWYgKGxlbikKLQkJKmxl
biA9IGNlbGwtPmJ5dGVzOwotCiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bnZtZW0vaW14LW9jb3RwLmMgYi9kcml2ZXJzL252bWVtL2lteC1vY290cC5jCmluZGV4IDE0Mjg0
ZTg2NmYyNi4uZDM4Mzk4OWQ0OGJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVtL2lteC1vY290
cC5jCisrKyBiL2RyaXZlcnMvbnZtZW0vaW14LW9jb3RwLmMKQEAgLTIyMiw4ICsyMjIsOCBAQCBz
dGF0aWMgaW50IGlteF9vY290cF9yZWFkKHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGludCBvZmZz
ZXQsCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBpbXhfb2NvdHBfY2VsbF9wcCh2b2lk
ICpjb250ZXh0LCBjb25zdCBjaGFyICppZCwgdW5zaWduZWQgaW50IG9mZnNldCwKLQkJCSAgICAg
dm9pZCAqZGF0YSwgc2l6ZV90IGJ5dGVzKQorc3RhdGljIGludCBpbXhfb2NvdHBfY2VsbF9wcCh2
b2lkICpjb250ZXh0LCBzdHJ1Y3QgbnZtZW1fY2VsbF9lbnRyeSAqY2VsbCwKKwkJCSAgICAgY29u
c3QgY2hhciAqaWQsIHZvaWQgKmRhdGEsIHNpemVfdCAqbGVuKQogewogCXN0cnVjdCBvY290cF9w
cml2ICpwcml2ID0gY29udGV4dDsKIApAQCAtMjMzLDggKzIzMyw4IEBAIHN0YXRpYyBpbnQgaW14
X29jb3RwX2NlbGxfcHAodm9pZCAqY29udGV4dCwgY29uc3QgY2hhciAqaWQsIHVuc2lnbmVkIGlu
dCBvZmZzZXQsCiAJCQl1OCAqYnVmID0gZGF0YTsKIAkJCWludCBpOwogCi0JCQlmb3IgKGkgPSAw
OyBpIDwgYnl0ZXMvMjsgaSsrKQotCQkJCXN3YXAoYnVmW2ldLCBidWZbYnl0ZXMgLSBpIC0gMV0p
OworCQkJZm9yIChpID0gMDsgaSA8IGNlbGwtPmJ5dGVzIC8gMjsgaSsrKQorCQkJCXN3YXAoYnVm
W2ldLCBidWZbY2VsbC0+Ynl0ZXMgLSBpIC0gMV0pOwogCQl9CiAJfQogCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggYi9pbmNsdWRlL2xpbnV4L252bWVtLXByb3Zp
ZGVyLmgKaW5kZXggNTBjYWExMTdjYjYyLi5iMGQyYjZhZjlmMzcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L252bWVtLXByb3Zp
ZGVyLmgKQEAgLTE0LDE0ICsxNCwyNSBAQAogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIu
aD4KIAogc3RydWN0IG52bWVtX2RldmljZTsKLXN0cnVjdCBudm1lbV9jZWxsX2luZm87CisKK3N0
cnVjdCBudm1lbV9jZWxsX2VudHJ5IHsKKwljb25zdCBjaGFyCQkqbmFtZTsKKwlpbnQJCQlvZmZz
ZXQ7CisJaW50CQkJYnl0ZXM7CisJaW50CQkJYml0X29mZnNldDsKKwlpbnQJCQluYml0czsKKwlz
dHJ1Y3QgZGV2aWNlX25vZGUJKm5wOworCXN0cnVjdCBudm1lbV9kZXZpY2UJKm52bWVtOworCXN0
cnVjdCBsaXN0X2hlYWQJbm9kZTsKK307CisKIHR5cGVkZWYgaW50ICgqbnZtZW1fcmVnX3JlYWRf
dCkodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZnNldCwKIAkJCQl2b2lkICp2YWwsIHNpemVf
dCBieXRlcyk7CiB0eXBlZGVmIGludCAoKm52bWVtX3JlZ193cml0ZV90KSh2b2lkICpwcml2LCB1
bnNpZ25lZCBpbnQgb2Zmc2V0LAogCQkJCSB2b2lkICp2YWwsIHNpemVfdCBieXRlcyk7CiAvKiB1
c2VkIGZvciB2ZW5kb3Igc3BlY2lmaWMgcG9zdCBwcm9jZXNzaW5nIG9mIGNlbGwgZGF0YSAqLwot
dHlwZWRlZiBpbnQgKCpudm1lbV9jZWxsX3Bvc3RfcHJvY2Vzc190KSh2b2lkICpwcml2LCBjb25z
dCBjaGFyICppZCwgdW5zaWduZWQgaW50IG9mZnNldCwKLQkJCQkJICB2b2lkICpidWYsIHNpemVf
dCBieXRlcyk7Cit0eXBlZGVmIGludCAoKm52bWVtX2NlbGxfcG9zdF9wcm9jZXNzX3QpKHZvaWQg
KnByaXYsIHN0cnVjdCBudm1lbV9jZWxsX2VudHJ5ICpjZWxsLCBjb25zdCBjaGFyICppZCwKKwkJ
CQkJIHZvaWQgKmJ1Ziwgc2l6ZV90ICpsZW4pOwogCiBlbnVtIG52bWVtX3R5cGUgewogCU5WTUVN
X1RZUEVfVU5LTk9XTiA9IDAsCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
