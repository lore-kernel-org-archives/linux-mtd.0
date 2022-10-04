Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3D8C4332F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zd9j8QiK9rBISICjMhUmGgrBdD4BcI7l9fiQpDHxq0k=; b=49suF6XyvAbM4e
	wOFHUyFUBOfYICJrVuPMzqVMOByqy3DRxRYdc7mELxAUntLUqMFLrgGY4u6nWunqsMXyQJrUo4m7h
	aUVOyk0gz1hn60ImVh1LBgf9M/u7f9gZe+xIqfhJURy45pRqXEL+bGEhN/kFR0Hc5WQsWnjCrQ7Q+
	5j5gNNYrDLWoohBCkM7zWxLE2w+Ew0Wlfp5DP4ZcxtlT4269SmwfVmHFAzocxVtkSZF0+zQniGXbF
	6+ZTjg3/43MbIEHGZtQZJK2MFusdKNHdEksSDtHnhte+mx/DUdCfirazREfxTBTfAMFVEafQ1OhYY
	K0qEMH3Xmrj3q22fiFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdQa-008yQm-FI; Tue, 04 Oct 2022 08:37:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdQX-008yPX-3v
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 08:37:22 +0000
Received: by mail-ed1-x529.google.com with SMTP id s2so7261666edd.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Oct 2022 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kShu3JiHXeOC6qlCggCXPdZVbnNPqXavY4BcrnK5Xm4=;
        b=IB39GjvKSpw8yqo7YB/mEkBVWTY3fslQk1Pr3I9rSGi3MTuep5N992Nuo/RDn8cQhw
         kOFr+GMG7/tOszPtpOvRF7TZvul0ACRc20XmqAqhp8a100tZ+Am9zvuVs7XholdFvMDB
         YAqYbghk+ZcAkIWWJvZ5ksCCJ4KnRYSPwP3cJFjLXkm+iEkjZWjxkb4qknzBZjByflpv
         m4OwglJgaocdKWdr9SmnDVxJTFI5j9+Y8ngyM4NvGuJDXaD5w09eou3VUUXQ7QYVBTLt
         GjxY6XWX4OMf3p4GEU+X2ZO1QLULkXCjID8MmyDBsgMA36tb/2ly5Ga3EYmXGQ2m+ZOs
         X6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kShu3JiHXeOC6qlCggCXPdZVbnNPqXavY4BcrnK5Xm4=;
        b=G1hDQ/WRrS6KrOlRgiLUfg5Xi+ABM/P0WTPrLhBnumGSQTNwJu8UXutE1eq45CApwg
         yFiHVgwc13YNsy6gVqju6035tX2ZJuVj47nProexbnbGwjPIGHhPsrYf/Dcbs3L+DSgE
         oew3Sn5/eIv7maeX7xaInj/VvhzXY/DUKjSmlEgi9G2yUvNYNO1BdLk0nOsCrv3YryiX
         nAt1x1ge88f5q0kXh1Fw5AysOa9gpz0e0yVi52cio7goleXXS3TyC7tQBkMqiwLsYWJX
         q3Hu3rIpHD5ipqp9aduUed2GneXaSwCjWXziITO+AZXOqLwQYD9Srq9gFCdXVMvVxLn+
         CnRw==
X-Gm-Message-State: ACrzQf0MMp2WxYNjkU8fc7uyGdtkZpDCLUrhs9x77uFQh+Sg2bJHBWJV
	RH4zeff46WZ8A4s2JjDrEF4=
X-Google-Smtp-Source: AMsMyM6YLvR1ANtP1eIM53wbtO7p9Dy69ONkLPyiAfdkULPu9rbPRWjvRaO++DfvlF2nnUicUF6C7w==
X-Received: by 2002:a05:6402:33c5:b0:447:e4a3:c930 with SMTP id a5-20020a05640233c500b00447e4a3c930mr22278878edc.401.1664872638877;
        Tue, 04 Oct 2022 01:37:18 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b00787a6adabe9sm6598376ejc.75.2022.10.04.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 01:37:18 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] mtd: core: simplify (a bit) code find partition-matching dynamic OF node
