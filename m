Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422A2C43218
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C9120B7C
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fr3E01Oq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+ofXdAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C9120B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFEATE3KM3j865fvpSUlumqXCEj72HLE285uGKIfwl0=; b=fr3E01OqcCdDJ0
	q8+8KCzr3ACxzvCgOdULgVgM1G05ZWgTRlU5p4j+bp9fE1m27qAgU05HXYLRI/WRQpFGIpnSqwVbn
	e6JznjJiw0Y+XElmT/L7w2sgnRJAj+ciyamsIARjN9Et3EZ3FVy+9U01WwS5PP00ilkWDrChAsAG3
	bq56W/aiu+nlaA0K0Bkq6axKViCislqqWtP+WG1hUZ8wtU/qYKHFmNwttK1OpW5+AHAiQ4GcabiZA
	z6+twRrJkZ0qTgHPwtJQbnUqZSbLFftj/m2/NZbg/7LibKxEoeUW9SIrWOqRIXwK4XLoTq6R7DAe0
	blKlZA5B+5P+IMZ1Zxdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3wf-0004a1-F8; Fri, 26 Apr 2019 16:43:29 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3vt-0003U1-77
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 16:42:44 +0000
Received: by mail-lj1-x242.google.com with SMTP id b12so2326462lji.4
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GmiljxR0tDKc7rqpSkSKqbQb6AAiPA5Nk+pPD2f3A2k=;
 b=o+ofXdAw4bIKSWuAYjDkmrfetZ07r0OreqSlGTEMAMWBtEpVMIrW6Cie1qcLcZruuw
 KSY0p3WWaDhq+GF63/PLKUB0osQ8ArtEtdlOARK/7w1Ik1DD00Y1YbzAyHbn6nAw1Nzo
 iS4ftTuer8CLtOu8l+2J819dnOJ7TF4yvUOIpACmiBCasZ7opq1/SL5vOxBVXak//40L
 bR/w7Dvm+/wXRHOWa5t3B3yKXeZO8IQdfB85Xl4cO37nqg+9PXKnKrvIGOEDsrgRJmVt
 krUl2k26Q8Cq4qXyZegCCSH4UZji6rVCbCoKlCHnaPSqVEw6Y3gdRe5JVqHOa+e4wQEG
 1oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GmiljxR0tDKc7rqpSkSKqbQb6AAiPA5Nk+pPD2f3A2k=;
 b=eT3SmTnfmyr4viyKFEtDsXB/e+Or0fnzwTXK9dPnmjbETP9Ti8lPAga6OceHcjb1NJ
 FiN0y/t63ZKyPGqJsb6O/J1vCxwqHnextYzCCKY2i/WrC2nni7ADKYF2w1IrRWK9aUy4
 e0eheZRD43gB2h20SUoqfrfxL2uKQbVksNfE6uft0jvCst8umJKK6ngC1/wqETeB+rvS
 TBeG33ngqpuoGEPj0xLQ+T4cMxJvYjSKE9jxQL1csnX90mrHiGJpAcevtaGavKSEEIVS
 b+TMgOFOXet9UnF4ZBHRXJWY7pK+BhhCwvL6rc+6nV/S61bsOarNGQ44/VRJxZW50Nlw
 bK8w==
X-Gm-Message-State: APjAAAVw07DYJcYbzjH/rmHitU8meJH/u/k7xaeJe4kvV4JV++ORKhVa
 j8WXq7+s5g6FFdzh9irGff2CgDxp9cM=
X-Google-Smtp-Source: APXvYqyXGvtR+Aq5jipLArRTQrWAcOARjHVWJn/3Jnmr11sInDW/lKSKycYh6xsZ2phrW6D1l94JCA==
X-Received: by 2002:a2e:9151:: with SMTP id q17mr24865433ljg.87.1556296959733; 
 Fri, 26 Apr 2019 09:42:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id q11sm5637807lfc.51.2019.04.26.09.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:42:39 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH 5/5] mtd: onenand/samsung: Set name field of mtd_info struct
Date: Fri, 26 Apr 2019 18:42:24 +0200
Message-Id: <20190426164224.11327-6-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_094241_862222_8A6AE4ED 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4KClRoaXMgcGF0Y2ggYWRk
cyBpbml0aWFsaXphdGlvbiBvZiAubmFtZSBmaWVsZCBvZiBtdGRfaW5mbyBzdHJ1Y3QgdG8KYXZv
aWQgcHJpbnRpbmcgIihudWxsKSIgaW4ga2VybmVsIGxvZyBtZXNzYWdlcywgc3VjaCBhczoKClsg
ICAgMS45NDI1MTldIDEgb2ZwYXJ0IHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSAobnVs
bCkKWyAgICAxLjk0OTcwOF0gQ3JlYXRpbmcgMSBNVEQgcGFydGl0aW9ucyBvbiAiKG51bGwpIjoK
ClNpZ25lZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL29uZW5h
bmQvc2Ftc3VuZy5jIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmcuYwppbmRleCAw
ZjQ1MDYwNDQxMmYuLjFmZGExZjMyNGNjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9v
bmVuYW5kL3NhbXN1bmcuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5j
CkBAIC04ODYsNiArODg2LDcgQEAgc3RhdGljIGludCBzM2Nfb25lbmFuZF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gLUVOT01FTTsKIAogCXRoaXMgPSAoc3Ry
dWN0IG9uZW5hbmRfY2hpcCAqKSAmbXRkWzFdOworCW10ZC0+bmFtZSA9IGRldl9uYW1lKCZwZGV2
LT5kZXYpOwogCW10ZC0+cHJpdiA9IHRoaXM7CiAJbXRkLT5kZXYub2Zfbm9kZSA9IG5wOwogCW10
ZC0+ZGV2LnBhcmVudCA9ICZwZGV2LT5kZXY7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
