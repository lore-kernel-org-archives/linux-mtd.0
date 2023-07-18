Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9AAEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HSWAMLTFGus+x9gXsSTNOA+UoDKb1fyYH9xIX/2tk2E=; b=OJBWMd/3StTqiU
	GbxHp7OTIO3QlVa7sb5TOjp+x0RMeHCMpK4mcut5Pcf3VFZ3QiEtassEXrnsOo2ifgRlkomNJ4QdV
	PWRHicgT02tsCtrYv0nabnrZ4hUsl6DYgQ0ayuB5CNQsMsVDi1T2QwQaGL2cdmFaWNrudp/qy7NFF
	t3jB4jtO2wwJbex1iJeV+qY0VN2T4qnvHQYzRgH2fvIKioCHKoprkC+udwcdyh8ocwLUus6ot7zQW
	V046UqiTE948unu954MtJ6jdakEN0zF04JsHvJcphbr35B/oL7Lwoikk7eVIUPYgrWjfGtNN1N3iu
	o7d3a8ewFUXw1EN+R4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Eb-006ENp-0L;
	Wed, 19 Jul 2023 08:08:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2EZ-006EMn-28
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dms8vT3LbWV2xoMki+URj5TVToq0zQb0Wlc+IcwUy+w=; b=UCj/ztQpgizosHcLnbrwEqnY/k
	iFYvP6idze3fKCKi0jpfW2dtSp37AMZMOdP7JTQnQVjUJ6+imSA/TPKGuP0LHqg/czNHXgQ712K6u
	fzV6XsOC72v4XJa0t7G6ow7dS2YHhroRYIS3uqrq5nRjbDK2skPeRkYKjD9cCX6gwbFoFS2LvFewu
	r0JwSLGxNR7d/IrAmNMJ1fn1YXB+ms4DW0Bdu33fspUsur/hVvNrt/sp5ud0HieEGIOxulk1n+7mm
	wxcH9FXUBx/7nQHLufwyp36tRmVgTgYV3HniQMyi+h9ts0z/Ws6NzCIm2AgHb1Fp630Y5ZmOXXF8C
	f/Y5qfDg==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnev-00Bl9Y-1y
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 16:34:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso9593836e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 09:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689698023; x=1692290023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dms8vT3LbWV2xoMki+URj5TVToq0zQb0Wlc+IcwUy+w=;
        b=CkuKsoKGX6U9dWhthd/X2vSZOpFFtXLPq00VVLFxhcUd6BlzcFADtoD8A19IAApk1x
         8QQlUNcEfH/pohBc01/4E7JDOy2PBBI17XaEWxLbHBuJ1EzJh0KxZ0c2T/jqYnUMUTuY
         jFIOBRKBF3T7RJ78HzaMN6StHgs2Js3VoAgJnKwOHHiBws2fCKUw0cR8KLNsl+v/B1Sd
         GfOj0RYUG1DB9svWzgYDk/MLzHL9npl8JGyqSSw1gieYW4yiRdztVCJG1IBDKKtJvHzC
         ztBcVdtqyj+jtdUcTrW138jTEiCcTN5Vu2PNXJj4GNvI5wOhvdMl3aAZGbrJAUiSWu6L
         aqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689698023; x=1692290023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dms8vT3LbWV2xoMki+URj5TVToq0zQb0Wlc+IcwUy+w=;
        b=aZvEGKAWHRYIMSre+peS9zvqbEiPo7fXoLutX/d7LskdaCdzT45H/WqlOl+PGiYulB
         RMFVsaaKR2+lcxAMxn5VZqFN9kTNfNt83BoC15owaR0K4j3sGPKkQyg6NnPMx9R8lQ0n
         4ExiDDP50SiKw0ymr7pAFVy6EANoFUvxKGnIW7iIbYnuksIEr3kJaETh2ypTX2yLY/h/
         gSJ5h0Pr7RQ1OXDmB/OB8ro3jV5JLV/ZkptKhRrrwWxJ+BBe2dmgO4VZVq3JJHiOg+Z0
         lrrh04m2bOqLg8ogbEmbL/G63GYhCiG9tR32tVRhTY1AbbB2pPdXMwXRkyfANSJYMnG5
         2/eQ==
X-Gm-Message-State: ABy/qLaOKyTh2PRxizMlHf9J5Wn0KdUXnMaGQacrYTFpdv4wS7+KZpOv
	K1D1JtMeE7j0XCkrGZGoRdE=
X-Google-Smtp-Source: APBJJlGb4woUVSCroydLKZ8g8rJhad5FBI9Se4LpaN8EmrS121cPQMKA6pHwWWPHmxN0TKo62f6bDQ==
X-Received: by 2002:a05:6512:210a:b0:4f6:6b:a43b with SMTP id q10-20020a056512210a00b004f6006ba43bmr9203838lfr.52.1689698022470;
        Tue, 18 Jul 2023 09:33:42 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id q26-20020ac2511a000000b004f76684329esm500480lfb.234.2023.07.18.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:33:41 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: rawnand: brcmnand: propagate init error -EPROBE_DEFER up
Date: Tue, 18 Jul 2023 18:33:31 +0200
Message-Id: <20230718163331.9116-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_173445_959568_33589087 
X-CRM114-Status: GOOD (  11.14  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTVREIHN1YnN5c3RlbSBt
YXkgcmV0dXJuIC1FUFJPQkVfREVGRVIgaWYgc29tZXRoaW5nIGlzbid0IHJlYWR5IHlldC4KSXQn
cyBpbXBvcnRhbnQgdG8gcGFzcyB0aGF0IGVycm9yIHVwIHNvIGRldmljZSB3aWxsIGdldCBwcm9i
ZWQgbGF0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYwppbmRleCAzOTY2MWUyM2Q3ZDQuLmNjYTJiMTUzYWUyNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0zMjQ1LDYgKzMyNDUsOCBA
QCBpbnQgYnJjbW5hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0
IGJyY21uYW5kX3NvYyAqc29jKQogCiAJCQlyZXQgPSBicmNtbmFuZF9pbml0X2NzKGhvc3QsIE5V
TEwpOwogCQkJaWYgKHJldCkgeworCQkJCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikKKwkJCQkJ
Z290byBlcnI7CiAJCQkJZGV2bV9rZnJlZShkZXYsIGhvc3QpOwogCQkJCWNvbnRpbnVlOyAvKiBU
cnkgYWxsIGNoaXAtc2VsZWN0cyAqLwogCQkJfQotLSAKMi4zNS4zCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
