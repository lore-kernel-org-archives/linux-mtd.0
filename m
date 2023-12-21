Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80B2C46CCD
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3+922YYqdcj4m3V1Ps3WMi6tvfXdL12/FXbqGypEvo=; b=HTrQo7Ly4irQnN
	Sk3l150O/gg0ThY1qEo8464tvPUms0URCYw/o4bQdgq0W1jvQOkUNyEucRLFJG8rKETBol8JYMqbc
	Vst2gnfYXM/eVxBw4Igl0PrHSMDqnjOjPLo6oqcRADOtp7vUzvmfzdRuEwCarm9UcET6b3gOPSkS1
	HQi7uqqlLV3xMWD8QfkTqXLf5cJtQVsXmhOCJiBZy0u+ovTEMZP1hXcNdN46CEZD0bnzCd3wbvUWp
	U9Q/BqdcvwWr/eJmBoN2364spm/1M1Iu/IWVpUeajAk8rnAXroxWbjFsQ1N6ZHjFTvqFrr2HXF2ol
	m/+NlrYpKs90yQSaloNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwS-003g3Z-1R;
	Thu, 21 Dec 2023 17:34:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwP-003g19-0k;
	Thu, 21 Dec 2023 17:34:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1fae88e66eso126856766b.3;
        Thu, 21 Dec 2023 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703180074; x=1703784874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS/utwklj/mQdHgmYltSxcVR9bMR4HdMDBmcgJXrZDU=;
        b=a1OwRddjsOw6e3WNbVkhKKEcx11OjL+rna3wr2DYQN/2sdR8pSw9zFmGGXhcnsQP/w
         Tz3RavdMczSfcWQP6tDZnBS4gTq9KONbboFemoEEULhD5QsCncRiNtJMLRaomV0JI0VR
         PGcTtxojqwouEgFnd6bd3aCQWjJVlpqxDCuh2iuP8SJNNiJoZi+l/dkX6tbLkfqektiH
         IK2MQOsZZNVyoCKPYTA6vJPU23hteOWCaD8661p/oaZZtoDSEWVUxHd0PWlRZPll/TGK
         2o1t+rdmKBMWrBnyFlKeLMZJkhlLplAKc3sGDXeIJLIwt7RMxkIyZkzS7OSKmP40P+vB
         RmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180074; x=1703784874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS/utwklj/mQdHgmYltSxcVR9bMR4HdMDBmcgJXrZDU=;
        b=woynU/iQ6J6XHHCpbzHHKnmJ9eEwn7zKWYOVWpkR++U1/6FGKWhH8NUX1OD7cVKEUw
         dKOTEynupo2O37veiIKcCBtpjFGQnHD3Jd72PnBPkuRtY7DcYrjKx0i1lc35ppoocY3P
         iSkelcBzQo1g34tZInDd6X0ghWpR7XkiiEoN2JTslZMf0bQeuVNUBGOuczDIVg1ZIdxs
         s/QVA/uLHe+QPupZmaEX0lZ801DToXuJl36RYV6/a6Oz5fY5rE2HketzEiXs1ddGI38w
         0SpuTQdF9JZX7gHXH4MH9geE9jKlpcL+eeI/iedAy2c1GSwYY+pnFf1a56bxDzdE36Dx
         W/eQ==
X-Gm-Message-State: AOJu0YxaJtBVlYcUZ3FNxsDaG48b94C6c19WPHfeYQFpDHtqczrJfpfS
	dVvYqNg5WmyITpMvGJ4LM3s=
X-Google-Smtp-Source: AGHT+IGgwY5w6AQTHQ1MgBWS25JJJBhWhKSdij/Jvg0xGBl8Vj+fXysVr5sbWXq5EX6J52TSERKREQ==
X-Received: by 2002:a17:906:4749:b0:a23:65de:419c with SMTP id j9-20020a170906474900b00a2365de419cmr75233ejs.144.1703180074094;
        Thu, 21 Dec 2023 09:34:34 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709060ad900b00a23499f1d7dsm1176118ejf.209.2023.12.21.09.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:34:33 -0800 (PST)
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
Subject: [PATCH V3 2/6] nvmem: core: add nvmem_dev_size() helper
Date: Thu, 21 Dec 2023 18:34:17 +0100
Message-Id: <20231221173421.13737-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231221173421.13737-1-zajec5@gmail.com>
References: <20231221173421.13737-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_093437_286606_F032FB9A 
X-CRM114-Status: GOOD (  10.91  )
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
