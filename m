Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679EAC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jun 2022 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yc/AQNo4ZAtZHiRjtD2c4PaPIFXWyqLQx1f2KTqFT44=; b=flQ0lBqNWNudvN
	Rd011jKdocMbbONHMNlC9xFY5RMghMBXYjWF7Y6nqvyuyDVFIm13huFV3bpMgEv87S1BJtTMufUes
	5WqnuaGeTb5HK0Hz/MXxRiXlopYQBm1m5e02LzEOieFoVOWXARtHZEb42f0N7MV4BoRqD9fbuHWpC
	gMq6Lki+xAu0wuqsrfuugkt5bVXwZqRE1lLB/k2DFwqwNv/Ke2rKwDEwY5w2KL6U5zWE11tVHQQey
	UwXwTUw2kbx/Qq3hVTDfQ0lhd0XdbQyiL/uVexaXZF6FirpGOVk0Jccp0DWmKtBA/ByZ26m/lgAqa
	/+iMGaAj5puEGWm7dZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o080z-00EU7Z-Mi; Sat, 11 Jun 2022 20:47:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o080m-00EU56-Ep; Sat, 11 Jun 2022 20:47:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id h23so4101735ejj.12;
        Sat, 11 Jun 2022 13:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVeFonmBJ+8ElS2S3DJZc1evp03zBLOPTs54ViZe9rI=;
        b=VNhZ4ylxFT+9aZ3DF1PBnm574in+3ZH0iAhReGS6WJYBSQ6cGlPLsZar5dVJTbxnT6
         I0u6TWviVpZbZecoivK+BeYpDGn972LHbC3AIv+343GxvBDm6BYzwhplxMtQfwLvOlqo
         Lm78Rh+LRB/pt1MZHzsAYrrkWzd3G+DF696jYUibKGieF/4IPKLjSZncF+Dh64rxNIx4
         T1wvW9gvRJJpjAvmLqrdjYjZN9Hpi4+pKjH8anxdOsW37eCYYIp4kls/yhLI/BgwMi0U
         8Ydxmd6LAvWNzd7x6VwwcpzfXEikmFSU6fm5nzmi04+9lHk0pc7gBP6YlZOtC9KhRLkW
         dRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVeFonmBJ+8ElS2S3DJZc1evp03zBLOPTs54ViZe9rI=;
        b=VG//MwZ4p5jIIt+Xmz/l4wryLZST7GU52LMSiYXG/DDA6EGPw9vWshFy9l6UJtcq2f
         5FeJE5Wr8eF4stird8wlgPuxGwofoP5/r8J3M5PKeEdccBwMaYQPJStoIGNdZsnbu9tx
         Tm9QI7nRXObx04YpM15zmfn5QxbDg8bz3qE3HDMhJIncoELhNBzTlmdrVayLl32qYwht
         2FcFmzpaYOxGC3DRoychEm8F2/DBRoEbF6Fd7NREY1MBPLclgeJQ11ZEoL4JQDIVsHOt
         M3BsXkSKUTuY1gzsEk7aMNM4N76kqgo6PcS/kcpCz8tR9+VtXTOLE1nOLSAlebYW4GdR
         9nZQ==
X-Gm-Message-State: AOAM5331PoU4n5I8fW95fVoyylXUlciFKzPl8Y5r/cBZfZT5aDmcG6c1
	SFZJZ+G09pZOf1/dYwUHzb8=
X-Google-Smtp-Source: ABdhPJxJaEekiae9+T38NAh/Cbqf/UH8IJceqQ9PqWUff+jhXYrvlmHH7HyeVTNnd0V2hLZEv49f3g==
X-Received: by 2002:a17:906:9244:b0:70c:f626:944d with SMTP id c4-20020a170906924400b0070cf626944dmr41572371ejx.496.1654980429683;
        Sat, 11 Jun 2022 13:47:09 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906301600b006f52dbc192bsm1490672ejz.37.2022.06.11.13.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 13:47:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 1/2] mtd: allow getting MTD device associated with a specific DT node
