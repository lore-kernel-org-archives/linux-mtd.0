Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A106C43218
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:43:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5948421479
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qzyQ10bh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLdiWg0Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5948421479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9YNgbGDyqBzeh5edQqQ9U6VqQRjNxgsWSoBmVB8GD4=; b=qzyQ10bht6ew7V
	Xy1pB28qj80YfEbFqGhoolLyndYqmvTh2jzuCLVgFiLOvM0pxtPyT+ZXuaQTCRq5dU6msaHFV6BEF
	8Dgk7IOVgUEDueRv2CKLKPWvv+CrPzBTnp+55OCreF5hbV18bn2xDRKq1/b+ENfOLGozs2HeAODzA
	6HUhmK9f9YLLYMur8y9NSSW2VLfJaT1B9u580QA92ZeJU2rb5TiKPofDsrmXLaW8TvHd5KtX3SMco
	6yF4pNxEzUiIeraDGF4PP28v39lCVbVX45AEDM4TKPDBsTh9di+ocsieZ716yz8YZUpXEeu9GtysJ
	K5ehSv2ihr2ZEHP6sgSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3wJ-00045n-Jl; Fri, 26 Apr 2019 16:43:07 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3vq-0003PM-0S
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 16:42:41 +0000
Received: by mail-lj1-x241.google.com with SMTP id s7so795420ljh.1
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Y+4Tl47IG+lz0BxKQcbzY1Eso3ZPi0a0zQy/pwXSWM=;
 b=GLdiWg0ZkD2A76urU8+cUmH7vu4+Xj4Xr0HWH0tPBVd1h13p5zIa8oOwLyU0z31n4W
 MC/IGXOLu4gAz/z2SgQOTsMvWc//eQlHtxh7QQ895Dyj4rjwrrSDzB4avpPAy8vcJYUR
 NnWAbeJg+tgKVEwd+UuNO1nYtnqxXrJTAis4G+Ei1fFPmj52MCw1g3nm3PjxmlZYvW3e
 9l+vTSCFBvGlDKsuTcxo7Ux/oNuOWDfDp1h8gM3ybn2Uin0weXZgm9n//Np9tEYB18JX
 /OtPusi+ULOTnp/yl+VIAeyDbA6Xf5M2hyVFqEGXMOJNR0qjQWXJhHWxFkkrsAgoeYe8
 uF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Y+4Tl47IG+lz0BxKQcbzY1Eso3ZPi0a0zQy/pwXSWM=;
 b=nfewZp+1FV3WtXttx6XBtFU8Krh30MtVaASbTIWj+YNNMg8IxJIiLrnYPLbX76CESv
 3E/6gSQW1OaPJ4EOPGvP6XEC8/PyaOkqZDwy3xQ38L7YAhbUpEAF/b9WX33M7xizrsi8
 gPUWleksjQIUBsOoUJSla2lLL1NyWcJuD6u5eXNm4X3Cu+nfJmHFsfbwKU2C40JPTJMo
 0iYuF7xQK1syWadeG1MTqwaYgSAB/ke1W2wrF5VS+++hW6aE456N6B63QEnyRVyYbBC6
 Sa32IyQ4HUqjvDknNjib5jhhranpmZdxpnSFW8lTBLykSgErbAr4Jy/JzWOShU5A0HJK
 U28Q==
X-Gm-Message-State: APjAAAVF4gsd3RRV/1r0gdPdswaOiixBZGZGByfukE0kk+fWl6jNhRnJ
 1FMrm9aOWS0IOakEbyICKgs=
X-Google-Smtp-Source: APXvYqyk/POYUvdk35I2whPVIAg8/WSc3NUy2eGeHn6j2RSTLnpZi2BPXJt0JWUcnlepCVr6LY1PQQ==
X-Received: by 2002:a2e:4a09:: with SMTP id x9mr5053589lja.19.1556296956179;
 Fri, 26 Apr 2019 09:42:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id q11sm5637807lfc.51.2019.04.26.09.42.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:42:35 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH 3/5] mtd: onenand/samsung: Add device tree support
