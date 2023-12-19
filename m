Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CADBC46CD4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3qlijfmU4Ied5Qm2Ta0+IxcpjW5UyrZljfj+Bhq76g=; b=h3AhBHKvBzEZx6
	I9v9dpRnuNvTKwa2bz0bjj8SXFWetjFPmrA6PQYMmFGg+n7voy3gDhZG21WE51uqF+x150LI5LrZp
	ap7720lbRDhm5JjmVmynE2lJW1ai2zr6VhQl4/vwvGDIZfwTvEjDmNOnGUxWdE/6spu/1ikuvzuGW
	VPjkqyepKfWPXECnTRF5Bm1mAB75g5CB+UfRSyouc5VpVuwiYAO53jVGY8hqvPTLj9WC7Vl4PFRO1
	068FvkIKj0aK+f0bs3SkJXqAfp/karDaPJVKFZreHHTMsi12DcadZ6trPMepVqmQhnCPHAfoVjy+e
	/+0UwrZeA0KEWgmB0HUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5N-00EytL-0V;
	Tue, 19 Dec 2023 17:40:53 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5G-00EypC-1S;
	Tue, 19 Dec 2023 17:40:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a235e394758so286860066b.1;
        Tue, 19 Dec 2023 09:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703007644; x=1703612444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvbpVGdOkFoSIrqGEOI2u72GgRBjNjQRomAfCiRlrrE=;
        b=kleIx50BmOeMFkdRVPhuxwVbi+YzsYYb7BVYSwH0HxBoi/zwaoIbvtQeAEzs9deXgP
         Gmjc9zYF3ousyZN1Oc2Lh3vHZce7FnFf9+Iv/K6pcEwtuhOlolRQ+0fe2CWrqLBIyaud
         MKPluDyiSbQ7473yrYRxGwcFnV7UBDx0sHLT7MtKLq1dSCrqTGRKPtVLpxcDM9P+6pCl
         CPchIVg9dxSBi1dCWclq+y53qjmbW9xl17nn4Qa8EhyHaukutkhXVRn4CdXAov7T/aBk
         hdJ4baFHmVoNncp+FDAR2s9CrT5gBH2ENUsSghxKF0z0WSNHNafBbFJtmHHMKxEWYYWJ
         /CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007644; x=1703612444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvbpVGdOkFoSIrqGEOI2u72GgRBjNjQRomAfCiRlrrE=;
        b=YuMf684wihmFx5xDGA/m6xqhUiQbj6Z+tqtl92vMnhMs3tJrdqv+vilB7DRF8F23kJ
         uUS2CG+DJtZMB04FhOo9wsixu8uW02QQ04468+1MikJ18DZMmH3DpU2tTdP+tp6vnve6
         TVG/Pno8kybx8AWoDGrq+8ikyS5L6Ykg3woX1eG5zPEtmrkaoS62cnOUumvTuR4/J2gH
         rTsPJ7+7q+6Q34lxgcKTGCQlnk5NVe5PTK7FlrUx5o7HGyeZAShJkPjlbDDbbt85cz5U
         tbq3rCjJ3hMEf3JUtrlA5NSkYZebIcU4bu8I9Asag4vGZyrIxGOvmsBU+So3ZoSnd59a
         je0w==
X-Gm-Message-State: AOJu0YwsB5uR6Dc++Ero6xXb3pt4oEc8cQ2RIRxwrEoi7eGbF+fyyLb7
	FABEp2tZuhejMgdSuu65doM=
