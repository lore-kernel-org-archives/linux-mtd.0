Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F31C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Z0oRUrhOvdlNB4W9tsguwm9ERrMWsASHdC82vc+wxQ=; b=iGcHHLtkU8+2Ym
	YqExJLWrNJpiG/2f0LB1+hjAA3TRhhTUPOkmWFiWGQlr+JBiv68fhhiRL9+gY746NwjPULCyKxch7
	0zRgMYWQcsUQF9CJ9TJWKRIzpZAU9SMfDfpPoIFvDRUWMfi+Oog/haNEiASewiuYIDvb8I5bApErd
	QLqUMlHGmjQK337hINzqWrOgYkC0Zeg4VVVI8zl5qwqj3cgid3gqdkFQL1BHGzCFBvE0mr/LKlikn
	QbIxXOZJ6bSd+qBWtFWAWkvdzpdqlCYMnFyo8WMHUURnmJ+CyTKaR2k0mMQV6IJtlMkifBbn1zQq+
	DLulDb/rWW5GHx+P5Ggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YvE-00G6iq-Lh; Wed, 15 Jun 2022 19:43:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Yv3-00G6e7-Ia; Wed, 15 Jun 2022 19:43:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id g25so25237244ejh.9;
        Wed, 15 Jun 2022 12:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeAaQxHNgpvGGApabF2dZ5cx3n1PATnxM0M/iIuIjaA=;
        b=k14tMQCVOVeOrgEvHimQMUqpKcCa52Ahn9gpZ0rCs6UBPmduwGS/RyEeSxGl32iBsa
         6sdJ2TwTf6gszE58GZjCVQJGrDA8gpYriykjwER+3ZPpzBx0LofuIzLo3P27yLoq7fgW
         7Rt6xQ+cd9bin8kCAxVf9OAmEkf0xoPvJLzAq1UnhUnZXXHDizAgllKcQfoCJgc78lH8
         f21xjPvnjHZJTTHcF5sfaryaMZuoSMBC9rM7poPFB2MPk1aJEBojUV7SB2CYo3Di4L+B
         +NVJ/3Qlpw2Fql50DHr+uEEqIoYmTRaMWDB+tUmgCak9rIhAlxwXqizC2JzH6fYVEb/l
         H8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeAaQxHNgpvGGApabF2dZ5cx3n1PATnxM0M/iIuIjaA=;
        b=hjjgeypoLv5nAGKAGUbZ8V0HOZC4RLTbVAib96QEraTvYaXL1xeY7LKrvYLq2NcN0D
         L83jiET3d4FhfhMbrlEIdoMoLMW30MroKp5i1ymot8Q/1eyGaZPSGjZ93Q+ZUUw6Kluz
         GTXTZ6g5+W0m+CnP03Tzgl9M6rpbEjoqUD1xnqGJRWAm28jif5z/Tf+RFhUhctqeOrCe
         EXoH9sCf7w8EE09JVjLFeqvSnrx07E75VZPj08Ssaf2h4ulMBoW3KF5c9FMFCEllT/rd
         VfnWhCUMWkpJ+GKzNAW1D6NDwDWZWqIjky9f4Po0sILigtEzxXB5smZnCqZMKU2LCm2y
         Q4YQ==
X-Gm-Message-State: AJIora8g5cL+DAYc+oOtV4MHDBXCBqOAqc2Fq8YUm782Ep8aA7D7b1iW
	CampsbQ8IZl2t1/uzG0lOXw=
