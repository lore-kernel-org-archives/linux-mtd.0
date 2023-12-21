Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1AEC46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLxIdsqLbSxuED4C8XziuCFQ2dSihKD7L8lwEN4e73A=; b=0+XbaBDATIQ++a
	/V8rSbYkaZLRUfjVC/wjE+Zz7a+HPFcQZ4vd1iNIy8G7j9G/3GbYscaC12+4FF2vgi96HudxD0Jpu
	DEcoloti6iWh29hbrgpkwFiCwuaYKRG7D3COjs/0qw9oWxyGHX655fFbGWbeuOY5k5HGufEP37NyQ
	zRTY3QMnI+VHtnJfjToEn9Qmc/Bix/7m/QnfmotlVxqjvyVv9Uew53wfVMqppHszsDFIKRGEoCbXJ
	YYCfCZeBrIJRxDQzzMzek2qY9zwaZ17u4J9HThlWQw5trHHMzFwqsKB8u9sVqkKMuoIdI80ORhLMJ
	60hNQJQkzPhUHIbnjFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwi-003gF6-26;
	Thu, 21 Dec 2023 17:34:56 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwV-003g3d-3A;
	Thu, 21 Dec 2023 17:34:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a2371eae8f1so123908066b.1;
        Thu, 21 Dec 2023 09:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703180080; x=1703784880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XhPv1RG5GYBxA6YK5orD14R9QXHs06Ax0C4Bquly6M=;
        b=cDztAuJvoKoGkYWu73aPmJbAceg8T9k0QPWoTksEnkC8kmUmtqcffVcwmBIW44oQ4x
         t0WKkcNhnXxvW0ufYevULQ0jiXqAJ0Q7fzBuxtL5WP+bBTlAyD+Tj0Cil/5RZlwn8QhN
         voCmVdG3FotxjIFw16jszIYeUG5Dxay1wo0UV3AUl4KsANBThg12toJfAkkyDil8ZlIU
         Pn+aGn6YotvwbJ7q1r9cJbkq62hnMFkUTux6RQA08U2BMKzZAgHT4nyiqHfrBqAV2Vju
         2jlsYtOSbg7IXUM7mMlVPrpsgYayBm7nCKGGsucorSd781aCLxM76bQP375SfoqatX1l
         /pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180080; x=1703784880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XhPv1RG5GYBxA6YK5orD14R9QXHs06Ax0C4Bquly6M=;
        b=XpdcztVUG9A8rVm6RnYfVoB7Z7ixnWw0PY2jxLvRtPfCDRlLaP2R8D0KC2yNDALqJy
         FkLIEjjjPBKRJXd6ZzM8VTJw5BOa3SYah2KWtbRtdtcxLJMhb8gPS5z4j0GHDFD79PFA
         A2zavz/xlQ9i2Oy48nidelNihODHEdsbfqnSWZfFyoqz4myAhtkjqaSfMcL1uI0JJQ8j
         d2ZaCtd8cdwKlMg+dnUXIwOhP/Gpubr3vS6KK4hvR605mZETWJXdjgbbAgbDZ5iS9Xzd
         u619TJE0aHSNxD+MDWZ0H9IGgtQjso1b5Okaxs7jpgXBY/YaZliPjWM9mcseF0VvfuTs
         5ySQ==
X-Gm-Message-State: AOJu0Yy7O5Tg204iZXSGp9E1ERggGMdMecw/iNz587YY/4ZNW9JONC+x
	sN4EXTPnPSjYRi+oklhwe+A=
X-Google-Smtp-Source: AGHT+IEY+7wyVZIZ+h3uGtQYr+kF581gR4pDcml555wj8gHDXaLod5c5pIXzSSoJp59GcB1hlVt2Ww==
X-Received: by 2002:a17:906:3c18:b0:a22:e2ea:4fad with SMTP id h24-20020a1709063c1800b00a22e2ea4fadmr83814ejg.83.1703180079840;
        Thu, 21 Dec 2023 09:34:39 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709060ad900b00a23499f1d7dsm1176118ejf.209.2023.12.21.09.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:34:39 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 5/6] nvmem: u-boot-env: improve coding style
