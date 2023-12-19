Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778C7C46CCD
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3+922YYqdcj4m3V1Ps3WMi6tvfXdL12/FXbqGypEvo=; b=2O+UzFtS/IOFUX
	W8VSR7LCyBMh52Gh4q9ZQ52xC1naenPRcVgRDmlprn+9DHc7m01oul+YgEcidXcKKaHJhb+sARfhn
	IgK6mmC2gXyVQUAr6pRqEwQkCT0MJYhMQcddAbNQtBUdBxpK3dvJYtNhX5fDUlAEq0eL5Q9XaDfyX
	YxuZZh+TIG3VJEJag3BbHP2x1UHQRdgeeszmpKlcDFDPkc+YWXJGGxnVCnQz5m/hNyN33qTPJ+SYS
	1t5MEcNU41AF+3RTb1y9gCuje0pm6bpB9gEoPvoABw5vTl+yxlGj2zN9eWAUlp0AYzSPvlRk+mbRv
	Y22bI+hTHaKONcLYLbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5H-00EyqI-0n;
	Tue, 19 Dec 2023 17:40:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5E-00EynM-0a;
	Tue, 19 Dec 2023 17:40:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54f4f7e88feso6614442a12.3;
        Tue, 19 Dec 2023 09:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703007640; x=1703612440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS/utwklj/mQdHgmYltSxcVR9bMR4HdMDBmcgJXrZDU=;
        b=KpoIUiZtPgGcupfXqit6R3n8WKSf6bjAH/albF1PKDDj0Yor93zUemQN7oG1ew2p3s
         S3XGNVl3PATNFgRxQ0rGKznjGChFqq6E6LzY9+Q9icPtVkNmTdTVAkwoPA7Yd7UQMRKk
         L0qQfKaisI9hX/rgdZ736fmyeIz/6HJdyDopMZeAWtztimt3dnOTUWVcK/mIoFlh/iwk
         6bmlr4I5qhuwegmSv3hw+WXPYH37qI6nCmBgdJn7z9iCdLm4kjCRNUQXVwiDNTqX66tY
         +BqePFJF/86RhBa6A7AiyXpYJ+OzC9s9PfBYUlYEYCy28sWd9xkvsMyY2nPPz6vzJz0e
         DK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007640; x=1703612440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS/utwklj/mQdHgmYltSxcVR9bMR4HdMDBmcgJXrZDU=;
        b=SkZwbmX3sg6jIr/fXKDsovIt7+vrlsLCpizwC8YKXyD0uvFX0HurGt/pQMs+S7QyP1
         MzNcLYTiRgssaOzCA83niee7dt+UQXt8jhxMOg+fp37+Nj1llgdPDw3VxskuWro69NNA
         qM1QMjUvrUw0vaiJZqtFlYNB1MVJOMGkXyF/DEO5iyFj0fDk74Wgna49mQb6arUP4FIA
         xZ4cchp2sxe9TtHiwkdCBC6LSGPzVJgywIr83KNhKpALKDYW/g1IF/wpgq+rm4VSVoWT
         OZCGu4PWSJ2cHYdGG48CpSq9RqT7ZVy1hDZRtri/D+5Vjh/wdJQlWoJ6iF/qc3WSfXwM
         JPog==
X-Gm-Message-State: AOJu0Yw4vVyk+xDhNvBL6lHSGSdjg4lfjxfVoljOAOFNlOJkO3l2yRjC
	LG/L9re5BbkzHudXBXtcuEI=
