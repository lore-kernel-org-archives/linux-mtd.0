Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B191EC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=374hRwSmZkevQ4AI0K6sO5+2PGRce7OZqN6zJqlIYPU=; b=0/o9FzIaCKzahV
	nr7s+3IFA2mBHG0m3Kiw9LQ5FDM7x82emgOG3sIpyp2Ze4jILaJybmzIbYU8+UO2R0szwloujCzQu
	nzrNl4CuXocIpI2LkiBNQhD02924jyZG3qyy2cJtMYt59oZDKYDoJbLi9H9SsVzM+Di9ghYGTSpKC
	OuamH5sElcIg7LbjMnN3vMYeB7rTDmmTnSYNhRh+kqCheSLsVVBT5T8DrCLnJTIY+Cb+ZtJBgTZ6z
	sIEWf/MrW90lRtfKDgIrrQJVt5ETuUNsJtMUXGBLr76jwwRl+7LarJ+SqGLsEbSb24bZF4s/up07K
	qIMux9mFNdvKe6SSRcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oll5d-005YdL-Nd; Fri, 21 Oct 2022 06:01:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oll5Y-005YaZ-Ro
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 06:01:02 +0000
Received: by mail-lf1-x130.google.com with SMTP id a29so3386534lfo.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2022 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5hHs2S/RQl/JXIwHudGm/5mav5RsuOJ5skKbHJaT7M=;
        b=OYP1l1n6nvRFKN66YMNkW/ZD0biklmoqW7/GKmlBQ/5ENQhPpcHwgnW/rNIUjRoyeq
         mUi4KXWRSDufdZ1cvTW+/XnGUEaYLFilpxFrjNlzxEDxCFeoa4hoLVhGgnokrL4GUPet
         uKYNILHU9QWMrCKkaYtUezb0B7qpROKi1T0G3/hNigGE37igbdbYuW2uvo4prBisHInc
         RUEzuiYlVyFbUVo4KlAGbb6R/AWWoEOYu7HdZU0ekJPUOU2oH4HXT/NQl7KkNx7KZB/t
         L3IccSVZ1ulaB+TjsnFK+9dkyAMqV/YBwlFRErIyCwwNXGnUijQlIUCwJg60u7yjz9E8
         xS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5hHs2S/RQl/JXIwHudGm/5mav5RsuOJ5skKbHJaT7M=;
        b=JS8XY8EzCxTZTKZcZQyiGzFf5LZ25Bl4ZarcoXIjvKcGeY6XIWtUB6VUj8wnox6ivo
         vTVyxPMjtYrPLteEiwpxSrK+jPNjsvmdI/JgzBpNqxiWcHV/od1EMicd6B8q1iq7HyHW
         MnDs6lVTuLwqs+C7FlNJ9akbR+VCphv+il5yYA2y01buWrQX5iOCUl/o7JMWEjnDbCqq
         mI5I4uuC5Ry97hz/JZCrmiKNdF5HOmfmPcbKziByF9cvOC02MKW03GW17ZOTLlJGCvyP
         eOMz/Jxe943DYRx43ASi0KQtATOSz/BaAF4vve4YBKvCoy6oQdC5/evXF2oMenMlqi5M
         nxMA==
X-Gm-Message-State: ACrzQf23ZLzMu5T5R/qzm2lXLCIVohqbyEN19RWqph0EX1Up1BdD8s3w
	DPt8KY1SNeBViRr4nldmU/c=
X-Google-Smtp-Source: AMsMyM6WDH7wq1u5kd3U+odFfEpgQ30j9+6ajofiuy78KRWiVD1E3qXL80lU1+kvXFHzYz3QOVAQIg==
X-Received: by 2002:ac2:5321:0:b0:4a4:3c25:dbd with SMTP id f1-20020ac25321000000b004a43c250dbdmr5837748lfh.406.1666332056154;
        Thu, 20 Oct 2022 23:00:56 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id p6-20020ac246c6000000b0049e9122bd0esm3021950lfo.114.2022.10.20.23.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 23:00:55 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: mtd: partitions: support marking rootfs partition
