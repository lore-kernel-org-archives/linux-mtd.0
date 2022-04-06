Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998EAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G704fl+z3BFRYmS+qVI47ZU02SfbpLrV0DXwvm33VFg=; b=gxkgsnN1UBItDo
	vFy4euqFic/twi1IgY+HmqBy7zMOMye3zJsnwZpbTJNebRAaEzEQFfjyyZcL12usbuDk+iOmggiBC
	gnCP3KcXHdKqYrKU9IFNpkMTqcTrnY6ByGo600Q5tcJCrJbnOuHeBCdEEEFbDtB7wdXY1ihMfwZPv
	8jjqAsIqZQBVy6xCgJlJPzu43J5PUADeOdU7X93p+jzP6X7+6OuF86scJ622ev/bsL7jea29A0UUW
	i+XGoDImSqjhYK2lU+UTJo5BPjDpCg/eSPtAtVTBDTCG2HOo6tzyKIJAjA6lVTjIWDFkWsndNgzed
	Z0vblnCAV5AbbfCb0fOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6i8-006WiB-MN; Wed, 06 Apr 2022 14:32:40 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6i5-006Wgj-LC; Wed, 06 Apr 2022 14:32:39 +0000
Received: by mail-lj1-x22c.google.com with SMTP id g24so3466914lja.7;
 Wed, 06 Apr 2022 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ua3fT8F2HjRCi9HSGNUFXUuRGoKDbKCgfZ5rZHjpyG0=;
 b=SQPNXmNiW4rebr/QZg8/x5gtfvrgJQwi5YSckBhzcsA/q6ij9L10+3V6bYO0oKcSWn
 aTl+Fipv6314CwOeTNLPN1Ahw8+BbB+dF50viZA/mueApGxw5UJLAU2VkT7k+o7NpZ5R
 gFhNS1UeW3tSQaOThQB7mcdx0Gnmf7uvLMphjBKBGJe4imShimFp/K/y16Z2c76Jb6K7
 EqKwrVND/culdATDDuHsi4ocl0VyJtd5YzydEyeRM+UcVNoOnLEn/hEjyBIIdlkMKI58
 9fIncOk22Bat/fwnxRSOJttm1x2rivvj614Yh7GYRYxWuxjCaGEv4VqBCPrhzRdIGgC0
 yvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ua3fT8F2HjRCi9HSGNUFXUuRGoKDbKCgfZ5rZHjpyG0=;
 b=5YikPpBcVR+pIXFqS1d5un+dsxEvls/OA58sii4Xv8uP39LDBoqg8UhoZU5yZAibXd
 3Y6LV5L1BgkalcwCMfh1ROJiqtX1dKS2FQW7fXaC/77pq+nSeSZbK66z6Pi/WvTTvu1w
 rG3ey4dSCve2YzoufQQ0X+NmwS6zM18qlZ6IIZeJopN0SbcPhaJjGAvZlAsHijgALbA6
 RBUfoWrc5WXkZVClPG9klWj+KTzhcVLOHAGtvtmcMZOZ+X9CBmBBA6/QjYD28BT/GDKO
 9jlOxjFo/njeSRH5cBVuvHjQbtmAStTkNjK1kkWUTQoshbnM3qpfnTepNa/jOOmj6Gn6
 ofcQ==
X-Gm-Message-State: AOAM531YHIpy9cGIDmgqF5ycX7nN4+T3RASTQMCXl0lAvvanXgRBvK5d
 jgo6dLoAgxS8QSvWuxb8tiQ=
X-Google-Smtp-Source: ABdhPJwtAaDgzqgeqxymEWZuhij4m770G+5LX+N8/5brJHxkfnLHz1BnJ76uIcXGJs0etWJRH5e16A==
X-Received: by 2002:a2e:bc19:0:b0:249:b29c:7f5e with SMTP id
 b25-20020a2ebc19000000b00249b29c7f5emr5677249ljf.312.1649255552987; 
 Wed, 06 Apr 2022 07:32:32 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 s2-20020a197702000000b0044a693649b9sm1843857lfc.131.2022.04.06.07.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 07:32:32 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] mtd: call of_platform_populate() for MTD partitions
