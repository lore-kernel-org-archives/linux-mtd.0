Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A85C4167D
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 07:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kT+dh8mzEgBSklxUAJ9w7p/LQ4v35efPeUyu/KpLpgE=; b=Cf3W7JEqRf7rbL
	4uEIOf1EeASonAZhrjWa1XGa7yVFXSCS3bto6/iEmV9lihA4koKqqh6YwZkKbuGd9+q6wief7Sz1W
	pQ4ezlRtvoxf4LOfN7ht/4jf15LP5d+fUNATRNr1smaVtNcinPE+KwL11avsbyDhA8Jy0i0YpgFp1
	2J7sftJChEaO6ewg6yI9ZZV+rWC5uHgNFnnA4TD//kj0gMAkKkCahl937Ls87UICvVO1x/q9b2J+g
	b0odOsSKD/t5wIpaaq1pdMC2Z9yBC7iDVZYn9YkpOcKvBZcaCSHZkX/ExyYT3VrPZFkzTgHybRU/E
	rYYyVm/S0KttDdp+dIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozY7q-00H3pz-6o; Mon, 28 Nov 2022 07:00:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozY7n-00H3mv-NQ; Mon, 28 Nov 2022 07:00:21 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g7so15915752lfv.5;
        Sun, 27 Nov 2022 23:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJWjxLIZ+Li8orVpVlkA5rNx5NNvxzopWHGhybrJ+vg=;
        b=Tyb/aNzeI0/O97kORWdBoPLZO+TZxvW1az2Kk+utIvANkQEGC1Jw6dVuplT0gmcUW+
         Hjwdumc6BFqk5p0FWAstJXFvewXzANBRypRYIIP95TB4JflyiM5PTiLuoc7ZlVRhn8NE
         zq3Az0F5N9NqxrfzuJJ8nMx19uRmHNDKKnj8mzLLhBOoWhIeYaCx3w1mxI1VWGrpC5Z/
         yVtdrpZu7vY7yGsLuEUYtqF6+bftMvvOQc6tHpG9Ag3eb/VFYppm+ZBG2n5uPu7cRb17
         /2CeWoXW7CjUaMyf5Z7cwRnuaG1TFSjfOiMMFw6yfmi49YkkGVlcx9EdC8e1lH0f1Gd3
         5I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJWjxLIZ+Li8orVpVlkA5rNx5NNvxzopWHGhybrJ+vg=;
        b=69/d2eqheqoofF7NFWtsjSob2UHZnmMbBuT4uQLnvwq7uOgU9kalNxTFZ6pKoJ+Chz
         wW4RZCjmJQSch7dZdKG4RambTuPnN5eHc37hkqihUvGXg4GmzkM5suNWnhPAPJwcYBmB
         ZetcMAGonUFU6dXd0wvPgRBOksxKae32FC2xSY/ARZmAPynlAQhTj42y105lLyOIWOkz
         4sh6yJI2PEytESJqZcM2bOusj4RXTfyQhuva3kxZ8UE44ETqJNrlouJp37DSXBFOvJas
         okqngKi6DOa9zSMSESQbJB/j49H5xgyOyDtc6Zkv6ERgF+toll3hUEhqjicb33FpTcS6
         AIrg==
X-Gm-Message-State: ANoB5pmNC8tiOPuPLqkq5zhnUshh0/i6AVjcWRdeSmr/pPm8HbEzlEfA
	46YeKNH7PFDgXF+quSstLqw=