Date: Fri, 21 Oct 2022 08:00:50 +0200
Message-Id: <20221021060051.2508-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_230100_922957_E1B9B1E6 
X-CRM114-Status: GOOD (  13.46  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTGludXggbmVlZHMgdG8g
a25vdyB3aGF0IHRvIHVzZSBhcyByb290IGRldmljZS4gT24gZW1iZWRkZWQgZGV2aWNlcyB3aXRo
CmZsYXNoIHRoZSBvbmx5IGNvbW1vbiB3YXkgdG8gc3BlY2lmeSB0aGF0IGlzIGNtZGxpbmUgJiBy
b290PSBwYXJhbWV0ZXIuCgpUaGF0IHNvbHV0aW9uIHdvcmtzIHdpdGggVS1Cb290IHdoaWNoIGlz
IExpbnV4ICYgY21kbGluZSBhd2FyZSBidXQgaXNuJ3QKYXZhaWxhYmxlIHdpdGggYWxsIG1hcmtl
dCBib290bG9hZGVycy4gQWxzbyB0aGF0IG1ldGhvZCBpcyBmcmFnaWxlOgoxLiBSZXF1aXJlcyBz
cGVjaWZpYyBwcm9iaW5nIG9yZGVyIG9uIG11bHRpLWZsYXNoIGRldmljZXMKMi4gVXNlcyBoYXJk
Y29kZWQgcGFydGl0aW9ucyBpbmRleGVzCgpBIGxvdCBvZiBkZXZpY2VzIHVzZSBkaWZmZXJlbnQg
cGFydGl0aW9uaW5nIG1ldGhvZHMuIEl0IG1heSBiZQoiZml4ZWQtcGFydGl0aW9ucyIgb3Igc29t
ZSBkeW5hbWljIHBhcnRpdGlvbmluZyAoZS5nLiBiYXNlZCBvbiBwYXJ0cwp0YWJsZSkuIEZvciBz
dWNoIGNhc2VzIGFsbG93ICJsaW51eCxyb290ZnMiIHByb3BlcnR5IHRvIG1hcmsgY29ycmVjdApm
bGFzaCBwYXJ0aXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+Ci0tLQpWMjogVXNlICJsaW51eCxyb290ZnMiIGFzIG1vcmUgYWNjdXJhdGUuIFRo
YW5rcyBSb2IuCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4
ZWQtcGFydGl0aW9ucy55YW1sICB8IDEgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAgICAgICB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMu
eWFtbAppbmRleCBhZDNjY2QyNTA4MDIuLmQ2NmE2ZTNiY2I1NiAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlv
bnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCkBAIC04NCw2ICs4NCw3IEBAIGV4YW1wbGVzOgog
ICAgICAgICBwYXJ0aXRpb25AMCB7CiAgICAgICAgICAgICBsYWJlbCA9ICJmaWxlc3lzdGVtIjsK
ICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MSAweDAwMDAwMDAwPjsKKyAgICAgICAg
ICAgIGxpbnV4LHJvb3RmczsKICAgICAgICAgfTsKICAgICB9OwogCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFy
dGl0aW9uLnlhbWwKaW5kZXggZjFhMDJkODQwYjEyLi5hMjVjZDIzYTM0YzAgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRp
b24ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvcGFydGl0aW9uLnlhbWwKQEAgLTUyLDYgKzUyLDEwIEBAIHByb3BlcnRpZXM6CiAgICAg
ICBpbW11bmUgdG8gcGFpcmVkLXBhZ2VzIGNvcnJ1cHRpb25zCiAgICAgdHlwZTogYm9vbGVhbgog
CisgIGxpbnV4LHJvb3RmczoKKyAgICBkZXNjcmlwdGlvbjogTWFya3MgcGFydGl0aW9uIHRoYXQg
Y29udGFpbnMgcm9vdCBmaWxlc3lzdGVtIHRvIG1vdW50IGFuZCBib290CisgICAgICB1c2VyIHNw
YWNlIGZyb20KKwogaWY6CiAgIG5vdDoKICAgICByZXF1aXJlZDogWyByZWcgXQotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