Date: Thu, 21 Dec 2023 18:34:20 +0100
Message-Id: <20231221173421.13737-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231221173421.13737-1-zajec5@gmail.com>
References: <20231221173421.13737-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_093444_026766_06B6E764 
X-CRM114-Status: GOOD (  12.91  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKMS4gUHJlZmVyIGt6YWxs
b2MoKSBvdmVyIGtjYWxsb2MoKQogICBTZWUgbWVtb3J5LWFsbG9jYXRpb24ucnN0IHdoaWNoIHNh
eXM6ICJ0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGl0J3MKICAgYmVzdCB0byB1c2Ugcm91dGluZXMg
dGhhdCBzZXQgbWVtb3J5IHRvIHplcm8sIGxpa2Uga3phbGxvYygpIgoyLiBEcm9wIGRldl9lcnIo
KSBmb3IgdV9ib290X2Vudl9hZGRfY2VsbHMoKSBmYWlsCiAgIEl0IGNhbiBmYWlsIG9ubHkgb24g
LUVOT01FTS4gV2UgZG9uJ3Qgd2FudCB0byBwcmludCBlcnJvciB0aGVuLgozLiBBZGQgZXh0cmEg
ImNyYzMyX2FkZHIiIHZhcmlhYmxlCiAgIEl0IG1ha2VzIGNvZGUgcmVhZGluZyBoZWFkZXIncyBj
cmMzMiBlYXNpZXIgdG8gdW5kZXJzdGFuZCAvIHJldmlldy4KClNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQpWMjogTmV3IHBhdGNoIHdpdGggc3VnZ2Vz
dGlvbnMgZnJvbSBNaXF1ZWwKCiBkcml2ZXJzL252bWVtL3UtYm9vdC1lbnYuYyB8IDggKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMgYi9kcml2ZXJzL252bWVtL3UtYm9v
dC1lbnYuYwppbmRleCAxMTE5MDUxODkzNDEuLmJlZmJhYjE1NmNkYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9udm1lbS91LWJvb3QtZW52LmMKKysrIGIvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMK
QEAgLTEzMiw2ICsxMzIsNyBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcGFyc2Uoc3RydWN0IHVf
Ym9vdF9lbnYgKnByaXYpCiAJc2l6ZV90IGNyYzMyX2RhdGFfb2Zmc2V0OwogCXNpemVfdCBjcmMz
Ml9kYXRhX2xlbjsKIAlzaXplX3QgY3JjMzJfb2Zmc2V0OworCV9fbGUzMiAqY3JjMzJfYWRkcjsK
IAlzaXplX3QgZGF0YV9vZmZzZXQ7CiAJc2l6ZV90IGRhdGFfbGVuOwogCXNpemVfdCBkZXZfc2l6
ZTsKQEAgLTE0Myw3ICsxNDQsNyBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcGFyc2Uoc3RydWN0
IHVfYm9vdF9lbnYgKnByaXYpCiAKIAlkZXZfc2l6ZSA9IG52bWVtX2Rldl9zaXplKG52bWVtKTsK
IAotCWJ1ZiA9IGtjYWxsb2MoMSwgZGV2X3NpemUsIEdGUF9LRVJORUwpOworCWJ1ZiA9IGt6YWxs
b2MoZGV2X3NpemUsIEdGUF9LRVJORUwpOwogCWlmICghYnVmKSB7CiAJCWVyciA9IC1FTk9NRU07
CiAJCWdvdG8gZXJyX291dDsKQEAgLTE3NSw3ICsxNzYsOCBAQCBzdGF0aWMgaW50IHVfYm9vdF9l
bnZfcGFyc2Uoc3RydWN0IHVfYm9vdF9lbnYgKnByaXYpCiAJCWRhdGFfb2Zmc2V0ID0gb2Zmc2V0
b2Yoc3RydWN0IHVfYm9vdF9lbnZfaW1hZ2VfYnJvYWRjb20sIGRhdGEpOwogCQlicmVhazsKIAl9
Ci0JY3JjMzIgPSBsZTMyX3RvX2NwdSgqKF9fbGUzMiAqKShidWYgKyBjcmMzMl9vZmZzZXQpKTsK
KwljcmMzMl9hZGRyID0gKF9fbGUzMiAqKShidWYgKyBjcmMzMl9vZmZzZXQpOworCWNyYzMyID0g
bGUzMl90b19jcHUoKmNyYzMyX2FkZHIpOwogCWNyYzMyX2RhdGFfbGVuID0gZGV2X3NpemUgLSBj
cmMzMl9kYXRhX29mZnNldDsKIAlkYXRhX2xlbiA9IGRldl9zaXplIC0gZGF0YV9vZmZzZXQ7CiAK
QEAgLTE4OCw4ICsxOTAsNiBAQCBzdGF0aWMgaW50IHVfYm9vdF9lbnZfcGFyc2Uoc3RydWN0IHVf
Ym9vdF9lbnYgKnByaXYpCiAKIAlidWZbZGV2X3NpemUgLSAxXSA9ICdcMCc7CiAJZXJyID0gdV9i
b290X2Vudl9hZGRfY2VsbHMocHJpdiwgYnVmLCBkYXRhX29mZnNldCwgZGF0YV9sZW4pOwotCWlm
IChlcnIpCi0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjZWxsczogJWRcbiIsIGVycik7
CiAKIGVycl9rZnJlZToKIAlrZnJlZShidWYpOwotLSAKMi4zNS4zCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
