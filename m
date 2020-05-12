Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67274C54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E4920643
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFtGt+Bl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t+rtPBl8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E4920643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38EQASCQcSJP+Rz+xvfSqthCU89W2K5RkhNHH07OpVU=; b=pFtGt+BlZUQbCw
	A8xOocB/njlhmt/YYz9NfrAsIlgaROC4v6Dn2TMM/HNxT3rVJqCDZHwWJEdo+kMLAUc2du3zgT691
	CSrIFuCHwT9IphIfPLdcGV7oxtKsiT6LOykrw71zGIphAAvsCay1VwMpOxTJWNQMFPBiJ+ZBb9uie
	+PirZFPU8wdXohymT6nnpv7D/pdxcSRd8kuHQ0JLHrIvj7XWvFTe2DTHJluCm84YLi1Z6bGMWzZjp
	y7j+NuCGFvq11Iy/2ukp4kHitSfC9p9d71sgBl6bjxFfHUuPuSSW1ZaCUlIxyUQ/UlePiUn8z/gO+
	3UvS9PPClzAaObtaXaHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPnT-0007xO-RE; Tue, 12 May 2020 07:57:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPnI-0007lN-Mu
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:57:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id l11so8201590wru.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKnAX8odzheYGQT7jDGjNlR3gvRSpwlFpS1VXp9+OKk=;
 b=t+rtPBl8xM/oMLoZggKEKVQ1X/xWoBIs5OibyQFRcHvNObtIM6v3af/9AzrsAqUE/k
 UybciGnMaLDJqfw1XEa1zjTD42QeqBpjafibcXRUg7RSgvGqvZrB8b0SsH+Hnvk+bN10
 sowFLNzrW+7d3hmG0/3UruTr2OJl3cDNnxZmQqAcEk7qZvOBdyA+pAFsRELK96OPTTN1
 CUpncx8RhmQ5gPO7uGqPA+LwVeVNktbBR+9e/xpLLBbsoTvQ+SNMN0/31Hdj0nMg3T0k
 hhuK2QvqN5Vtzx19Z3KLNtFeMDq8YmCEd7NB36p9Q0Hkxp12GJ/7zNSB1gILQalDkZVz
 BOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKnAX8odzheYGQT7jDGjNlR3gvRSpwlFpS1VXp9+OKk=;
 b=rCcHpCtHQlaQq7XA7C9l9+sXKrO+rzaV52qhrIFag8BTBjHn94s0sb9pW2lfeyTSaj
 UVDyQKS9CHFIRvJ2NPp+oyUk8ztgMzOCC3pZZsRU6RdR6kisdEtI8ie14HMCWno6kN2P
 2mpBg4ws9aItg8SAFa6x3/VTvCxPzAfuQMy77hNmhLaBSo+iDzT0EJ1AhngUhH0WDmw2
 lmggZJcc6IuT7NetKmOrLR8JfTF1rJBLy/S2XgzWFWIhGDlTGpXDaHBA9k61xreEsC4G
 KYUxa/yexuZpJILnEjV3jQAeez2IsD2xdbwibEuRTrQr2MRT6U8X9O3XuhpBg/ert3XO
 Kotw==
X-Gm-Message-State: AGi0PuauLgt05tp12azk5/GQ29m84K6Sm6gJ5avZkzR/F/pSIUi/nXni
 9MHPD6ewb4dlnvFtTjehXXo=
X-Google-Smtp-Source: APiQypKQwhXCVL/sn5E+I1b6Dwcm3VQqlLP5ifkvLOekIBhx5aYOclR8fafBTsQDDgUDuakI9hQt0w==
X-Received: by 2002:adf:afe9:: with SMTP id y41mr5657932wrd.56.1589270259075; 
 Tue, 12 May 2020 00:57:39 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:57:38 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 1/2] mtd: rawnand: brcmnand: fix hamming oob layout
Date: Tue, 12 May 2020 09:57:32 +0200
Message-Id: <20200512075733.745374-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512075733.745374-1-noltari@gmail.com>
References: <20200512060023.684871-1-noltari@gmail.com>
 <20200512075733.745374-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_005740_749163_A491FFDD 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rmlyc3QgMiBieXRlcyBhcmUgdXNlZCBpbiBsYXJnZS1wYWdlIG5hbmQuCgpGaXhlczogZWY1ZWVl
YTZlOTExICgibXRkOiBuYW5kOiBicmNtOiBzd2l0Y2ggdG8gbXRkX29vYmxheW91dF9vcHMiKQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHY0OiBubyBjaGFuZ2VzCiB2MzogaW52
ZXJ0IHBhdGNoIG9yZGVyCiB2MjogZXh0ZW5kIG9yaWdpbmFsIGNvbW1lbnQKCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXggZTRlM2NlZWFjMzhmLi4xYzEwNzAxMTFlYmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMTExNiwxMSAr
MTExNiwxNCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX2hhbW1pbmdfb29ibGF5b3V0X2ZyZWUoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogCQlpZiAoIXNlY3Rpb24pIHsKIAkJCS8q
CiAJCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBh
Z2UKLQkJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KKwkJCSAqIE5BTkQgdXNlIGJ5dGVzIDAgYW5kIDEu
CiAJCQkgKi8KLQkJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikKLQkJCQlvb2JyZWdpb24tPm9m
ZnNldCsrOwotCQkJb29icmVnaW9uLT5sZW5ndGgtLTsKKwkJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+
IDUxMikgeworCQkJCW9vYnJlZ2lvbi0+b2Zmc2V0ICs9IDI7CisJCQkJb29icmVnaW9uLT5sZW5n
dGggLT0gMjsKKwkJCX0gZWxzZSB7CisJCQkJb29icmVnaW9uLT5sZW5ndGgtLTsKKwkJCX0KIAkJ
fQogCX0KIAotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
