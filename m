Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E007CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C56E207ED
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2XyTi7B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVxEWGAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C56E207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUDpWncYk8ySVPYzdXy/xTm/ez30IkT+lcuhp7X7B3I=; b=u2XyTi7BDxbjLS
	bwW0jL3LuiL4TO9PNyVIfctMVntO2W0jM5r73pdxrftMrQnjF91l1wQTjbxx6vQ60y2P8NFhtMxYw
	LBAd0MMAbUuBk2z1fXFvypwkGuP4WWmhyOU5gHQ1evhc9dVduzDTKvyB1V8CC9XNOgROqFJTwYrgw
	/aoWa0ZTzEzDxYdgNMVJxCMJZ0v87gHUvKK8O+Jr78bEErVC+q13M74PytQ9EKZJCBAUpMFU84g6w
	n1rtVHIL7LAYnIGkrPCCnx2HFIa6gNz0WGKrJcIB4ej/9azwyztyM6hMR635brQFFv3LMheqnCzfR
	Y+bOXSkh8lMq0J+Ifr6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjeES-0005K9-Hq; Fri, 12 Jun 2020 07:36:08 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjeED-0005Ax-UN; Fri, 12 Jun 2020 07:35:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id l11so8683196wru.0;
 Fri, 12 Jun 2020 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+dRr0+LqXIl7Im4UO44miDTuI38sVf6D3sGaM7BzTw=;
 b=TVxEWGAFYaT7Abyc6rM/L/LAQewp9ZFr4x0CqCfwUknqU4gB6N64hJXnjQ0tLBW1nj
 t1xpJ2B+fWTAsOlOe2LgEkv9sw1Rws6uYFpNC+fprC/cgvGx78PZnD9fiK7v5QHB9BBe
 p001z7xrik0ysWNGlBdRCIdQhVHJ2i7841wW9DkGsYZFOBz7AiWHdhNdZjv3ugH/qTpX
 8S3k02koXX91fHvjOYx9KRm7WSh1DDnMV76BpmwiG7BKHqJ9uCva+KqgztLb1vpsvwvT
 XPGho0bR7/RdnzsFKa5jnXu7mP9vN1EQu9PcOrjlAweqJVPcUGrEybolvfF8YtqJjsjr
 OhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+dRr0+LqXIl7Im4UO44miDTuI38sVf6D3sGaM7BzTw=;
 b=D3Vbe2/2qiUmyEh7nu3ZGOSaWciLA6DpmfmZ8B/oGv470vWXJPOr4tRy4YvZ34UCem
 Bxixp200nkLIAtCrhGhAxVwBEut46vVWImNkuJlx2KHo7SRem7yduvBhNBGDAFTHy8sk
 FDWoXBFT0VviOgsth4gqVT8QkDhmFL7hF6k4ExgSzRG94yu8ZIebKKVlxLyg37nOdatH
 4zPvn3oq06R64/8dD/VUMafRmpgGog5RxPSqQ5XhgUpsJ/vP3QPV/foiR/berY3TRqyc
 4TrPwZbEM/iTLqcKYwemkaULTVifWoTK9ej3l+r1KOx51lGzb9+pZE7FaCJCkRxTeF45
 OHKw==
X-Gm-Message-State: AOAM530NhkwKqxie4UkS7zQOSnT7N49aNSCOYdSI3PD/ll67EYRbhgcJ
 rfquloBwckMtUUxR6Qy2Vls=
X-Google-Smtp-Source: ABdhPJxOsgd6flPA0JCauNhh1ZlR45HzUiPV+lbPcExOT9NWKh6pnzfSbwJJpTuxHF33g4XFITkT0Q==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr14341234wrw.179.1591947352233; 
 Fri, 12 Jun 2020 00:35:52 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net.
 [83.49.61.28])
 by smtp.gmail.com with ESMTPSA id a1sm7729914wmd.28.2020.06.12.00.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 00:35:51 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: tsbogend@alpha.franken.de, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: parsers: bcm63xx: simplify CFE detection