Date: Wed,  6 Apr 2022 16:32:24 +0200
Message-Id: <20220406143225.28107-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073237_753263_0C1F896E 
X-CRM114-Status: GOOD (  13.16  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVW50aWwgdGhpcyBjaGFu
Z2UgTVREIHN1YnN5c3RlbSBzdXBwb3J0ZWQgaGFuZGxpbmcgcGFydGl0aW9ucyBvbmx5IHdpdGgK
TVREIHBhcnRpdGlvbnMgcGFyc2Vycy4gVGhhdCdzIGEgc3BlY2lmaWMgLyBsaW1pdGVkIEFQSSBk
ZXNpZ25lZCBhcm91bmQKcGFydGl0aW9ucy4KClNvbWUgTVREIHBhcnRpdGlvbnMgbWF5IGhvd2V2
ZXIgcmVxdWlyZSBkaWZmZXJlbnQgaGFuZGxpbmcuIFRoZXkgbWF5CmNvbnRhaW4gc3BlY2lmaWMg
ZGF0YSB0aGF0IG5lZWRzIHRvIGJlIHBhcnNlZCBhbmQgc29tZWhvdyBleHRyYWN0ZWQuIEZvcgp0
aGF0IHB1cnBvc2UgTVREIHN1YnN5c3RlbSBzaG91bGQgYWxsb3cgYmluZGluZyBvZiBzdGFuZGFy
ZCBwbGF0Zm9ybQpkcml2ZXJzLgoKQW4gZXhhbXBsZSBjYW4gYmUgVS1Cb290IChzdWIpcGFydGl0
aW9uIHdpdGggZW52aXJvbm1lbnQgdmFyaWFibGVzLgpUaGVyZSBleGlzdCBhICJ1LWJvb3QsZW52
IiBEVCBiaW5kaW5nIGZvciBNVEQgKHN1YilwYXJ0aXRpb24gdGhhdApyZXF1aXJlcyBhbiBOVk1F
TSBkcml2ZXIuCgpSZWY6IDVkYjFjMmRiYzA0YyAoImR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFUt
Qm9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYmluZGluZyIpClNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL210ZC9tdGRwYXJ0LmMg
fCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwppbmRleCAzNTc2NjFi
NjJjOTQuLjlmY2U5NDZmYTY5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkcGFydC5jCisr
KyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwpAQCAtMTcsNiArMTcsNyBAQAogI2luY2x1ZGUgPGxp
bnV4L210ZC9wYXJ0aXRpb25zLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8
bGludXgvb2YuaD4KKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgogCiAjaW5jbHVkZSAi
bXRkY29yZS5oIgogCkBAIC01OTMsNiArNTk0LDcgQEAgc3RhdGljIGludCBtdGRfcGFydF9vZl9w
YXJzZShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKIAkJCWNvbnRpbnVlOwogCQlyZXQgPSBtdGRf
cGFydF9kb19wYXJzZShwYXJzZXIsIG1hc3RlciwgcHBhcnRzLCBOVUxMKTsKIAkJaWYgKHJldCA+
IDApIHsKKwkJCW9mX3BsYXRmb3JtX3BvcHVsYXRlKG5wLCBOVUxMLCBOVUxMLCAmbWFzdGVyLT5k
ZXYpOwogCQkJb2Zfbm9kZV9wdXQobnApOwogCQkJcmV0dXJuIHJldDsKIAkJfQpAQCAtNjAwLDYg
KzYwMiw3IEBAIHN0YXRpYyBpbnQgbXRkX3BhcnRfb2ZfcGFyc2Uoc3RydWN0IG10ZF9pbmZvICpt
YXN0ZXIsCiAJCWlmIChyZXQgPCAwICYmICFlcnIpCiAJCQllcnIgPSByZXQ7CiAJfQorCW9mX3Bs
YXRmb3JtX3BvcHVsYXRlKG5wLCBOVUxMLCBOVUxMLCAmbWFzdGVyLT5kZXYpOwogCW9mX25vZGVf
cHV0KG5wKTsKIAogCS8qCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
