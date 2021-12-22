Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7482C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 19:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8nyvSriegkhk6rFUV0qCSfizIv8ZxApPAWPjCZ0yZPE=; b=RqdKRmRyBv+34h
	W0AKhMAwPwnV/9fWqvu7RrwYA7tboOHHA51MMrr0iaIaVj0PqFI8lE34xRWR7ql4JPMT0RY0R1fKd
	XLENZDpdXOxD1QWegTIxVGxZuzUQxI9URgcIqEBxY7YUbRki+SA4wDqeahqAsSAyBH0LgyX8bgweW
	CORysh4saVcqOcgsPL4v/OV9DhBYbohpy7CCYS5q//LISngg/obskn8rPRKrC6p2cEfsjZmubGK8s
	hWAdcS1FuwrE1vrtCFy79QUAzLynIeYlWAEABp4ifHa4zxs2reaIVHNX5cMgqBCitrdZLo49WZqzu
	wgajXDDQeyL+cDxEO36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n07D3-00BDhB-QG; Wed, 22 Dec 2021 19:23:33 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n07D1-00BDfs-4Z
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 19:23:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id p8so5386050ljo.5
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 11:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmbFZL+w3ae5fA8Ekugn4kVFo17QFX/FP2wMDhmpXOY=;
 b=dLkU6AGwDBB6d4GVp30/fEalwT0Rx9ebq1BcO5klzW6rkEb/e+tG1O3AOZR/yJTtQQ
 aIAo3/NHhIu8dhs0GITQUxLl9a2TZfCwsquZNOdTt72wm6dz/qR76e3EjalYEOp/+s5q
 hMwb0T07cV/AYLAF0NaHxzhkPBWO/NOXC1s74QJBqoHaH5M9F/il4HB26iMWhbveWczd
 XE/rInO3uHgT9TxKdKjGzigX/JRyvv1PFGVeZHfo2RfNGjhYSEwBvMMHrWWsuKziMzPh
 6VWfQdvFfkU5PgYYHUiqnu77heZjTKNFSqmbeKxBVC58bbZWnuGHx7ucjYIMbRiPoq7W
 D7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmbFZL+w3ae5fA8Ekugn4kVFo17QFX/FP2wMDhmpXOY=;
 b=mVPK7F/8eE6UVbgrQa30Njeu4h2gII4fHkB0SMg81ikknlS3JSJCeDcIEExz9seyMT
 Kx+kaGb75PjeWFragKzhVkKqAWQKCmYXgVG0/obdgdBFLm2UEnLYxybUAYt2TFUO9kQe
 7woVMC8Ndrb+Bb5iwLNtpZcid6Ehzdnvd1T8VtxOHuHbiwnvh8RkdGg7CsJzOfIZw68G
 Ctkq7XtuiJc2Cq/oRa79C2716XadDefCP5bIDxUSDCmDLoOfA8bi42eSO87YyYCpDzDw
 Fme8pfrTd0QW0tvqAlgaW/J9hGNcOmtkd22aLP/2a/tczdQP1cSOeA9nnXBEbGdCXtUR
 wDlQ==
X-Gm-Message-State: AOAM531To5sRkDv2BITjX/eHoN+lTQFNE6xJFzgaaEbdFWWgRJUVEUS9
 CAe1SVrsSVMIhHlE42rf/NkrqA8kEwc=
X-Google-Smtp-Source: ABdhPJyH7Sk5P7qxvMVO//EGRVpJIfX+mHzWGnfgzVV5YTrnxZvCPZsAr1ZxxgF2O6AXROF/SfJVlw==
X-Received: by 2002:a2e:a4b6:: with SMTP id g22mr2867341ljm.447.1640201007302; 
 Wed, 22 Dec 2021 11:23:27 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id q10sm242070lfm.163.2021.12.22.11.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:23:26 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] mtd: core: call devm_of_platform_populate() for MTD
 devices
Date: Wed, 22 Dec 2021 20:23:18 +0100
Message-Id: <20211222192320.21974-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_112331_209561_A23031D3 
X-CRM114-Status: GOOD (  12.70  )
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
