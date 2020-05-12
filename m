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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B34C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49F4720752
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d7F8wTyo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYYn2rm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49F4720752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKRAqvoi3DPLT9lgcojVahNV7GiWrEdCtfd6j3xdc8M=; b=d7F8wTyoooydkL
	Ho5yVVB3TZGZtmT4hCcQ7JyGJo9MlxHO2OANY5ypUdD9KX7qzOmNZhHK6Ch0VLsxJ6WufVVmP+fGg
	5LxhJAA8IAQbqmNQqq0wKJt2ECkZ5yQcMbb1NoZjZYcWg9xuijiWP5NQ2RURUY53sN3haPpghMeKK
	HnP9EdImB30D+wfSJq+aByv0WSo1thtkeibTO7l1cWfHQ3oMvNEuy/Pojn5iDyqt9vCJXkYmovkCo
	unVQZ1l+NnwLrljcAL+2oSc40AEfzVX2dtFpTDaSyNXqJrvwy5OSU0vOXt5DYJFTFwh2KmnbkZjHI
	JL1RhiS1jMB7F2Ho1XtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYOl5-0000oY-1E; Tue, 12 May 2020 06:51:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYOl1-0000nQ-Vy
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 06:51:17 +0000
Received: by mail-wm1-x341.google.com with SMTP id e26so20446942wmk.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PzqUJAgwkfPwZqY9huLuJ57Jz2DxDsPXmmqSEmn6iEQ=;
 b=jYYn2rm9tXXBGEfdfNQxs0IaQPLDPbZSznuhX3K3+inFDcNXl0KqQtlWqLM9/BjpNP
 kVv7wd8np8uF/tWqF7LnPYZiT9kKEfwIdiBsKmde+aZznx/vHd5yLgXEiJ8u98GMTMm/
 Gsv4kEFmvrb1jC/i9LQB3C+LyUCfjfqEwgt12dDtMEOnNbO0QMLxQwIa2COQGzigJXAe
 4CaHT90CiQBrTZ2ua2AHa+d8Mi+GHAtvKm9bHHumm3st3Gi8TwvFOWQJTogShROTWwN9
 OmVGoAxdexdjEQoAoQEigGrj3xKbHKGvBoDQU53JtJj2qNesFI9pkKokCm7CWUhcF4NW
 GQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PzqUJAgwkfPwZqY9huLuJ57Jz2DxDsPXmmqSEmn6iEQ=;
 b=ZZDnUE2YW7pti2HIZMCwKPcirQkqOR1lyT6iosTHQOwkD4KADSkEyh8m7trmqDLXIu
 qLWQvDDrkBusPMXzBUgsTi0Q4IG1EiT/RDQqNl+5rlj7RydT9RYw4jWLcCQ+jbq+StDD
 7ABTIiQqDHjmmFgll5TAm8QfwQXJ/p9wV8XsfGTZeKFq8U2oEBkSt9b5KtxaUy6r5r0f
 lkDyCc2pnkeYGuMw2Y69wR2D+zzeCsWC9FskqPQLsnYFmjRgmbgNNAdGh6aw6hKyggvt
 LBJVso3lmtLTEBu0onXbOpfHXue64SJ+nz84W2bYUVFMcbpw8soC7RF7FTXyH6oVqgYJ
 SKjQ==
X-Gm-Message-State: AGi0PuaIWCIrwoQKTuNCxAv0UJOsKBVAOECgTIbenhr77KBaodS4mbu8
 iy8GaEU9EejX/v2LgipF3d8=
X-Google-Smtp-Source: APiQypJvYf4NALaAkFyguhqo82x6QEXVkcwJJetASyREMrQ2k+rzJEeg2imq5+2NaLIPszqT4KSHyA==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr34648915wmg.36.1589266274574; 
 Mon, 11 May 2020 23:51:14 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id n25sm30740119wmk.9.2020.05.11.23.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:51:14 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
Date: Tue, 12 May 2020 08:51:11 +0200
Message-Id: <20200512065111.716801-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505082055.2843847-1-noltari@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_235116_023609_F66C3068 
X-CRM114-Status: GOOD (  13.71  )
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

VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
LgpUaGlzIGlzIGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8g
dGhlIE9PQiwgc2luY2UgaXQgd2lsbApmYWlsIGR1ZSB0byB0aGUgdXNhYmxlIE9PQiBieXRlcyBu
b3QgYmVpbmcgMHhmZi4KQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFu
ZCBFQ0MgYnl0ZXMgYXJlbid0IDB4ZmYuCgpGaXhlczogMDJiODhlZWE5ZjljICgibXRkOiBicmNt
bmFuZDogQWRkIGNoZWNrIGZvciBlcmFzZWQgcGFnZSBiaXRmbGlwcyIpClNpZ25lZC1vZmYtYnk6
IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjM6IEZp
eCBjb21taXQgbG9nIGFuZCBtZXJnZSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsgY2FsbHMu
CiB2MjogQWRkIEZpeGVzIHRhZwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwppbmRleCBlNGUzY2VlYWMzOGYuLjgwZmUwMWYwMzUxNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0yMDE4LDggKzIwMTgsOSBAQCBzdGF0aWMg
aW50IGJyY21uYW5kX3JlYWRfYnlfcGlvKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLAogc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCQkgIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHZvaWQg
KmJ1ZiwgdTY0IGFkZHIpCiB7CisJc3RydWN0IG10ZF9vb2JfcmVnaW9uIG9vYmVjYzsKIAlpbnQg
aSwgc2FzOwotCXZvaWQgKm9vYiA9IGNoaXAtPm9vYl9wb2k7CisJdm9pZCAqb29iOwogCWludCBi
aXRmbGlwcyA9IDA7CiAJaW50IHBhZ2UgPSBhZGRyID4+IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAJaW50
IHJldDsKQEAgLTIwMzUsMTEgKzIwMzYsMTkgQEAgc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVy
aWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCWlmIChyZXQpCiAJCXJldHVy
biByZXQ7CiAKLQlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyssIG9vYiArPSBz
YXMpIHsKKwlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyspIHsKIAkJZWNjX2No
dW5rID0gYnVmICsgY2hpcC0+ZWNjLnNpemUgKiBpOwotCQlyZXQgPSBuYW5kX2NoZWNrX2VyYXNl
ZF9lY2NfY2h1bmsoZWNjX2NodW5rLAotCQkJCQkJICBjaGlwLT5lY2Muc2l6ZSwKLQkJCQkJCSAg
b29iLCBzYXMsIE5VTEwsIDAsCisKKwkJaWYgKG10ZC0+b29ibGF5b3V0LT5lY2MobXRkLCBpLCAm
b29iZWNjKSkgeworCQkJb29iID0gTlVMTDsKKwkJCW9vYmVjYy5sZW5ndGggPSAwOworCQl9IGVs
c2UgeworCQkJb29iID0gY2hpcC0+b29iX3BvaSArIG9vYmVjYy5vZmZzZXQ7CisJCX0KKworCQly
ZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoZWNjX2NodW5rLCBjaGlwLT5lY2Muc2l6
ZSwKKwkJCQkJCSAgb29iLCBvb2JlY2MubGVuZ3RoLAorCQkJCQkJICBOVUxMLCAwLAogCQkJCQkJ
ICBjaGlwLT5lY2Muc3RyZW5ndGgpOwogCQlpZiAocmV0IDwgMCkKIAkJCXJldHVybiByZXQ7Ci0t
IAoyLjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
