Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5092C43217
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DY8wdPiOLj5svuuObWvfFB2GG1JDiK4afz50q5xMIo=; b=11uRKmqyJqi3x0
	nckPD2KCD1ZvTotyB4V2RoJIVy0jvEDyn+G9rNf4hBxzomu3qyIBISOKMi/VkLpDUaPVigtblM8cY
	EyWP0nOG+UVUF/kPOgxQ39xbgmblDa9vKiVW+sBDcl05ZbkMh0Gkwhwi3vT5D2KRdxRaImispHieE
	pHZSDGk0Txi5j3dsg7YJdv7T9YRxmopc5FiSSmOn7ShFOX1CmDmA4Sa/iatW8YdqrUPXtQBowY2vb
	rEYEXCgNV1jmarlrwF1kDSZEVyNemVEcVwFcbTzW219tkP8cP2GhuFpTokffZASXFVWnCf4vwm//L
	1M2hDU7lhHuluFNs4yQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oll5f-005YeF-L7; Fri, 21 Oct 2022 06:01:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oll5Z-005Yap-MT
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 06:01:05 +0000
Received: by mail-lf1-x133.google.com with SMTP id d6so3287031lfs.10
        for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2022 23:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ9xIMP9KJSnyP3kmEcAZFEOTKsj48z0+6bhrdbyYmQ=;
        b=d1Ic9JTyYswqZsEL5SydOKhL435NQPu3xf45ckQx+lh0zbljdQXq32zSHLZSdZhfGK
         0NTAOfVvX/A9wGkQREP8rf4nIZ2eIZ5dknqfY6MXMR5wSF0tSbL4i443zXJDCpCu3dM9
         LLnBbM0HkC7bE2lEC8Iy4RpSsR3VM4UbZ+Zpsx8RVHF/cPNO94o8MVbVdBkF3vhnNQwW
         mlkB2aOzr2RpA5I+GZX0sodWgJkknZuegcQYzVXIU+R998qS1zhMaoGJPt1ym+bJXFnj
         Rx7DyriZhROpSd0A7uzEvPKl8bRHVk8I3Jy7cM6KPFBLtnciJLQ99aHoQQTYutgufa8r
         Qpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJ9xIMP9KJSnyP3kmEcAZFEOTKsj48z0+6bhrdbyYmQ=;
        b=vh4Mw10jRVLnA5CSWMO3th/RMczPwbZljBL9sV8xJAaYKEjtoIG3YS8j+Saeo24BT1
         dKREOeEl/pZoZgXH8+lFUBPQ1mfMEtNNVK8EXVbxTWvzGfoXCcR053FRHQ28d6Tj/oWN
         f9AAZnVGreId0n6HK7g74HnuK9ASRjoodLm9xM8y/o0QbgtYaGfSQn15OekwN/cp3P/3
         kbC2Vz225q6oT+OmC5gW7GHgXKOtHHZP+apRdnb9JKf2YGbXBS0q9A7hRo1RFqD5ItBk
         kFo2iHcwZ6FxzY6ANnEpJjHum+2ikV21P1KUCLDiPfvRAxms5QiM4i/cnD3k3VauIuE5
         pozw==
X-Gm-Message-State: ACrzQf0jbTXKd3V4gB+FdlrJ2XDM/x8brazHkjmF4u0FrcHkzPN5bKsw
	o+rTM/Q985eHbjkTNIjob9k=
X-Google-Smtp-Source: AMsMyM6B1qDtmd+KvrXozhnnD4v6SqdWdIOD/IrSleQ9kdprEflFZM9GH+ldehIYgYyV0Ptm4xo4Qg==
X-Received: by 2002:a05:6512:11e9:b0:49f:d530:9f25 with SMTP id p9-20020a05651211e900b0049fd5309f25mr6513590lfs.533.1666332058608;
        Thu, 20 Oct 2022 23:00:58 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id p6-20020ac246c6000000b0049e9122bd0esm3021950lfo.114.2022.10.20.23.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 23:00:58 -0700 (PDT)
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
Subject: [PATCH V2 2/2] mtd: core: set ROOT_DEV for partitions marked as rootfs in DT
Date: Fri, 21 Oct 2022 08:00:51 +0200
Message-Id: <20221021060051.2508-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021060051.2508-1-zajec5@gmail.com>
References: <20221021060051.2508-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_230104_125325_E39846E3 
X-CRM114-Status: GOOD (  14.30  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBhZGRzIHN1cHBv
cnQgZm9yICJsaW51eCxyb290ZnMiIGJpbmRpbmcgdGhhdCBpcyB1c2VkIHRvIG1hcmsgZmxhc2gK
cGFydGl0aW9uIGNvbnRhaW5pbmcgcm9vdGZzLiBJdCdzIHVzZWZ1bCBmb3IgZGV2aWNlcyB1c2lu
ZyBkZXZpY2UgdHJlZQp0aGF0IGRvbid0IGhhdmUgYm9vdGxvYWRlciBwYXNzaW5nIHJvb3QgaW5m
byBpbiBjbWRsaW5lLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgotLS0KVjI6IFVzZSAibGludXgscm9vdGZzIiBhcyBtb3JlIGFjY3VyYXRlLiBUaGFu
a3MgUm9iLgotLS0KIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDcgKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwppbmRleCAwNzI0OWFmNGY4OTAuLjAzNGIwNmFmZjY2
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210
ZGNvcmUuYwpAQCAtMjgsNiArMjgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4KICNpbmNs
dWRlIDxsaW51eC9kZWJ1Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvbnZtZW0tcHJvdmlkZXIuaD4K
KyNpbmNsdWRlIDxsaW51eC9yb290X2Rldi5oPgogCiAjaW5jbHVkZSA8bGludXgvbXRkL210ZC5o
PgogI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+CkBAIC03MzUsNiArNzM2LDEyIEBA
IGludCBhZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAkJbm90LT5hZGQobXRk
KTsKIAogCW11dGV4X3VubG9jaygmbXRkX3RhYmxlX211dGV4KTsKKworCWlmIChvZl9maW5kX3By
b3BlcnR5KG10ZF9nZXRfb2Zfbm9kZShtdGQpLCAibGludXgscm9vdGZzIiwgTlVMTCkpIHsKKwkJ
cHJfaW5mbygibXRkOiBzZXR0aW5nIG10ZCVkICglcykgYXMgcm9vdCBkZXZpY2VcbiIsIG10ZC0+
aW5kZXgsIG10ZC0+bmFtZSk7CisJCVJPT1RfREVWID0gTUtERVYoTVREX0JMT0NLX01BSk9SLCBt
dGQtPmluZGV4KTsKKwl9CisKIAkvKiBXZSBfa25vd18gd2UgYXJlbid0IGJlaW5nIHJlbW92ZWQs
IGJlY2F1c2UKIAkgICBvdXIgY2FsbGVyIGlzIHN0aWxsIGhvbGRpbmcgdXMgaGVyZS4gU28gbm9u
ZQogCSAgIG9mIHRoaXMgdHJ5XyBub25zZW5zZSwgYW5kIG5vIGJpdGNoaW5nIGFib3V0IGl0Ci0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
