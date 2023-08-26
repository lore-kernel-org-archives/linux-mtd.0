Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8755C83F01
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fi3anK9XCGBx/hdzkFUzEY75En/GlfLJmP4qJ6xWaNU=; b=4eKttO5QSjp5Le
	EuF+bY0J/MsyMc4qi7cCsQnZ2eI7OHyBTerzEDsMRPVaNYK0EgHzHQeb7+08YK8s5aZwGcOHRQcU7
	a3K+ZDZLmKC3Sa34tAhrzu90RDTmfOPwFcMMoWGCIqq6wpZnbQQQOeUOO3M70SMVXzoIbj6Z7poM6
	t0GsSDGsydDgesmo67sLlRMDD5rdDULGYGW4oVBUN5ImRUes+1BvIBLsA3UZ2qqLC58YnLVKCpW8D
	DTnxZt9OeJLfMnyZ1iZzD76yWDRTtSRUtp6X6dgqxoHp/h3fy+LCACZyUHny5Qhv8Z+fOzzQsoY88
	RSdWPvTktE/t1mL85pWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZzh2-007CLl-1C;
	Sat, 26 Aug 2023 20:15:36 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZzgz-007CKi-09
	for linux-mtd@lists.infradead.org;
	Sat, 26 Aug 2023 20:15:34 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5007f3d3235so3090248e87.2
        for <linux-mtd@lists.infradead.org>; Sat, 26 Aug 2023 13:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693080929; x=1693685729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiClfjB25JQP+nvwhV5eVxfGres78QLziYRocpk7hNg=;
        b=r4mXYBsZgZu4XhHaE9QWRSqYR7q8IE+oEin5qfpD6Sf/J3TWFuEa/ViTN1VsdtHFzl
         aKOkLvPFGeuvP5g3fDazkDDX+isg9uywLXAzGIsjSVVgG717OlvIOWcYVzJ8W5UzR0cz
         yta2QTDhx1KDOLnw1YGXBvC9JxCouGvN3GEiOZDEqxf3Qza6F8SP5VrpfgVncP7QOUuw
         g64oR9ZWg4Y4xmzKeRPw9Opc4pYsfjCuhVSVoqTUjvHvqTb6cmmZBeJ4To1STVuFE6TW
         KZsjz9kdI9fJyWtRIDeX73jR8EATlD4knXtFGgqiKQ4LWVySfrOrTLGKt+qwO5HXCEZN
         E6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693080929; x=1693685729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiClfjB25JQP+nvwhV5eVxfGres78QLziYRocpk7hNg=;
        b=A1+9Z6oQY8ASA+B3aJqe6nOV6f1q02YIq3tccy2VnNE6nN69FEd8oXzFR7xOI/uZNZ
         9q1kmfl8dpd4VtnCRBaf3gpnmg3mEKyZUc1j2M10YUa4yN2Bpgv7Fji5dU17VucvZwfM
         jkLIQhf4rq8JBVh1H1Kb3MWgN5InomGBwdm+V6/+9QSIxLpgHKQJPFkqxEFCvck3ogw+
         yDKVENjshDKHK5AKPxTIXJYCTUEGXZSNz8mf3FlqsYwI6N/TsjmXLbqKcZUETpUTzUV8
         Q8KmQ3+aJVHPodbnlAzUGE1li9tQPpEfLACXatRhLsiyXqJabSuCY/8KGZ3aN3XSvOMs
         uMlw==
X-Gm-Message-State: AOJu0YwmDRj2royFnaQKQf1e1UeF7ospNE4SDRM0yVyj7Xx0BNwRt16l
	r7ux8AFYMudgNEWWbRDBIME=
