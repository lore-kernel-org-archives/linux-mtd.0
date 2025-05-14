Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47381C3ABC5
	for <linux-mtd@archiver.kernel.org>; Wed, 14 May 2025 06:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JjHB6oZKGaolVsWexX1EYHiM/jySKUVrOL/potd9QxU=; b=mN3TNmieyhHL6h
	nkal+giwm7LsisFk9UxQjEdhS5ZHGrkFnFEyIA2hpF6YPYA24wmmJYOfKkSBTvUEdE5pQyoMrGQTD
	pJkbJa+LUIpsDAzVHDYDezAIYTON0XOsQhXtkXWcK/mxH5zSoJ1t4fJDZHlRloW9YyWd7/rMoDb0x
	yVjCJo9EwhddO7CfI/DJdWvCttj7oDWlmdDtw867dFe5L8JEESfuhrzWrAbWzrDyIa3sFoNqfm+d5
	qz3P+nCsAMPRUG7xPXQQ7K7JVE7mvLz386pwfO8H1cFTEWKlxrEpsDGH0hxtJJeIqk8yHpdMmGgG9
	YOzDEtRFgDioD20nbOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5QQ-0000000E8ta-1Ng7;
	Wed, 14 May 2025 06:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5QO-0000000E8t2-2G2U
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 May 2025 06:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NeVM2h2Stw1nFbFkEhu5d40BuDFNnEXXFXORIacGvH8=; b=ZG13lU87ORNjlOGB87x2UZur0v
	eEa9KEuivynhoeewzfUd1+v2kr6xqmHkl9Ty2U7NYupfM5JCkbuJ9U6Qlr5HT6u4YQNgf3YO1mIGQ
	3WhHRVZvaaocHTcoCq6P9LTaHlYCBs98N5gnO4Q/cXXRk5X2a8/N/iB1jxC2YDfCujxuaa/ht/KiW
	v2W5s/5IGnwZ7fXMezJeZTDqUDyLMB5545r+Q4271BzK5EHQqIQvVvrfYx3fbfgfvhPRk/flNfW7w
	VEVOwi4rhlari72JSZxMwYxD1pJd/DUNcPTvF57LGGCNLfB5RvDvr/Q5DFfyfb8fr5aYmYek6Gcaz
	pxCWr0bA==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uF5QK-0000000H5xR-3vs8
	for linux-mtd@lists.infradead.org;
	Wed, 14 May 2025 06:17:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so4511014f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 May 2025 23:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747203298; x=1747808098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeVM2h2Stw1nFbFkEhu5d40BuDFNnEXXFXORIacGvH8=;
        b=QfoU8Gfp0H0IW/i5Dr6Xw3DPGxU9KKc64x05562ZM+hGc6A9ktyScZL1CWDEie5zQE
         ajvymnFcF5pygqiI4ec4GMDyIZGKrMUZBq8yO8IX+EE2K2Lso+zP0gA8qn6ec52xapNd
         6NSr9GT1t1Y/kY9XXMLC45l9/4GmyVDXobBr15K6+aY8ERGa8L9k/c1xjD2wlQCrtmMH
         vGbhL0SZ/bSE7SsKJ6JUxpkQFygft2ljZLNYbgpCKNXNCmU2hRAXaXR2TSCHIYbtylPI
         ieC+yXGW9oTCsIeNY/4kLM29fbrpjNYlX/JRpN0Rs8Y/b5YLg0jeVface6lLpaK2BZ/B
         MLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203298; x=1747808098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeVM2h2Stw1nFbFkEhu5d40BuDFNnEXXFXORIacGvH8=;
        b=Oyz9aJjJO8I8KBOxiQFjMW3N0hwNqI0nqSkkKuZqwEukTPZ9kzWBF3jEIW1edYu1+4
         y+Nd7WcTnhzHH6ujb7dNXPaGyQ2qvUtSpvVgOEGhJqZ1gKtm647+Icmpbl2Vizn1oG+r
         nBh9Vc7/vzkmlK0gvR7FVpggsmjpx+C4pHYym9Cr7HnSDu9UXJ8fKNFFoJNNTd9UNZ3h
         rG/rasi2nwoP2U/FGyf4nJomY3duuHsGczjdAeSvcK/2X/fa5tiVk8pMVywEp/de6jJz
         YC4I7+KBOZNO6BzTWKb2e1G7mFZ12NtPWS8YawbPomNnVEr9fwFgHj2LcqorQysWtvex
         VOEA==