Date: Tue,  4 Oct 2022 10:37:09 +0200
Message-Id: <20221004083710.27704-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_013721_182607_29F4F4EC 
X-CRM114-Status: GOOD (  14.85  )
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
Pm5hbWUgdG8gYXZvaWQgb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoKQozLiBVc2UgbXRkX2dldF9v
Zl9ub2RlKCkgaGVscGVyCgpDYzogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0t
LQogZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMTYgKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKaW5kZXggMThhYTU0NDYw
ZDM2Li4yMjExZTBlZDZjYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYworKysg
Yi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTU1MSwxOCArNTUxLDE2IEBAIHN0YXRpYyB2b2lk
IG10ZF9jaGVja19vZl9ub2RlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCXN0cnVjdCBkZXZpY2Vf
bm9kZSAqcGFydGl0aW9ucywgKnBhcmVudF9kbiwgKm10ZF9kbiA9IE5VTEw7CiAJY29uc3QgY2hh
ciAqcG5hbWUsICpwcmVmaXggPSAicGFydGl0aW9uLSI7CiAJaW50IHBsZW4sIG10ZF9uYW1lX2xl
biwgb2Zmc2V0LCBwcmVmaXhfbGVuOwotCXN0cnVjdCBtdGRfaW5mbyAqcGFyZW50OwogCWJvb2wg
Zm91bmQgPSBmYWxzZTsKIAogCS8qIENoZWNrIGlmIE1URCBhbHJlYWR5IGhhcyBhIGRldmljZSBu
b2RlICovCi0JaWYgKGRldl9vZl9ub2RlKCZtdGQtPmRldikpCisJaWYgKG10ZF9nZXRfb2Zfbm9k
ZShtdGQpKQogCQlyZXR1cm47CiAKIAkvKiBDaGVjayBpZiBhIHBhcnRpdGlvbnMgbm9kZSBleGlz
dCAqLwogCWlmICghbXRkX2lzX3BhcnRpdGlvbihtdGQpKQogCQlyZXR1cm47Ci0JcGFyZW50ID0g
bXRkLT5wYXJlbnQ7Ci0JcGFyZW50X2RuID0gZGV2X29mX25vZGUoJnBhcmVudC0+ZGV2KTsKKwlw
YXJlbnRfZG4gPSBtdGRfZ2V0X29mX25vZGUobXRkLT5wYXJlbnQpOwogCWlmICghcGFyZW50X2Ru
KQogCQlyZXR1cm47CiAKQEAgLTU3NSwxNSArNTczLDE1IEBAIHN0YXRpYyB2b2lkIG10ZF9jaGVj
a19vZl9ub2RlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCiAJLyogU2VhcmNoIGlmIGEgcGFydGl0
aW9uIGlzIGRlZmluZWQgd2l0aCB0aGUgc2FtZSBuYW1lICovCiAJZm9yX2VhY2hfY2hpbGRfb2Zf
bm9kZShwYXJ0aXRpb25zLCBtdGRfZG4pIHsKLQkJb2Zmc2V0ID0gMDsKLQogCQkvKiBTa2lwIHBh
cnRpdGlvbiB3aXRoIG5vL3dyb25nIHByZWZpeCAqLwotCQlpZiAoIW9mX25vZGVfbmFtZV9wcmVm
aXgobXRkX2RuLCAicGFydGl0aW9uLSIpKQorCQlpZiAoIW9mX25vZGVfbmFtZV9wcmVmaXgobXRk
X2RuLCBwcmVmaXgpKQogCQkJY29udGludWU7CiAKIAkJLyogTGFiZWwgaGF2ZSBwcmlvcml0eS4g
Q2hlY2sgdGhhdCBmaXJzdCAqLwotCQlpZiAob2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobXRkX2Ru
LCAibGFiZWwiLCAmcG5hbWUpKSB7Ci0JCQlvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhtdGRfZG4s
ICJuYW1lIiwgJnBuYW1lKTsKKwkJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhtdGRfZG4s
ICJsYWJlbCIsICZwbmFtZSkpIHsKKwkJCW9mZnNldCA9IDA7CisJCX0gZWxzZSB7CisJCQlwbmFt
ZSA9IG10ZF9kbi0+bmFtZTsKIAkJCW9mZnNldCA9IHByZWZpeF9sZW47CiAJCX0KIAotLSAKMi4z
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