X-Google-Smtp-Source: AGHT+IGqrFqmGE4oHqPCMDDR68XZhC2DGYJX9mBLn9ove4qTNG59NMxLTApREuKbJviG3CqQrT9bGg==
X-Received: by 2002:a05:6512:114d:b0:4f8:67f0:7253 with SMTP id m13-20020a056512114d00b004f867f07253mr21782588lfg.49.1693080928758;
        Sat, 26 Aug 2023 13:15:28 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id j13-20020ac253ad000000b004fe119b0105sm825811lfh.272.2023.08.26.13.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 13:15:28 -0700 (PDT)
Message-ID: <ba3c419a-6511-480a-b5f2-6c418f9c02e7@gmail.com>
Date: Sat, 26 Aug 2023 22:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "nvmem: add new config option"
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alban Bedel
 <albeu@free.fr>, Christian Marangi <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230718084804.20139-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230718084804.20139-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_131533_083671_069FB120 
X-CRM114-Status: GOOD (  22.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU3JpbmksCgpPbiAxOC4wNy4yMDIzIDEwOjQ4LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4g
RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgNTE3ZjE0ZDljZjM1MzNkNWFiNGZkZWQxOTVhYjZmODBhOTJlMzc4Zi4KPiAKPiBJ
dCBzZWVtcyB0aGF0ICJub19vZl9ub2RlIiBjb25maWcgb3B0aW9uIHdhcyBhZGRlZCB0byBoZWxw
IG10ZCdzIGNhc2UuCj4gCj4gRFQgbm9kZXMgb2YgTVREIHBhcnRpdGlvbnMgKHRoYXQgYXJlIGFs
c28gTlZNRU0gZGV2aWNlcykgbWF5IGNvbnRhaW4KPiBzdWJub2RlcyB0aGF0IFNIT1VMRCBOT1Qg
YmUgdHJlYXRlZCBhcyBOVk1FTSBmaXhlZCBjZWxscy4gVG8gcHJldmVudAo+IE5WTUVNIGNvcmUg
Y29kZSBmcm9tIHBhcnNpbmcgdGhlbSAibm9fb2Zfbm9kZSIgd2FzIHNldCB0byB0cnVlIGFuZCB0
aGF0Cj4gbWFkZSBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKCkgaW4gTlZNRU0gYSBuby1vcC4KPiAK
PiBXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMiIGNv
bmZpZyBvcHRpb24KPiB0aGluZ3MgZ290IG1vcmUgZXhwbGljaXQuIE1URCBzdWJzeXN0ZW0gc2lt
cGx5IHRlbGxzIE5WTUVNIHdoZW4gdG8gbG9vawo+IGZvciBmaXhlZCBjZWxscyBhbmQgdGhlcmUg
aXMgbm8gbmVlZCB0byBoYWNrICJvZl9ub2RlIiBwb2ludGVyIGFueW1vcmUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IEltcG9y
dGFudDogdGhpcyBpcyBiYXNlZCBvbiB0b3Agb2YgdGhlCj4gW1BBVENIIFY0XSBudm1lbTogYWRk
IGV4cGxpY2l0IGNvbmZpZyBvcHRpb24gdG8gcmVhZCBvbGQgc3ludGF4IGZpeGVkIE9GIGNlbGxz
CgpJIHNlZSB5b3Ugc2tpcHBlZCB0aG9zZSB0d28gcGF0Y2hlcyBmb3IgNi42LgoKQ2FuIHlvdSBx
dWV1ZSB0aGVtIGZvciA2LjcsIHBsZWFzZT8KCgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvbXRkY29y
ZS5jICAgICAgICAgIHwgMSAtCj4gICBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgfCAy
ICstCj4gICBpbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggfCAyIC0tCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCA5
ZGI4ZDc4NTM2MzkuLjNkNzgxZmZiOGMzMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRj
b3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtNTU0LDcgKzU1NCw2IEBA
IHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgIAljb25m
aWcucmVhZF9vbmx5ID0gdHJ1ZTsKPiAgIAljb25maWcucm9vdF9vbmx5ID0gdHJ1ZTsKPiAgIAlj
b25maWcuaWdub3JlX3dwID0gdHJ1ZTsKPiAtCWNvbmZpZy5ub19vZl9ub2RlID0gIW9mX2Rldmlj
ZV9pc19jb21wYXRpYmxlKG5vZGUsICJudm1lbS1jZWxscyIpOwo+ICAgCWNvbmZpZy5wcml2ID0g
bXRkOwo+ICAgCj4gICAJbXRkLT5udm1lbSA9IG52bWVtX3JlZ2lzdGVyKCZjb25maWcpOwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4g
aW5kZXggNThkODkxOWU2NjgyLi5hMGM5MTUzY2RhMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
dm1lbS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+IEBAIC0xMDI3LDcgKzEw
MjcsNyBAQCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rlcihjb25zdCBzdHJ1Y3Qg
bnZtZW1fY29uZmlnICpjb25maWcpCj4gICAJbnZtZW0tPm5rZWVwb3V0ID0gY29uZmlnLT5ua2Vl
cG91dDsKPiAgIAlpZiAoY29uZmlnLT5vZl9ub2RlKQo+ICAgCQludm1lbS0+ZGV2Lm9mX25vZGUg
PSBjb25maWctPm9mX25vZGU7Cj4gLQllbHNlIGlmICghY29uZmlnLT5ub19vZl9ub2RlKQo+ICsJ
ZWxzZQo+ICAgCQludm1lbS0+ZGV2Lm9mX25vZGUgPSBjb25maWctPmRldi0+b2Zfbm9kZTsKPiAg
IAo+ICAgCXN3aXRjaCAoY29uZmlnLT5pZCkgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L252bWVtLXByb3ZpZGVyLmggYi9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmgKPiBpbmRl
eCAxYjgxYWRlYmRiOGIuLmUzOTMwODM1MjM1YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L252bWVtLXByb3ZpZGVyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmgK
PiBAQCAtODksNyArODksNiBAQCBzdHJ1Y3QgbnZtZW1fY2VsbF9pbmZvIHsKPiAgICAqIEByZWFk
X29ubHk6CURldmljZSBpcyByZWFkLW9ubHkuCj4gICAgKiBAcm9vdF9vbmx5OglEZXZpY2UgaXMg
YWNjZXNzaWJseSB0byByb290IG9ubHkuCj4gICAgKiBAb2Zfbm9kZToJSWYgZ2l2ZW4sIHRoaXMg
d2lsbCBiZSB1c2VkIGluc3RlYWQgb2YgdGhlIHBhcmVudCdzIG9mX25vZGUuCj4gLSAqIEBub19v
Zl9ub2RlOglEZXZpY2Ugc2hvdWxkIG5vdCB1c2UgdGhlIHBhcmVudCdzIG9mX25vZGUgZXZlbiBp
ZiBpdCdzICFOVUxMLgo+ICAgICogQHJlZ19yZWFkOglDYWxsYmFjayB0byByZWFkIGRhdGEuCj4g
ICAgKiBAcmVnX3dyaXRlOglDYWxsYmFjayB0byB3cml0ZSBkYXRhLgo+ICAgICogQHNpemU6CURl
dmljZSBzaXplLgo+IEBAIC0xMjIsNyArMTIxLDYgQEAgc3RydWN0IG52bWVtX2NvbmZpZyB7Cj4g
ICAJYm9vbAkJCWlnbm9yZV93cDsKPiAgIAlzdHJ1Y3QgbnZtZW1fbGF5b3V0CSpsYXlvdXQ7Cj4g
ICAJc3RydWN0IGRldmljZV9ub2RlCSpvZl9ub2RlOwo+IC0JYm9vbAkJCW5vX29mX25vZGU7Cj4g
ICAJbnZtZW1fcmVnX3JlYWRfdAlyZWdfcmVhZDsKPiAgIAludm1lbV9yZWdfd3JpdGVfdAlyZWdf
d3JpdGU7Cj4gICAJaW50CXNpemU7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