X-Google-Smtp-Source: AGRyM1sAO6s8WrkND9IqSLFNkOoSsbBsyq8tmeli3+/6WTSIMEkds8HRFI63vvFEhffvyAQFIfxN2g==
X-Received: by 2002:a17:906:9244:b0:70c:f626:944d with SMTP id c4-20020a170906924400b0070cf626944dmr1300802ejx.496.1655322191129;
        Wed, 15 Jun 2022 12:43:11 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d750000000b0042bd6f745fasm18096eds.92.2022.06.15.12.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 12:43:10 -0700 (PDT)
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
Subject: [PATCH V4 1/2] mtd: allow getting MTD device associated with a specific DT node
Date: Wed, 15 Jun 2022 21:42:59 +0200
Message-Id: <20220615194300.13358-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_124313_660514_64CF3D2A 
X-CRM114-Status: GOOD (  13.73  )
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
ZmFsQG1pbGVja2kucGw+CkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgotLS0KVjM6IEZpcnN0IGludHJvZHVjdGlvbiBvZiBvZl9nZXRfbXRkX2Rldmlj
ZV9ieV9ub2RlKCkKVjQ6IFVzZSBFUFJPQkVfREVGRVIKClNyaW5pdmFzOiBpbiBWMyBNaXF1ZWwg
c2FpZCBpdCdzIE9LIHRvIHB1c2ggdGhpcyBwYXRjaCB0aHJvdWdoIE5WTUVNIAotLS0KIGRyaXZl
cnMvbXRkL210ZGNvcmUuYyAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5j
bHVkZS9saW51eC9tdGQvbXRkLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9t
dGRjb3JlLmMKaW5kZXggOWViMDY4MGRiMzEyLi4zNjEzY2MxNDJmMjUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYworKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTExNTQs
NiArMTE1NCwzNCBAQCBpbnQgX19nZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkK
IH0KIEVYUE9SVF9TWU1CT0xfR1BMKF9fZ2V0X210ZF9kZXZpY2UpOwogCisvKioKKyAqIG9mX2dl
dF9tdGRfZGV2aWNlX2J5X25vZGUgLSBvYnRhaW4gYW4gTVREIGRldmljZSBhc3NvY2lhdGVkIHdp
dGggYSBnaXZlbiBub2RlCisgKgorICogQG5wOiBkZXZpY2UgdHJlZSBub2RlCisgKi8KK3N0cnVj
dCBtdGRfaW5mbyAqb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wKQoreworCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gTlVMTDsKKwlzdHJ1Y3QgbXRkX2luZm8g
KnRtcDsKKwlpbnQgZXJyOworCisJbXV0ZXhfbG9jaygmbXRkX3RhYmxlX211dGV4KTsKKworCWVy
ciA9IC1FUFJPQkVfREVGRVI7CisJbXRkX2Zvcl9lYWNoX2RldmljZSh0bXApIHsKKwkJaWYgKG10
ZF9nZXRfb2Zfbm9kZSh0bXApID09IG5wKSB7CisJCQltdGQgPSB0bXA7CisJCQllcnIgPSBfX2dl
dF9tdGRfZGV2aWNlKG10ZCk7CisJCQlicmVhazsKKwkJfQorCX0KKworCW11dGV4X3VubG9jaygm
bXRkX3RhYmxlX211dGV4KTsKKworCXJldHVybiBlcnIgPyBFUlJfUFRSKGVycikgOiBtdGQ7Cit9
CitFWFBPUlRfU1lNQk9MX0dQTChvZl9nZXRfbXRkX2RldmljZV9ieV9ub2RlKTsKKwogLyoqCiAg
KglnZXRfbXRkX2RldmljZV9ubSAtIG9idGFpbiBhIHZhbGlkYXRlZCBoYW5kbGUgZm9yIGFuIE1U
RCBkZXZpY2UgYnkKICAqCWRldmljZSBuYW1lCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210
ZC9tdGQuaCBiL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCmluZGV4IDk1NWFlZTE0YjBmNy4uNmZj
ODQxY2VlZjMxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAorKysgYi9pbmNs
dWRlL2xpbnV4L210ZC9tdGQuaApAQCAtNjc3LDYgKzY3Nyw3IEBAIGV4dGVybiBpbnQgbXRkX2Rl
dmljZV91bnJlZ2lzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyKTsKIGV4dGVybiBzdHJ1Y3Qg
bXRkX2luZm8gKmdldF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgbnVtKTsK
IGV4dGVybiBpbnQgX19nZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7CiBleHRl
cm4gdm9pZCBfX3B1dF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKTsKK2V4dGVybiBz
dHJ1Y3QgbXRkX2luZm8gKm9mX2dldF9tdGRfZGV2aWNlX2J5X25vZGUoc3RydWN0IGRldmljZV9u
b2RlICpucCk7CiBleHRlcm4gc3RydWN0IG10ZF9pbmZvICpnZXRfbXRkX2RldmljZV9ubShjb25z
dCBjaGFyICpuYW1lKTsKIGV4dGVybiB2b2lkIHB1dF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5m
byAqbXRkKTsKIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
