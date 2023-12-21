Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C00BC35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpCVgkOVVCNPsSmObR+vzGYhOomWzs9LPiHf1MEPXy0=; b=yEdjxUo90+zGkC
	O1esuJ17M7QFEA4CvjiXqfFMyGLePwjQjsJMIOjBdTyb/PqotPLrAk1VaTluxwQg5dZDUZ+XsAzUA
	CPbnTaG1auLevgU9jVCiAXxyyqCvF1/IGJPnw1oKpe81tTPuXu0Cv9+zbfPnyEzTDU4jVLbV8J9ZM
	44AAoQbQZnqYK5dnVksZwDy3FsycKLyjdQAJM3DLyIyHKNb0piOrr9/zSk8TKNHsyuqCVzriDVpW/
	3NdjG/wfbxF677Ki7Sajpv4wja8D2dSmUFNVRryFSXia710XS+yMdjIhetDrfh02bm3ag2SG9bSKH
	EUsVbChVYDZKqORXTn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwZ-003g8N-1B;
	Thu, 21 Dec 2023 17:34:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwS-003g25-16;
	Thu, 21 Dec 2023 17:34:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a235eb41251so131398166b.3;
        Thu, 21 Dec 2023 09:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703180076; x=1703784876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqokOpCdOnYJH+v0vSqloYMckBtHhTjUM2t6QO3puqo=;
        b=ZK6lmDCnXJfHYcRXzihRBnCHKJkU+Zi3UKqWgXkWuya81kdr8M3I40KfOexmmAZwsZ
         HZ/I1nU89lOkje2MfVANKTeD0AKgM8+ULPHVVUD1BKsxyr3TA5Y5DbjZqfX4lHF2D9B6
         TVXmSsmwX8TuGiWLbGdyVlpPMJTyUBzJvztuwH+TUpEt1bfphAQnkg7JB/ov0gBHPvKr
         GOrgFNUsCiRw3OCFAy3/U3VmqoZ01MtgcQ+ZBwe//mrcPlyNcQf4m3QcgcIKsuA4fhME
         zgiBQTPTY73Fr6KQ8zX7jHXkDTV1YFaCuMsWoQlNexahdX3b/fTtN1FyAOTd/BiDXMvM
         dnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180076; x=1703784876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqokOpCdOnYJH+v0vSqloYMckBtHhTjUM2t6QO3puqo=;
        b=G8nlOjYfKqBpWllfDruTPtEklFan+kD60Zs8Dxeute1H7Ce2Mpl1dZEEqCAm2wh5q6
         uf2G4agMrkJQVyV6VBCB/qzJ+5xQC8EQdueVcT7rbZPVq/KVJk4NSv2kVQo0SLtjQ+0y
         R1d03xbiX6+Xq9eJHZJhhMAdpAQyWNYVU5afGcdScz5dh8M1SKLGebDzZREKh9vyIPjG
         dvM12rrQBBp8QB6HP/6Jzy/twMaImhM4eAUFcAMKuYO8efJgJh6tcw+u6o4KOiv7KyGP
         GlZsTcJPirsLlzt1Jgvm9f/n/el4mM209LZJfbX7GqWJ0Ego4Z0PXZhkB86MGNnATQXn
         +Y/g==
X-Gm-Message-State: AOJu0Yyc3rccbuVR8Y1ECsY3ReDbI21KumZSPstn4zWZX/CAQkQOyAFN
	45fyYjv9AvxTa2jy4FwK06w=
X-Google-Smtp-Source: AGHT+IGaQKjDvlJgaXz5OpWMMH3CY7VA2HKjsXJ3j9h1/O/qdloXPM6loUd6C+exNofs994/dz4K/A==
X-Received: by 2002:a17:906:1059:b0:a23:56a3:f51e with SMTP id j25-20020a170906105900b00a2356a3f51emr22883ejj.198.1703180075704;
        Thu, 21 Dec 2023 09:34:35 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709060ad900b00a23499f1d7dsm1176118ejf.209.2023.12.21.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:34:35 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 3/6] nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper
