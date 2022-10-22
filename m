Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B9CFA373E
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 21:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1Byv6SBYacrGEqH3w09Xl75jmupTSnYo2LEljCWAC4=; b=Tjn4MmB3ABQMZS
	x6uanZjfXTwMlnQITRKKvTxkZdGi6/jL/PfLl9iFyaU0oOmcG+nUAq+UsrZvUh0U30Xa+eqIdKelF
	hXntzKlc3icMCtms1H47EBfdM1jbqkvYGjQtB0sW+wxXWHqGog9mLrP7IQ9GLO3pmtN1VPODcubM0
	o9SVzn7SADX+4CXlXDZPlJ7h07MbeMUCXW3vEQBE6KE6W8TdDb0oVKNnJQb8YK3W+HumylHZ8nfBx
	/9p3ZYcUGHb0b45yQzqbUhIclVHS1WOZy6RgnPjcyly9FkoYEoRxskcV3oO42hjm3bZeoaPdk7mRu
	p++YHRz2Ac7g+uexD4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omLoC-00DpBi-0R; Sat, 22 Oct 2022 21:13:32 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omLo8-00DpAU-LH
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 21:13:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id z97so18087684ede.8
        for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2022 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMcPWSUmJnWN6Xepe9O23Js1qxdW09hzjNuw8smzgps=;
        b=Juwv+t1RTD/CMonD6c03dxDghAH5fYtIui194P1sOuPDqUipKVcMtYq5xsIHFnFu/S
         9PuKQH+IEKm9pjZCdY5rKHFMux6oZ6jGSl/kLkoOPzGiCObsf8o8V/BIs4ImZJ24157x
         vCJ4/stysEk6t20lEO+Guu/3orvGzmm07igbOeQdiKL4A/gMqz8qTwo/gO00Xc+5hgnY
         D+/QqytyJcYHxhBW/nZccJUnnNV3z2H4Zzo2XIG5Z0M9/WfLUgZfnTa6297r6BzOL5J0
         75kjjA5hJtnpm2S/eHxSYDOqznebiuBAghHKBcvY38HOpjFsUNzasVI9q7LASA5P552b
         gExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMcPWSUmJnWN6Xepe9O23Js1qxdW09hzjNuw8smzgps=;
        b=zKcAMHTTOSHkwKLJYvfafjnAZmDVqa+G8AZwHabHkvzD7A7iDNorAEjTAJNcEW79ko
         IFcupKu8W0qIoFMQalZGVGp0Yamgb7n/+gFu/yQsaPhrhx9bnVm+YCjyc6RJo3lcAfuR
         vw1CrToGeFzhGRu8QOUMwPiQsNEqlx7GeYani0CGPdnp1zTe+O9pYAWx7buVIxndd1aY
         Hla+u+ANxpxA8lNUHK0Pi2oId+OlWQeOoGE8Ev8Qr8VMvKtUtIHb8azKOxrLfUfB8XA2
         T7hE/kF+AA1r9+d7zc24uaiexT8Sa6RbM2kLhvCrt0zkR1tRLCL2mnSQhEDWNXmUcXJT
         sn3g==
X-Gm-Message-State: ACrzQf0yCO80Ir+L+wocT4F/wbV3U78tvH6LE1Z8cdw9bu6BBgcPJZop
	j//zXju2g9tXM8foRR54+/c=
