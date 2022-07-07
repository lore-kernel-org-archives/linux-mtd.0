Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353E3C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vEczAtxJawPbvNEeARMT5rPZDxcpWGoNBzv16PBlrMY=; b=g8dSS1RUM914gR
	sPa20EYJCyUslZX1wl9vN4ZO2Aw8Gp7FgmsJMTwHCOueSW+GbXDiPOzhabdmRW1X+k7lq9QxKd2KB
	WTyJDQd8asaH5a2ci+fj6gQyaKv4TF/6CKWsO/XU8neWSk+i24a9Vt/FeOPefcBDWZjvuZC7g0Jyq
	UNUgmG7yPo8fSnctoaZ/wx6HPkWg9Hs/GQhp/t0Q+n7EII7WxG3Vs90axjybDETj97UXAL6HzHWo3
	+N/PYFlPOw0PXXp+2e8PZXELGaCyz2Tfr1V6KNVKW69Xy7nyaF+60NUpWY8gcUub6IvvHn59m+y2P
	zqGXHa4lDz+9637NvHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9UUJ-00H0EW-Al; Thu, 07 Jul 2022 16:36:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9UUG-00H0CE-SJ
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 16:36:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id g1so16213637edb.12
        for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2022 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLHJBhKHjVuVR3mcBnbsIiyt4ymeaQeICW0gIztUwNk=;
        b=WtTIbV5NJdT9zJWs+mhSLRYyDgDLVvro/qoXQvONrI99p4YJdq9CJvunBXxk/s4flX
         2fSST51RQKynfZABj3JPYqMiqNhpxOrjfGEOsZopM40wCsc+a9IJGONgwTmCPuxj8F2N
         901RsE3W/IVPtf53qV+qeTwdwRmp8oB2buDdr/gQkn8pfV8Y1m/6DRWUT6F0vze+JhGJ
         nvkPnuMkGR5yLKqdA8e6iCG0N09O9rWjSCoqE1GZmKybAkqmkfj0m+LIsNEF/3LvSI45
         70EYoKn0jJm/WLgq+v7qN1VC+G7divIXTl+23AMGmWncLv1mEE2p/0H+AcrOfWwjCcc8
         QxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLHJBhKHjVuVR3mcBnbsIiyt4ymeaQeICW0gIztUwNk=;
        b=CGsf394a2+V/AFvMKOOMlz9lZ2XKrIaPvBnAXMMrSyf0BOQJJGkq3REOdpuIXEhdAL
         +AIL4n4yn0O1BytjMWQ43TVCZzvnHkEz5HlTrLHZzWz6ZcBLPvgjg4z5MzS37vW/NgXH
         X+rIRDUVhxZ9VHzbMgrDo2UCguYx0Cb3neOtUTU8ANpRpe2c1q1hq3XmoflnbvRyDxSj
         6s9duDKVx/jSetRhxLfvdXl6JdRqcC0yqVKQGxN3UkYAgnPrJETcGzWxa1LB8qYme1E8
         C75N2IypRLlX9YTMvsmQ4SmnlNBS6AAJAdZrx1wg2/iAHqE8WnLiMUlnEuTZ+XxQxAXj
         /IGA==
X-Gm-Message-State: AJIora+hq53wxwkoutRL3yxTO7oSxtJBKUxpnbSUkeP/iJtifAPQb74e
	ndb0w2J961UC+9yHdmgxzJQ=
X-Google-Smtp-Source: AGRyM1ukPWJPXLiuOVCJXJPl+hNENNGEsZ/ZCuSj7lSJ/+SZlZLgHpvXwZASVtuHy7YIqSlpb8HKQw==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr29336124edb.348.1657211777713;
        Thu, 07 Jul 2022 09:36:17 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t27-20020a17090616db00b0071cbc7487e1sm19009030ejd.69.2022.07.07.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:36:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] mtd: core: simplify (a bit) code find partition-matching dynamic OF node
Date: Thu,  7 Jul 2022 18:36:06 +0200
Message-Id: <20220707163607.20729-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_093620_956991_31C23460 
X-CRM114-Status: GOOD (  14.71  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKMS4gRG9uJ3QgaGFyZGNv
ZGUgInBhcnRpdGlvbi0iIHN0cmluZyB0d2ljZQoyLiBVc2Ugc2ltcGxlciBsb2dpYyAmIHVzZSAt
Pm5hbWUgdG8gYXZvaWQgb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoKQoKU2lnbmVkLW9mZi1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbXRkL210ZGNv
cmUuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCmluZGV4IGRjOWIzMzk5MDg5NS4uNzljNDQ3ZmUzMGI0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCkBA
IC01NzMsMTUgKzU3MywxNSBAQCBzdGF0aWMgdm9pZCBtdGRfY2hlY2tfb2Zfbm9kZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCkKIAogCS8qIFNlYXJjaCBpZiBhIHBhcnRpdGlvbiBpcyBkZWZpbmVkIHdp
dGggdGhlIHNhbWUgbmFtZSAqLwogCWZvcl9lYWNoX2NoaWxkX29mX25vZGUocGFydGl0aW9ucywg
bXRkX2RuKSB7Ci0JCW9mZnNldCA9IDA7Ci0KIAkJLyogU2tpcCBwYXJ0aXRpb24gd2l0aCBuby93
cm9uZyBwcmVmaXggKi8KLQkJaWYgKCFvZl9ub2RlX25hbWVfcHJlZml4KG10ZF9kbiwgInBhcnRp
dGlvbi0iKSkKKwkJaWYgKCFvZl9ub2RlX25hbWVfcHJlZml4KG10ZF9kbiwgcHJlZml4KSkKIAkJ
CWNvbnRpbnVlOwogCiAJCS8qIExhYmVsIGhhdmUgcHJpb3JpdHkuIENoZWNrIHRoYXQgZmlyc3Qg
Ki8KLQkJaWYgKG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKG10ZF9kbiwgImxhYmVsIiwgJnBuYW1l
KSkgewotCQkJb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobXRkX2RuLCAibmFtZSIsICZwbmFtZSk7
CisJCWlmICghb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobXRkX2RuLCAibGFiZWwiLCAmcG5hbWUp
KSB7CisJCQlvZmZzZXQgPSAwOworCQl9IGVsc2UgeworCQkJcG5hbWUgPSBtdGRfZG4tPm5hbWU7
CiAJCQlvZmZzZXQgPSBwcmVmaXhfbGVuOwogCQl9CiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