Date: Sat, 11 Jun 2022 22:46:50 +0200
Message-Id: <20220611204651.19947-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_134712_565758_F2E4BB83 
X-CRM114-Status: GOOD (  13.20  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTVREIHN1YnN5c3RlbSBB
UEkgYWxsb3dzIGludGVyYWN0aW5nIHdpdGggTVREIGRldmljZXMgKGUuZy4gcmVhZGluZywKd3Jp
dGluZywgaGFuZGxpbmcgYmFkIGJsb2NrcykuIFNvIGZhciBhIHJhbmRvbSBkcml2ZXIgY291bGQg
Z2V0IE1URApkZXZpY2Ugb25seSBieSBpdHMgbmFtZSAoZ2V0X210ZF9kZXZpY2Vfbm0oKSkuIFRo
aXMgY2hhbmdlIGFsbG93cwpnZXR0aW5nIHRoZW0gYWxzbyBieSBhIERUIG5vZGUuCgpUaGlzIEFQ
SSBpcyByZXF1aXJlZCBmb3IgZHJpdmVycyBoYW5kbGluZyBEVCBkZWZpbmVkIE1URCBwYXJ0aXRp
b25zIGluIGEKc3BlY2lmaWMgd2F5IChlLmcuIFUtQm9vdCAoc3ViKXBhcnRpdGlvbiB3aXRoIGVu
dmlyb25tZW50IHZhcmlhYmxlcykuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Ci0tLQpWMzogRmlyc3QgaW50cm9kdWN0aW9uIG9mIG9mX2dldF9tdGRf
ZGV2aWNlX2J5X25vZGUoKQoKbXRkIG1haW50YWluZXJzOiBwbGVhc2UgbGV0IGtub3cgaG93IHdv
dWxkIHlvdSBsaWtlIHRoaXMgcGF0Y2gKcHJvY2Vzc2VkLiBXb3VsZCB0aGF0IGJlIE9LIGZvciB5
b3UgdG8gUmV2aWV3L0FjayBpdCBhbmQgbGV0IGl0IGdvCnRocm91Z2ggTlZNRU0gdHJlZT8KLS0t
CiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIGluY2x1ZGUvbGludXgvbXRkL210ZC5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCmluZGV4IDllYjA2ODBkYjMxMi4uN2RjMjE0MjcxYzg1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCkBA
IC0xMTU0LDYgKzExNTQsMzQgQEAgaW50IF9fZ2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZv
ICptdGQpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChfX2dldF9tdGRfZGV2aWNlKTsKIAorLyoqCisg
KiBvZl9nZXRfbXRkX2RldmljZV9ieV9ub2RlIC0gb2J0YWluIGFuIE1URCBkZXZpY2UgYXNzb2Np
YXRlZCB3aXRoIGEgZ2l2ZW4gbm9kZQorICoKKyAqIEBucDogZGV2aWNlIHRyZWUgbm9kZQorICov
CitzdHJ1Y3QgbXRkX2luZm8gKm9mX2dldF9tdGRfZGV2aWNlX2J5X25vZGUoc3RydWN0IGRldmlj
ZV9ub2RlICpucCkKK3sKKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IE5VTEw7CisJc3RydWN0IG10
ZF9pbmZvICp0bXA7CisJaW50IGVycjsKKworCW11dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7
CisKKwllcnIgPSAtRU5PREVWOworCW10ZF9mb3JfZWFjaF9kZXZpY2UodG1wKSB7CisJCWlmICht
dGRfZ2V0X29mX25vZGUodG1wKSA9PSBucCkgeworCQkJbXRkID0gdG1wOworCQkJZXJyID0gX19n
ZXRfbXRkX2RldmljZShtdGQpOworCQkJYnJlYWs7CisJCX0KKwl9CisKKwltdXRleF91bmxvY2so
Jm10ZF90YWJsZV9tdXRleCk7CisKKwlyZXR1cm4gZXJyID8gRVJSX1BUUihlcnIpIDogbXRkOwor
fQorRVhQT1JUX1NZTUJPTF9HUEwob2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSk7CisKIC8qKgog
ICoJZ2V0X210ZF9kZXZpY2Vfbm0gLSBvYnRhaW4gYSB2YWxpZGF0ZWQgaGFuZGxlIGZvciBhbiBN
VEQgZGV2aWNlIGJ5CiAgKglkZXZpY2UgbmFtZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
dGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAppbmRleCA5NTVhZWUxNGIwZjcuLjZm
Yzg0MWNlZWYzMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKKysrIGIvaW5j
bHVkZS9saW51eC9tdGQvbXRkLmgKQEAgLTY3Nyw2ICs2NzcsNyBAQCBleHRlcm4gaW50IG10ZF9k
ZXZpY2VfdW5yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm1hc3Rlcik7CiBleHRlcm4gc3RydWN0
IG10ZF9pbmZvICpnZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IG51bSk7
CiBleHRlcm4gaW50IF9fZ2V0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpOwogZXh0
ZXJuIHZvaWQgX19wdXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7CitleHRlcm4g
c3RydWN0IG10ZF9pbmZvICpvZl9nZXRfbXRkX2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnApOwogZXh0ZXJuIHN0cnVjdCBtdGRfaW5mbyAqZ2V0X210ZF9kZXZpY2Vfbm0oY29u
c3QgY2hhciAqbmFtZSk7CiBleHRlcm4gdm9pZCBwdXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCk7CiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