X-Google-Smtp-Source: AGHT+IE4Iweh6+hO7rOhKCZkig6kqe51ihdxK4L/LdTZ6cXOsGys0uUBqLTu6ozGXqXinvBp5StI5w==
X-Received: by 2002:a17:906:74d0:b0:a26:8c0f:b0ca with SMTP id z16-20020a17090674d000b00a268c0fb0camr53272ejl.75.1703007640440;
        Tue, 19 Dec 2023 09:40:40 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id tx27-20020a1709078e9b00b00a1c85124b08sm15834840ejc.94.2023.12.19.09.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:40:40 -0800 (PST)
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
Subject: [PATCH V2 2/5] nvmem: core: add nvmem_dev_size() helper
Date: Tue, 19 Dec 2023 18:40:22 +0100
Message-Id: <20231219174025.15228-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231219174025.15228-1-zajec5@gmail.com>
References: <20231219174025.15228-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094044_238524_6AD7B479 
X-CRM114-Status: GOOD (  11.52  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBpcyByZXF1aXJl
ZCBieSBsYXlvdXRzIHRoYXQgbmVlZCB0byByZWFkIHdob2xlIE5WTUVNIGNvbnRlbnQuIEl0J3MK
ZXNwZWNpYWxseSB1c2VmdWwgZm9yIE5WTUVNIGRldmljZXMgd2l0aG91dCBoYXJkY29kZWQgbGF5
b3V0IChsaWtlClUtQm9vdCBlbnZpcm9ubWVudCBkYXRhIGJsb2NrKS4KClNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KUmV2aWV3ZWQtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9udm1lbS9jb3Jl
LmMgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9udm1lbS1jb25z
dW1lci5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9udm1lbS9jb3JlLmMgYi9kcml2ZXJzL252bWVtL2NvcmUuYwppbmRleCA0
ZWQ1NDA3NjM0NmQuLjk4MDEyM2ZiNGRkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lbS9jb3Jl
LmMKKysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKQEAgLTIxNjMsNiArMjE2MywxOSBAQCBjb25z
dCBjaGFyICpudm1lbV9kZXZfbmFtZShzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbSkKIH0KIEVY
UE9SVF9TWU1CT0xfR1BMKG52bWVtX2Rldl9uYW1lKTsKIAorLyoqCisgKiBudm1lbV9kZXZfc2l6
ZSgpIC0gR2V0IHRoZSBzaXplIG9mIGEgZ2l2ZW4gbnZtZW0gZGV2aWNlLgorICoKKyAqIEBudm1l
bTogbnZtZW0gZGV2aWNlLgorICoKKyAqIFJldHVybjogc2l6ZSBvZiB0aGUgbnZtZW0gZGV2aWNl
LgorICovCitzaXplX3QgbnZtZW1fZGV2X3NpemUoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0p
Cit7CisJcmV0dXJuIG52bWVtLT5zaXplOworfQorRVhQT1JUX1NZTUJPTF9HUEwobnZtZW1fZGV2
X3NpemUpOworCiBzdGF0aWMgaW50IF9faW5pdCBudm1lbV9pbml0KHZvaWQpCiB7CiAJaW50IHJl
dDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbnZtZW0tY29uc3VtZXIuaCBiL2luY2x1ZGUv
bGludXgvbnZtZW0tY29uc3VtZXIuaAppbmRleCAyZDMwNmZhMTNiMWEuLjM0YzBlNThkZmEyNiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1jb25zdW1lci5oCisrKyBiL2luY2x1ZGUv
bGludXgvbnZtZW0tY29uc3VtZXIuaApAQCAtODEsNiArODEsNyBAQCBpbnQgbnZtZW1fZGV2aWNl
X2NlbGxfd3JpdGUoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0sCiAJCQkgICAgc3RydWN0IG52
bWVtX2NlbGxfaW5mbyAqaW5mbywgdm9pZCAqYnVmKTsKIAogY29uc3QgY2hhciAqbnZtZW1fZGV2
X25hbWUoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0pOworc2l6ZV90IG52bWVtX2Rldl9zaXpl
KHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtKTsKIAogdm9pZCBudm1lbV9hZGRfY2VsbF9sb29r
dXBzKHN0cnVjdCBudm1lbV9jZWxsX2xvb2t1cCAqZW50cmllcywKIAkJCSAgICBzaXplX3QgbmVu
dHJpZXMpOwotLSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
