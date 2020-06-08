Return-Path: <SRS0=yUT7=7V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFE6C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 16:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723DD2063A
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 16:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUWv9zA1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLSxxQtA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723DD2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzza8d5Dfw9CYLZ2QYIEsnN1Kgct/1AOvqww+PqyYhE=; b=eUWv9zA1hTcycS
	MnOykGyRLDSOMtLfLdNlQwwgNyOFar9DAuLTuKMEEVxcykiHn1aDeDaH9I9jYbxsLDK46YdUrQeiN
	v1+6KMME2zB+KK0MbBCwq9TFIePl6JbpeGl0pH4fa9WaIJiQGmbo3KKAKCKZh6zc+8Bkj95VyvoKj
	7mHc8CBIv8xiiXAmD3766sAjTDQiSDWGC/CwT04fJYLOLFoTSfChY/x7sn5NSx9rb/TDSxHAy8HKE
	D7P6rHHSmSGUjdF6Hvpat9i2PdNM9t42j3BjMSuLiHsPAKhdJCQBE6bTp24VTRgjfzRaDUsMjkuZ9
	F9k2Bcr1ux1qo5zbbhYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiKIp-00061e-7o; Mon, 08 Jun 2020 16:07:11 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiKIh-0005uH-CX; Mon, 08 Jun 2020 16:07:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id y20so69439wmi.2;
 Mon, 08 Jun 2020 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xSm/ixCMsXrBbAVZMWIWVyDBFHz6cDKWQtZCmAnN0nA=;
 b=ZLSxxQtAqk9VJDhuTPL/QytUa2FIBQopJdBHKih5e4AAFXp7fINT9N+ePLJodzE/tU
 MIo4bnGqf6TwcM2yJnT8F3mNUgmp+iiR7KVcEf0MRbb/a/WciLworDKVhxZ4gXx6Shts
 HMV0P81Yb2gscczPSxyxyT6ukEYSwfakd0VCuBT7SJriDcBqMux5KKV6paMbOPPS9Ud9
 XRvv63vkPM7+tmGskVRlRvyeSWZZFi+ulGYCSujm6IW2JWESuFocQua+OIV3YkJciJFg
 HRbtsT0RpycizikAmUr1ILfJsTt/0ebbdX3R89RLKixL+YdeRFBH3h6OODLDz9Ucvi9b
 ylXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xSm/ixCMsXrBbAVZMWIWVyDBFHz6cDKWQtZCmAnN0nA=;
 b=l1T9A0e3CFYcW3E7OrHyx6h3n4qqS/24vzTVtY08yR8spC4DkU4e/9UhfgueaT7i/o
 pK75tLevqYgG3NpQXqmk3QxI4xzwCwTz56GZrg9YCSdBJ+x0HVt350nHHJxm0uOkrMnf
 2FW8R6fe+Tuh0E4uh8GSijeG2Bh8WVainARnm6sX5t3sZVWLtsvJoVzP9DQK/KORRLrj
 3aWP6i1H0/osLzdAKGYXOBR0BASxDqQy7se4pLm+LOX5RQ+YQn1ovBINQC41xwPBObGM
 G8a9LmQzCU3zawm0h4Tc7eHSM3oe7qxFWGc6RMqWJzI6AQoksTe1y3VIRN1Mz0m4IxVg
 psTQ==
X-Gm-Message-State: AOAM530KkVPOosD91zlE4bMScXwjP3DIYWOgrdiNnJzYxGrPegwey76j
 57YUjUMs5mJmZVtYZ1h9J8P34pGqEeT/fw==
X-Google-Smtp-Source: ABdhPJzlh/xf/IFViONY5iqBfTW9IBvJzeWdZjU4s6WE0zKa+QDIy95NBnZc/nabW15BofK0+Fz87w==
X-Received: by 2002:a1c:24c6:: with SMTP id k189mr72594wmk.9.1591632418158;
 Mon, 08 Jun 2020 09:06:58 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net.
 [83.49.61.28])
 by smtp.gmail.com with ESMTPSA id b187sm32275wmd.26.2020.06.08.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:06:57 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: tsbogend@alpha.franken.de, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
Date: Mon,  8 Jun 2020 18:06:49 +0200
Message-Id: <20200608160649.3717152-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608094053.3381512-1-noltari@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_090703_426077_976E59C7 
X-CRM114-Status: GOOD (  11.77  )
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

