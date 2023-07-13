Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A4FEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKjoe8kfbPnJl1qMitiWZ5lFCbEbt9uH+nq7uuEYj/I=; b=lojwsK3FcT6BAO
	tOPCsC/88p5PVgty530pdOOdlmAPEj8Z4/sXbWjs3nMz5bQW2oYokEfbwQO9eZEcfWlXsQhCVm0ri
	MhE7Zl/VxFB3hUafE45E3yFI/8PoH96AXS8CHyA3gOeAHA5sTbg643bmzqZ2aL36mvyrNbvKd76rX
	EST+DToGb1ebfqT2oyytH/XMeEzR0r9b68AjWWi/7FyxB8rMZJ7urPTvtxbK26OmRybMY9yghCocJ
	LRq9nmxuBbbLzAR/kmmQNIwbIs3+X5C5DF8n2s2MLWgY0vXOOY8OpCuUtzjTLhNds+GdlXeTQKyKq
	U/6dMVfiany8VzNKgyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtAG-002jpL-1A;
	Thu, 13 Jul 2023 10:03:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtAD-002jn0-0C
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:03:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so583811a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689242586; x=1691834586;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGlDIyrrfNAq/yp93QtArxGFLqlQI2VbX5YT6nCkJec=;
        b=dRMUT/whHAaqfW62jCLHfa3YAYIoSb/L33DoG8qef7m5uyaWftiZ6aHVo7EdPXCuue
         mpWPNSlvyDl8E9zg488amopoa40UCmSROulQTLgONzQoY9OwZARbI4e5hSDRXj4af3LT
         j9seR79WLt5m98CBWnG6TUkMNdKP0ZYBuMYOHLn+NsSLnk8yuvdguLDmEcu9j035kGPX
         ZnY+KHBUCez2YbTt6zxHoviEu0cdLcB4AzaUiN4DUGrwTOHUMQ1IZXty8rRu2bzIK5hB
         KErrA/clD3DcD+itYeG1hxtH+tDXK/yDY/8jmCnbN/p5Sc144FjYlZb5/RqUod4sgzje
         ejAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242586; x=1691834586;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGlDIyrrfNAq/yp93QtArxGFLqlQI2VbX5YT6nCkJec=;
        b=h9h5aKipiiF8JvNVCkkB+KyBtVcCIuky5J7OjrJXy05v000ju5h0YevZ4/yrU7r2fs
         3Ms3Zf4gR7AulGGMnFcE+01j8Ov68I0NJGZBoqcBbKueqykpeqbKNY7oNv+4AkaJGd3E
         nmb8wzdqE9k8x6yzMczrHjxNUeaxTjXSezbMZOYxc5q2B98pLqSm6O4/opmMN2rDgawS
         bbIcutKgLmC1fXdDNe4BVtf70vygUrfMfLdhF+KaRKfHWEGdE40XfP4iMq6FaXQizvbZ
         oSfI1OSQW8dm9CKihnA5ApO84snRcgkKMGvotB69H9Zx/kVdEAAepQK6psGo8+g8ywfb
         yG3w==
X-Gm-Message-State: ABy/qLYPBjycuzGQdz3l/Il+m9ObtbplBIQ6Xi5yj+XT8V/cNFeBXuUA
	Otp1MbrENy5J/ehqgJGE85S98w==
X-Google-Smtp-Source: APBJJlG0P8JjG7quzdt3aed4/aGpuXKVi0PuT9bBYRTMrdueHE8H83Z1oxV0y7WYLZqDc96rvJyz9g==
X-Received: by 2002:aa7:d511:0:b0:51d:91d2:335b with SMTP id y17-20020aa7d511000000b0051d91d2335bmr1561993edq.1.1689242586245;
        Thu, 13 Jul 2023 03:03:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id w22-20020a056402071600b0051de3c6c5e5sm4007740edx.94.2023.07.13.03.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:03:05 -0700 (PDT)
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
In-Reply-To: <20230627204630.9476-1-zajec5@gmail.com>
References: <20230627204630.9476-1-zajec5@gmail.com>
Subject: Re: [PATCH V4] dt-bindings: nvmem: fixed-cell: add compatible for
 MAC cells
Message-Id: <168924258532.15442.13233045007197917854.b4-ty@linaro.org>
Date: Thu, 13 Jul 2023 11:03:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_030309_096604_28C79526 
X-CRM114-Status: UNSURE (   9.28  )
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

Ck9uIFR1ZSwgMjcgSnVuIDIwMjMgMjI6NDY6MzAgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBBIGxvdCBvZiBob21lIHJvdXRlcnMgaGF2ZSBOVk1FTSBmaXhlZCBjZWxscyBjb250YWlu
aW5nIE1BQyBhZGRyZXNzIHRoYXQKPiBuZWVkIHNvbWUgZnVydGhlciBwcm9jZXNzaW5nLiBJbiB+
OTklIGNhc2VzIE1BQyBuZWVkcyB0byBiZToKPiAxLiBPcHRpb25hbGx5IHBhcnNlZCBmcm9tIEFT
Q0lJIGZvcm1hdAo+IDIuIEluY3JlYXNlZCBieSBhIHZlbmRvci1waWNrZWQgdmFsdWUKPiAKPiBU
aGVyZSB3YXMgYWxyZWFkeSBhbiBhdHRlbXB0IHRvIGRlc2lnbiBhIGJpbmRpbmcgZm9yIHRoYXQg
YXQgTlZNRU0KPiBkZXZpY2UgbGV2ZWwgaW4gdGhlIHBhc3QuIEl0IHdhc24ndCBhY2NlcHRlZCB0
aG91Z2ggYXMgaXQgZGlkbid0IHJlYWxseQo+IGZpdCBOVk1FTSBkZXZpY2UgbGF5ZXIuCj4gCj4g
Wy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBudm1lbTogZml4ZWQt
Y2VsbDogYWRkIGNvbXBhdGlibGUgZm9yIE1BQyBjZWxscwogICAgICBjb21taXQ6IGI3NDk1ZWEx
YjUzNGZhNGQ3M2U1MTMyZjA1ZWNjNzlmNTA2OGFhMjIKCkJlc3QgcmVnYXJkcywKLS0gClNyaW5p
dmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
