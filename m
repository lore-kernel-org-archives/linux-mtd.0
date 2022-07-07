Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C69C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYOUSxaVnke56HjCgHGXz1VwgH5NP+RVR5WfV86B8lc=; b=Avmji7rDQ7tAvf
	/6zYqiNz0FoWWZ5Fx7qdzUZ8iwcj7iQtcHSmtJx4S5M7VmwshXSinFEIgSvZWiNasDfc4jX5Va/jI
	MuKLBmlgRsqIJG8+B1W02t5hVQ3XKzexsNp3UWELcsnUNpK51vG2X/LP2Li0GRBTe9kQnyydoBdVI
	OritnQ4J+BSUCZ0q4UUxEpuz/+uwGJDY5TiFuuu5bCovTYaVEJKqfRfvpaJ5CkCZ37RqjUHXyQzAR
	33n/xSCmK7DYbG7RAj2FlfoTa269h6ONyH8x4EjkIE1pg+ESmkjhwQKw8Q0G0KEcGdXC0y0/JHTNI
	5pEz7JmDvFiqp7Lw4BGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9UUM-00H0Fz-PO; Thu, 07 Jul 2022 16:36:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9UUH-00H0Cs-FI
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 16:36:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id k30so15725040edk.8
        for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2022 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EpRFRQjTAtTr1M5DmE/x/HJDwd5mR/vVrtLFwi8k4Rc=;
        b=EMKT4/3otjt8/rvpIKCJ1b2up/bgSsRt4nctE5sS6+lnuOSbOyoeg/ktEO4LC2wrW7
         Q99cck/TGy6MosOLQ75QZs/hGRX1dUfvsEr5F7N1QUKjI9uEwQb7rmyaaSlWtf8JrC0c
         DCSkH/e1WiRqMJ28VaobSI+VKrzLSssbI65UVRvM91xUA2iL3wO6q9S5rcuuhDpc64tv
         HK4bp1IrDrQWV7+oPb+9c7tdAJyd4OlbN8lvFtEzEIt1q1YVrEcEj2gzUgZHN2Xx5dZf
         JP0wpwymGrtRbjexM9FvahGJJnJDx9bWiqRuKCf7bdZb1XEC4v0Utps82E/SOutECnjk
         pcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EpRFRQjTAtTr1M5DmE/x/HJDwd5mR/vVrtLFwi8k4Rc=;
        b=kORM1tBwxq9sKhHef6wkOEgw1OWI2/C2ZsHPYUXWqAyPvwch2rhi1/3iXJWrqoarSF
         rwE4YXHFzjlCUjotFAioXLq1bZHT0LTb2iykLRX6ft3iWE8vuxIuKn3Q0yl4+ZJQJD2o
         /4eNdnf8b1biE9WYo7bNm8gORuhXJSC4vujrwmrhuod38BEeJSnTEfiIqEvMNLt9z2RF
         SFSwIcwpxpYqBlTJd6RRW+CN2PTdZYn1yMIddL7Z/wo0oovdrhrETQTr9dpeEdWIaswx
         BdNn4etx1u81NszJFD0bZlFSLw89M45wkgN/86H1foAprYuw+WoCOZh8bYy9LuI3XHIg
         cZiA==
X-Gm-Message-State: AJIora9QadfCVOeLBPUwmsoR7mdYCm3538FpgNkKGFvGTNiDLR1x5/Jy
	xcX/hCi9RxiF/T9PL2vnB9k=
X-Google-Smtp-Source: AGRyM1uthBb64W9W4HBZS6HwalidhRpgNw15fqS9Jvm5Snv3iAZKAdSpM3VWd3ObZl1c/1XPTq8Y4A==
X-Received: by 2002:aa7:d555:0:b0:43a:1be7:9e17 with SMTP id u21-20020aa7d555000000b0043a1be79e17mr37347794edr.183.1657211779662;
        Thu, 07 Jul 2022 09:36:19 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t27-20020a17090616db00b0071cbc7487e1sm19009030ejd.69.2022.07.07.09.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:36:19 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: core: find OF node for every MTD partition
