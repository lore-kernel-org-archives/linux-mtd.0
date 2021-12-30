Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337F2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Dec 2021 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8nyvSriegkhk6rFUV0qCSfizIv8ZxApPAWPjCZ0yZPE=; b=w9WXhmwapevBZZ
	WUMVoimaNO2EKffd0ZR+XctNlwumXO41ObwvL6/OFCAFE3PzBL1FxpZFRpjkVnwqVLUTj/6lagkW2
	Xwa8FwzVzhXW1z7ziPzhBNJZvlxa+Y1BjGpV4auNBZ8F5eZ43oszwblTHG1PkKGnGC9gx2jKJTcd/
	xxkwnz3Pyl0w32w1g7RctrORX4ex9yv/RgLeNICADqiBpo6nco5eLnBip4DuXtUicIs0PyFD5EIfA
	B+DaU6g+WbLQbTK9iZs2fBhSpTqqVbuB8dBS3Wf6/OOBQnIuE1+sl63YUm7mqw6Z2MfGDcCFj/tJO
	MjgiDDk/ZxwrJTm9AsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2rMu-0046a6-GP; Thu, 30 Dec 2021 09:05:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2rMr-0046ZG-45
 for linux-mtd@lists.infradead.org; Thu, 30 Dec 2021 09:05:02 +0000
Received: by mail-lj1-x232.google.com with SMTP id by39so39690226ljb.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Dec 2021 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmbFZL+w3ae5fA8Ekugn4kVFo17QFX/FP2wMDhmpXOY=;
 b=fZ3Ev8jtzPAShYqCKYkyXWe3FmPDZnj7vyEXvF+vYDVGRaGPvO77jfdto7S1XqUswj
 QcBtyL7Odns/FjPcn8i77XfX8uw3nXXOGgdqXjzNk3AGHTFy1eKQrBNNXtXOkeffgeZ1
 c8W0gijcymflJTG3xsh5uzF7CxXxIttJODsgU9IWH2NtJOEHcEr0ijiCjDxkSp5wXfvh
 l9qeaNv8Q9RtT2J02jglo9sUQbcmether37dSrKBTif8nLY2wQTPlFpMMKHtQMWtjsUw
 53J06f4RK0v4LZzNhjOE/Pioen5R87IXCZOqs1saTiC2qdfMz3c3a7odQZAmwjgZFPaB
 /LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmbFZL+w3ae5fA8Ekugn4kVFo17QFX/FP2wMDhmpXOY=;
 b=VNc4LmVQgH4x273xWvcGcTY/40GI4E/J5vFxej18hBcMmQtEbilS7R1GpW1zDyt93c
 bKGrsV2yWVf2awi47vw2aOf0aRQpjiVJPH7faw4gjnoJZfzi/OvkNp785UYJFZ63koT7
 E2vRQIjUWu8us/BsRDBt3XL1PXzSLuBMfubITF/1NyLsHSaGPtrxD5tH1O0AAgtmtqTu
 Q6zdTvJKkn1bPtk1zosHgEBMiXSPwlGtjpwFWronSDD7241fsiupFb51CDuXvNGkh/o2
 1J4uPkZBzHjujr5GoYyq3Nv+AWCFVqaoE8i6nPXxWr5Zl6SH9f1j39sL4/g2sNI08bw3
 2ncA==
X-Gm-Message-State: AOAM532HuZUeBNFcTQ8Af24AZGzsK/MaZt7iaNfWZkazYjDAurmClrEW
 dnYXIdMOKfsR4slWv3w5OcM=
X-Google-Smtp-Source: ABdhPJwaT7mr00o0HB88uX9XEw8ZrPCDI/+I5R7gN/sb04GsaTBMK3qqUB2tX4Pv9zVp4pLr/qvGMQ==
X-Received: by 2002:a2e:1602:: with SMTP id w2mr26247986ljd.517.1640855099102; 
 Thu, 30 Dec 2021 01:04:59 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id d5sm2440007lfl.242.2021.12.30.01.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:04:58 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/3] mtd: core: call devm_of_platform_populate() for MTD
 devices
Date: Thu, 30 Dec 2021 10:04:47 +0100
Message-Id: <20211230090449.11808-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_010501_208548_CB9DFED7 
X-CRM114-Status: GOOD (  12.58  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBhZGRzIHN1cHBv
cnQgZm9yIGJpbmRpbmdzIHByZXNlbnQgaW4gTVREIGRldmljZXMgKGFwcGxpZXMgdG8KcGFydGl0
aW9ucyB0b28pIG5vZGVzLiBUaGUgcHVycG9zZSBvZiB0aGlzIGNoYW5nZSBpcyB0byBhbGxvdyBk
cml2ZXJzCmhhbmRsZSBNVEQgZGV2aWNlIChwYXJ0aXRpb24pIGRhdGEuIFNvbWUgcGFydGl0aW9u
cyBtYXkgY29udGFpbiBpbmZvCnRoYXQgcmVxdWlyZXMgcGFyc2luZyAmIHByb2Nlc3NpbmcuCgpB
biBleGFtcGxlIGNhbiBiZSBVLUJvb3QgcGFydGl0aW9uIHRoYXQgY29udGFpbnMgYmxvY2sgd2l0
aCBlbnZpcm9ubWVudAp2YXJpYWJsZXMgc29tZWh3ZXJlIGluIGEgbWlkZGxlLiBUaGF0IGJsb2Nr
IHNob3VsZCBiZSBkZXNjcmliZWQgaW4gRFQKYW5kIHBhcnNlZCBieSBhIHNwZWNpZmljIGRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0t
CiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210
ZC9tdGRjb3JlLmMKaW5kZXggNzBmNDkyZGNlMTU4Li4wN2I3NWU2Y2ExMTEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL210ZGNvcmUuYworKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTE5
LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9pb2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L2lu
aXQuaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3Jt
Lmg+CiAjaW5jbHVkZSA8bGludXgvcHJvY19mcy5oPgogI2luY2x1ZGUgPGxpbnV4L2lkci5oPgog
I2luY2x1ZGUgPGxpbnV4L2JhY2tpbmctZGV2Lmg+CkBAIC02OTAsNiArNjkxLDkgQEAgaW50IGFk
ZF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQlub3QtPmFkZChtdGQpOwogCiAJ
bXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOworCisJZGV2bV9vZl9wbGF0Zm9ybV9wb3B1
bGF0ZSgmbXRkLT5kZXYpOworCiAJLyogV2UgX2tub3dfIHdlIGFyZW4ndCBiZWluZyByZW1vdmVk
LCBiZWNhdXNlCiAJICAgb3VyIGNhbGxlciBpcyBzdGlsbCBob2xkaW5nIHVzIGhlcmUuIFNvIG5v
bmUKIAkgICBvZiB0aGlzIHRyeV8gbm9uc2Vuc2UsIGFuZCBubyBiaXRjaGluZyBhYm91dCBpdAot
LSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
