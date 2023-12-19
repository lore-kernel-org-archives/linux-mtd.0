Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA6DC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYI9tULjJrdFPHl31qbUGMoAvuZF2aYX9Zec1UAm1YY=; b=xLhVeUZHkbLUMD
	mafeX6+TGlxZPrORHNzdQlAVxh2adfNFwc0U3dzC9DL1QkpMev4fM9XLdLq6GukZs8pquXhM8nUyh
	wO1qlUi7HUWBT3kQsQoXctfFvHfJXs+QYkqe6LtxCZr4fhCT0jcUMqfBV0FTJr+lpYRW4Mq+ETf+S
	Vxjt/CvH32aLphTPR/LKV+ImSAg7/7o5Y7b8nL0mOAS3KHAwtQRv3VnEsM6c1bSV5nMRQND0GFnA5
	jbfw1LVRQdNgmBeP0s7V8qm8rxw1ogMn0HmmFxg9XhoDvPsiIta0DsZu86cYCUUxGnRXM2KEjk+cT
	K36g/UfktS7tPgzMu5kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYmw-00Dwym-23;
	Tue, 19 Dec 2023 12:01:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYms-00Dwvq-33;
	Tue, 19 Dec 2023 12:01:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40d190df5d0so26929225e9.3;
        Tue, 19 Dec 2023 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702987283; x=1703592083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7yEMgXZhKtlt+r30N1IJsOJuMAaTYKKq9iU4tTYh4A=;
        b=dC8lvo8B4HByghfHuHo2l3QHTFIt+4vQl6NQmG0/3Mk/8J0qtbvosTcckM4HZcjGck
         6VdqJ7BT146Qq8fPMUhoRtyXggKCBV8E2/lbOiCYJAIqFbmexoZnqXBeiu9XHhDoPGJv
         3IC2p4DdIBcIJ12ClNcUmm24tHcac7mkiYgt+JxIMIoH4CQwBdLqtDdhCARrPnIJkhje
         Id/TEuLpGsWeyRupc+KTYpKu6anCKS3BHbmE6GAb/RMe7DNDENC2xFlHgTeCiVLrbA2A
         P0NcT/4XyXgPj5WDeTa2dppw0hdXJAtKzyRgyBxxTKITHpDSSYgEa0AVaJm1/VZBGHal
         8tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987283; x=1703592083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7yEMgXZhKtlt+r30N1IJsOJuMAaTYKKq9iU4tTYh4A=;
        b=Ymp0r0qTAMPNbd1IUgtUWYDWyX8tFz6aVCw/GgicdfSRJerDJlqr1P3ybaGlktFVTQ
         7mqrrE8KV7JSMKton1oD/xiujl2TYA+Sj9RwMUoGJWSWarWF/hZJBnBzrMMv3+VxArQx
         Vl/sKoFnZMQLz8gFnbip4Vaws6+W5nfDX+T9/at8qj6GaLeFGqoAx7D3xrleaUxLqHJi
         wZpC7WGuvd1rFohxg0TW7VIm0i1ltDg4SBIRVvqUWy8G3OOpuKIQkmDpjnePuf5jFdkT
         vgpJpA5TZdtPyTTPMTQBM9jwDKgi0XG2aZ72DNeB/75MLW3bERx+x7SBLnMophSnGfQD
         enmQ==
X-Gm-Message-State: AOJu0YxPyMSHk5d37IG+S6dEzZHlb1ZldPzEjV+w52tBnVgpWxLVTr+8
	KCebeZSbPLD/82GDUkr9QeQ=
X-Google-Smtp-Source: AGHT+IFacrsz/WxyyAmEwuqg1BB6bNHm96HPr0zlPC74PGs1gxTM16a3p4tpZQe9CQsLj/7ekjHxXA==
X-Received: by 2002:a05:600c:d4:b0:40b:5e59:c55b with SMTP id u20-20020a05600c00d400b0040b5e59c55bmr9283867wmm.133.1702987283001;
        Tue, 19 Dec 2023 04:01:23 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ux4-20020a170907cf8400b00a230f3799a4sm6767478ejc.225.2023.12.19.04.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:01:22 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH v6.8 2/2] nvmem: drop nvmem_layout_get_match_data()