Date: Thu,  7 Jul 2022 18:36:07 +0200
Message-Id: <20220707163607.20729-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707163607.20729-1-zajec5@gmail.com>
References: <20220707163607.20729-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_093621_566371_669DDA03 
X-CRM114-Status: GOOD (  15.05  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKRG9uJ3QgbGltaXQgdGhp
cyBmZWF0dXJlIHRvIHRoZSAibnZtZW0tY2VsbHMiLiBUaGVyZSBhcmUgbW9yZSBjYXNlcyB0bwp0
aGlzLgoxLiBEeW5hbWljIHBhcnRpdGlvbnMgbWF5IG5lZWQgdG8gYmUgaGFuZGxlZCB3aXRoIHBh
cnNlcnMKICAgVGhpcyBhcHBsaWVzIHRvICJmaXhlZC1wYXJ0aXRpb25zIiBwYXJzZXIgYW5kIGFs
bCBjdXN0b20gb25lcy4KMi4gRHluYW1pYyBwYXJ0aXRpb25zIGNhbiBiZSBoYW5kbGVkIHdpdGgg
c3BlY2lmaWMgZHJpdmVycwogICBDb25zaWRlciAidS1ib290LGVudiIgYXMgc3BlY2lmaWVkIGlu
IHRoZSB1LWJvb3QsZW52LnlhbWwuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Ci0tLQogZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMTEgKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCmlu
ZGV4IDc5YzQ0N2ZlMzBiNC4uZjc2OTM3MzZkZGU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9t
dGRjb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCkBAIC01NTIsNyArNTUyLDYgQEAg
c3RhdGljIHZvaWQgbXRkX2NoZWNrX29mX25vZGUoc3RydWN0IG10ZF9pbmZvICptdGQpCiAJY29u
c3QgY2hhciAqcG5hbWUsICpwcmVmaXggPSAicGFydGl0aW9uLSI7CiAJaW50IHBsZW4sIG10ZF9u
YW1lX2xlbiwgb2Zmc2V0LCBwcmVmaXhfbGVuOwogCXN0cnVjdCBtdGRfaW5mbyAqcGFyZW50Owot
CWJvb2wgZm91bmQgPSBmYWxzZTsKIAogCS8qIENoZWNrIGlmIE1URCBhbHJlYWR5IGhhcyBhIGRl
dmljZSBub2RlICovCiAJaWYgKGRldl9vZl9ub2RlKCZtdGQtPmRldikpCkBAIC01ODgsMTkgKzU4
NywxMSBAQCBzdGF0aWMgdm9pZCBtdGRfY2hlY2tfb2Zfbm9kZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKIAkJcGxlbiA9IHN0cmxlbihwbmFtZSkgLSBvZmZzZXQ7CiAJCWlmIChwbGVuID09IG10ZF9u
YW1lX2xlbiAmJgogCQkgICAgIXN0cm5jbXAobXRkLT5uYW1lLCBwbmFtZSArIG9mZnNldCwgcGxl
bikpIHsKLQkJCWZvdW5kID0gdHJ1ZTsKKwkJCW10ZF9zZXRfb2Zfbm9kZShtdGQsIG10ZF9kbik7
CiAJCQlicmVhazsKIAkJfQogCX0KIAotCWlmICghZm91bmQpCi0JCWdvdG8gZXhpdF9wYXJ0aXRp
b25zOwotCi0JLyogU2V0IG9mX25vZGUgb25seSBmb3IgbnZtZW0gKi8KLQlpZiAob2ZfZGV2aWNl
X2lzX2NvbXBhdGlibGUobXRkX2RuLCAibnZtZW0tY2VsbHMiKSkKLQkJbXRkX3NldF9vZl9ub2Rl
KG10ZCwgbXRkX2RuKTsKLQotZXhpdF9wYXJ0aXRpb25zOgogCW9mX25vZGVfcHV0KHBhcnRpdGlv
bnMpOwogZXhpdF9wYXJlbnQ6CiAJb2Zfbm9kZV9wdXQocGFyZW50X2RuKTsKLS0gCjIuMzQuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