Date: Fri, 26 Apr 2019 18:42:22 +0200
Message-Id: <20190426164224.11327-4-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_094238_411017_CDA44961 
X-CRM114-Status: GOOD (  14.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4KClRoaXMgcGF0Y2ggYWRk
cyBzdXBwb3J0IGZvciBpbnN0YW50YXRpb24gdXNpbmcgRGV2aWNlIFRyZWUuCgpTaWduZWQtb2Zm
LWJ5OiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBQ
YXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+Ci0tLQogZHJpdmVy
cy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmcuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmcuYwppbmRleCA5NjI4YmY1YmMzOTcuLjBmNDUwNjA0
NDEyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmcuYworKysg
Yi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jCkBAIC0yNSw2ICsyNSw3IEBACiAj
aW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQu
aD4KICNpbmNsdWRlIDxsaW51eC9pby5oPgorI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAKICNpbmNs
dWRlICJzYW1zdW5nLmgiCiAKQEAgLTgzNSw4ICs4MzYsMzYgQEAgc3RhdGljIHZvaWQgczNjX29u
ZW5hbmRfc2V0dXAoc3RydWN0IG10ZF9pbmZvICptdGQpCiAJdGhpcy0+d3JpdGVfYnVmZmVycmFt
ID0gb25lbmFuZF93cml0ZV9idWZmZXJyYW07CiB9CiAKKyNpZmRlZiBDT05GSUdfT0YKK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHMzY19vbmVuYW5kX29mX21hdGNoW10gPSB7CisJ
eyAuY29tcGF0aWJsZSA9ICJzYW1zdW5nLHMzYzY0MDAtb25lbmFuZCIsCisJCS5kYXRhID0gKHZv
aWQgKilUWVBFX1MzQzY0MDAgfSwKKwl7IC5jb21wYXRpYmxlID0gInNhbXN1bmcsczNjNjQxMC1v
bmVuYW5kIiwKKwkJLmRhdGEgPSAodm9pZCAqKVRZUEVfUzNDNjQxMCB9LAorCXsgLmNvbXBhdGli
bGUgPSAic2Ftc3VuZyxzNXB2MjEwLW9uZW5hbmQiLAorCQkuZGF0YSA9ICh2b2lkICopVFlQRV9T
NVBDMTEwIH0sCisJe30sCit9OworTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgb25lbmFuZF9zM2Nf
ZHRfbWF0Y2gpOworI2VuZGlmCisKK3N0YXRpYyBlbnVtIHNvY190eXBlIHMzY19vbmVuYW5kX2dl
dF9kZXZpY2VfaWQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CisKKwlpZiAoSVNfRU5BQkxFRChDT05G
SUdfT0YpICYmIG5wKSB7CisJCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOworCisJ
CW1hdGNoID0gb2ZfbWF0Y2hfbm9kZShzM2Nfb25lbmFuZF9vZl9tYXRjaCwgbnApOworCQlyZXR1
cm4gKGVudW0gc29jX3R5cGUpbWF0Y2gtPmRhdGE7CisJfQorCisJcmV0dXJuIHBsYXRmb3JtX2dl
dF9kZXZpY2VfaWQocGRldiktPmRyaXZlcl9kYXRhOworfQorCiBzdGF0aWMgaW50IHMzY19vbmVu
YW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CisJc3RydWN0IGRldmlj
ZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwogCXN0cnVjdCBvbmVuYW5kX3BsYXRmb3Jt
X2RhdGEgKnBkYXRhOwogCXN0cnVjdCBvbmVuYW5kX2NoaXAgKnRoaXM7CiAJc3RydWN0IG10ZF9p
bmZvICptdGQ7CkBAIC04NTgsOSArODg3LDEwIEBAIHN0YXRpYyBpbnQgczNjX29uZW5hbmRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXRoaXMgPSAoc3RydWN0IG9uZW5h
bmRfY2hpcCAqKSAmbXRkWzFdOwogCW10ZC0+cHJpdiA9IHRoaXM7CisJbXRkLT5kZXYub2Zfbm9k
ZSA9IG5wOwogCW10ZC0+ZGV2LnBhcmVudCA9ICZwZGV2LT5kZXY7CiAJb25lbmFuZC0+cGRldiA9
IHBkZXY7Ci0Jb25lbmFuZC0+dHlwZSA9IHBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldiktPmRy
aXZlcl9kYXRhOworCW9uZW5hbmQtPnR5cGUgPSBzM2Nfb25lbmFuZF9nZXRfZGV2aWNlX2lkKHBk
ZXYpOwogCiAJczNjX29uZW5hbmRfc2V0dXAobXRkKTsKIApAQCAtOTE5LDYgKzk0OSwxMCBAQCBz
dGF0aWMgaW50IHMzY19vbmVuYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJfQogCiAJb25lbmFuZC0+Y2xrX2J1cyA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiYnVz
Iik7CisJaWYgKG5wICYmIElTX0VSUihvbmVuYW5kLT5jbGtfYnVzKSkgeworCQlkZXZfZXJyKCZw
ZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IGJ1cyBjbG9ja1xuIik7CisJCXJldHVybiBQVFJfRVJS
KG9uZW5hbmQtPmNsa19idXMpOworCX0KIAlpZiAoIUlTX0VSUihvbmVuYW5kLT5jbGtfYnVzKSkK
IAkJY2xrX3ByZXBhcmVfZW5hYmxlKG9uZW5hbmQtPmNsa19idXMpOwogCkBAIC0xMDAwLDYgKzEw
MzQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzM2Nfb25lbmFuZF9kcml2ZXIg
PSB7CiAJLmRyaXZlciAgICAgICAgID0gewogCQkubmFtZQk9ICJzYW1zdW5nLW9uZW5hbmQiLAog
CQkucG0JPSAmczNjX3BtX29wcywKKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHMz
Y19vbmVuYW5kX29mX21hdGNoKSwKIAl9LAogCS5pZF90YWJsZQk9IHMzY19vbmVuYW5kX2RyaXZl
cl9pZHMsCiAJLnByb2JlICAgICAgICAgID0gczNjX29uZW5hbmRfcHJvYmUsCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