Date: Tue, 19 Dec 2023 13:01:04 +0100
Message-Id: <20231219120104.3422-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231219120104.3422-1-zajec5@gmail.com>
References: <20231219120104.3422-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_040127_025493_4E872DDA 
X-CRM114-Status: GOOD (  11.06  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhhbmtzIGZvciBsYXlv
dXRzIHJlZmFjdG9yaW5nIHdlIG5vdyBoYXZlICJzdHJ1Y3QgZGV2aWNlIiBhc3NvY2lhdGVkCndp
dGggbGF5b3V0LiBBbHNvIGl0cyBPRiBwb2ludGVyIHBvaW50cyBkaXJlY3RseSB0byB0aGUgIm52
bWVtLWxheW91dCIKRFQgbm9kZS4KCkFsbCBpdCB0YWtlcyB0byBnZXQgbWF0Y2ggZGF0YSBpcyBh
IGdlbmVyaWMgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkuCgpTaWduZWQtb2ZmLWJ5OiBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQogZHJpdmVycy9udm1lbS9jb3JlLmMg
ICAgICAgICAgIHwgMTMgLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRl
ci5oIHwgMTAgLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCmlu
ZGV4IDQ0MWQxMzJlYmI2MS4uNGVkNTQwNzYzNDZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVt
L2NvcmUuYworKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwpAQCAtODc2LDE5ICs4NzYsNiBAQCB2
b2lkIG52bWVtX2xheW91dF91bnJlZ2lzdGVyKHN0cnVjdCBudm1lbV9sYXlvdXQgKmxheW91dCkK
IH0KIEVYUE9SVF9TWU1CT0xfR1BMKG52bWVtX2xheW91dF91bnJlZ2lzdGVyKTsKIAotY29uc3Qg
dm9pZCAqbnZtZW1fbGF5b3V0X2dldF9tYXRjaF9kYXRhKHN0cnVjdCBudm1lbV9kZXZpY2UgKm52
bWVtLAotCQkJCQlzdHJ1Y3QgbnZtZW1fbGF5b3V0ICpsYXlvdXQpCi17Ci0Jc3RydWN0IGRldmlj
ZV9ub2RlIF9fbWF5YmVfdW51c2VkICpsYXlvdXRfbnA7Ci0JY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCAqbWF0Y2g7Ci0KLQlsYXlvdXRfbnAgPSBvZl9udm1lbV9sYXlvdXRfZ2V0X2NvbnRhaW5l
cihudm1lbSk7Ci0JbWF0Y2ggPSBvZl9tYXRjaF9ub2RlKGxheW91dC0+ZGV2LmRyaXZlci0+b2Zf
bWF0Y2hfdGFibGUsIGxheW91dF9ucCk7Ci0KLQlyZXR1cm4gbWF0Y2ggPyBtYXRjaC0+ZGF0YSA6
IE5VTEw7Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChudm1lbV9sYXlvdXRfZ2V0X21hdGNoX2RhdGEp
OwotCiAvKioKICAqIG52bWVtX3JlZ2lzdGVyKCkgLSBSZWdpc3RlciBhIG52bWVtIGRldmljZSBm
b3IgZ2l2ZW4gbnZtZW1fY29uZmlnLgogICogQWxzbyBjcmVhdGVzIGEgYmluYXJ5IGVudHJ5IGlu
IC9zeXMvYnVzL252bWVtL2RldmljZXMvZGV2LW5hbWUvbnZtZW0KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCBiL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIu
aAppbmRleCA4MWE2NzY0MmFjNTUuLmYwYmEwZTAzMjE4ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9udm1lbS1wcm92aWRlci5oCisrKyBiL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIu
aApAQCAtMjA1LDkgKzIwNSw2IEBAIHZvaWQgbnZtZW1fbGF5b3V0X2RyaXZlcl91bnJlZ2lzdGVy
KHN0cnVjdCBudm1lbV9sYXlvdXRfZHJpdmVyICpkcnYpOwogCW1vZHVsZV9kcml2ZXIoX19udm1l
bV9sYXlvdXRfZHJpdmVyLCBudm1lbV9sYXlvdXRfZHJpdmVyX3JlZ2lzdGVyLCBcCiAJCSAgICAg
IG52bWVtX2xheW91dF9kcml2ZXJfdW5yZWdpc3RlcikKIAotY29uc3Qgdm9pZCAqbnZtZW1fbGF5
b3V0X2dldF9tYXRjaF9kYXRhKHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtLAotCQkJCQlzdHJ1
Y3QgbnZtZW1fbGF5b3V0ICpsYXlvdXQpOwotCiAjZWxzZQogCiBzdGF0aWMgaW5saW5lIHN0cnVj
dCBudm1lbV9kZXZpY2UgKm52bWVtX3JlZ2lzdGVyKGNvbnN0IHN0cnVjdCBudm1lbV9jb25maWcg
KmMpCkBAIC0yMzgsMTMgKzIzNSw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IG52bWVtX2xheW91dF9y
ZWdpc3RlcihzdHJ1Y3QgbnZtZW1fbGF5b3V0ICpsYXlvdXQpCiAKIHN0YXRpYyBpbmxpbmUgdm9p
ZCBudm1lbV9sYXlvdXRfdW5yZWdpc3RlcihzdHJ1Y3QgbnZtZW1fbGF5b3V0ICpsYXlvdXQpIHt9
CiAKLXN0YXRpYyBpbmxpbmUgY29uc3Qgdm9pZCAqCi1udm1lbV9sYXlvdXRfZ2V0X21hdGNoX2Rh
dGEoc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0sCi0JCQkgICAgc3RydWN0IG52bWVtX2xheW91
dCAqbGF5b3V0KQotewotCXJldHVybiBOVUxMOwotfQotCiAjZW5kaWYgLyogQ09ORklHX05WTUVN
ICovCiAKICNpZiBJU19FTkFCTEVEKENPTkZJR19OVk1FTSkgJiYgSVNfRU5BQkxFRChDT05GSUdf
T0YpCi0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