Date: Thu, 21 Dec 2023 18:34:18 +0100
Message-Id: <20231221173421.13737-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231221173421.13737-1-zajec5@gmail.com>
References: <20231221173421.13737-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_093440_406401_4FD2C50C 
X-CRM114-Status: GOOD (  16.31  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU2ltcGxpZnkgYWRkaW5n
IE5WTUVNIGNlbGxzLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KLS0tClYzOiBTcGxpdCBQQVRDSCAzLzMgaW50byB0d28KCiBkcml2ZXJzL252bWVtL3Ut
Ym9vdC1lbnYuYyB8IDU1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMgYi9kcml2ZXJzL252bWVtL3UtYm9vdC1l
bnYuYwppbmRleCBjNGFlOTRhZjRhZjcuLmRkOWQwYWQyMjcxMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9udm1lbS91LWJvb3QtZW52LmMKKysrIGIvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMKQEAg
LTIzLDEzICsyMywxMCBAQCBlbnVtIHVfYm9vdF9lbnZfZm9ybWF0IHsKIAogc3RydWN0IHVfYm9v
dF9lbnYgewogCXN0cnVjdCBkZXZpY2UgKmRldjsKKwlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1l
bTsKIAllbnVtIHVfYm9vdF9lbnZfZm9ybWF0IGZvcm1hdDsKIAogCXN0cnVjdCBtdGRfaW5mbyAq
bXRkOwotCi0JLyogQ2VsbHMgKi8KLQlzdHJ1Y3QgbnZtZW1fY2VsbF9pbmZvICpjZWxsczsKLQlp
bnQgbmNlbGxzOwogfTsKIAogc3RydWN0IHVfYm9vdF9lbnZfaW1hZ2Vfc2luZ2xlIHsKQEAgLTk0
LDQzICs5MSwzNiBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcmVhZF9wb3N0X3Byb2Nlc3NfZXRo
YWRkcih2b2lkICpjb250ZXh0LCBjb25zdCBjaGFyICppZCwgaQogc3RhdGljIGludCB1X2Jvb3Rf
ZW52X2FkZF9jZWxscyhzdHJ1Y3QgdV9ib290X2VudiAqcHJpdiwgdWludDhfdCAqYnVmLAogCQkJ
CXNpemVfdCBkYXRhX29mZnNldCwgc2l6ZV90IGRhdGFfbGVuKQogeworCXN0cnVjdCBudm1lbV9k
ZXZpY2UgKm52bWVtID0gcHJpdi0+bnZtZW07CiAJc3RydWN0IGRldmljZSAqZGV2ID0gcHJpdi0+
ZGV2OwogCWNoYXIgKmRhdGEgPSBidWYgKyBkYXRhX29mZnNldDsKIAljaGFyICp2YXIsICp2YWx1
ZSwgKmVxOwotCWludCBpZHg7Ci0KLQlwcml2LT5uY2VsbHMgPSAwOwotCWZvciAodmFyID0gZGF0
YTsgdmFyIDwgZGF0YSArIGRhdGFfbGVuICYmICp2YXI7IHZhciArPSBzdHJsZW4odmFyKSArIDEp
Ci0JCXByaXYtPm5jZWxscysrOwotCi0JcHJpdi0+Y2VsbHMgPSBkZXZtX2tjYWxsb2MoZGV2LCBw
cml2LT5uY2VsbHMsIHNpemVvZigqcHJpdi0+Y2VsbHMpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXBy
aXYtPmNlbGxzKQotCQlyZXR1cm4gLUVOT01FTTsKIAotCWZvciAodmFyID0gZGF0YSwgaWR4ID0g
MDsKKwlmb3IgKHZhciA9IGRhdGE7CiAJICAgICB2YXIgPCBkYXRhICsgZGF0YV9sZW4gJiYgKnZh
cjsKLQkgICAgIHZhciA9IHZhbHVlICsgc3RybGVuKHZhbHVlKSArIDEsIGlkeCsrKSB7CisJICAg
ICB2YXIgPSB2YWx1ZSArIHN0cmxlbih2YWx1ZSkgKyAxKSB7CisJCXN0cnVjdCBudm1lbV9jZWxs
X2luZm8gaW5mbyA9IHt9OworCiAJCWVxID0gc3RyY2hyKHZhciwgJz0nKTsKIAkJaWYgKCFlcSkK
IAkJCWJyZWFrOwogCQkqZXEgPSAnXDAnOwogCQl2YWx1ZSA9IGVxICsgMTsKIAotCQlwcml2LT5j
ZWxsc1tpZHhdLm5hbWUgPSBkZXZtX2tzdHJkdXAoZGV2LCB2YXIsIEdGUF9LRVJORUwpOwotCQlp
ZiAoIXByaXYtPmNlbGxzW2lkeF0ubmFtZSkKKwkJaW5mby5uYW1lID0gZGV2bV9rc3RyZHVwKGRl
diwgdmFyLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFpbmZvLm5hbWUpCiAJCQlyZXR1cm4gLUVOT01F
TTsKLQkJcHJpdi0+Y2VsbHNbaWR4XS5vZmZzZXQgPSBkYXRhX29mZnNldCArIHZhbHVlIC0gZGF0
YTsKLQkJcHJpdi0+Y2VsbHNbaWR4XS5ieXRlcyA9IHN0cmxlbih2YWx1ZSk7Ci0JCXByaXYtPmNl
bGxzW2lkeF0ubnAgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShkZXYtPm9mX25vZGUsIHByaXYtPmNl
bGxzW2lkeF0ubmFtZSk7CisJCWluZm8ub2Zmc2V0ID0gZGF0YV9vZmZzZXQgKyB2YWx1ZSAtIGRh
dGE7CisJCWluZm8uYnl0ZXMgPSBzdHJsZW4odmFsdWUpOworCQlpbmZvLm5wID0gb2ZfZ2V0X2No
aWxkX2J5X25hbWUoZGV2LT5vZl9ub2RlLCBpbmZvLm5hbWUpOwogCQlpZiAoIXN0cmNtcCh2YXIs
ICJldGhhZGRyIikpIHsKLQkJCXByaXYtPmNlbGxzW2lkeF0ucmF3X2xlbiA9IHN0cmxlbih2YWx1
ZSk7Ci0JCQlwcml2LT5jZWxsc1tpZHhdLmJ5dGVzID0gRVRIX0FMRU47Ci0JCQlwcml2LT5jZWxs
c1tpZHhdLnJlYWRfcG9zdF9wcm9jZXNzID0gdV9ib290X2Vudl9yZWFkX3Bvc3RfcHJvY2Vzc19l
dGhhZGRyOworCQkJaW5mby5yYXdfbGVuID0gc3RybGVuKHZhbHVlKTsKKwkJCWluZm8uYnl0ZXMg
PSBFVEhfQUxFTjsKKwkJCWluZm8ucmVhZF9wb3N0X3Byb2Nlc3MgPSB1X2Jvb3RfZW52X3JlYWRf
cG9zdF9wcm9jZXNzX2V0aGFkZHI7CiAJCX0KLQl9CiAKLQlpZiAoV0FSTl9PTihpZHggIT0gcHJp
di0+bmNlbGxzKSkKLQkJcHJpdi0+bmNlbGxzID0gaWR4OworCQludm1lbV9hZGRfb25lX2NlbGwo
bnZtZW0sICZpbmZvKTsKKwl9CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTIwOSw3ICsxOTksNiBAQCBz
dGF0aWMgaW50IHVfYm9vdF9lbnZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAgPSBkZXYtPm9mX25vZGU7CiAJc3RydWN0IHVfYm9vdF9lbnYgKnByaXY7Ci0JaW50IGVycjsK
IAogCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsK
IAlpZiAoIXByaXYpCkBAIC0yMjQsMTcgKzIxMywxNSBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0dXJuIFBUUl9FUlIocHJp
di0+bXRkKTsKIAl9CiAKLQllcnIgPSB1X2Jvb3RfZW52X3BhcnNlKHByaXYpOwotCWlmIChlcnIp
Ci0JCXJldHVybiBlcnI7Ci0KIAljb25maWcuZGV2ID0gZGV2OwotCWNvbmZpZy5jZWxscyA9IHBy
aXYtPmNlbGxzOwotCWNvbmZpZy5uY2VsbHMgPSBwcml2LT5uY2VsbHM7CiAJY29uZmlnLnByaXYg
PSBwcml2OwogCWNvbmZpZy5zaXplID0gcHJpdi0+bXRkLT5zaXplOwogCi0JcmV0dXJuIFBUUl9F
UlJfT1JfWkVSTyhkZXZtX252bWVtX3JlZ2lzdGVyKGRldiwgJmNvbmZpZykpOworCXByaXYtPm52
bWVtID0gZGV2bV9udm1lbV9yZWdpc3RlcihkZXYsICZjb25maWcpOworCWlmIChJU19FUlIocHJp
di0+bnZtZW0pKQorCQlyZXR1cm4gUFRSX0VSUihwcml2LT5udm1lbSk7CisKKwlyZXR1cm4gdV9i
b290X2Vudl9wYXJzZShwcml2KTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgdV9ib290X2Vudl9vZl9tYXRjaF90YWJsZVtdID0gewotLSAKMi4zNS4zCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
