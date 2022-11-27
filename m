Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E4BC46467
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Nov 2022 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K5fbBKuzz4GQ2+HSoM+FBc3fYVuuvsFQWSjHyg0KS70=; b=Y5RKIDtJOo8+kM
	FUmXte9E79GK572K8kiYz9LXoQxon1ZLRiiyD+URvTEBbRPh159konaUrZ1oRuwZC5ppHXYckDkUj
	D/p6Zg3Pi51hfB2MQH8XuvU0isFAl6c0vVNMkEaj9r7/f1W1/urxKbRHyyzQ09Hg2hLZOql+pCycy
	XCKeij7YXli18r7rix5hr24cyvfE2zcMPDRUi/ahk8Dx3MCV+Ano9BeF4NlDJ8IjVCliZX8OlH6lm
	jFkK3zGCmkuX1p7sv/ttj53bfqnwds81uIlZCe6LccRgHpTfvjRSAhev8MFjZylaoRENXNPZkwpAH
	eUoUIJS5/4qbvubkdmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozQnZ-00E8Q9-RZ; Sun, 27 Nov 2022 23:10:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozQnW-00E8Mz-WD; Sun, 27 Nov 2022 23:10:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id c1so14859737lfi.7;
        Sun, 27 Nov 2022 15:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8JXtlo4DWFyHURdtAccWfZAXE3cOsEDHes1809eE/U=;
        b=QW9F8xXcDk6+dTNytDZQt+FDxATthPJl4PyRcDASxAZnVPMrhSGrtAqYfMauiA2RC4
         qX3sAEj2SgBWgdSJ9mgXapjj8gjYXO8e6aPIVmEf7zfftdfZFQloCpPS1MukHL7KCc5p
         nywgoMZfSNUk9LQoSg2VVwtmXEk9pM9n1F8LKMOl3SwSTRZ0YHm3iWi3j/nkHElM6L1q
         oX4ULjLTHXgzr1h4oXqyYo4497dTUu9irJ55DryuzE9fv2+Ov49HNWzK/rlgNv9kThPv
         jrhpPLMQo+K1ROIYZmtgwWUUeFq3IisZdawefHcj5JWHF/p6/1Og1Y7wYH0lqXM6KWvw
         zpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8JXtlo4DWFyHURdtAccWfZAXE3cOsEDHes1809eE/U=;
        b=6BXwFuvYhs7mgW6qTq26/11wJ+pWwFY/l5SRvgwNuf7+E1VguB4eOQPMEuh7oMlEvq
         i+c7eJ+YOXtPMrvrqffUk/eAzgsX8LoZhX0Ma7yP0KUXdu6Iruns6yQeFViFhEortiM2
         VQ7d98YAprmH2ZLdxe+sDfya8Dg2EHZNX1TyR3Kjsc2qnwnRiih3Jzq9axB9oFx6ejWd
         MLIGcDYeeb8XDWoLYZQJ7XdVULhJYMOy+pvORllHqTdrXqijcwMPO4D/VH7j/5fE3gMA
         wDZr2NyOA7qZntM0s1n4eqnDvnEvuf/iIkyrJhgRJZGqAHOIpxnL8xjg55zpp9WzBnuf
         fLkA==
X-Gm-Message-State: ANoB5plja8lNrocDi/gyd9Ao0A5+KGtog+QAMUfSi8GU7Io6jUUhdmyw
	dJy4uo2N5rQ087LjT6LpQQk=
X-Google-Smtp-Source: AA0mqf7sUKQqb/1PAv8GCFQE+7LTmVRJLj315wSetO38JXCWb7+qDuuRDemCeeABGvrEU3plpkHwYw==
X-Received: by 2002:a05:6512:210d:b0:4a2:741f:1909 with SMTP id q13-20020a056512210d00b004a2741f1909mr17557432lfr.484.1669590646981;
        Sun, 27 Nov 2022 15:10:46 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id d17-20020a0565123d1100b004b4ea0f4e7fsm1439984lfv.299.2022.11.27.15.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 15:10:46 -0800 (PST)
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
Subject: [PATCH 1/2] nvmem: core: refactor .cell_post_process() CB arguments
Date: Mon, 28 Nov 2022 00:10:34 +0100
Message-Id: <20221127231035.17547-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_151055_066604_E7F36F04 
X-CRM114-Status: GOOD (  18.29  )
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
