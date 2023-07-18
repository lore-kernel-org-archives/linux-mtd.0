Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4971CEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 04:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hFkP0pyhwb4IlWfwIdhnSXyJ8d/iWtTqz1zBCuZjStY=; b=To3Ux8sfU0GdPL
	dqZ0U1b44Xcn89gh5PkW1UV72CfYQCEmiy5h30geLFY6YCqKzRp/taSdW4qcG0TSDnoyM5t+Kz/lX
	kS/cLL997vSGeHTDD1dwPKfboqBincCnqaJ8Ca5JdYfCsE+vmGOghiDU+mrdsWPAery8kLU/CVYKi
	E/o4QWJf5ttvuJv75YWQpdWQOWoFFsprkyfBGQ7t1k+3jZfpMRVRnGp/Nwf6YW3X1xshXVj5E+4Rl
	4ktpGP+1HYCG1SPDqkeTdIVAURA54q7+DgoP8iKBoKsaFfGEiDrpikmzYbxUBYWyfD+wqYdQ6s035
	wMSG3VkV3+VO/aMbMpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzFs-0055ug-1p;
	Wed, 19 Jul 2023 04:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzFr-0055uA-2D
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 04:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4DYCk050WETvN4LXWc6L2eaH1RpRxI8rd+ry2nyzDfk=; b=DK01WDH+ZOv8KEwHIk2j6iUSgb
	Vu1nVHDBaTo+9okJOKxuziAPJaP6Jx3PggAIoByDW1YoCeg4uMCCoY4PEKKJT7cX4CMTYXzKXfi1L
	DCaM4JU29Djcd4hSqC5Ha4wPm+/U3ZyqsgSjClK4+xJ4BAMnxrOLNvUXWHj/WtiMROT2bQIoL7Zzn
	tYOKHKKn9dV4W0XyHSqR+XCVo0yNFb081YWzASHT6GN7T84CXZWcNeso3CB6RSuh1lPLFqZw1HYNO
	eeC+yQWb2qCdZX0k1SErugmAMq7KQaQUbPh0FVkgQ1D21/DB/BkuBXclfZzTDcwIGsLLVPRxnjlaA
	WrIUUPdg==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLl76-00Baal-0Z
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:51:42 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso9357070e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689688178; x=1692280178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DYCk050WETvN4LXWc6L2eaH1RpRxI8rd+ry2nyzDfk=;
        b=JcIFrNFE2XP11IMHHdFIzKU2kcD3Hcyho0T8KImQsIpPKTDY9l7NM+je+8XU1HtHeC
         oqtVQS2RpygQHI6tQwdRENHbOJeALqg8aVvqs/1+bu/cUS1HCXfpdHS6WVncvL8wQHjY
         rqlpoWgixPzkE+fn6SkkT75kLvv+lQlWW/Ma7RZiw+la5CNhTiAa2Fn0sdlyZ8B7QIrz
         q8N66fSp7TMs/qVMm4BkuhA8kW9xR1tcHSjDWvNNMlrLlItFmjoIADuMOssYQbOUMFct
         is8WuSUZwF6WQghgq1QNy9sbWDwWnARtEfJG4NLkI5f4Kcq95pNbLeBBkzO5zuONlgj1
         8pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689688178; x=1692280178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DYCk050WETvN4LXWc6L2eaH1RpRxI8rd+ry2nyzDfk=;
        b=J4TpQcbfobYO6TKXpwoRooXs/hE2sa4NTA1FQ3rW1g4QmfrdKBt29CsZs1sYo+kmRH
         WtR9OxfMQ+J644eHEcIiGZKsAAVxeFuAbP41Uz5D5tfPmgWpKDqImjQvyHAvDd1MkIs7
         jV0HQKW9gMnYjgbWFoNSBj5S/NOE9BPlfE3GmS/QcDNYmWr2uagpGv3qpWjhyhB+wr1R
         /8x72spzrwAe4KRGFzE11IYP0MmINUykhuki5mQPWUo58w9A1hK22FxOENYz2NZw5QH6
         V/2FJlzhJoZX8BAMmlxEqC+VU5A1OVIb7wGPTlxsNbodi1wDb+yQF3v0DdNnKHZTRJ9I
         lUuw==
X-Gm-Message-State: ABy/qLbff2Hzr/cTAXOnL3bePzDCWsaxQ2NkixwoHLH7qQGVWnY3Xnv1
	rfqUnOE8Q7tPlmfw6nkZI4I=
X-Google-Smtp-Source: APBJJlFXMcTg8ACDAEyW3xe3Lf5jo7rwxTIIFcteeLrZI7Qg/el5nGtWcKv15fz/usdA0URf3Wwk5Q==
X-Received: by 2002:a19:8c05:0:b0:4f9:5396:ed1b with SMTP id o5-20020a198c05000000b004f95396ed1bmr10346152lfd.28.1689688177729;
        Tue, 18 Jul 2023 06:49:37 -0700 (PDT)
Received: from localhost.lan ([31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z22-20020ac25df6000000b004fba785d549sm447055lfq.263.2023.07.18.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 06:49:37 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: mtdpart: check for subpartitions parsing result
Date: Tue, 18 Jul 2023 15:49:27 +0200
Message-Id: <20230718134927.10047-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145140_407383_742638D8 
X-CRM114-Status: GOOD (  12.51  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKcGFyc2VfbXRkX3BhcnRp
dGlvbnMoKSBtYXkgcmV0dXJuIGFuIGVycm9yIHNvIGl0IHNob3VsZCBiZSBjaGVja2VkIGFuZApv
cHRpb25hbGx5IHBhc3NlZCB1cAoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8IDYgKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCmluZGV4IDIzNDgz
ZGI4ZjMwYy4uZjQzYjUzNDI5OTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMK
KysrIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCkBAIC00MjYsNyArNDI2LDExIEBAIGludCBhZGRf
bXRkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICpwYXJlbnQsCiAJCW10ZF9hZGRfcGFydGl0
aW9uX2F0dHJzKGNoaWxkKTsKIAogCQkvKiBMb29rIGZvciBzdWJwYXJ0aXRpb25zICovCi0JCXBh
cnNlX210ZF9wYXJ0aXRpb25zKGNoaWxkLCBwYXJ0c1tpXS50eXBlcywgTlVMTCk7CisJCXJldCA9
IHBhcnNlX210ZF9wYXJ0aXRpb25zKGNoaWxkLCBwYXJ0c1tpXS50eXBlcywgTlVMTCk7CisJCWlm
IChyZXQpIHsKKwkJCXByX2VycigiRmFpbGVkIHRvIHBhcnNlIHN1YnBhcnRpdGlvbnM6ICVkXG4i
LCByZXQpOworCQkJZ290byBlcnJfZGVsX3BhcnRpdGlvbnM7CisJCX0KIAogCQljdXJfb2Zmc2V0
ID0gY2hpbGQtPnBhcnQub2Zmc2V0ICsgY2hpbGQtPnBhcnQuc2l6ZTsKIAl9Ci0tIAoyLjM1LjMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
