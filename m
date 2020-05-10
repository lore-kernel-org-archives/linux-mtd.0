Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127BCC38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 15:15:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF11F20725
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 15:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CS9vF7b6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qb0OGWex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF11F20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r/QvpXCFi1+l5nkZkpn9b01scjEXpVePOib0lrxu3gc=; b=CS9vF7b6XScazi
	H7JaSxjOA/HumOya+xPw11RyKJAuU0romAj9M6lTFN2T2lG/J8tkL+PvtUZORecF5NXXY0x+zhWWG
	peEoWhWZ8LxSlPXq8TC9eDrlNvZq1h9AnZUHvyQahSwcSp69O02E2JzTxBlmTnV3GoKVqoh4s7mA+
	SN+1maIONfvobkW/dojDg5xsqqaII7UaR0/mpzwAJsXJ1u5g4zemmX68Ikm++OhZ8VFFFMFtqcsDt
	+AsFRldPIOHmUPkKAu9hoJ6evh9UXWETRBMIt5AJic++nWn/EycELLif4JNX1DInplgo17d0fwYkt
	rNyKZLiLmY5Yl566fQGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXnfH-0007Og-4P; Sun, 10 May 2020 15:14:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXnf7-00078e-8G
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 15:14:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id w19so1236384wmc.1
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyysxUp4XjcgsqI2Lfus556dLlr5fhri7TKgWrqmiJE=;
 b=qb0OGWexu2cHDt229RIuaammyh4YBvZZQ5yFQ34zvb7DmJHEISASUaV3F10i9spuge
 PeFpaIbgR75Ge1v/Xy9jvA8k7EudCWJ0H/rXfjl0kz/+dQ6EnkVAnexAjI+igxqPnd3u
 /+SCj/KyEPZEu6x6WDR66FUZModaorWk3lOtnhfAfPA2jZoimFZqOOvvvKoEIP+EsgWo
 11z+YBCsklt4cIlPMqlyiOlaUR6RdpJzdw0HqRWGZNyW66x4XPVbBJlL9HWZn5uCY0PH
 QK3wc2kQyb7edTGCm+1hMAEHKJJPbKd7NFRZHEwtqmyDk8+CkuSVCaecAmSaLfIU55UZ
 /Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyysxUp4XjcgsqI2Lfus556dLlr5fhri7TKgWrqmiJE=;
 b=K/0mzaPtWmro7tZjqP6pLICmz0+mw5G75Mp9tsNXJ+3rVmYeyrsXTPHte6xSCPiqCo
 eDbk/MDcJ7VZR4BXZWQa/S7aj+BXo/xmWKmiUlyTh8dl1lwgqNKM751jBKM7ULMlqJye
 eA4zffinwWlghY2iGQvTYfafbKVUUVZ0bJu6eGhbbxAX0U8K4yVx3iWjcxASz4FQQYFl
 jIVUy93gsKVkkhgXmAWjgakqLkCTVuvoL4qY1fExpCuOq3EjbGZfEdvVVmzUo4Ah6u6s
 JvEB27K4COmEqRkPpVqUr2NmvpxscaDV8aWgM5PZodaEB+PNRSBijbTfI0EQ27gwpkIW
 EHew==
X-Gm-Message-State: AGi0PuZ4eRhPwoyKr/rK7KQ5idk5q9Ec4hVGFJ7PsOOGAt5bJ4kXZHds
 L/rpgH5eHHL527eQUcLxeUI=
X-Google-Smtp-Source: APiQypLLdc4lGN0pRsmfHFAo/Jd2cV7QfHwh3umlf/UMcLSrbBtkd/KW0StN+PjHbPwn1DCEEK+KUw==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr2456741wme.80.1589123676201;
 Sun, 10 May 2020 08:14:36 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d133sm25176897wmc.27.2020.05.10.08.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 08:14:35 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/3] nand: brcmnand: rename v4 registers
Date: Sun, 10 May 2020 17:14:04 +0200
Message-Id: <20200510151406.2527856-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_081441_320426_456318DA 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXggZTRlM2NlZWFjMzhmLi42YTA4ZGQwN2IwNTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMzM4LDggKzMzOCw4
IEBAIGVudW0gYnJjbW5hbmRfcmVnIHsKIAlCUkNNTkFORF9GQ19CQVNFLAogfTsKIAotLyogQlJD
TU5BTkQgdjQuMCAqLwotc3RhdGljIGNvbnN0IHUxNiBicmNtbmFuZF9yZWdzX3Y0MFtdID0gewor
LyogQlJDTU5BTkQgdjMuMy12NC4wICovCitzdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3Nf
djMzW10gPSB7CiAJW0JSQ01OQU5EX0NNRF9TVEFSVF0JCT0gIDB4MDQsCiAJW0JSQ01OQU5EX0NN
RF9FWFRfQUREUkVTU10JPSAgMHgwOCwKIAlbQlJDTU5BTkRfQ01EX0FERFJFU1NdCQk9ICAweDBj
LApAQCAtNTkxLDggKzU5MSw4IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChz
dHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKIAkJY3RybC0+cmVnX29mZnNldHMgPSBi
cmNtbmFuZF9yZWdzX3Y2MDsKIAllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNTAw
KQogCQljdHJsLT5yZWdfb2Zmc2V0cyA9IGJyY21uYW5kX3JlZ3NfdjUwOwotCWVsc2UgaWYgKGN0
cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA0MDApCi0JCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5h
bmRfcmVnc192NDA7CisJZWxzZSBpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDMwMykKKwkJ
Y3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFuZF9yZWdzX3YzMzsKIAogCS8qIENoaXAtc2VsZWN0
IHN0cmlkZSAqLwogCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNzAxKQotLSAKMi4yNi4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
