Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327E1C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 19:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0456D206B8
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 19:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGEZxel7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRQM1Y5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0456D206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTjM1yuaRimGd5VdSMalbsoIWL/DgsyJGp2joWU0ht4=; b=TGEZxel7L7QSIg
	oiPfr4jW7vwhGU8NApRfPwi8xdnf4lSLJjs+Yn6VJ2cYcJhv/zuZ3BaWaaE23aLX75N7uGay8EcBS
	ww1rPKEwWsaUk2f8V95JacCwJqkrOZxV3CPYlJ/E6cuWo4HeASRNBLkTczE5/jHRj0jN6eZNw3idR
	7s0U/Ep4eOCA18U+lmDcM7vqQ2dG+co1HLNa1C6+RG/mk37mmUvMj/oPsLljamfkiMEchDH4Rn8xq
	GGtiet1mpoR6L14gPgt/Gb6edtksvzcNGiWsdP65lh+j3+jiAYqHxaJO8U02mihSkoEL58fqZvjnM
	3f4cwFfZOYS9O4yjAuLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVgJs-0004UZ-4P; Mon, 04 May 2020 19:00:00 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVgJk-0004Lc-KD
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 18:59:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id s8so359121wrt.9
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTu28xUDgKPSOfBD93/Q64n/TLopzl8Xcrc16onzdb4=;
 b=TRQM1Y5Y/kjYZMLRbOikbwDibHa3llJJVJ/bc7jGQWQvtEvHnYk+1txiccS6Rgx+6T
 1cpp1S+GVHWE22ZiEMtiCRXQWeW/mtePV1UrimBZe/Rsw6y0mt6J0YlRUdfmkWvPMU72
 D9rdhVW3L/6GTSOCfkvt6gRQDp8I/s7nzXE5vpUzPNKKbuVL913l/pHILh2AmLNoa7X4
 2fSfTjShbGngeSDvAdACnvzOFfyriEE8CQYvSTJpqBC852ad1HA5FjpKz+1lqLRnPcsY
 jNREp73WKhNlU9NPAI3hqdLEuyfcJzOM5PLSxBtKjKSzv7jgQ+9uSFF94uhiC2g/SHpv
 Hn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTu28xUDgKPSOfBD93/Q64n/TLopzl8Xcrc16onzdb4=;
 b=DSINypnleh0y/Cv2n57/7sno/KBn1bZYd/vGp//s1814w9MTBpb2FkCfdfDvm1oZgV
 z45scG/QYPQVOHKK0Yb1gD3QMfJZzP9/ug95b6HMFSqxAikfwmwn1LC1w22JGPiUXjPP
 o9KTTscUktO8BG/3rGB97h1ajpcOMC8nmDPgoORM2Mr4H8FLfWKNySO1mxxQArryDnOk
 OrXghLdjU98D+n8/DNMEZmrr7rVlqq14lSq6Sm3aZnGiKVMXdVK6dk0seZTwaDU6zcWC
 hiu9ZoQHz73aLJxrWrx1/8XVYUTSna0lPLyaRRCjTZW/z7hkZnO9ShJD18n7KkZfRPks
 4j1w==
X-Gm-Message-State: AGi0PuZqYyRz2XjLoKTpBBfyQPjQUZrFPWEfbDSQdE94QMYX3hre+zz+
 xev3Rew2Tov9UweCXkCGEdQ=
X-Google-Smtp-Source: APiQypKIse9qXrWL+g42FDTv87t6NfFQ+bDzxi1DIXWKshuoMbdJwHPaPEgXUDiQ6wAWMVLgt0psUQ==
X-Received: by 2002:adf:9447:: with SMTP id 65mr534819wrq.331.1588618791289;
 Mon, 04 May 2020 11:59:51 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id i25sm452952wml.43.2020.05.04.11.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 11:59:50 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 2/2] nand: brcmnand: fix hamming oob layout
Date: Mon,  4 May 2020 20:59:45 +0200
Message-Id: <20200504185945.2776148-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
 <20200504185945.2776148-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_115952_658991_D4C3692F 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rmlyc3QgMiBieXRlcyBhcmUgdXNlZCBpbiBsYXJnZS1wYWdlIG5hbmQuCgpTaWduZWQtb2ZmLWJ5
OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHYyOiBl
eHRlbmQgb3JpZ2luYWwgY29tbWVudAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXgg
NzY3MzQzZTBlNmU3Li4wYTFkNzZmZGUzN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYwpAQCAtMTExNCwxMCArMTExNCwxMCBAQCBzdGF0aWMgaW50IGJyY21uYW5k
X2hhbW1pbmdfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9u
LAogCX0gZWxzZSB7CiAJCS8qCiAJCSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBC
Qkkgd2hpbGUgbGFyZ2UtcGFnZQotCQkgKiBOQU5EIHVzZSBieXRlIDAuCisJCSAqIE5BTkQgdXNl
IGJ5dGVzIDAgYW5kIDEuCiAJCSAqLwogCQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIpIHsKLQkJ
CW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMTsKKwkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMjsKIAkJfSBl
bHNlIHsKIAkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMDsKIAkJCW5leHQtLTsKLS0gCjIuMjYuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
