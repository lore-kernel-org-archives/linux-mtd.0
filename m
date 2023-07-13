Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEACEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBV0lc4SP8l5n5bwBnuJMpT1GEU/+4/nqfyw309XH/g=; b=0BmDtnXnwA1CA7
	bAaTNVsnIvkyCPf6B6GxSAIxMX0MP3FVwDZc5DAgnZ2ugYMG9kLzVEXFOHUUwXXNIpF096DIWsJdn
	Gy7Rlnd13aov+qRB9TFNksSMYWLU81py0xKKZsmiKbWwNxGk6Fvg+PsAs1A+Rq0zZ4B8dNkv1d2ae
	S2O1gg19nqjrViSEKwAELdwI+zQlpa11JJIJ9UwYfRd/JZwLjHquPPgnBEoB2F4Ad6c4mW7oBBeOs
	ESb+4Fq7vLvATpORnqtfp8iRHe1FdxUnbceWo4w/aJpy3Kxv5m1wlxge0z0Ca/Hn53/3TxZUbHdpI
	SImBWgcpxiEzp7ekseKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJt8M-002jRr-33;
	Thu, 13 Jul 2023 10:01:14 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJt8I-002jQw-2y
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:01:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so81710366b.2
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 03:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689242469; x=1691834469;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/M+pj3sOHUyESIK93V4GQh+1nRLUFIcF7Y/I33mUxQ=;
        b=PF7NZgKmP2RkxrFnKSy8s1zMvSzfBwLHcqSq6qpC/yOx85SeOX1/IiEz5B/pYvd0gd
         X3Q5tU+pWDcsIbxZlW0q3x5jZDkYwmoxuELnwD0x+E7wvRCdiS5ldf1pbZPMZf1Nl8bL
         IZScRt/OQVD8uGoFKVqs5zKtJpwVfMYjQYSM9rHz9r82Ny1hJi5TfgqV4W0v2ZU3JBnp
         pMe9L/xGL8jox8/ixOz1oBBXuOndXcz86iAE9qr4wH8GJFsvht0MaZ4hmwZXhTThiDYz
         9LSaAFq9adU+W2nsTYLz/SlmXS/xT2xNAnhAIE3egnJFex1DHAytr3q6VbZ/vl4X7TGw
         no2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242469; x=1691834469;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/M+pj3sOHUyESIK93V4GQh+1nRLUFIcF7Y/I33mUxQ=;
        b=WcsJoBH2KNFXwaLcSdztPQ8iZ+nVjdePZUeADDIHgwaAun58+u2aFbHO0gezR95ozS
         8ilJmV/F2fFb5dVtvcwnU5fJviELpNCMngfmAoDrCl+799+wI96DwarG/MTmoDsjhSEM
         zWBmtHjqzkDgcJrDJce2RnXRhFy2gFIABXKq5hY6TtJwyahfI06miFpQJqGrF/V/t51F
         jvt1RPYoHNGQEdYjAJp0pjNa4XW6Yq+0qpyZ4cEDw+C4JN1b170Ct8BiHEtOUo6qHLML
         Imq/ZTmY56fX55Q5BI5x3GDj0NaomevtFMG99Vl+yKO30fJ2/wmY01ulVckNcSyqPU/E
         VcJQ==
X-Gm-Message-State: ABy/qLb9PvVaxNsIIYpbDuO8oVj8QuK508Uqnx06GeIbCiS3O+gLr89Y
	+tEHsF7/miRx9qbImJY+hcnWJ9+Nikqc2Nt9jDSqpQ==
X-Google-Smtp-Source: APBJJlEqtwreGESohUF4BGCg9ioea4Pgd3hPuliT8cWOafgfdREMplipu6B24Py+pFdOX3VMzCi38g==
X-Received: by 2002:a17:906:1c9:b0:994:758:fa4a with SMTP id 9-20020a17090601c900b009940758fa4amr1038460ejj.46.1689242468874;
        Thu, 13 Jul 2023 03:01:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id lf16-20020a170907175000b00993928e4d1bsm3776545ejc.24.2023.07.13.03.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:01:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20230616213033.8451-1-zajec5@gmail.com>
References: <20230616213033.8451-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: nvmem: fixed-cell: add compatibles for
 MAC cells
Message-Id: <168924246786.15304.6050913171032604227.b4-ty@linaro.org>
Date: Thu, 13 Jul 2023 11:01:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_030110_968038_1C3084A3 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

Ck9uIEZyaSwgMTYgSnVuIDIwMjMgMjM6MzA6MzMgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBBIGxvdCBvZiBob21lIHJvdXRlcnMgaGF2ZSBOVk1FTSBmaXhlZCBjZWxscyBjb250YWlu
aW5nIE1BQyBhZGRyZXNzIHRoYXQKPiBuZWVkIHNvbWUgZnVydGhlciBwcm9jZXNzaW5nLiBJbiB+
OTklIGNhc2VzIE1BQyBuZWVkcyB0byBiZToKPiAxLiBPcHRpb25hbGx5IHBhcnNlZCBmcm9tIEFT
Q0lJIGZvcm1hdAo+IDIuIEluY3JlYXNlZCBieSBhIHZlbmRvci1waWNrZWQgdmFsdWUKPiAKPiBU
aGVyZSB3YXMgYWxyZWFkeSBhbiBhdHRlbXB0IHRvIGRlc2lnbiBhIGJpbmRpbmcgZm9yIHRoYXQg
YXQgTlZNRU0KPiBkZXZpY2UgbGV2ZWwgaW4gdGhlIHBhc3QuIEl0IHdhc24ndCBhY2NlcHRlZCB0
aG91Z2ggYXMgaXQgZGlkbid0IHJlYWxseQo+IGZpdCBOVk1FTSBkZXZpY2UgbGF5ZXIuCj4gCj4g
Wy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBudm1lbTogZml4ZWQt
Y2VsbDogYWRkIGNvbXBhdGlibGVzIGZvciBNQUMgY2VsbHMKICAgICAgY29tbWl0OiBhNzk2NDY3
NDQyN2JkZjVhYTlmZjM0MmU0ZGZiOGE0ZDM0NTg1MWExCgpCZXN0IHJlZ2FyZHMsCi0tIApTcmlu
aXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
