Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A964AC433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB9964FEE
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 12:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB9964FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1EngTf9JEjpQSXfqUbJcYm0paL0e+T3H4XLipBWULQU=; b=ptrFxmwjZmtqwaqDbJIGkHzoxX
	s61WcaHjREHIjltjFLyUziM/4kheBkb6Q5SF2ccmRf0a5raBIn060DlKthOaPXOf0j7/IkVQ1gTF4
	5tcIkBDGQjqCkrCHN6aFqNhU8zrECeX/+Xr4/dlwVo/vLNc6jhlcgrF3bdjkoVsXvkt51QBtaiERK
	c7nx8GZKI90OgE2gtx7NZ75AJJuJ574lvUntSMBjctow/kFh+0b6Q54uEcT254DKPnEvVl5ygSV+W
	yMusOQyTphYkjf8RLMzQf+LQKW/tjGojjEc+vzRinrG0/UllETmzV9t63LOcXMW0wxc8Z2tsQoZKb
	YdlIMuDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKhBc-00BSAL-4G; Fri, 12 Mar 2021 12:46:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKh9a-00BS6q-SW
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 12:46:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id a18so4705177wrc.13
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VI13v7WXCHyV5J1x9UibDqjD7a10mhiWIB5IsHD7pqI=;
 b=o5XPui/gukKRgc7PwBjmedNbk1silTZsSMBrZFwN59+1UnRqSRTHgMrsho3JGLL21s
 1LXij9Esxn7wFm+eYTFhyiQzfwMxisfmrVzm7yr9JrBBVuRni6wuKmkOJ7XcXjCPck99
 YHpI/i2s0vP5B0FVBlI4umrK9GTH5NW5uOQz2XngcxGQSHfob5nye5O/M7dZAhRk0r3W
 hf4rDf7trLqUmXy5acCE/3zMaOIbGvzR863EMS2BKJ1DiBGc66CC47HxCaNhGBOtukgw
 +t1cPmmjvY05uvE/MKWY6E7l/n1qjrSdkY+KHZaGJz0LLMoJ8PJQay5bqGgWCrvJ/kai
 Dn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VI13v7WXCHyV5J1x9UibDqjD7a10mhiWIB5IsHD7pqI=;
 b=roIUIG4On+3eGQGke6kbSp7nD2wXfDAOx7zUYILNhOAValRPFDWJZDnaR2x8m72HcD
 RP9f98+ex3l853AM6K2kool31MQ7IeDOW37mu/zc3vQbVS5UbhJtBfWKJPk0Ix68XBbl
 GB02HzwvWzA5kId3Ueemhebvgt31juB/338UAw1Us8Tq13p6YMIBdfcxFvgAVfEDjbAE
 0YC8z/6m+J0wiD8b4DGFDk9jcWiFr5obkE6VxjWF5+jbj6qA/Ymsa+YNwSckgcMez9NV
 E4yHkUmLcgnoHx/zrAHkNI0QK++UaqqxF0a5vwwDXBsgtVv4sm3Y0dpeKiLaSMNs1vEy
 SWsQ==
X-Gm-Message-State: AOAM53237n97vHuc4QhiOe3S6fWQNK8CaAaV1n+1QRYTGtq4L56nqjRD
 amaHlrwYzm+1OuCTcfa0KaM=
X-Google-Smtp-Source: ABdhPJxM6NNpxowCaT6kxszVSN/rPkxCB9XCQ9dzbhnd8x3OlG4E0ebpRadAVgbmMVBfJ6FPU6/siQ==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr13984426wrr.12.1615553068908; 
 Fri, 12 Mar 2021 04:44:28 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id 36sm8213414wrh.94.2021.03.12.04.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:44:28 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] mtd: core: add nvmem-cells compatible to parse mtd as
 nvmem cells
Date: Fri, 12 Mar 2021 07:28:19 +0100
Message-Id: <20210312062830.20548-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_124631_186878_A4753572 
X-CRM114-Status: GOOD (  12.13  )
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

UGFydGl0aW9ucyB0aGF0IGNvbnRhaW5zIHRoZSBudm1lbS1jZWxscyBjb21wYXRpYmxlIHdpbGwg
cmVnaXN0ZXIKdGhlaXIgZGlyZWN0IHN1Ym9ub2RlcyBhcyBudm1lbSBjZWxscyBhbmQgdGhlIG5v
ZGUgd2lsbCBiZSB0cmVhdGVkIGFzIGEKbnZtZW0gcHJvdmlkZXIuCgpTaWduZWQtb2ZmLWJ5OiBB
bnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgpUZXN0ZWQtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwppbmRl
eCAyZDY0MjNkODlhMTcuLmFjMWI0ZjE3NmExNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRk
Y29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwpAQCAtNTMxLDYgKzUzMSw3IEBAIHN0
YXRpYyBpbnQgbXRkX252bWVtX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZz
ZXQsCiAKIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIHsK
KwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBtdGRfZ2V0X29mX25vZGUobXRkKTsKIAlzdHJ1
Y3QgbnZtZW1fY29uZmlnIGNvbmZpZyA9IHt9OwogCiAJY29uZmlnLmlkID0gLTE7CkBAIC01NDMs
NyArNTQ0LDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRkKHN0cnVjdCBtdGRfaW5mbyAqbXRk
KQogCWNvbmZpZy5zdHJpZGUgPSAxOwogCWNvbmZpZy5yZWFkX29ubHkgPSB0cnVlOwogCWNvbmZp
Zy5yb290X29ubHkgPSB0cnVlOwotCWNvbmZpZy5ub19vZl9ub2RlID0gdHJ1ZTsKKwljb25maWcu
bm9fb2Zfbm9kZSA9ICFvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAibnZtZW0tY2VsbHMi
KTsKIAljb25maWcucHJpdiA9IG10ZDsKIAogCW10ZC0+bnZtZW0gPSBudm1lbV9yZWdpc3Rlcigm
Y29uZmlnKTsKLS0gCjIuMzAuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
