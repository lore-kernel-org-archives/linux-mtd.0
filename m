Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E390C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 07:30:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F3064E71
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 07:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F3064E71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tt5tf8s9cQhPfXNmD9s8UR68N4KtCJ40TAx1SUA31E0=; b=hsZmvO046WlDFmDHUDlbh9OwaH
	kTFPMnzurdLub16tVCv/VY9ynEILVLCIHh8d+YnZ3/Ovq8s6fYb5CzTe1rX2Q+RNvHU1pNPb0Y2iN
	TCGWOQu88MQD5tvumuHiGxoI3Ghto/OdXIIR70LVVjeVe1KdRAgulf5Z78FNHpuw6d6wQQ4WA+xw8
	M4Gm/uLZlvXxBRipzz1wkDFLtxmYrQ5fd26FSFoUWhvzV17hTYa+DSN7ouvaLKUBrrSpdHrcki7d9
	ZH7MNyl93J+RR4o81yGrQymHlCZEvMJo4Kzk4vp+yHSfP4r/OvgAHMfAbQKFSxCPm/p2//FTC84ko
	rRcwOewA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBYKI-0000bf-Ce; Mon, 15 Feb 2021 07:29:46 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBYKG-0000b5-2v
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 07:29:45 +0000
Received: by mail-lj1-x22b.google.com with SMTP id x1so6541750ljj.11
 for <linux-mtd@lists.infradead.org>; Sun, 14 Feb 2021 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=79lwX7opGlCl6k5/gtvtF+EDAPSlvhge501UOjBBscg=;
 b=eiC5KUj7w3Xi5LydiaVaeY2pU7nAWZNFMzNtonYi6Gj9FCa9r7bZDFBNu3uEJ24nlb
 IVnQB2kazqrFhJP0/poOWprW7rVU1GUyivC4/Y8akCTl6KU86N656ztrv2DqH5akeVNN
 NcnjnPlePYIiSXaABijTi0xyxWt4owXTLMGOOnPeDhVU5MSYTS1ej+I2Qasy0aTvdWgn
 7hqpEf/Wsm7vtE1rN11JvJg3WW60iXn7w3U5Xt4+J+35Aa4Q83jxWP0frOMJxnG+evOi
 TWJ6wY3wJQ8/bwffoOm4lz3Ir3V1EITAxmWZ/HcntwicFbVnmq/Ra/7fZknfRgPrSqJP
 +XUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=79lwX7opGlCl6k5/gtvtF+EDAPSlvhge501UOjBBscg=;
 b=sEDWwIMM7XjW6Q7ORvkyp3htK2QfRjjCRE9s8i2r8vePBS3uo7HUAeQM+rZKDmQ0M1
 4mcJ+RcRWfXdF6IT505dGtIu11WVqTZ0iNNJV9HCVGhehHo3TX4hh20cXZCUyOzBtH7/
 lsZtIWLpyZzBsC8V2r3C4Malxx67u5WYaJxJsxSC4bM3kRmIUzRn/wxW06l8uSDkCT3v
 uzK9oPL88JWc4UeC0TgcpQmg9KHewhXlSBv7DDNpQI2ngsAgAxbC9gBxTgS6RRIjd+Qa
 Ck1NulRS457iv94amftz2ooYMmBvzpQHqYr/+VZxFLcnypvgD9lWiROFExLsmc/jewG4
 xmaA==
X-Gm-Message-State: AOAM5319XLMJX+eVDSzToXR0fkZT0+Yz1N7h2mgf+jj6I4sQdk3KN7MG
 eIqNkCZvnQtmYwfj1hz9jN8=
X-Google-Smtp-Source: ABdhPJxXhZkTpdE72XrqXK28hqtTTDaRS+c9UywWe9x23DTns/PHAPvrg65zYVKRvGljJ5UDmJGQ2Q==
X-Received: by 2002:a2e:730c:: with SMTP id o12mr3645460ljc.27.1613374179617; 
 Sun, 14 Feb 2021 23:29:39 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id l19sm3538642lji.53.2021.02.14.23.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 23:29:39 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] mtd: parsers: ofpart: fix building as module
