Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iimFJ6U2wZQtUuYQEuZtXHxdEbffDvf2ecxNug1oOsc=; b=3Lk3fdHepO+YgG
	NR1lCOx2GWZDzEgD/u9rJl29/NbBKc+TWoUC+JshMswWmJBBCujRrz7nXSyJcd080PxxvYS6Je6dU
	dwIVgGf5Ba7lAiM8lswSVHIQApM44u/n9qeJ50FN+OhwBE6nj7/ExzV7JoVmj/24Pi86oeZn/Axuq
	v3q2d2eyUQX+PEAy3JKeAjqTGrQ3VSvbgFtp0C4X9e6FL6lY60xFi07rzp99agvn9AqEHES+6RKrX
	Hs5rGrLB/O0InulIXLmRm9oh/QsY2Ko5UTK09+qJiARyRlvKcgatUxfd/saI1RwXc9ED2SWXd4bZl
	tN8fi5AqId52KvEVoD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPfq-0029s9-GQ; Tue, 10 May 2022 13:13:10 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPfn-0029qO-Fx
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 13:13:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id m20so32843996ejj.10
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8nsbDVM3+ugAvLUdOVtBpKzHJmbj2uNhbXgOFH/eJI=;
 b=AnRe9hbLDU4378bYA9cF2a6iUW3egeQ9QvWhmKm361s28mYdqUrA9SIcpVI4xXjwEN
 eTul0MaL3zQkDWl4pmybOatQSybEJ6ZZxs/1O02BGfuyP7eEeOQb+uOZfqKrkF/xA6Ek
 cfmgaG6nLhV7cnfSVdjsll7iUxNghIEEIyC/UXH8OVVpcsCuiBHDKI5UU4w89xq4IhOw
 H3SdJv6Jzww/oSvqH6/EyUlRv/AYdYcNK0wfBmiEwj5QFWEpJbHmj8KfgXCfA/JffpBQ
 GauqSYzSI13is2OXMdYr51tNODq1LRhWVq2tVEnXfhbtmzqYiCiTN3tM+/ERMFoVTPxI
 pyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8nsbDVM3+ugAvLUdOVtBpKzHJmbj2uNhbXgOFH/eJI=;
 b=wQR+bf+p5Kx5017+/U07EwicEsUjCynWdsJRU0YJ2ash+MiKQv8FLwrlJixxCenJvm
 vrpfPnKEFWnQ7UwguUpH52E28/pICADvF/wWJ037qkbBGdy4kGOWZjPBucdSUIrg/JcH
 nuIhQB0yR0D+oKxmVJSPIoOCV5gB3GVa56nzabABxifCmtfbXPnyw5xqAVsM2v2jdG0/
 LoNvyqS3AKEQVbfscUMFmFc6vVgEAqX/ukiueQBhLoipVlVvqoEVzui5gjr4uBFdGRTU
 n5frONHV87jUpbpO87wGVMA3eUaojPsPrGEtAkuqyTdzk9mTxTvB14zIxnGYne0dlgMJ
 FY1w==
X-Gm-Message-State: AOAM5334+Xz7+w3/slMW6hVUAVkhuSlcTON6IdtVRvknfdRXUCoty74S
 yvS3EebnTBgPwKXu8W+DC8g=
X-Google-Smtp-Source: ABdhPJyKLcgPLVK3BnN2dYFDhPUmBSSxHbYC+pI0CgxzhC11PgneRKZ3lBk6N9uh4k02mrlu+Uaxmw==
X-Received: by 2002:a17:906:4fd5:b0:6f8:5aa9:6f13 with SMTP id
 i21-20020a1709064fd500b006f85aa96f13mr15355764ejw.267.1652188385347; 
 Tue, 10 May 2022 06:13:05 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1709064c8200b006f3ef214dccsm6110815eju.50.2022.05.10.06.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 06:13:05 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3] mtd: call of_platform_populate() for MTD partitions