X-Google-Smtp-Source: AA0mqf6MDwAz9//kkzdVgCtw2+Ffvol7C4TGrXdX4s+wwD0HRr9r+8MCg2EpImrmXN6Xn32kNpiJSg==
X-Received: by 2002:a19:6b1a:0:b0:4b4:3313:feaf with SMTP id d26-20020a196b1a000000b004b43313feafmr16169443lfa.365.1669618816051;
        Sun, 27 Nov 2022 23:00:16 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t12-20020a2e780c000000b002770a7e320esm1129686ljc.81.2022.11.27.23.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 23:00:15 -0800 (PST)
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
Subject: [PATCH V2 2/2] nvmem: u-boot-env: reformat MAC in "ethaddr" cell when reading
Date: Mon, 28 Nov 2022 07:59:23 +0100
Message-Id: <20221128065923.1180-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128065923.1180-1-zajec5@gmail.com>
References: <20221128065923.1180-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_230019_807675_9226ED73 
X-CRM114-Status: GOOD (  15.94  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTlZNRU0gY29uc3VtZXJz
IGV4cGVjdCBNQUMgaW4gYSBieXRlLWJhc2VkIGZvcm1hdCAoc2VlIGUuZy4KbnZtZW1fZ2V0X21h
Y19hZGRyZXNzKCkpLiBVLUJvb3QgZW52aXJvbm1lbnQgZGF0YSBzdG9yZXMgYWxsIHZhbHVlcyBp
bgpBU0NJSSBmb3JtLgoKQWRkIHBvc3QgcHJvY2Vzc2luZyBjYWxsYmFjayBkZXRlY3RpbmcgImV0
aGFkZHIiIHJlYWRzIGFuZCByZWZvcm1hdCBkYXRhCmFzIGV4cGVjdGVkLiBUaGlzIGZpeGVzIEV0
aGVybmV0IGRyaXZlcnMgcmVhZGluZyBNQUMgZnJvbSBOVk1FTSBkZXZpY2VzLgoKU2lnbmVkLW9m
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KVjI6IHNlbGVjdCBH
RU5FUklDX05FVF9VVElMUyAmIGRyb3AgdW51c2VkICJwcml2IiB2YXJpYWJsZQotLS0KIGRyaXZl
cnMvbnZtZW0vS2NvbmZpZyAgICAgIHwgIDEgKwogZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMg
fCAxOSArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL0tjb25maWcgYi9kcml2ZXJzL252bWVtL0tj
b25maWcKaW5kZXggNzU1ZjU1MTQyNmI1Li4zNGZiMGJhMzZiODAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbnZtZW0vS2NvbmZpZworKysgYi9kcml2ZXJzL252bWVtL0tjb25maWcKQEAgLTMyNiw2ICsz
MjYsNyBAQCBjb25maWcgTlZNRU1fVV9CT09UX0VOVgogCXRyaXN0YXRlICJVLUJvb3QgZW52aXJv
bm1lbnQgdmFyaWFibGVzIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBPRiAmJiBNVEQKIAlzZWxlY3Qg
Q1JDMzIKKwlzZWxlY3QgR0VORVJJQ19ORVRfVVRJTFMKIAloZWxwCiAJICBVLUJvb3Qgc3RvcmVz
IGl0cyBzZXR1cCBhcyBlbnZpcm9ubWVudCB2YXJpYWJsZXMuIFRoaXMgZHJpdmVyIGFkZHMKIAkg
IHN1cHBvcnQgZm9yIHZlcmlmeWluZyAmIGV4cG9ydGluZyBzdWNoIGRhdGEuIEl0IGFsc28gZXhw
b3NlcyB2YXJpYWJsZXMKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jIGIv
ZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMKaW5kZXggMmE4N2RkYTQ1MTg4Li5lMzBjZTRmN2Vh
MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jCisrKyBiL2RyaXZlcnMv
bnZtZW0vdS1ib290LWVudi5jCkBAIC00LDYgKzQsOCBAQAogICovCiAKICNpbmNsdWRlIDxsaW51
eC9jcmMzMi5oPgorI2luY2x1ZGUgPGxpbnV4L2V0aGVyZGV2aWNlLmg+CisjaW5jbHVkZSA8bGlu
dXgvaWZfZXRoZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+CkBAIC03MCw2
ICs3MiwyMiBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcmVhZCh2b2lkICpjb250ZXh0LCB1bnNp
Z25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQg
dV9ib290X2Vudl9jZWxsX3Bvc3RfcHJvY2Vzcyh2b2lkICpjb250ZXh0LCBzdHJ1Y3QgbnZtZW1f
Y2VsbF9lbnRyeSAqY2VsbCwKKwkJCQkJY29uc3QgY2hhciAqaWQsIHZvaWQgKmJ1Ziwgc2l6ZV90
ICpsZW4pCit7CisJaWYgKCFzdHJjbXAoY2VsbC0+bmFtZSwgImV0aGFkZHIiKSkgeworCQl1OCBt
YWNbRVRIX0FMRU5dOworCisJCWlmIChtYWNfcHRvbihidWYsIG1hYykpIHsKKwkJCWV0aGVyX2Fk
ZHJfY29weShidWYsIG1hYyk7CisJCQlpZiAobGVuKQorCQkJCSpsZW4gPSBFVEhfQUxFTjsKKwkJ
fQorCX0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IHVfYm9vdF9lbnZfYWRkX2NlbGxz
KHN0cnVjdCB1X2Jvb3RfZW52ICpwcml2LCB1aW50OF90ICpidWYsCiAJCQkJc2l6ZV90IGRhdGFf
b2Zmc2V0LCBzaXplX3QgZGF0YV9sZW4pCiB7CkBAIC0xNzksNiArMTk3LDcgQEAgc3RhdGljIGlu
dCB1X2Jvb3RfZW52X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0
IG52bWVtX2NvbmZpZyBjb25maWcgPSB7CiAJCS5uYW1lID0gInUtYm9vdC1lbnYiLAogCQkucmVn
X3JlYWQgPSB1X2Jvb3RfZW52X3JlYWQsCisJCS5jZWxsX3Bvc3RfcHJvY2VzcyA9IHVfYm9vdF9l
bnZfY2VsbF9wb3N0X3Byb2Nlc3MsCiAJfTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2OwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7Ci0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