Date: Mon, 15 Feb 2021 08:28:44 +0100
Message-Id: <20210215072844.16136-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_022944_148509_7F4C1A9C 
X-CRM114-Status: GOOD (  11.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBmaXhlczoKRVJS
T1I6IG1vZHBvc3Q6IG1pc3NpbmcgTU9EVUxFX0xJQ0VOU0UoKSBpbiBkcml2ZXJzL210ZC9wYXJz
ZXJzL2JjbTQ5MDgtcGFydGl0aW9ucy5vCkVSUk9SOiBtb2Rwb3N0OiAiYmNtNDkwOF9wYXJ0aXRp
b25zX3Bvc3RfcGFyc2UiIFtkcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydC5rb10gdW5kZWZpbmVk
IQoKUmVwb3J0ZWQtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgpG
aXhlczogMDljZjZlZTZkMjFjICgibXRkOiBwYXJzZXJzOiBvZnBhcnQ6IHN1cHBvcnQgQkNNNDkw
OCBmaXhlZCBwYXJ0aXRpb25zIikKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbXRkL3BhcnNlcnMvTWFrZWZpbGUgICAgICAgICAg
ICAgfCAyICstCiBkcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ5MDgtcGFydGl0aW9ucy5jIHwgMiAr
KwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlIGIvZHJpdmVycy9tdGQvcGFyc2Vy
cy9NYWtlZmlsZQppbmRleCAwMTk3MmE1ZWRjNWMuLmJmNThhNTIyMTczMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvcGFyc2Vycy9NYWtlZmlsZQorKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL01h
a2VmaWxlCkBAIC00LDcgKzQsNyBAQCBvYmotJChDT05GSUdfTVREX0JDTTQ3WFhfUEFSVFMpCQkr
PSBiY200N3h4cGFydC5vCiBvYmotJChDT05GSUdfTVREX0JDTTYzWFhfUEFSVFMpCQkrPSBiY202
M3h4cGFydC5vCiBvYmotJChDT05GSUdfTVREX0NNRExJTkVfUEFSVFMpCQkrPSBjbWRsaW5lcGFy
dC5vCiBvYmotJChDT05GSUdfTVREX09GX1BBUlRTKQkJKz0gb2ZwYXJ0Lm8KLW9iai0kKENPTkZJ
R19NVERfT0ZfUEFSVFMpCQkrPSBiY200OTA4LXBhcnRpdGlvbnMubworb2ZwYXJ0LW9ianMJCQkJ
Oj0gYmNtNDkwOC1wYXJ0aXRpb25zLm8KIG9iai0kKENPTkZJR19NVERfUEFSU0VSX0lNQUdFVEFH
KQkrPSBwYXJzZXJfaW1hZ2V0YWcubwogb2JqLSQoQ09ORklHX01URF9BRlNfUEFSVFMpCQkrPSBh
ZnMubwogb2JqLSQoQ09ORklHX01URF9QQVJTRVJfVFJYKQkJKz0gcGFyc2VyX3RyeC5vCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ5MDgtcGFydGl0aW9ucy5jIGIvZHJpdmVy
cy9tdGQvcGFyc2Vycy9iY200OTA4LXBhcnRpdGlvbnMuYwppbmRleCA0MGViM2IzODAxYzMuLmFj
NjlhMjE2OTc2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY200OTA4LXBhcnRp
dGlvbnMuYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ5MDgtcGFydGl0aW9ucy5jCkBA
IC02MiwzICs2Miw1IEBAIGludCBiY200OTA4X3BhcnRpdGlvbnNfcG9zdF9wYXJzZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhCiAKIAlyZXR1cm4gMDsKIH0K
KworTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
