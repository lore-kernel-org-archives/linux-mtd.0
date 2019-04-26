Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E868C43218
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1AA7214AE
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3Pvb/uG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkHXdRvo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1AA7214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYXH1dFNYjYYeWKg5zkPSzmUH7a3BOnrntpZFfRqAbo=; b=X3Pvb/uGbR6gM0
	ggHIU6Eu58ed/5j+zj5zn8p7li5x5ewxBbfnVMc9UugfdK+8pfV08Ej0g9JC+qD+/K/cn444BRFak
	VoOMQ3zK5lN+nPZ28IZJGyZFHCu6Ag4oQBSN7MMNvbJpdQtPnWV2lg/2nYQ1p+bdXG+ljZVxgFeZB
	1nzwL85azNmZY5Owk+p0Dv1UuYxdbyPerYdaHU3iHXIYqB4F0ZD183eJuskuVJ5Eu2+bx51i+zq4m
	wphgSCCKlc7WwwnKz3FCihYzrmsUJo/EQLoa/n3ftBBcoLPoTcJJ8Hsb6LmrKHl6HGRqcag9Oc5MP
	yg/xxx8LoxsMg3BIgLCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3w7-0003qg-U5; Fri, 26 Apr 2019 16:42:55 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3vo-0003Om-Cl
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 16:42:38 +0000
Received: by mail-lf1-x144.google.com with SMTP id j20so2982388lfh.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWVEhVXV6Szyd9/44KMWrRQaDEl4L0ZWJnDi1/l1OvU=;
 b=WkHXdRvo7xgf4zAkZ1FgFwoafjH+HccU9KLH1nV9eSay+kL9EbIhE6HkomyibxW1e4
 lNHutCqEG+L35Mk8D6utdJQ97nVWRuksU1keF0ALEwIfHvmOpLMVogA/Wi5dsdXkj6ZH
 heoVg3WDdIQwDg0auIn9YOkFfd1EjsS6W3Xm8S1MFOVqip9GQ5Q8M9dxn0u6389PMpTr
 C5SXY+nN5SKa4QMyjEZQ6vNGwTxE0MxU2JzTkAD7zuNxehhx3MBHRh6z7wxd/gSBScS2
 n+JZfX5Ahg5EbO2YYTuPLFt/ibIXN/yzINXn0rCyOrI7VZ5g7YpEmZD6TmN+KgxMm4bV
 3/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWVEhVXV6Szyd9/44KMWrRQaDEl4L0ZWJnDi1/l1OvU=;
 b=V1YafGj2xUpvqm98T6JW9xguVo78YsJgUVQbFNUxiCcaknZTIGFWjcCYsVegNlz5z2
 HMIuI4Go4Nq9jR7iSrym4ny1M8by9IUpdxW7kwugCRrZaOydvkaDDf9RfVRdBmQ90mNH
 KPEsc77DF+jn6o7nKDoRJOenJ+GZ2j1wmtNtrMLgyFbrba90M+qwFBuNk8aBxJOYt+y6
 XzAPkX6ZDw/vaiUS8wwFWu+xEj6s4skoHQD6sJCTkK1sfAkk1cC1ToDkdeKItZUFxrMv
 bQRlcg+KancejN+Zyv01WEWF2/LqaFCBLOq3FW2K7d/toPksYOi+I8KlRkQBmBXv4bVJ
 5p1g==
X-Gm-Message-State: APjAAAXFcGRmf7iufY4UsUddfkeJb7E8zSFEOwkRcVufnQt02Lr6U5GX
 qsa1ljYCX29BERDdmMN5UxM=
X-Google-Smtp-Source: APXvYqxhhrqH1igbuxLqu6Jv09PPhxp/Yw5Ugs/uQ7FpqteK7/kO4wqb+fOJ0yS80vA0LZ6oBCvrzQ==
X-Received: by 2002:a19:7702:: with SMTP id s2mr26244975lfc.102.1556296954524; 
 Fri, 26 Apr 2019 09:42:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id q11sm5637807lfc.51.2019.04.26.09.42.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:42:33 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH 2/5] mtd: onenand/samsung: Make sure that bus clock is enabled
Date: Fri, 26 Apr 2019 18:42:21 +0200
Message-Id: <20190426164224.11327-3-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_094236_544695_92FC0F25 
X-CRM114-Status: GOOD (  12.92  )
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
cyBiYXNpYyBoYW5kbGluZyBvZiBjb250cm9sbGVyIGJ1cyBjbG9jayB0byBtYWtlIHN1cmUgdGhh
dAppbiBkZXZpY2UgcHJvYmUgaXQgaXMgZW5hYmxlZCBhbmQgZGV2aWNlIGNhbiBvcGVyYXRlIGNv
cnJlY3RseS4gVGhlCmNsb2NrIGlzIG9wdGlvbmFsIGFuZCBkcml2ZXIgYmVoYXZpb3IgaXMgaWRl
bnRpY2FsIGFzIGJlZm9yZSB0aGlzIHBhdGNoCmlmIG5vdCBwcm92aWRlZC4KClNpZ25lZC1vZmYt
Ynk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFBh
d2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9z
YW1zdW5nLmMgYi9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jCmluZGV4IGE0MjVm
MTlhMzg3Ni4uOTYyOGJmNWJjMzk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5h
bmQvc2Ftc3VuZy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nLmMKQEAg
LTE0LDYgKzE0LDcgQEAKICAqCVM1UEMxMTA6IHVzZSBETUEKICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvY2xrLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KQEAgLTEyNSw2ICsxMjYs
NyBAQCBlbnVtIHNvY190eXBlIHsKIHN0cnVjdCBzM2Nfb25lbmFuZCB7CiAJc3RydWN0IG10ZF9p
bmZvCSptdGQ7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZQkqcGRldjsKKwlzdHJ1Y3QgY2xrCSpj
bGtfYnVzOwogCWVudW0gc29jX3R5cGUJdHlwZTsKIAl2b2lkIF9faW9tZW0JKmN0cmxfYmFzZTsK
IAl2b2lkIF9faW9tZW0JKmNoaXBfYmFzZTsKQEAgLTkxNiw2ICs5MTgsMTAgQEAgc3RhdGljIGlu
dCBzM2Nfb25lbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQl9CiAJ
fQogCisJb25lbmFuZC0+Y2xrX2J1cyA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiYnVzIik7
CisJaWYgKCFJU19FUlIob25lbmFuZC0+Y2xrX2J1cykpCisJCWNsa19wcmVwYXJlX2VuYWJsZShv
bmVuYW5kLT5jbGtfYnVzKTsKKwogCWVyciA9IG9uZW5hbmRfc2NhbihtdGQsIDEpOwogCWlmIChl
cnIpCiAJCXJldHVybiBlcnI7CkBAIC05NDcsNiArOTUzLDggQEAgc3RhdGljIGludCBzM2Nfb25l
bmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJb25lbmFuZF9yZWxlYXNl
KG10ZCk7CisJaWYgKCFJU19FUlIob25lbmFuZC0+Y2xrX2J1cykpCisJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShvbmVuYW5kLT5jbGtfYnVzKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