Date: Tue, 10 May 2022 15:12:59 +0200
Message-Id: <20220510131259.555-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_061307_608911_E001179B 
X-CRM114-Status: GOOD (  17.09  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVW50aWwgdGhpcyBjaGFu
Z2UgTVREIHN1YnN5c3RlbSBzdXBwb3J0ZWQgaGFuZGxpbmcgcGFydGl0aW9ucyBvbmx5IHdpdGgK
TVREIHBhcnRpdGlvbnMgcGFyc2Vycy4gVGhhdCdzIGEgc3BlY2lmaWMgLyBsaW1pdGVkIEFQSSBk
ZXNpZ25lZCBhcm91bmQKcGFydGl0aW9ucy4KClNvbWUgTVREIHBhcnRpdGlvbnMgbWF5IGhvd2V2
ZXIgcmVxdWlyZSBkaWZmZXJlbnQgaGFuZGxpbmcuIFRoZXkgbWF5CmNvbnRhaW4gc3BlY2lmaWMg
ZGF0YSB0aGF0IG5lZWRzIHRvIGJlIHBhcnNlZCBhbmQgc29tZWhvdyBleHRyYWN0ZWQuIEZvcgp0
aGF0IHB1cnBvc2UgTVREIHN1YnN5c3RlbSBzaG91bGQgYWxsb3cgYmluZGluZyBvZiBzdGFuZGFy
ZCBwbGF0Zm9ybQpkcml2ZXJzLgoKQW4gZXhhbXBsZSBjYW4gYmUgVS1Cb290IChzdWIpcGFydGl0
aW9uIHdpdGggZW52aXJvbm1lbnQgdmFyaWFibGVzLgpUaGVyZSBleGlzdCBhICJ1LWJvb3QsZW52
IiBEVCBiaW5kaW5nIGZvciBNVEQgKHN1YilwYXJ0aXRpb24gdGhhdApyZXF1aXJlcyBhbiBOVk1F
TSBkcml2ZXIuCgpSZWY6IDVkYjFjMmRiYzA0YyAoImR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFUt
Qm9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYmluZGluZyIpClNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tClYyOiBGaXggY2FzZSBmb3IgIyBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBpcyBub3Qgc2V0CiAgICBtYXN0ZXItPmRldiBjYW4n
dCBiZSB1c2VkIGJsaW5kbHkgYXMgaXQgbWF5IHBvaW50IHRvIHVucmVnaXN0ZXJlZAogICAgZGV2
aWNlIGFuZCBjYXVzZSBXQVJOSU5HcwpWMzogVXNlIGVhc2llciB0byBmb2xsb3cgbG9naWMgZm9y
IHNldHRpbmcgImRldiIgdmFyaWFibGUgKyBhZGQgY29tbWVudAotLS0KIGRyaXZlcnMvbXRkL210
ZHBhcnQuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5j
CmluZGV4IDM1NzY2MWI2MmM5NC4uZDQ0MmZhOTRjODcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9tdGRwYXJ0LmMKKysrIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCkBAIC0xNyw2ICsxNyw3IEBA
CiAjaW5jbHVkZSA8bGludXgvbXRkL3BhcnRpdGlvbnMuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIu
aD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+
CiAKICNpbmNsdWRlICJtdGRjb3JlLmgiCiAKQEAgLTU3NywxMCArNTc4LDE2IEBAIHN0YXRpYyBp
bnQgbXRkX3BhcnRfb2ZfcGFyc2Uoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCiAJc3RydWN0IG10
ZF9wYXJ0X3BhcnNlciAqcGFyc2VyOwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7CiAJc3RydWN0
IHByb3BlcnR5ICpwcm9wOworCXN0cnVjdCBkZXZpY2UgKmRldjsKIAljb25zdCBjaGFyICpjb21w
YXQ7CiAJY29uc3QgY2hhciAqZml4ZWQgPSAiZml4ZWQtcGFydGl0aW9ucyI7CiAJaW50IHJldCwg
ZXJyID0gMDsKIAorCWRldiA9ICZtYXN0ZXItPmRldjsKKwkvKiBVc2UgcGFyZW50IGRldmljZSAo
Y29udHJvbGxlcikgaWYgdGhlIHRvcCBsZXZlbCBNVEQgaXMgbm90IHJlZ2lzdGVyZWQgKi8KKwlp
ZiAoIUlTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpICYmICFtdGRfaXNf
cGFydGl0aW9uKG1hc3RlcikpCisJCWRldiA9IG1hc3Rlci0+ZGV2LnBhcmVudDsKKwogCW5wID0g
bXRkX2dldF9vZl9ub2RlKG1hc3Rlcik7CiAJaWYgKG10ZF9pc19wYXJ0aXRpb24obWFzdGVyKSkK
IAkJb2Zfbm9kZV9nZXQobnApOwpAQCAtNTkzLDYgKzYwMCw3IEBAIHN0YXRpYyBpbnQgbXRkX3Bh
cnRfb2ZfcGFyc2Uoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCiAJCQljb250aW51ZTsKIAkJcmV0
ID0gbXRkX3BhcnRfZG9fcGFyc2UocGFyc2VyLCBtYXN0ZXIsIHBwYXJ0cywgTlVMTCk7CiAJCWlm
IChyZXQgPiAwKSB7CisJCQlvZl9wbGF0Zm9ybV9wb3B1bGF0ZShucCwgTlVMTCwgTlVMTCwgZGV2
KTsKIAkJCW9mX25vZGVfcHV0KG5wKTsKIAkJCXJldHVybiByZXQ7CiAJCX0KQEAgLTYwMCw2ICs2
MDgsNyBAQCBzdGF0aWMgaW50IG10ZF9wYXJ0X29mX3BhcnNlKHN0cnVjdCBtdGRfaW5mbyAqbWFz
dGVyLAogCQlpZiAocmV0IDwgMCAmJiAhZXJyKQogCQkJZXJyID0gcmV0OwogCX0KKwlvZl9wbGF0
Zm9ybV9wb3B1bGF0ZShucCwgTlVMTCwgTlVMTCwgZGV2KTsKIAlvZl9ub2RlX3B1dChucCk7CiAK
IAkvKgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
