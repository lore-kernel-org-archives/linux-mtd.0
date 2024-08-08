Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4BDC3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rN+6Hi9Q85Ewxj0pkzRqoqxDYF0/1UzL8uUgzn0+qQ8=; b=lYzFoaJNBYRckp
	/8mvJmc39h6nbJUsLUVBzWRWjzPOjamhwwRrOtq+On5rPx2OM3+znP2IrE8KJf4QncaaKrOmO7mCT
	av2Za9vh85Vrw6zvlKEqZvEeIwPnPAJPiF9/y0bNlecKPbyR23vX3KP7DNNIAjU42ZoqGqTH0GymK
	mYej4/aS4Cu6CVLiDF1Y+tI1T+t1CdCPt6GgF/X2lR/xiv11Jf566p72hqvXfRh8fhMdhnT8juzVy
	ApzpvxvjkHvNquId4x8MWIiGOC5/Iz2OCti2Oz4BgjErfHVBHr4EsV5tpySS0nCTMEZVfyqzgTfIl
	uZcUOu03/HSdPqVxImcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbw9S-00000007BDR-0Hes;
	Thu, 08 Aug 2024 05:57:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbw9P-00000007BCz-2Kye;
	Thu, 08 Aug 2024 05:57:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a7a9a7af0d0so67865266b.3;
        Wed, 07 Aug 2024 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723096645; x=1723701445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPiAoXpK0JdsQyNpaN7hZCrHpa0VhsUUiY7QeEceZ+E=;
        b=lf48vP4UYqMxd0d7V1myuGGhFniBM5FLp5w2vZrC1gA4EoW7rNoKKsY+DKEPt+GPeo
         1+zNnkaqSq2A7OsGJB2hURFELrwGbrYCsrrWoPjRThePJDhHdAeHWjpfiJZK0NJ7hrzU
         YJbDZHZofEx0DcjRAlgWG110kW+XwrxSXEEIoJMcE90Vkzbj2QdLuIsM5bChhTgh2pxs
         A64TEcAFut+xeAfDepQBlyd+D9LE3YUy6acT0KCdKxojnbU7XJfhoIRum933tmpOc8Bb
         6UK2dQ3pkY8g5/UjemWpzuBHJBZDLYmPTeGofCSpOV7dE0P4MBBNCo3m98cL8VfQXxoV
         TVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723096645; x=1723701445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPiAoXpK0JdsQyNpaN7hZCrHpa0VhsUUiY7QeEceZ+E=;
        b=S/FkI7kNZQBzFoufV2Ly0hI8xXtalrfNNxI/mXuyO32JzLWeY0VoIQe42ile0eHFJG
         LNCdoWR6XHyP+/td3H0EB2mEjKe+yqHC3MU1LmylnHMQ60aSsLFFwO9JPkNgPaMHX+nc
         DrPzSKnI8CDonMxfMd92BMfs52kLmw+v+GHFOGMYjGeDb9dqXpLLnYKR4VYHYWUCzLA7
         Q1gyPtFwo8F8GkegXdTJxgw/mGwZnOqDgdx8TknPKpFqhDgiKOk4o37aDp3+UPhhShVE
         w9pHDdWGN2aWG90wv4f5/JWOESF8pZM6ilg7qDGjE/KlNqbS25EOjna++iVNSm1bKV7P
         NUjA==
X-Forwarded-Encrypted: i=1; AJvYcCX63MMRppyoNBuBUJrhG7UV4y9zW5xfdbCCx2u9toc6tW3GoI+8Yjxdj0vos3B4YRFTf50ZYxHHe2EZJPpzvE7ToTMOixNHMu5C1BKBTi9sR1Nr4cCAvfoWDPhXD0iKb9oKmvdl0VHd0q6XNVrqlxRS4bIh
X-Gm-Message-State: AOJu0Yy5WYDOeSIMkUN0uv5xwQ3UTPTDK/Bq2hjipmOrR7e4GCywDvGS
	cLUZ9qno7M5kcMVuEuTQMcEposrdbQ3C4avIV88rR+E7020h+nTd
X-Google-Smtp-Source: AGHT+IFOK5O6efGExDbiRRC8zbPf8APmGN3SBFAmHarWVs0d/h+onpCcwSHzigQsOOkJQdmzBFsYXg==
X-Received: by 2002:a17:906:d249:b0:a7a:8cb9:7490 with SMTP id a640c23a62f3a-a8090e4e094mr42616166b.47.1723096645018;
        Wed, 07 Aug 2024 22:57:25 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec8cc7sm704287066b.215.2024.08.07.22.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 22:57:24 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] MAINTAINERS: Update path for U-Boot environment variables YAML
Date: Thu,  8 Aug 2024 07:57:10 +0200
Message-Id: <20240808055710.19292-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_225727_624594_8F2601CC 
X-CRM114-Status: GOOD (  12.91  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBmaWxlIHdhcyBt
b3ZlZCB0byB0aGUgbGF5b3V0cy8gc3ViZGlyZWN0b3J5LgoKU2lnbmVkLW9mZi1ieTogUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KSSBtaXNzZWQgdGhpcyBNQUlOVEFJTkVS
UyBjaGFuZ2UgaW4gdGhlIGNvbW1pdCAxYjNmNWI4OGM1NDEKKCJkdC1iaW5kaW5nczogbnZtZW06
IGNvbnZlcnQgVS1Cb290IGVudiB0byBhIGxheW91dCIpLgoKU3Jpbmk6IEkgYmVsaWV2ZSB5b3Vy
IHBvbGljeSBpcyB0byByZWJhc2UgeW91ciB0cmVlIGFuZCBzZW5kIFBBVENIZXMgdG8KR3JlZyBk
dXJpbmcgbWVyZ2Ugd2luZG93LiBDb3VsZCB5b3UgZml4dXAgYWJvdmUgcGF0Y2ggd2l0aCB0aGlz
IGNoYW5nZSwKcGxlYXNlPwoKIE1BSU5UQUlORVJTIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCA3NjBjYjM5NjY2NDMuLmUyOTliY2FiZTJlOCAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTIzNDQ0LDcgKzIzNDQ0LDcgQEAgRjoJ
ZHJpdmVycy9tZWRpYS9wY2kvdHc2ODZ4LwogVS1CT09UIEVOVklST05NRU5UIFZBUklBQkxFUwog
TToJUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgogUzoJTWFpbnRhaW5lZAotRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbAor
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvdS1ib290
LGVudi55YW1sCiBGOglkcml2ZXJzL252bWVtL2xheW91dHMvdS1ib290LWVudi5jCiBGOglkcml2
ZXJzL252bWVtL3UtYm9vdC1lbnYuYwogCi0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