Date: Fri, 12 Jun 2020 09:35:49 +0200
Message-Id: <20200612073549.1658336-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608160649.3717152-1-noltari@gmail.com>
References: <20200608160649.3717152-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_003553_996680_929C6D11 
X-CRM114-Status: GOOD (  11.54  )
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
PGpvbmFzLmdvcnNraUBnbWFpbC5jb20+Ci0tLQogdjM6IGtlZXAgQ09NUElMRV9URVNUIGNvbXBh
dGliaWxpdHkgYnkgYWRkaW5nIGEgbmV3IGZ1bmN0aW9uIHRoYXQgb25seSBjaGVja3MKICAgICBm
d19hcmczIHdoZW4gQ09ORklHX01JUFMgaXMgZGVmaW5lZC4KIHYyOiB1c2UgQ0ZFX0VQVFNFQUwg
ZGVmaW5pdGlvbiBhbmQgYXZvaWQgdXNpbmcgYW4gYWRkaXRpb25hbCBmdW5jdGlvbi4KCiBkcml2
ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgfCAzNCArKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIGIvZHJp
dmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCmluZGV4IDc4ZjkwYzZjMThmZC4uYzUxNGMw
NDc4OWFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMKKysr
IGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCkBAIC0yMiw2ICsyMiwxMSBAQAog
I2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4K
IAorI2lmZGVmIENPTkZJR19NSVBTCisjaW5jbHVkZSA8YXNtL2Jvb3RpbmZvLmg+CisjaW5jbHVk
ZSA8YXNtL2Z3L2NmZS9jZmVfYXBpLmg+CisjZW5kaWYgLyogQ09ORklHX01JUFMgKi8KKwogI2Rl
ZmluZSBCQ005NjNYWF9DRkVfQkxPQ0tfU0laRQkJU1pfNjRLCS8qIGFsd2F5cyBhdCBsZWFzdCA2
NEtpQiAqLwogCiAjZGVmaW5lIEJDTTk2M1hYX0NGRV9NQUdJQ19PRkZTRVQJMHg0ZTAKQEAgLTMy
LDI4ICszNywxMyBAQAogI2RlZmluZSBTVFJfTlVMTF9URVJNSU5BVEUoeCkgXAogCWRvIHsgY2hh
ciAqX3N0ciA9ICh4KTsgX3N0cltzaXplb2YoeCkgLSAxXSA9IDA7IH0gd2hpbGUgKDApCiAKLXN0
YXRpYyBpbnQgYmNtNjN4eF9kZXRlY3RfY2ZlKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyKQorc3Rh
dGljIGlubGluZSBpbnQgYmNtNjN4eF9kZXRlY3RfY2ZlKHZvaWQpCiB7Ci0JY2hhciBidWZbOV07
Ci0JaW50IHJldDsKLQlzaXplX3QgcmV0bGVuOwotCi0JcmV0ID0gbXRkX3JlYWQobWFzdGVyLCBC
Q005NjNYWF9DRkVfVkVSU0lPTl9PRkZTRVQsIDUsICZyZXRsZW4sCi0JCSAgICAgICAodm9pZCAq
KWJ1Zik7Ci0JYnVmW3JldGxlbl0gPSAwOwotCi0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQot
CWlmIChzdHJuY21wKCJjZmUtdiIsIGJ1ZiwgNSkgPT0gMCkKLQkJcmV0dXJuIDA7Ci0KLQkvKiB2
ZXJ5IG9sZCBDRkUncyBkbyBub3QgaGF2ZSB0aGUgY2ZlLXYgc3RyaW5nLCBzbyBjaGVjayBmb3Ig
bWFnaWMgKi8KLQlyZXQgPSBtdGRfcmVhZChtYXN0ZXIsIEJDTTk2M1hYX0NGRV9NQUdJQ19PRkZT
RVQsIDgsICZyZXRsZW4sCi0JCSAgICAgICAodm9pZCAqKWJ1Zik7Ci0JYnVmW3JldGxlbl0gPSAw
OwotCi0JcmV0dXJuIHN0cm5jbXAoIkNGRTFDRkUxIiwgYnVmLCA4KTsKKyNpZmRlZiBDT05GSUdf
TUlQUworCXJldHVybiAoZndfYXJnMyA9PSBDRkVfRVBUU0VBTCk7CisjZWxzZQorCXJldHVybiAw
OworI2VuZGlmIC8qIENPTkZJR19NSVBTICovCiB9CiAKIHN0YXRpYyBpbnQgYmNtNjN4eF9yZWFk
X252cmFtKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLApAQCAtMTM4LDcgKzEyOCw3IEBAIHN0YXRp
YyBpbnQgYmNtNjN4eF9wYXJzZV9jZmVfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3Rl
ciwKIAlzdHJ1Y3QgYmNtOTYzeHhfbnZyYW0gKm52cmFtID0gTlVMTDsKIAlpbnQgcmV0OwogCi0J
aWYgKGJjbTYzeHhfZGV0ZWN0X2NmZShtYXN0ZXIpKQorCWlmICghYmNtNjN4eF9kZXRlY3RfY2Zl
KCkpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJbnZyYW0gPSB2emFsbG9jKHNpemVvZigqbnZyYW0p
KTsKLS0gCjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