X-Forwarded-Encrypted: i=1; AJvYcCUvD8N8P5wXbx6bo+/dgo+RJ6g2XH20l1bv0n8bFYt4e8rZfNrBtdOUTfiK9M+IFPa1JL39dKwPOTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdY268Dpwy2oYTQKiai1kUpamYDRHERvHmAUW5nFux2Jp29mEj
	rhNomsxXyhT97+EloYqOqypwrKGS9OGqUH8nhk9oRET6rMoR3+T4
X-Gm-Gg: ASbGncu4d8X+kIfvIouIzxWONhkcRH6somP0F39qDmdrbUIqzaSegq8dtnevplLONSt
	+NQH6FwouMkHKbQWPW9Iy/vTggaVY4OypMR/IIo72Z1Rtkv2LvI6RrwChciiAmk6CQ6OhmP/yRh
	eWNcITLJ48IR4IbeG4v2D94X7rkWgQrH0yv/J3SiOEZxrCnSUQ4kSFC6YI/8SuoLQMFblHptrrt
	WdFIBlItWT5KIkSkTUCO445C0PNIkLH7AiW82J+sgsBL5vOUXg3conkezXNdk/xL62aUrj7vKK5
	dj97+343tLAOyl5WUqYdr3Gup/GEctxd3KWimKLZm6OeyHoyox+FCb3YMXl0dDbdIfsF8Gt32b0
	AXn1Q8oNghujGXsDOfPs25yQ16aOWQrrlk1LfZqi/kl1OYpuxlvc=
X-Google-Smtp-Source: AGHT+IGELleSe/EkJ657aNOlkflnr85dFaoekbo06RvE73Tj85o9n9teCannJWwIHe2q+LzdscPf6Q==
X-Received: by 2002:a5d:584d:0:b0:3a1:fe77:9e3d with SMTP id ffacd0b85a97d-3a34994bbbamr1373051f8f.37.1747203297707;
        Tue, 13 May 2025 23:14:57 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddff6sm18719531f8f.12.2025.05.13.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:14:57 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: dregan@broadcom.com,
	florian.fainelli@broadcom.com,
	computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
Date: Wed, 14 May 2025 08:14:54 +0200
Message-Id: <20250514061454.772340-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_071701_395992_D0A715BF 
X-CRM114-Status: GOOD (  11.24  )
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

