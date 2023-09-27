Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8688EE82CD3
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XjzCQvdnvxC39h8idfDKcvtWOpWF6xULJzOaCnrj1GY=; b=zho2fmQNMA7Aud
	PV5bb1QI0qm1mJ1MQ3lYrixbA2a+rNXtdnlo6fGONsgWdjb+UGhk/a2CtCM/AZgih1Zd1Qx0Mhhgs
	d7gKGJQQ1JjhMkzpqzi1Cd2HiVthLNDNPhP2DC5AFAx8upwdbjvQ773HSAw8QDk33XDLmjQDKxCr2
	UWdOvln5zu4YjKsd3ag6nq/wrN1CvCe/M27nPpSFOQYZ0ZlD2mGQVJiRSIKYMPZfcM3014zjRdRs+
	svMMKXHHn+FnB+//n0w5kstqUuCO7idvg+MV/NA6sLSslp0N0G+wfqRoBEqSNlUg3YgK8a0e5G10O
	8lXj4pI3J3UAONA8DIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb7q-001jeN-2i;
	Wed, 27 Sep 2023 20:27:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb7o-001jdg-2H
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 20:27:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-533df112914so9991898a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 13:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695846429; x=1696451229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=deWnOQK0F8AaBZFvDCNkWcrFlBFqXd4uRDRwFDPrjhg=;
        b=ChFCbHYgxKG4n46/GrG1E9uLQWws3/2P12V5RDDiljfMtCaPbq0TpDej4pThKHgPqs
         fv5EfRF+GXt31zwbkUmmghJiNrzs+Ayn1dfevfPxCbuZF2+gJVfk7AW6VW/UmwM4Ar6V
         6xKzRQgA9r+gM0H4McrVVA4o+ulNt+8D9Vr6VVESoJuoaCWr5ZexTpczTmhrl3gE00D6
         P1xld+sePnEHGP0GAtrvICY+Pfm9q5AlrORMiz5mVa7g9bgAsLXj4/aQPrUMRGEDF/E6
         TCBNjVqWmvY3Fhlkb+cKyXDKJBGXiVoyvrjaPqbXDCA+ZL3vQo6Zn2bhyzZ1gttjcUFH
         E55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846429; x=1696451229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deWnOQK0F8AaBZFvDCNkWcrFlBFqXd4uRDRwFDPrjhg=;
        b=UFrvdsiYpq/eKq6ENoV3X9XxbPLTgicW1Dbp6ti7VYjUbApz9Vfg313AGsUo5crADJ
         sX8/Z4JmcVTsiGXliYuAvYxf2UK6RXJ9pGl3SNG0nUuW+hLp6MTJs9nVzHFANLtVs1OC
         Kt6o9s/pNqgDO8GEjN6tjse04lKp237UmMCb41IkKneqyCUlBPMy30kjQ5SLLx0cr+ev
         sMA7yumHDX0mZ7Ek1SnaNTs3Kabiz/SuVak3IHOfNRsnLMXUZYSiDT1Emzw32r5cEXuH
         S3cUdHO5VtVNveHtw9Uj5pjZGe5NiR7MZ7GxoeQMuDDCLYZ9rCjUCZZYRkQJKmhOAQOq
         VsNw==
X-Gm-Message-State: AOJu0YzCa644HIFerIIfZly24wvV3XDWT4JbwfXrBGnmmpGpcPMNI2V8
	DjGbcxPnBRHKfcz8fi6DXqc=
X-Google-Smtp-Source: AGHT+IGYdUjPCEGOSUgqrr51aF3bod8cS3BOHxQQGTIcX5sotHXQANlIFsbg+3ZEYtic7Hd/2WnNCw==
X-Received: by 2002:a17:906:3152:b0:9ae:654d:5105 with SMTP id e18-20020a170906315200b009ae654d5105mr2489991eje.47.1695846429126;
        Wed, 27 Sep 2023 13:27:09 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id qw25-20020a1709066a1900b009b293d1f2eesm3907439ejc.107.2023.09.27.13.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:27:08 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: John Thomson <lists@johnthomson.fastmail.com.au>,
	linux-mtd@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] mtd: mtdpart: check for subpartitions parsing result
Date: Wed, 27 Sep 2023 22:26:57 +0200
Message-Id: <20230927202657.27169-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_132712_745459_D7CF6EEA 
X-CRM114-Status: GOOD (  13.47  )
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
bEBtaWxlY2tpLnBsPgotLS0KVjI6IFVzZSAicmV0IDwgMCIgYXMgcmV0IGNvbnRhaW5zIG5vIG9m
IHBhcnRzIG9uIHN1Y2Nlc3MuIFRoYW5rcyBKb2huIQoKIGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8
IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFy
dC5jCmluZGV4IDIzNDgzZGI4ZjMwYy4uNjgxMWE3MTQzNDlkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9tdGRwYXJ0LmMKKysrIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCkBAIC00MjYsNyArNDI2
LDExIEBAIGludCBhZGRfbXRkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICpwYXJlbnQsCiAJ
CW10ZF9hZGRfcGFydGl0aW9uX2F0dHJzKGNoaWxkKTsKIAogCQkvKiBMb29rIGZvciBzdWJwYXJ0
aXRpb25zICovCi0JCXBhcnNlX210ZF9wYXJ0aXRpb25zKGNoaWxkLCBwYXJ0c1tpXS50eXBlcywg
TlVMTCk7CisJCXJldCA9IHBhcnNlX210ZF9wYXJ0aXRpb25zKGNoaWxkLCBwYXJ0c1tpXS50eXBl
cywgTlVMTCk7CisJCWlmIChyZXQgPCAwKSB7CisJCQlwcl9lcnIoIkZhaWxlZCB0byBwYXJzZSBz
dWJwYXJ0aXRpb25zOiAlZFxuIiwgcmV0KTsKKwkJCWdvdG8gZXJyX2RlbF9wYXJ0aXRpb25zOwor
CQl9CiAKIAkJY3VyX29mZnNldCA9IGNoaWxkLT5wYXJ0Lm9mZnNldCArIGNoaWxkLT5wYXJ0LnNp
emU7CiAJfQotLSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
