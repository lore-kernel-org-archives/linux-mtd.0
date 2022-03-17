Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50469C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IWxpf7xCCqFqef3FgWzjMRWfD2w2wSsOdFeqltDEbW4=; b=aFPTjhhTQFSIMh
	bFrL0zjklQ/iLLwLisfzBGlzQmX0DHZP9FY4DM/NzgJNWAgGsEgoWusgJD6sD7VYReQqrFGuej5HB
	6Cso8/ftXKt7ZeEd4CstbL+2tQShvnHtpSyDdEfpJV9NwRxUKeYHrth+CwV4JYnuN6iDC8oBmT9Kn
	xTax/OELHQ0gmabLV5eqHJRL4jl5FOxQOIniyuxSQTyGG9ZO2hDUEyEF4M33RSs9DJ29EqnT0d/gf
	g51GH3Ykxq0qs2UbKruQCCMC1Hmxt48T7CcvAZYe4JE8hfphMd+AmbaHWPNeCksdyW1UcSNt3J8S3
	WrNPJwJiPrV+iGfWEgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoXP-00FqYu-6E; Thu, 17 Mar 2022 11:43:27 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUoXM-00FqYJ-Fa
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 11:43:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id s25so8501717lfs.10
 for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2022 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOLCmK3+zo8AxaRS7/lRqltwPNipcf9iVgMPvtIqyFM=;
 b=YIIu8Y2N+FMspBVRt/UNQMqyRgcNTDoasJbbKRX7WJ7JQZEvOn75eXUN54b4wazjUQ
 BSF46T3Yzu+bbyqKIGPNy8r5LqJ/AWTUasBz7WWH/dhNslnWEkvXTyKHalQbfLlQQxVy
 KLlfjBsfw+LtCn7FjiaPuTnxacPG8OWrblz11VO6kwP+e20fzglNyqsGbOn3ketKlWl8
 N47F0vPW2Gnb4DGLS0jg2EqaKTmvN757u++q5IX9NWfdY515xZ+1Bmrrgq7zeLbjbiNu
 dM59vLmDxOrhhx9Fp/hgwxvzpgwrd7DqgurELJFBAKamgaoGCSK++JcBM21UIqfv29SG
 pthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOLCmK3+zo8AxaRS7/lRqltwPNipcf9iVgMPvtIqyFM=;
 b=cR5DnalZ/NX9ODaYuH1sVV0KEBSBRu6tIc/ilm1c1W+S7Cwzk7zdrkLhadwuc7UsHV
 6cw+Rq/q9rvt3GXTK/xLNET0tTaosxjho5uS/Ck7bb+IyrkonwYcTcuzEIYUN5sCxd7P
 59F/KMCcHyWwgJA1q7Z0q3NXr0EPg0vIDl4p+TCVVJdrprILfACEwgIOYQD5QihMLYJJ
 nc1Z9s0KaRX0AZF0p8huDRarURjmpRd0avRGfIRL2QHz2d5DBliykB19e4SwxPNrrd//
 vP0mrUED9UvZbvwswBMLEKi54gh3nZl26yqlm5d5ykNKdpx3JszRDYlxqf2y0Mt1z9N6
 B5Ng==
X-Gm-Message-State: AOAM532fcIwi0yUclCHShGcCfNXYjMQvE2+fZky13U9eor8GHg0imEn+
 1SdafvQeZMLPKqIq1zMr6L8=
X-Google-Smtp-Source: ABdhPJzLFrqyYuxiKTrXzpyaGRTU4e/prkAWE04iEt/NiFGaghH0fwNHr1cdyM2NShA9qLxOnxp4EA==
X-Received: by 2002:a05:6512:3f21:b0:448:2f20:586f with SMTP id
 y33-20020a0565123f2100b004482f20586fmr2771970lfa.431.1647517401969; 
 Thu, 17 Mar 2022 04:43:21 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 v17-20020a2ea451000000b00247e30b50dfsm403100ljn.107.2022.03.17.04.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:43:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: parsers: bcm47xxpart: print correct offset on read error
Date: Thu, 17 Mar 2022 12:43:16 +0100
Message-Id: <20220317114316.29827-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_044324_541205_9BCD155C 
X-CRM114-Status: GOOD (  11.11  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKbXRkX3JlYWQoKSBnZXRz
IGNhbGxlZCB3aXRoIG9mZnNldCArIDB4ODAwMCBhcyBhcmd1bWVudCBzbyB1c2UgdGhlIHNhbWUK
dmFsdWUgaW4gcHJfZXJyKCkuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+Ci0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5jIGIvZHJpdmVycy9tdGQvcGFy
c2Vycy9iY200N3h4cGFydC5jCmluZGV4IDYwMTJhMTBmMTBjOC4uNTBmY2Y0YzIxNzRiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ3eHhwYXJ0LmMKKysrIGIvZHJpdmVycy9t
dGQvcGFyc2Vycy9iY200N3h4cGFydC5jCkBAIC0yMzcsNyArMjM3LDcgQEAgc3RhdGljIGludCBi
Y200N3h4cGFydF9wYXJzZShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKIAkJCSAgICAgICAodWlu
dDhfdCAqKWJ1Zik7CiAJCWlmIChlcnIgJiYgIW10ZF9pc19iaXRmbGlwKGVycikpIHsKIAkJCXBy
X2VycigibXRkX3JlYWQgZXJyb3Igd2hpbGUgcGFyc2luZyAob2Zmc2V0OiAweCVYKTogJWRcbiIs
Ci0JCQkgICAgICAgb2Zmc2V0LCBlcnIpOworCQkJICAgICAgIG9mZnNldCArIDB4ODAwMCwgZXJy
KTsKIAkJCWNvbnRpbnVlOwogCQl9CiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
