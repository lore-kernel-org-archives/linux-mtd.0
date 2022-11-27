Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A07EC4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Nov 2022 23:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wzoNyDgxScQxZZd7X9+jwO3jW9zWZW+mrXngHTTmxI=; b=YQjK20QLPyGmeL
	t8vPBXUbJ9ve5z2fFAUaXfQZJg5JY1k+FNufQE5sV8RTeNmqhfKZ5mXe648jTMwdgfI49RLXTZcwy
	B1y2uTMGLK9m1Ey1oWrsCJNqMXymo4WaozhX3nTL1T1ToUIcsgstiFW+6JQ+8EU9uj/A6bsorP5Ma
	rTYsCf4Pl4Dn/Pviedt4FVhmJADDve9HI/cw6JnUC6NH5ODV5VzpG9zETKJujkQoVDVe47aCXLwmR
	qQvv95G/vbITBNSgpbBjGeZRXIiwLl+KiS1xPasAybl4Ok1aM5gQTWTfQjyM1oa+0PjsOMytUPxxx
	fT1lOR4q/AgmanoEGEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozQnj-00E8T1-Se; Sun, 27 Nov 2022 23:11:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozQna-00E8O4-C8; Sun, 27 Nov 2022 23:10:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id c1so14859906lfi.7;
        Sun, 27 Nov 2022 15:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44xs7cQ6Cza924S+PWNfvtVgJyd+csfrYDPNush93DA=;
        b=dcCRE3/yjOIPoUAIJRWPvdkLOmTLO/UNEPjAijvzfGDUBgV25ejhUlrihqSjBpRKRs
         vCk669JGtPhOHwF5GaK12F/FaDY0o8LtOVw3wxejm3AijcTtZoPj1qQtvY49Sjd2N0Z2
         quvzUTKkG3tozQVoe/haD35aBci34NXMYeCUduZGWxz20gXH/f0yaagLBAnurPCKzEqM
         HVtNBJGIyBev0aeVY1eW/7HW1aQDb46npx0NpAN8Et/FFF06HOA8AcvyN2ICOxE0oL8o
         5nsGnF26uj1QA+ld5pxcdGBO7Id3cA85kxrxwcGNpS0SkzGJ2GlxgnPzv/KGRojwV+/H
         XDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44xs7cQ6Cza924S+PWNfvtVgJyd+csfrYDPNush93DA=;
        b=5hszXufSpMPxwfi8CwaNImtRQMFbcRh/25ysklc+GrlStP7FVrix4y/FXA5WP3WX9u
         EXCnNABjo3uS9wq7Yx3ESEdhTliL05cKm9TMAOTNxoZQCy6r5EveY0IZT2VAZsC6timA
         pclTjqkKhgcL7el5Wt9KKDeid0oVbc8BymZib3INjlH/GUETG6oloAXLIOryia0ACRSe
         2WQJseRffQEZsRKOPH3ICTvn9elaM8Yhse4HuBNBVt8t7veJBXZ5L+Y2+qdtHGnUeU41
         QVfmpRD+Lhd85nWg1058UHXyiYxnG5unH3bWDjUzgsp/7zKEX/cA1Qah9b80A8ya1Suu
         iJrQ==
X-Gm-Message-State: ANoB5plmr4hMVti+is9ihbHwH4DfW8MAtx1eRNfli4b3Ls7e7kv/8m6y
	hjUzpTSe14JJ1ebqKw9jasM=
X-Google-Smtp-Source: AA0mqf5bGsZx5aHPFgT0mbXBwTIQVCg2ZADAZiOGHR44KvhEqlhqur+3NjsGAXM/v1FyHtWC2gfPnw==
X-Received: by 2002:ac2:5e26:0:b0:4b1:4602:3f9 with SMTP id o6-20020ac25e26000000b004b1460203f9mr10079217lfg.80.1669590651716;
        Sun, 27 Nov 2022 15:10:51 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id d17-20020a0565123d1100b004b4ea0f4e7fsm1439984lfv.299.2022.11.27.15.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 15:10:51 -0800 (PST)
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
Subject: [PATCH 2/2] nvmem: u-boot-env: reformat MAC in "ethaddr" cell when reading
Date: Mon, 28 Nov 2022 00:10:35 +0100
Message-Id: <20221127231035.17547-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127231035.17547-1-zajec5@gmail.com>
References: <20221127231035.17547-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_151058_466073_83B7AB4C 
X-CRM114-Status: GOOD (  14.88  )
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
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbnZt
ZW0vdS1ib290LWVudi5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vdS1ib290LWVu
di5jIGIvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMKaW5kZXggMmE4N2RkYTQ1MTg4Li5kMTAz
YTUyZTAwMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZW0vdS1ib290LWVudi5jCisrKyBiL2Ry
aXZlcnMvbnZtZW0vdS1ib290LWVudi5jCkBAIC00LDYgKzQsOCBAQAogICovCiAKICNpbmNsdWRl
IDxsaW51eC9jcmMzMi5oPgorI2luY2x1ZGUgPGxpbnV4L2V0aGVyZGV2aWNlLmg+CisjaW5jbHVk
ZSA8bGludXgvaWZfZXRoZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4K
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+CkBA
IC03MCw2ICs3MiwyNCBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcmVhZCh2b2lkICpjb250ZXh0
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRp
YyBpbnQgdV9ib290X2Vudl9jZWxsX3Bvc3RfcHJvY2Vzcyh2b2lkICpjb250ZXh0LCBzdHJ1Y3Qg
bnZtZW1fY2VsbF9lbnRyeSAqY2VsbCwKKwkJCQkJY29uc3QgY2hhciAqaWQsIHZvaWQgKmJ1Ziwg
c2l6ZV90ICpsZW4pCit7CisJc3RydWN0IHVfYm9vdF9lbnYgKnByaXYgPSBjb250ZXh0OworCisJ
aWYgKCFzdHJjbXAoY2VsbC0+bmFtZSwgImV0aGFkZHIiKSkgeworCQl1OCBtYWNbRVRIX0FMRU5d
OworCisJCWlmIChtYWNfcHRvbihidWYsIG1hYykpIHsKKwkJCWV0aGVyX2FkZHJfY29weShidWYs
IG1hYyk7CisJCQlpZiAobGVuKQorCQkJCSpsZW4gPSBFVEhfQUxFTjsKKwkJfQorCX0KKworCXJl
dHVybiAwOworfQorCiBzdGF0aWMgaW50IHVfYm9vdF9lbnZfYWRkX2NlbGxzKHN0cnVjdCB1X2Jv
b3RfZW52ICpwcml2LCB1aW50OF90ICpidWYsCiAJCQkJc2l6ZV90IGRhdGFfb2Zmc2V0LCBzaXpl
X3QgZGF0YV9sZW4pCiB7CkBAIC0xNzksNiArMTk5LDcgQEAgc3RhdGljIGludCB1X2Jvb3RfZW52
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IG52bWVtX2NvbmZp
ZyBjb25maWcgPSB7CiAJCS5uYW1lID0gInUtYm9vdC1lbnYiLAogCQkucmVnX3JlYWQgPSB1X2Jv
b3RfZW52X3JlYWQsCisJCS5jZWxsX3Bvc3RfcHJvY2VzcyA9IHVfYm9vdF9lbnZfY2VsbF9wb3N0
X3Byb2Nlc3MsCiAJfTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