X-Google-Smtp-Source: AMsMyM5Qf2ADuVBQDHAFHzbyHZ+OeqC55sfOOOezRBA6Gp3Wz7C2lnCHShhxvyaoPqr5xTnfUEk34w==
X-Received: by 2002:a50:ed03:0:b0:461:9f73:b8d9 with SMTP id j3-20020a50ed03000000b004619f73b8d9mr857808eds.140.1666473205425;
        Sat, 22 Oct 2022 14:13:25 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id la5-20020a170907780500b0077f20a722dfsm13382584ejc.165.2022.10.22.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 14:13:25 -0700 (PDT)
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
Subject: [PATCH V3 2/2] mtd: core: set ROOT_DEV for partitions marked as rootfs in DT
Date: Sat, 22 Oct 2022 23:13:18 +0200
Message-Id: <20221022211318.32009-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022211318.32009-1-zajec5@gmail.com>
References: <20221022211318.32009-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_141328_720753_7CAEA5F7 
X-CRM114-Status: GOOD (  14.76  )
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
cnQgZm9yICJsaW51eCxyb290ZnMiIGJpbmRpbmcgdGhhdCBpcyB1c2VkIHRvIG1hcmsgZmxhc2gK
cGFydGl0aW9uIGNvbnRhaW5pbmcgcm9vdGZzLiBJdCdzIHVzZWZ1bCBmb3IgZGV2aWNlcyB1c2lu
ZyBkZXZpY2UgdHJlZQp0aGF0IGRvbid0IGhhdmUgYm9vdGxvYWRlciBwYXNzaW5nIHJvb3QgaW5m
byBpbiBjbWRsaW5lLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgotLS0KVjI6IFVzZSAibGludXgscm9vdGZzIiBhcyBtb3JlIGFjY3VyYXRlLiBUaGFu
a3MgUm9iLgpWMzogQWRkIElTX0JVSUxUSU4oQ09ORklHX01URCkgY2hlY2sgdG8gYXZvaWQKICAg
IEVSUk9SOiBtb2Rwb3N0OiAiUk9PVF9ERVYiIFtkcml2ZXJzL210ZC9tdGQua29dIHVuZGVmaW5l
ZCEKLS0tCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29y
ZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmluZGV4IDIwZmNlZGMzMDIxZS4uZjcwYTVlNjY4
NDNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQv
bXRkY29yZS5jCkBAIC0yOCw2ICsyOCw3IEBACiAjaW5jbHVkZSA8bGludXgvbGVkcy5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KICNpbmNsdWRlIDxsaW51eC9udm1lbS1wcm92aWRlci5o
PgorI2luY2x1ZGUgPGxpbnV4L3Jvb3RfZGV2Lmg+CiAKICNpbmNsdWRlIDxsaW51eC9tdGQvbXRk
Lmg+CiAjaW5jbHVkZSA8bGludXgvbXRkL3BhcnRpdGlvbnMuaD4KQEAgLTczNSw2ICs3MzYsMTcg
QEAgaW50IGFkZF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQlub3QtPmFkZCht
dGQpOwogCiAJbXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOworCisJaWYgKG9mX2ZpbmRf
cHJvcGVydHkobXRkX2dldF9vZl9ub2RlKG10ZCksICJsaW51eCxyb290ZnMiLCBOVUxMKSkgewor
CQlpZiAoSVNfQlVJTFRJTihDT05GSUdfTVREKSkgeworCQkJcHJfaW5mbygibXRkOiBzZXR0aW5n
IG10ZCVkICglcykgYXMgcm9vdCBkZXZpY2VcbiIsIG10ZC0+aW5kZXgsIG10ZC0+bmFtZSk7CisJ
CQlST09UX0RFViA9IE1LREVWKE1URF9CTE9DS19NQUpPUiwgbXRkLT5pbmRleCk7CisJCX0gZWxz
ZSB7CisJCQlwcl93YXJuKCJtdGQ6IGNhbid0IHNldCBtdGQlZCAoJXMpIGFzIHJvb3QgZGV2aWNl
IC0gbXRkIG11c3QgYmUgYnVpbHRpblxuIiwKKwkJCQltdGQtPmluZGV4LCBtdGQtPm5hbWUpOwor
CQl9CisJfQorCiAJLyogV2UgX2tub3dfIHdlIGFyZW4ndCBiZWluZyByZW1vdmVkLCBiZWNhdXNl
CiAJICAgb3VyIGNhbGxlciBpcyBzdGlsbCBob2xkaW5nIHVzIGhlcmUuIFNvIG5vbmUKIAkgICBv
ZiB0aGlzIHRyeV8gbm9uc2Vuc2UsIGFuZCBubyBiaXRjaGluZyBhYm91dCBpdAotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