SW5zdGVhZCBvZiB0cnlpbmcgdG8gcGFyc2UgQ0ZFIHZlcnNpb24gc3RyaW5nLCB3aGljaCBpcyBj
dXN0b21pemVkIGJ5IHNvbWUKdmVuZG9ycywgbGV0J3MganVzdCBjaGVjayB0aGF0ICJDRkUxIiB3
YXMgcGFzc2VkIG9uIGFyZ3VtZW50IDMuCgpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb25hcyBHb3Jza2kg
PGpvbmFzLmdvcnNraUBnbWFpbC5jb20+Ci0tLQogdjI6IHVzZSBDRkVfRVBUU0VBTCBkZWZpbml0
aW9uIGFuZCBhdm9pZCB1c2luZyBhbiBhZGRpdGlvbmFsIGZ1bnRpb24uCgogZHJpdmVycy9tdGQv
cGFyc2Vycy9iY202M3h4cGFydC5jIHwgMjkgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYyBiL2RyaXZlcnMvbXRkL3Bh
cnNlcnMvYmNtNjN4eHBhcnQuYwppbmRleCA3OGY5MGM2YzE4ZmQuLjQ5M2E3NWIyZjI2NiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCisrKyBiL2RyaXZlcnMv
bXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYwpAQCAtMjIsNiArMjIsOSBAQAogI2luY2x1ZGUgPGxp
bnV4L210ZC9wYXJ0aXRpb25zLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KIAorI2luY2x1ZGUg
PGFzbS9ib290aW5mby5oPgorI2luY2x1ZGUgPGFzbS9mdy9jZmUvY2ZlX2FwaS5oPgorCiAjZGVm
aW5lIEJDTTk2M1hYX0NGRV9CTE9DS19TSVpFCQlTWl82NEsJLyogYWx3YXlzIGF0IGxlYXN0IDY0
S2lCICovCiAKICNkZWZpbmUgQkNNOTYzWFhfQ0ZFX01BR0lDX09GRlNFVAkweDRlMApAQCAtMzIs
MzAgKzM1LDYgQEAKICNkZWZpbmUgU1RSX05VTExfVEVSTUlOQVRFKHgpIFwKIAlkbyB7IGNoYXIg
Kl9zdHIgPSAoeCk7IF9zdHJbc2l6ZW9mKHgpIC0gMV0gPSAwOyB9IHdoaWxlICgwKQogCi1zdGF0
aWMgaW50IGJjbTYzeHhfZGV0ZWN0X2NmZShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlcikKLXsKLQlj
aGFyIGJ1Zls5XTsKLQlpbnQgcmV0OwotCXNpemVfdCByZXRsZW47Ci0KLQlyZXQgPSBtdGRfcmVh
ZChtYXN0ZXIsIEJDTTk2M1hYX0NGRV9WRVJTSU9OX09GRlNFVCwgNSwgJnJldGxlbiwKLQkJICAg
ICAgICh2b2lkICopYnVmKTsKLQlidWZbcmV0bGVuXSA9IDA7Ci0KLQlpZiAocmV0KQotCQlyZXR1
cm4gcmV0OwotCi0JaWYgKHN0cm5jbXAoImNmZS12IiwgYnVmLCA1KSA9PSAwKQotCQlyZXR1cm4g
MDsKLQotCS8qIHZlcnkgb2xkIENGRSdzIGRvIG5vdCBoYXZlIHRoZSBjZmUtdiBzdHJpbmcsIHNv
IGNoZWNrIGZvciBtYWdpYyAqLwotCXJldCA9IG10ZF9yZWFkKG1hc3RlciwgQkNNOTYzWFhfQ0ZF
X01BR0lDX09GRlNFVCwgOCwgJnJldGxlbiwKLQkJICAgICAgICh2b2lkICopYnVmKTsKLQlidWZb
cmV0bGVuXSA9IDA7Ci0KLQlyZXR1cm4gc3RybmNtcCgiQ0ZFMUNGRTEiLCBidWYsIDgpOwotfQot
CiBzdGF0aWMgaW50IGJjbTYzeHhfcmVhZF9udnJhbShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwK
IAlzdHJ1Y3QgYmNtOTYzeHhfbnZyYW0gKm52cmFtKQogewpAQCAtMTM4LDcgKzExNyw3IEBAIHN0
YXRpYyBpbnQgYmNtNjN4eF9wYXJzZV9jZmVfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1h
c3RlciwKIAlzdHJ1Y3QgYmNtOTYzeHhfbnZyYW0gKm52cmFtID0gTlVMTDsKIAlpbnQgcmV0Owog
Ci0JaWYgKGJjbTYzeHhfZGV0ZWN0X2NmZShtYXN0ZXIpKQorCWlmIChmd19hcmczICE9IENGRV9F
UFRTRUFMKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCW52cmFtID0gdnphbGxvYyhzaXplb2YoKm52
cmFtKSk7Ci0tIAoyLjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
