Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57359C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GofMAh/0/MPviBLYjXQ06sBtoQ+/j0jYrVJnKDv6dE=; b=CGMdZlaPPcZgY6
	lxYGKekPht41b/gDzfTiECM9iN6e3+Ujs1GAod7vI9Pj3P35X137tVh4RIpUmMzHbiqeQ0DY6PxwW
	CYdY7Y/YT3d94Bo0ERYSy4FfUDrstyh4nQWyn11oF+J15CLLraV6orxtmzEejOGzVSKBcQJLUI40V
	7JW4YddIyBRLSgDSjox6S3hHKtEnD5eOaFVtXiUYbM9eL/fhYAv8PWNEx0Gc9FeOI8QJV8nrnOfbO
	CiKEYqXifZdxv/c0sZKyXqgjqJgYC0fjx17fFPEDwMp1Bq5oBj/2qWvkYpEO7hkFGD1Ay8SlwSX/S
	9QTSIUsh/qcTqk87U6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7b2-0012D8-Jm; Wed, 19 Oct 2022 11:50:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol7ay-0012BB-JA
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 11:50:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id r14so24856649edc.7
        for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2022 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTGwtjY7Qx3UHK834yfCMHLL0TaAs+yVt4csz4H7rFw=;
        b=OtokJ3G5ZiLF/OC4iEJMusA6NeuqVEVdAZ9v0gKZ8M5SVAINXZqwJnLLxNhUZUgn8R
         Q7gUdiErZk0QhUbU84FHgDdN+NzKzliyYGENPzQm0dU8dRuZrN4SxXvFchaXy4nCYdz+
         9m8rfs2Wr8KKCpoURG3k9LjtOE1djHUFfUWmOGsjHt90WSAMwlXlepZVemcfXbkZV882
         j1JEIpQJk7vhe8E/4jkP7JzjmN5G4sHQ+WWbRkhH6rjTLvP+rBW440/lpRqjboaxwzsm
         78L82AZScEuO4G8Pu7+oje4nyPKYFi1KhoQQibGXkee3QvlrxpWsuo1+dkPwB0MXStJt
         3blA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTGwtjY7Qx3UHK834yfCMHLL0TaAs+yVt4csz4H7rFw=;
        b=CLoHERwmHUNnZGGGMiiYsj4SXUyx5mLuisVtCBlgpcI56fzpma3WdsXuc//RFrDO3/
         pARcL2sNybPIcnMngpLBVJEhHvPLI1m8zoVCYqp1eeCu9VhXhWUVQO5wAhEJHsdo43m0
         AujcdVaCcxYrjxkA1AjCabSjAQ4K2MMCNo+GIR10X1EPnZ8+4ryBIIQoDmJj5KHQ8nGK
         5710nB2Ddynu9n8H1/PB2jTM0K+Xwak5zBL/5SP6b1Sbw6rjlo0ypGgn7kyKcieiQ8KC
         RSxo3JIC0xsA/0WlKshQMIVtIYYmIwMv5ol15Pp7UocGajhfrZx00D/HUTctReibTyym
         avIQ==
X-Gm-Message-State: ACrzQf0fPNuWlQv8FyENG3qlgvh2YDt8/FZMijHoSWUudntZyfJaaZLj
	K5YB4U77hs/olLpfBVmSrFs=
X-Google-Smtp-Source: AMsMyM5hxDnxb0AZmFD6fuLcsa3sjqXIPikwrHU3jQN0KPwiAZQ1Myq20sNxembhfYBGhptsB46FRw==
X-Received: by 2002:a05:6402:3709:b0:459:279e:fdc6 with SMTP id ek9-20020a056402370900b00459279efdc6mr7180563edb.338.1666180247042;
        Wed, 19 Oct 2022 04:50:47 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id dk24-20020a0564021d9800b0045b910b0542sm10377884edb.15.2022.10.19.04.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 04:50:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: core: set ROOT_DEV for partitions marked as root devices in DT
Date: Wed, 19 Oct 2022 13:50:41 +0200
Message-Id: <20221019115041.31805-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019114855.31639-1-zajec5@gmail.com>
References: <20221019114855.31639-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_045048_676112_64E72D21 
X-CRM114-Status: GOOD (  15.01  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBhZGRzIHN1cHBv
cnQgZm9yICJsaW51eCxyb290LWRldmljZSIgYmluZGluZyB0aGF0IGlzIHVzZWQgdG8gbWFyawpy
b290IGRldmljZSBNVEQgcGFydGl0aW9uLiBJdCdzIHVzZWZ1bCBmb3IgZGV2aWNlcyB1c2luZyBk
ZXZpY2UgdHJlZQp0aGF0IGRvbid0IGhhdmUgYm9vdGxvYWRlciBwYXNzaW5nIHJvb3QgaW5mbyBp
biBjbWRsaW5lLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgotLS0KIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwppbmRleCAwNzI0OWFmNGY4OTAuLjAzNGIwNmFmZjY2MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwpAQCAtMjgsNiArMjgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2xlZHMuaD4KICNpbmNsdWRl
IDxsaW51eC9kZWJ1Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvbnZtZW0tcHJvdmlkZXIuaD4KKyNp
bmNsdWRlIDxsaW51eC9yb290X2Rldi5oPgogCiAjaW5jbHVkZSA8bGludXgvbXRkL210ZC5oPgog
I2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+CkBAIC03MzUsNiArNzM2LDEyIEBAIGlu
dCBhZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAkJbm90LT5hZGQobXRkKTsK
IAogCW11dGV4X3VubG9jaygmbXRkX3RhYmxlX211dGV4KTsKKworCWlmIChvZl9maW5kX3Byb3Bl
cnR5KG10ZF9nZXRfb2Zfbm9kZShtdGQpLCAibGludXgscm9vdGZzIiwgTlVMTCkpIHsKKwkJcHJf
aW5mbygibXRkOiBzZXR0aW5nIG10ZCVkICglcykgYXMgcm9vdCBkZXZpY2VcbiIsIG10ZC0+aW5k
ZXgsIG10ZC0+bmFtZSk7CisJCVJPT1RfREVWID0gTUtERVYoTVREX0JMT0NLX01BSk9SLCBtdGQt
PmluZGV4KTsKKwl9CisKIAkvKiBXZSBfa25vd18gd2UgYXJlbid0IGJlaW5nIHJlbW92ZWQsIGJl
Y2F1c2UKIAkgICBvdXIgY2FsbGVyIGlzIHN0aWxsIGhvbGRpbmcgdXMgaGVyZS4gU28gbm9uZQog
CSAgIG9mIHRoaXMgdHJ5XyBub25zZW5zZSwgYW5kIG5vIGJpdGNoaW5nIGFib3V0IGl0Ci0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