X-Google-Smtp-Source: AGHT+IF7v0el0xOUJw8FCEGpmE14E0MqTBdoBv0Uaj9ZYjmK4P8W4YVF7oTGw5Pmx8ydiXStN/I61g==
X-Received: by 2002:a17:906:da04:b0:a26:8919:6d99 with SMTP id fi4-20020a170906da0400b00a2689196d99mr274634ejb.2.1703007643985;
        Tue, 19 Dec 2023 09:40:43 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id tx27-20020a1709078e9b00b00a1c85124b08sm15834840ejc.94.2023.12.19.09.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:40:43 -0800 (PST)
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
Subject: [PATCH V2 4/5] nvmem: u-boot-env: improve coding style
Date: Tue, 19 Dec 2023 18:40:24 +0100
Message-Id: <20231219174025.15228-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231219174025.15228-1-zajec5@gmail.com>
References: <20231219174025.15228-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094046_489791_4E6073C9 
X-CRM114-Status: GOOD (  13.56  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKMS4gUHJlZmVyIGt6YWxs
b2MoKSBvdmVyIGtjYWxsb2MoKQogICBTZWUgbWVtb3J5LWFsbG9jYXRpb24ucnN0IHdoaWNoIHNh
eXM6ICJ0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGl0J3MKICAgYmVzdCB0byB1c2Ugcm91dGluZXMg
dGhhdCBzZXQgbWVtb3J5IHRvIHplcm8sIGxpa2Uga3phbGxvYygpIgoyLiBEcm9wIGRldl9lcnIo
KSBmb3IgdV9ib290X2Vudl9hZGRfY2VsbHMoKSBmYWlsCiAgIEl0IGNhbiBmYWlsIG9ubHkgb24g
LUVOT01FTS4gV2UgZG9uJ3Qgd2FudCB0byBwcmludCBlcnJvciB0aGVuLgozLiBBZGQgZXh0cmEg
ImNyYzMyX2FkZHIiIHZhcmlhYmxlCiAgIEl0IG1ha2VzIGNvZGUgcmVhZGluZyBoZWFkZXIncyBj
cmMzMiBlYXNpZXIgdG8gdW5kZXJzdGFuZCAvIHJldmlldy4KClNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tClYyOiBOZXcgcGF0Y2ggd2l0aCBzdWdn
ZXN0aW9ucyBmcm9tIE1pcXVlbAoKIGRyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jIHwgOCArKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYyBiL2RyaXZlcnMvbnZtZW0vdS1i
b290LWVudi5jCmluZGV4IDExMTkwNTE4OTM0MS4uYmVmYmFiMTU2Y2RhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYworKysgYi9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYu
YwpAQCAtMTMyLDYgKzEzMiw3IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1Y3Qg
dV9ib290X2VudiAqcHJpdikKIAlzaXplX3QgY3JjMzJfZGF0YV9vZmZzZXQ7CiAJc2l6ZV90IGNy
YzMyX2RhdGFfbGVuOwogCXNpemVfdCBjcmMzMl9vZmZzZXQ7CisJX19sZTMyICpjcmMzMl9hZGRy
OwogCXNpemVfdCBkYXRhX29mZnNldDsKIAlzaXplX3QgZGF0YV9sZW47CiAJc2l6ZV90IGRldl9z
aXplOwpAQCAtMTQzLDcgKzE0NCw3IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1
Y3QgdV9ib290X2VudiAqcHJpdikKIAogCWRldl9zaXplID0gbnZtZW1fZGV2X3NpemUobnZtZW0p
OwogCi0JYnVmID0ga2NhbGxvYygxLCBkZXZfc2l6ZSwgR0ZQX0tFUk5FTCk7CisJYnVmID0ga3ph
bGxvYyhkZXZfc2l6ZSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFidWYpIHsKIAkJZXJyID0gLUVOT01F
TTsKIAkJZ290byBlcnJfb3V0OwpAQCAtMTc1LDcgKzE3Niw4IEBAIHN0YXRpYyBpbnQgdV9ib290
X2Vudl9wYXJzZShzdHJ1Y3QgdV9ib290X2VudiAqcHJpdikKIAkJZGF0YV9vZmZzZXQgPSBvZmZz
ZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9icm9hZGNvbSwgZGF0YSk7CiAJCWJyZWFrOwog
CX0KLQljcmMzMiA9IGxlMzJfdG9fY3B1KCooX19sZTMyICopKGJ1ZiArIGNyYzMyX29mZnNldCkp
OworCWNyYzMyX2FkZHIgPSAoX19sZTMyICopKGJ1ZiArIGNyYzMyX29mZnNldCk7CisJY3JjMzIg
PSBsZTMyX3RvX2NwdSgqY3JjMzJfYWRkcik7CiAJY3JjMzJfZGF0YV9sZW4gPSBkZXZfc2l6ZSAt
IGNyYzMyX2RhdGFfb2Zmc2V0OwogCWRhdGFfbGVuID0gZGV2X3NpemUgLSBkYXRhX29mZnNldDsK
IApAQCAtMTg4LDggKzE5MCw2IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1Y3Qg
dV9ib290X2VudiAqcHJpdikKIAogCWJ1ZltkZXZfc2l6ZSAtIDFdID0gJ1wwJzsKIAllcnIgPSB1
X2Jvb3RfZW52X2FkZF9jZWxscyhwcml2LCBidWYsIGRhdGFfb2Zmc2V0LCBkYXRhX2xlbik7Ci0J
aWYgKGVycikKLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGNlbGxzOiAlZFxuIiwgZXJy
KTsKIAogZXJyX2tmcmVlOgogCWtmcmVlKGJ1Zik7Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
