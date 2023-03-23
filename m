Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F9AC76195
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5vfJJMCz2ura8oIjxrbOWMW4YTDwHaRGcYPoc9zZZtU=; b=LyqQJgKCHc1ybJ
	XkTRK75rMucSCJdjOorWNEf/9Hj29d1sHFZ9DeEvMtbGkoAd/lNdF6gYOtxDKpKG7vpiOIQYoe0lm
	hlUUMotuEXweMYWMIm8zr0yns9/4uaDq4pDDGusciEm1GdUtMbFdz93Ht8qFmhWyJqNHPNqrXUSmW
	xqanQrrC5Nf34Mas4rng2gwML+Mczzdq36Jazk/1aAZ+Oo1frSIIWKWjMpH+3pxdxv7ZHOr9nVtHU
	5uYxP0IYFy5TGmW40BJPtmBLkT/aPlmu3Z8/GaeUoGqmOl+ThDhuYX/Qv0c7mOeefK9Y9urH19Spa
	LWnKuZV3xdPWo6rSb55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJl-001xty-02;
	Thu, 23 Mar 2023 12:45:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJi-001xrP-19
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 12:45:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id u1so1030636wmn.5
        for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2023 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQAQqByVAfmFm3DU3NaNbOMQ1oSxcBn7+GrE//RQMVI=;
        b=i7Ck+oQM9NQ0o/40CWEKutNaf3I1dTIPcGRZ5OsO31ggX6ege909sCo/b4giY9Jr7G
         KnqFlJWhs23pvdIQZrgSkLK12GS0AIAqeLeerydkN5MFF/YmBDmvXvqsAoqgQOPMneBM
         67tfNLmGCvaoiCHcZCgLdiuHAFa1cye3gQq347GDioCbQN4iBgLqQIavk4iBBq7dNqOx
         y07JF47WgdcyhtXc279MIBEO4ZMWXqpYFIw8ebfSWiD9D/VidwcQUq74ExG1cpjEM3ut
         ba+XTeeCnxyl5tmJeSXfNSOyU+bemt+wB9jcIVWNEy+HObJuTMtq7eMtqBjI35Vo6T55
         1pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQAQqByVAfmFm3DU3NaNbOMQ1oSxcBn7+GrE//RQMVI=;
        b=R1Plf6tDvRxH6bsaz1cwFCc0t24akIgmbUv7v9rXSZ+ymxgqCLldfy49hrC1mUSAPR
         YfTb/Rr+2j2EdS/iy/MZqMxFDwNc0cXIDm6M3ilq69KN9gZv5izMb3jpi61UAl5iUtbn
         4smeAE0rmAahrAiVz7FePOq0diLPH1MkKMRJ4nESzgZ7pImdUOvnAyaWd39LDAj0OSqr
         mlQG8uCWCILx/j4FRzEcuONdkBKRfE50ohpeGX6udrxSBrn/GCY/3Fe5pIbip5dKJ9av
         DRE6eyBiXi1t8rg0Na4UEG29sC5tCjpupSLOZZ4o7Fm96KBFQwx1kcnEl4ECRON0AANo
         pwYA==
X-Gm-Message-State: AO0yUKWNsw+LT+WnpIEUvzYdfdPFT8Fe6+i3B9F9lTsSDBPfJ7kq5Wlv
	mEZgK2DEd7lrDt0VMHk5bP0=
X-Google-Smtp-Source: AK7set8OZ06UGqX7C9zxBNwCmbwThgLUts/p8I3JzlN/dTP6p8ZS8bMug+WVnPOXu6H0eH51ney3ow==
X-Received: by 2002:a7b:c457:0:b0:3ea:e582:48dd with SMTP id l23-20020a7bc457000000b003eae58248ddmr2211647wmi.34.1679575512920;
        Thu, 23 Mar 2023 05:45:12 -0700 (PDT)
Received: from atlantis.lan (255.red-79-146-124.dynamicip.rima-tde.net. [79.146.124.255])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c1c0900b003ee6aa4e6a9sm1942939wms.5.2023.03.23.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:45:12 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	masonccyang@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 0/2] mtd: nand: raw: macronix: allow disabling block protection
Date: Thu, 23 Mar 2023 13:45:08 +0100
Message-Id: <20230323124510.2484808-1-noltari@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_054518_390589_696CE1F4 
X-CRM114-Status: UNSURE (   7.34  )
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

U29tZSBkZXZpY2VzIGhhbmcgd2hlbiBibG9jayBwcm90ZWN0aW9uIGlzIGVuYWJsZWQsIHNvIGxl
dCdzIGFkZCBhIGJvb2xlYW4KcHJvcGVydHkgdG8gYWxsb3cgZGlzYWJsaW5nIGl0LgoKw4FsdmFy
byBGZXJuw6FuZGV6IFJvamFzICgyKToKICBkdC1iaW5kaW5nczogbXRkOiBuYW5kOiBNYWNyb25p
eDogZG9jdW1lbnQgbmV3IGJpbmRpbmcKICBtdGQ6IG5hbmQ6IHJhdzogbWFjcm9uaXg6IGFsbG93
IGRpc2FibGluZyBibG9jayBwcm90ZWN0aW9uCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dCB8IDMgKysrCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX21hY3Jvbml4LmMgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