bGFzdF9jbWQgYW5kIGxhc3RfYnl0ZSBhcmUgbm93IHVudXNlZCBicmNtbmFuZF9ob3N0IG1lbWJl
cnMuCmxhc3RfYWRkciBpcyBvbmx5IHdyaXR0ZW4gYW5kIG5ldmVyIHJlYWQgc28gd2UgY2FuIHJl
bW92ZSBpdCB0b28uCgpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5v
bHRhcmlAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zmxvcmlhbi5m
YWluZWxsaUBicm9hZGNvbS5jb20+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYyB8IDI0ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgogdjI6IGZpeCB1bnVzZWQgaG9zdCB2
YXJpYWJsZSB3YXJuaW5ncy4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
YwppbmRleCAxN2Y2ZDk3MjNkZjkuLjI5OWRkMmJjYTViNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0zMTAsOSArMzEwLDYgQEAgc3RydWN0IGJyY21uYW5k
X2hvc3QgewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UJKnBkZXY7CiAJaW50CQkJY3M7CiAKLQl1
bnNpZ25lZCBpbnQJCWxhc3RfY21kOwotCXVuc2lnbmVkIGludAkJbGFzdF9ieXRlOwotCXU2NAkJ
CWxhc3RfYWRkcjsKIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnCWh3Y2ZnOwogCXN0cnVjdCBicmNtbmFu
ZF9jb250cm9sbGVyICpjdHJsOwogfTsKQEAgLTIyMzMsMTQgKzIyMzAsMTEgQEAgc3RhdGljIGlu
dCBicmNtbmFuZF9yZWFkX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdWludDhfdCAqYnVm
LAogCQkJICAgICAgaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCiB7CiAJc3RydWN0IG10ZF9p
bmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKLQlzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9z
dCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKIAl1OCAqb29iID0gb29iX3JlcXVp
cmVkID8gKHU4ICopY2hpcC0+b29iX3BvaSA6IE5VTEw7CiAJdTY0IGFkZHIgPSAodTY0KXBhZ2Ug
PDwgY2hpcC0+cGFnZV9zaGlmdDsKIAotCWhvc3QtPmxhc3RfYWRkciA9IGFkZHI7Ci0KLQlyZXR1
cm4gYnJjbW5hbmRfcmVhZChtdGQsIGNoaXAsIGhvc3QtPmxhc3RfYWRkciwKLQkJCW10ZC0+d3Jp
dGVzaXplID4+IEZDX1NISUZULCAodTMyICopYnVmLCBvb2IpOworCXJldHVybiBicmNtbmFuZF9y
ZWFkKG10ZCwgY2hpcCwgYWRkciwgbXRkLT53cml0ZXNpemUgPj4gRkNfU0hJRlQsCisJCQkgICAg
ICh1MzIgKilidWYsIG9vYik7CiB9CiAKIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmVhZF9wYWdlX3Jh
dyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCkBAIC0yMjUyLDExICsyMjQ2
LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIHVpbnQ4X3QgKmJ1ZiwKIAlpbnQgcmV0OwogCXU2NCBhZGRyID0gKHU2NClwYWdlIDw8
IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAKLQlob3N0LT5sYXN0X2FkZHIgPSBhZGRyOwotCiAJYnJjbW5h
bmRfc2V0X2VjY19lbmFibGVkKGhvc3QsIDApOwotCXJldCA9IGJyY21uYW5kX3JlYWQobXRkLCBj
aGlwLCBob3N0LT5sYXN0X2FkZHIsCi0JCQltdGQtPndyaXRlc2l6ZSA+PiBGQ19TSElGVCwgKHUz
MiAqKWJ1Ziwgb29iKTsKKwlyZXQgPSBicmNtbmFuZF9yZWFkKG10ZCwgY2hpcCwgYWRkciwgbXRk
LT53cml0ZXNpemUgPj4gRkNfU0hJRlQsCisJCQkgICAgKHUzMiAqKWJ1Ziwgb29iKTsKIAlicmNt
bmFuZF9zZXRfZWNjX2VuYWJsZWQoaG9zdCwgMSk7CiAJcmV0dXJuIHJldDsKIH0KQEAgLTIzNjMs
MTMgKzIzNTUsMTAgQEAgc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9wYWdlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKIAkJCSAgICAgICBpbnQgb29iX3JlcXVp
cmVkLCBpbnQgcGFnZSkKIHsKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNo
aXApOwotCXN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0ID0gbmFuZF9nZXRfY29udHJvbGxlcl9k
YXRhKGNoaXApOwogCXZvaWQgKm9vYiA9IG9vYl9yZXF1aXJlZCA/IGNoaXAtPm9vYl9wb2kgOiBO
VUxMOwogCXU2NCBhZGRyID0gKHU2NClwYWdlIDw8IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAKLQlob3N0
LT5sYXN0X2FkZHIgPSBhZGRyOwotCi0JcmV0dXJuIGJyY21uYW5kX3dyaXRlKG10ZCwgY2hpcCwg
aG9zdC0+bGFzdF9hZGRyLCAoY29uc3QgdTMyICopYnVmLCBvb2IpOworCXJldHVybiBicmNtbmFu
ZF93cml0ZShtdGQsIGNoaXAsIGFkZHIsIChjb25zdCB1MzIgKilidWYsIG9vYik7CiB9CiAKIHN0
YXRpYyBpbnQgYnJjbW5hbmRfd3JpdGVfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
Y29uc3QgdWludDhfdCAqYnVmLApAQCAtMjM4MSw5ICsyMzcwLDggQEAgc3RhdGljIGludCBicmNt
bmFuZF93cml0ZV9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1aW50OF90
ICpidWYsCiAJdTY0IGFkZHIgPSAodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdDsKIAlpbnQg
cmV0ID0gMDsKIAotCWhvc3QtPmxhc3RfYWRkciA9IGFkZHI7CiAJYnJjbW5hbmRfc2V0X2VjY19l
bmFibGVkKGhvc3QsIDApOwotCXJldCA9IGJyY21uYW5kX3dyaXRlKG10ZCwgY2hpcCwgaG9zdC0+
bGFzdF9hZGRyLCAoY29uc3QgdTMyICopYnVmLCBvb2IpOworCXJldCA9IGJyY21uYW5kX3dyaXRl
KG10ZCwgY2hpcCwgYWRkciwgKGNvbnN0IHUzMiAqKWJ1Ziwgb29iKTsKIAlicmNtbmFuZF9zZXRf
ZWNjX2VuYWJsZWQoaG9zdCwgMSk7CiAKIAlyZXR1cm4gcmV0OwotLSAKMi4zOS41CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
